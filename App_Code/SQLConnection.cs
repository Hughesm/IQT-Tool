using System.Data;
using System.Data.SqlClient;

//How to use and return a dataset:
/// <summary>
///  1)  Create your dataset object (x)
///  2)  SQLConnection ConnectToDataBase = new SQLConnection(); create new object
///  3)  ConnectToDataBase.connection_string = SQLConnect;      pass connection credentials 
///  4)  ConnectToDataBase.Sql = Sql;                           pass the sql
///  5)  (x) = ConnectToDataBase.GetConnection                  dataset is populate with returned data
/// 
/// Send just a sql statement
/// 1) SQLConnection (y) = new SQLConnection();                 create new object
/// 2) (y).Query(sql statement, sql connection details);        pass your statement and connection details into the Query method
/// 
/// </summary>
    
public class SQLConnection
{
    private string SqlString;
    private string Connectionstring;
    private SqlDataAdapter da1;

    /// <summary>
    /// SQL String: Holds the SQL Statement.
    /// </summary>
    /// 

    public string Sql
    {
        set { SqlString = value; }
    }

    /// <summary>
    /// Connection String: Holds the connection details to the database.
    /// </summary>
    /// 

    public string connection_string
    {
        set { Connectionstring = value; }
    }


    /// <summary>
    /// GetConnection Method,call this method with the location of the database 
    /// </summary>
    /// 

    public DataSet GetConnection
    {
        get { return TheDataSet(); }
    }

    //connects to the database and puts the data into a dataset for use
    private DataSet TheDataSet()
    {
        SqlConnection con = new SqlConnection(Connectionstring);

        con.Open();

        da1 = new SqlDataAdapter(SqlString, con);

        DataSet data_set = new DataSet();

        da1.Fill(data_set, "Table_Data");

        con.Close();

        return data_set;
    }


    /// <summary>
    /// Query Method, used for just sending querys like insert statements (anything with no returns really)
    /// </summary>
    /// <param name="Statement">SQL Statement (string)</param>
    /// /// <param name="Connection">Holds the connection string to connect to the datalayer (string)</param>
    /// 

    public void Query(string Statement, string Connection)
    {

        SqlConnection connection = new SqlConnection(Connection);
        SqlCommand Cmd = new SqlCommand(Statement, connection);
        connection.Open();
        Cmd.ExecuteNonQuery();
    }


    public static class Global //saves global varibles
    {
        public static string SelectedIncident { get; set; }
    }
}