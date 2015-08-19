using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Gets data and binfs them to datasets
/// </summary>
/// 
namespace IRS
{
    public class GetDataSets
    {

        public DataSet DataOutputMethod(string Query)
        {

            SQLConnection ConnectToDataBase;
            string SQLConnect = "Data Source=hq-ict-12580s;Initial Catalog=dmtreporting_dev;User=dmt;Password=Dmteam;";
            DataSet IncidentDataSet = new DataSet();
            ConnectToDataBase = new SQLConnection();

            ConnectToDataBase.connection_string = SQLConnect;

            //set the sql statement to bind to the gridview
            ConnectToDataBase.Sql = Query;

            IncidentDataSet = ConnectToDataBase.GetConnection;

            //use adapter to populate dataset...
            SqlDataAdapter DataAdapter = new SqlDataAdapter(Query, SQLConnect);  //sql statement and connections string fed into the SqlConnection class to bring and connect to data

            DataAdapter.Fill(IncidentDataSet);

            return IncidentDataSet;
        }

    }

    public class MySession
    {
        // private constructor
        private MySession()
        {
            ActiveDebug = "false";
        }

        // Gets the current session.
        public static MySession Current
        {
            get
            {
                MySession session =
                  (MySession)HttpContext.Current.Session["__MySession__"];
                if (session == null)
                {
                    session = new MySession();
                    HttpContext.Current.Session["__MySession__"] = session;
                }
                return session;
            }
        }

        // **** add your session properties here, e.g like this:
        public string ActiveDebug { get; set; }
        public string IncNumber { get; set; }
        public int LoginId { get; set; }
        public int numberofRecords { get; set; }
    }

    enum IncidentIRS
    {
        Checked,
        NotChecked,
        Completed,
        Archived
    };
      



    static class StringExtensions
    {
        public static string Reverse(this string input)
        {
            return new string(input.ToCharArray().Reverse().ToArray());
        }
    }



















}
