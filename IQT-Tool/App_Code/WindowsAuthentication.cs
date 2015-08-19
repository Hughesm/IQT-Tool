using System;
using System.Collections.Generic;
using System.Data;
using System.DirectoryServices;
using System.Globalization;
using System.Linq;
using CodeEngine.Framework.QueryBuilder;
using CodeEngine.Framework.QueryBuilder.Enums;
using PropertyCollection = System.DirectoryServices.PropertyCollection;

///Use this class like so:
/// 1) Create new WindowsAuthentication object, and setup with activedir  - WindowsAuthentication WinAuth = new WindowsAuthentication {ActivDirName = User.Identity.Name}; (or 'Page.User.Identity.Name' on a masterpage)     
/// 2) To get the Full Name of the user                                   - WinAuth.FullName = WinAuth.GetFullName(User.Identity.Name);
/// 3) To Set the Username                                                - WinAuth.UserName = WinAuth.GetUsername(WinAuth.ActiveDName); 
/// 4) To track user                                                      - WinAuth.AddArea((WindowsAuthentication.PerformancePortal.Er));
///                                                                       - WinAuth.TrackerSql(); 
interface IWindowsAuth
{
    string UserName { get; set; }
    string FullName { get; set; }
    string AreaChosen { get; set; }

    string GetFullName();
    string GetUsername();
    void TrackerSql();

}

public class WindowsAuthentication : IWindowsAuth
{
    public enum PerformancePortal //add new ones when needed, also ammend the TrackerSql() method
    {
        Mos,
        Iat,
        Kpi,
        Framework,
        Ibt,
        Qrt,
        Iqt,
        Ckpi,
        Ss,
        Portal,
        Er
    }

    protected const string SqlConnect =
        "Data Source=hq-ict-12580s;Initial Catalog=dmtreporting_dev;User=dmt;Password=Dmteam;";

    private string ActiveDName;
    public string UserName { get; set; }
    public string FullName { get; set; }
    public string AreaChosen { get; set; }

    protected List<PerformancePortal> _Areas = new List<PerformancePortal>();

    public string ActivDirName
    {
        set
        {
            ActiveDName = value;
        }
        get { return ActiveDName; }

    }

    public void AddArea(PerformancePortal newArea)
    {
        _Areas.Add(newArea);
    }

    /// <summary>
    /// TrackerSql Method: This method will track a user and comit it to the datalayer.
    /// </summary>

    public void TrackerSql()
    {

        foreach (var area in _Areas)
        {
            switch (area) //add new enum here
            {
                case PerformancePortal.Mos:
                    AreaChosen = "MOS";
                    break;
                case PerformancePortal.Ckpi:
                    AreaChosen = "Corporate KPI Scorecards";
                    break;
                case PerformancePortal.Framework:
                    AreaChosen = "Incident KPI Framework";
                    break;
                case PerformancePortal.Iat:
                    AreaChosen = "Incident Analysis Tool";
                    break;
                case PerformancePortal.Ibt:
                    AreaChosen = "Internal Benchmarking Tool";
                    break;
                case PerformancePortal.Iqt:
                    AreaChosen = "Incident Query Tool";
                    break;
                case PerformancePortal.Kpi:
                    AreaChosen = "Incident KPI Tool";
                    break;
                case PerformancePortal.Qrt:
                    AreaChosen = "Quarterly Reporting Tool";
                    break;
                case PerformancePortal.Ss:
                    AreaChosen = "Station Scorecard";
                    break;
                case PerformancePortal.Portal:
                    AreaChosen = "Performance Portal";
                    break;
                case PerformancePortal.Er:
                    AreaChosen = "Emergency Reponse";
                    break;
            }

            string INSERTstatement;
            string Selectstatement;
            DataSet TrackerDataSet;
            string strSQLconnection;
            SQLConnection ConnectToDataBase = new SQLConnection();
            SQLConnection InsertQuery = new SQLConnection();
            strSQLconnection = SqlConnect;

            InsertQueryBuilder insertQuery = new InsertQueryBuilder();
            SelectQueryBuilder selectQuery = new SelectQueryBuilder();
            //create select statement
            selectQuery.SelectColumns("Name", "Department", "[Rank]");
            selectQuery.SelectFromTable("OrganisationalStructure");
            selectQuery.AddWhere("[Login]", Comparison.Equals, UserName);

            Selectstatement = selectQuery.BuildQuery();
            //retrieve select statement dataset
            ConnectToDataBase.connection_string = strSQLconnection;
            ConnectToDataBase.Sql = Selectstatement;
            TrackerDataSet = ConnectToDataBase.GetConnection;
            //get data from dataset table
            var name = TrackerDataSet.Tables[0].Rows[0]["Name"].ToString();
            var department = TrackerDataSet.Tables[0].Rows[0]["Department"].ToString();
            var rank = TrackerDataSet.Tables[0].Rows[0]["Rank"].ToString();
            //create insert statmement
            insertQuery.Table = "PerfPortal_Tracker";
            insertQuery.SetField("LoginName", UserName);
            insertQuery.SetField("FullName", name);
            insertQuery.SetField("Department", department);
            insertQuery.SetField("JobTitle", rank);
            insertQuery.SetField("[DateTime]", DateTime.Now.ToString(CultureInfo.InvariantCulture));
            insertQuery.SetField("AreaAccessed", AreaChosen);

            INSERTstatement = insertQuery.BuildQuery();
            //send sql statement to server

            InsertQuery.Query(INSERTstatement, SqlConnect);
        }

    }

    /// <summary>
    /// GetFullName Method: Uses the user login name to get the full name of user by interrogating active directory. Uses active directory name.
    /// </summary>

    public string GetFullName()
    {

        string str;
        string strDomain;
        string strName;

        if (string.IsNullOrEmpty(ActiveDName))

        {   
            ActiveDName = @"GMFS\h";
           
        }

        // Parse the string to check if domain name is present.
        int idx = ActiveDName.IndexOf('\\');
        if (idx == -1)
        {
            idx = ActiveDName.IndexOf('@');
        }

        if (idx != -1)
        {
            strDomain = ActiveDName.Substring(0, idx);
            strName = ActiveDName.Substring(idx + 1);
        }
        else
        {
            strDomain = Environment.MachineName;
            strName = ActiveDName;
        }

        try
        {
            var obDirEntry = new DirectoryEntry("WinNT://" + strDomain + "/" + strName);
            PropertyCollection coll = obDirEntry.Properties;

            object obVal = coll["FullName"].Value;

            str = obVal.ToString();

        }
        catch (Exception ex)
        {
            str = ex.Message;
        }
        //below rearranges the name from [last][first] to [first][last]
        string[] Name = str.Split(new char[0]);
        foreach (string order in Name)
        {
            str = Name[1];
            //+" " + Name[0];
        }


        return str;
    }

    /// <summary>
    /// Username Method: Strips the GMFS section of the active directory name from the string. Uses active directory name.
    /// </summary>
    /// 

    public string GetUsername()
    {

        ActiveDName = new string((from c in ActiveDName
                                  where char.IsWhiteSpace(c) || char.IsLetterOrDigit(c)
                                  select c
            ).ToArray());

        {
            if (string.IsNullOrEmpty(ActiveDName))
            {
                ActiveDName = @"GMFS\redmondp";
            }
            else
            {
                ActiveDName = ActiveDName.Remove(0, 4);
            }

            return ActiveDName;
        }
    }






}

