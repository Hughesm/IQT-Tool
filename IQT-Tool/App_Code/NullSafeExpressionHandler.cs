﻿
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;

namespace App_Code
{
    /// <summary>
    ///     Provides a means of handling lambda expressions in a null safe manner.
    /// </summary>
    public static class NullSafeExpressionHandler
    {
        /// <summary>
        ///     Manages locking of items in the expression cache.
        /// </summary>
        private static readonly object expressionCacheLock = new object();

        /// <summary>
        ///     Contains cached expressions.
        /// </summary>
        private static readonly Dictionary<ExpressionCacheKey, Delegate> expressionCache = new Dictionary<ExpressionCacheKey, Delegate>();

        /// <summary>
        ///     Returns the value of the specified expression, returning the default value of the
        ///     result type (<c>null</c> for reference types) instead of throwing an exception
        ///     when one or more of the referenced members in the expression are <c>null</c>.
        /// </summary>
        /// <typeparam name="TSource">The type of the instance to evaluate the expression on.</typeparam>
        /// <typeparam name="TResult">The type of the result.</typeparam>
        /// <param name="instance">The instance the method must operate on.</param>
        /// <param name="expression">The expression to evaluate.</param>
        /// <returns>The result of the expression or the default value of the result type, if one or more of the referenced members in the expression are <c>null</c>.</returns>
        /// <exception cref="ArgumentNullException">
        ///     The specified <paramref name="instance"/> is <c>null</c>.
        ///     -or-
        ///     The specified <paramref name="expression"/> is <c>null</c>.
        /// </exception>
        /// <remarks>
        ///     When calling this method multiple times in the same AppDomain and providing the
        ///     same expression, a cached instance of the delegate will be returned.
        /// </remarks>
        public static TResult SafeGet<TSource, TResult>(TSource instance, Expression<Func<TSource, TResult>> expression)
        {
            if (instance == null)
            {
                throw new ArgumentNullException("instance");
            }
            else if (expression == null)
            {
                throw new ArgumentNullException("expression");
            }

            return GetSafeGetDelegate(expression)(instance);
        }

        /// <summary>
        ///     Returns the function that evaluates to the value of the specified expression,
        ///     returning the default value of the result type (<c>null</c> for reference types)
        ///     instead of throwing an exception when one or more of the referenced members in the
        ///     expression are <c>null</c>.
        /// </summary>
        /// <typeparam name="TSource">The type of the instance to evaluate the expression on.</typeparam>
        /// <typeparam name="TResult">The type of the result.</typeparam>
        /// <param name="expression">The expression to evaluate.</param>
        /// <returns>The function that represents the expression or the default value of the result type, if one or more of the referenced members in the expression are <c>null</c>.</returns>
        /// <exception cref="ArgumentNullException">The specified <paramref name="expression"/> is <c>null</c>.</exception>
        /// <exception cref="ArgumentException">The specified <paramref name="expression"/> does not appear to express a value.</exception>
        /// <remarks>
        ///     When calling this method multiple times in the same AppDomain and providing the
        ///     same expression, a cached instance of the delegate will be returned.
        /// </remarks>
        public static Func<TSource, TResult> GetSafeGetDelegate<TSource, TResult>(Expression<Func<TSource, TResult>> expression)
        {
            if (expression == null)
            {
                throw new ArgumentNullException("expression");
            }

            Func<TSource, TResult> function;

            lock (expressionCacheLock)
            {
                ExpressionCacheKey key = new ExpressionCacheKey()
                {
                    Expression = expression.ToString(),
                    InstanceType = typeof(TSource)
                };

                if (!expressionCache.ContainsKey(key))
                {
                    MemberExpression body = GetBody<TSource, TResult>(expression);

                    if (body == null)
                    {
                        throw new ArgumentException("Does not appear to express a value.", "expression");
                    }

                    IList<MemberExpression> reversedSourceFragments = GetFragments(body);

                    bool canHaveNulls = reversedSourceFragments.Any(n => n.Type.IsClass);

                    if (!canHaveNulls)
                    {
                        function = expression.Compile();
                    }
                    else
                    {
                        function = CreateSafeGetDelegate<TSource, TResult>(reversedSourceFragments);
                    }

                    expressionCache[key] = function;
                }
                else
                {
                    function = (Func<TSource, TResult>)expressionCache[key];
                }
            }

            return function;
        }

        /// <summary>
        ///     Returns a new delegate that safely gets the result of the specified expression
        ///     fragments.
        /// </summary>
        /// <typeparam name="TSource">The instance type.</typeparam>
        /// <typeparam name="TResult">The result type.</typeparam>
        /// <param name="expressionFragments">The expression fragments, which will be processed in the order as specified.</param>
        /// <returns>The result or the default value of the result type, if one or more of the referenced members in the expression are <c>null</c>.</returns>
        private static Func<TSource, TResult> CreateSafeGetDelegate<TSource, TResult>(IList<MemberExpression> expressionFragments)
        {
            List<Expression> targetFragments = new List<Expression>();
            MemberExpression lastSourceFragment = expressionFragments.Last();

            ParameterExpression instanceParameter = Expression.Variable(typeof(object), "instance");
            ParameterExpression resultVariable = Expression.Variable(typeof(TResult), "result");

            LabelTarget useDefaultLabel = Expression.Label("useDefault");
            LabelTarget returnLabel = Expression.Label("return");

            foreach (MemberExpression sourceFragment in expressionFragments)
            {
                MemberInfo memberInfo = (MemberInfo)sourceFragment.Member;

                MemberExpression member = ConstantExpression.MakeMemberAccess(
                    Expression.Convert(instanceParameter, memberInfo.DeclaringType),
                    memberInfo);

                if (sourceFragment != lastSourceFragment)
                {
                    // Iterate into the member.
                    targetFragments.Add(
                        Expression.Assign(
                            instanceParameter,
                            Expression.Convert(member, typeof(object))));

                    // Value types cannot represent a null reference.
                    if (sourceFragment.Type.IsClass)
                    {
                        targetFragments.Add(
                            Expression.IfThen(
                                Expression.Equal(instanceParameter, Expression.Constant(null)),
                                Expression.Goto(useDefaultLabel)));
                    }
                }
                else
                {
                    // The value of the final member is the actual result.
                    targetFragments.Add(
                        Expression.Assign(
                            resultVariable,
                            Expression.Convert(member, typeof(TResult))));
                }
            }

            targetFragments.Add(Expression.Goto(returnLabel));
            targetFragments.Add(Expression.Label(useDefaultLabel));
            targetFragments.Add(Expression.Assign(resultVariable, Expression.Default(typeof(TResult))));
            targetFragments.Add(Expression.Label(returnLabel));

            targetFragments.Add(resultVariable);

            Expression finalExpression = Expression.Block(new[] { resultVariable }, targetFragments);

            return Expression.Lambda<Func<TSource, TResult>>(finalExpression, instanceParameter).Compile();
        }

        /// <summary>
        ///     Returns the body of the specified expression.
        /// </summary>
        /// <typeparam name="TSource">The expression type.</typeparam>
        /// <typeparam name="TResult">The result type.</typeparam>
        /// <param name="expression">The expression.</param>
        /// <returns>The expression body.</returns>
        private static MemberExpression GetBody<TSource, TResult>(Expression<Func<TSource, TResult>> expression)
        {
            switch (expression.Body.NodeType)
            {
                case ExpressionType.Convert:
                case ExpressionType.ConvertChecked:
                    UnaryExpression body = expression.Body as UnaryExpression;
                    return ((body != null) ? body.Operand : null) as MemberExpression;

                default:
                    return expression.Body as MemberExpression;
            }
        }

        /// <summary>
        ///     Returns the fragments of which the specified expression is made up.
        /// </summary>
        /// <param name="expression">The expression.</param>
        /// <returns>The fragment expressions.</returns>
        private static IList<MemberExpression> GetFragments(MemberExpression expression)
        {
            List<MemberExpression> fragments = new List<MemberExpression>();

            while (expression != null)
            {
                fragments.Insert(0, expression);
                expression = expression.Expression as MemberExpression;
            }

            return fragments;
        }

        /// <summary>
        ///     An expression cache key.
        /// </summary>
        private struct ExpressionCacheKey
        {
            /// <summary>
            ///     The expression string.
            /// </summary>
            public string Expression;

            /// <summary>
            ///     The instance type the expression can be invoked on.
            /// </summary>
            public Type InstanceType;

            /// <summary>
            ///     Implements the operator ==.
            /// </summary>
            /// <param name="x">The x.</param>
            /// <param name="y">The y.</param>
            /// <returns>The result of the operator.</returns>
            public static bool operator ==(ExpressionCacheKey x, ExpressionCacheKey y)
            {
                return x.Expression == y.Expression && x.InstanceType == y.InstanceType;
            }

            /// <summary>
            ///     Implements the operator !=.
            /// </summary>
            /// <param name="x">The x.</param>
            /// <param name="y">The y.</param>
            /// <returns>The result of the operator.</returns>
            public static bool operator !=(ExpressionCacheKey x, ExpressionCacheKey y)
            {
                return !(x == y);
            }

            /// <summary>
            ///     Determines whether the specified <see cref="System.Object"/> is equal to this
            ///     instance.
            /// </summary>
            /// <param name="obj">Another object to compare to.</param>
            /// <returns><c>true</c> if the specified <see cref="System.Object"/> is equal to this instance; otherwise, <c>false</c>.</returns>
            public override bool Equals(object obj)
            {
                return obj is ExpressionCacheKey && this == (ExpressionCacheKey)obj;
            }

            /// <summary>
            ///     Returns a hash code for this instance.
            /// </summary>
            /// <returns>A hash code for this instance, suitable for use in hashing algorithms and data structures like a hash table.</returns>
            public override int GetHashCode()
            {
                return Expression.GetHashCode() ^ InstanceType.GetHashCode();
            }
        }
    }
}

