using System;
using System.Data;
using CodeEngine.Framework.QueryBuilder;
using CodeEngine.Framework.QueryBuilder.Enums;
using System.Configuration;

/// <summary>
/// Summary description for AdvIRSClasses
/// This class hold all data items until the are called for display or use in methods

/// </summary>
public class AdvIRS : iSearch
{
    // Data properties taken from the SQL database

    public DataSet IncidentData;
    public string IncidentIRS { get; set; }
    public string idinref { get; set; }
    public string inccreateddate { get; set; }
    public string inclocationaddress { get; set; }
    public string incidentcategory { get; set; }
    public string borough { get; set; }
    public string ward { get; set; }
    public string idstref { get; set; }
    public string incidenttype { get; set; }
    public string propertycategory { get; set; }
    public string firecause { get; set; }
    public string iddesc { get; set; }
    public string WatchDesc { get; set; }
    public string riskcat { get; set; }
    public string responsestandardmet { get; set; }
    public string incidentstage { get; set; }
    public string Latitude { get; set; }
    public string Longitude { get; set; }
    public string IncTimeStoppedMobilising { get; set; }
    public string OriginOfCall { get; set; }
    public string PropertyType { get; set; }
    public string PropertySubclass { get; set; }
    public string oicincname { get; set; }
    public string FireSizeONArrival { get; set; }
    public string FireDamageONCLOSE { get; set; }
    public string FireSizeRoomOrigin { get; set; }
    public string FireTotalDamageArea { get; set; }
    public string FireDistanceAdjacentPropertyDamaged { get; set; }
    public string IgnitionSource { get; set; }
    public string ItemFirstIgnited { get; set; }
    public string FireMainCause { get; set; }
    public int? Calendarid { get; set; }
    public string FireStartLocation { get; set; }
    public string PropertyClass { get; set; }
    public string PropertyDescription { get; set; }
    public string attackonffyn { get; set; }
    public string attackonfftype { get; set; }
    public string hazmatinvolvedyn { get; set; }
    public string isrtcyn { get; set; }
    public string rtcextricationyn { get; set; }
    public string alarmsystempresentyn { get; set; }
    public string alarmtype { get; set; }
    public string conforiginyn { get; set; }
    public string derelictyn { get; set; }
    public string alarmoperatedyn { get; set; }
    public string heatsmokeonlyyn { get; set; }
    public string suspunderinfluenceyn { get; set; }
    public string fireclassification { get; set; }
    public string itemfirstignitedcat { get; set; }
    public string lupname { get; set; }
    public string sstertype { get; set; }
    public string sssectype { get; set; }
    public string sstype { get; set; }
    public string victimtype { get; set; }
    public string victimage { get; set; }
    public string victimgender { get; set; }
    public string victimethnicity { get; set; }
    public string victimwasrescued { get; set; }
    public string victimrescuedby { get; set; }
    public string victimrescuemethod { get; set; }
    public string victimnatureofinjury { get; set; }
    public string victimseverityofinjury { get; set; }
    public int? incpk { get; set; }
    public string fagroup { get; set; }
    public int? numvehiclesdeployed { get; set; }
    public string MBCALLSIGN { get; set; }
    public string ApplianceType { get; set; }
    public DateTime? MBARRIVE { get; set; }
    public DateTime? MBLEAVE { get; set; }
    public DateTime? MBMOBILE { get; set; }
    public string MBOIC { get; set; }
    public DateTime? MBRETURN { get; set; }
    public string MobilisationStatus { get; set; }
    public string SendtoMobileint { get; set; }
    public string MobiletoArriveint { get; set; }
    public int? SendtoLeaveint { get; set; }
    public int? OfficerCount { get; set; }
    public string PFStatus { get; set; }
    public int? TheOrder { get; set; }
    public int? Emergency { get; set; }
    public string ArrLatLong { get; set; }
    public string MobLatLon { get; set; }
    public string AdiGeneral { get; set; }
    public string userName { get; set; }
    public string AreaChosen { get; set; }
    protected string SQLConnect = ConfigurationManager.ConnectionStrings["constr"].ToString();


    /// <summary>
    /// PopulateIncidentData Method: Using the Building BuildIncidentQuery this method populates a dataset that contains the wanted incidents to display in the Reports Section
    /// </summary>
    /// <param name="IncidentNumber">Requires you to pass the incident number to bring back relevant data (String)</param>
  
    public DataSet PopulateIncidentData(string IncidentNumber)
    {
        //Using the Building BuildIncidentQuery this method populates a dataset that contains the wanted incidents to display in the Reports Section

        DataSet incidentDataSet = new DataSet();
        string strSQLconnection;
        SQLConnection ConnectToDataBase;

        //connect to the database
        ConnectToDataBase = new SQLConnection();
        strSQLconnection = SQLConnect;
        ConnectToDataBase.Sql = BuildIncidentQuery(IncidentNumber);
        ConnectToDataBase.connection_string = strSQLconnection;

        using (incidentDataSet = ConnectToDataBase.GetConnection)
        {
            if (incidentDataSet == null) throw new ArgumentNullException("IncidentNumber");

            return incidentDataSet;
        }

    }

  
    /// <summary>
    /// BuildIncidentQuery Method: Using the incident number this method brings back all relevant data for that incident, which is defined below in the Select statement.
    /// </summary>
    /// <param name="IncidentNumber">Requires you to pass the incident number to bring back relevant data (String)</param>
    
    public string BuildIncidentQuery(string IncidentNumber)
    {
        //Using the incident number this method brings back all relevant data for that incident, which is defined below in the Select statement.
        //NOTE: This cannot be accessed and is set to private to stop tampering.
        SelectQueryBuilder Query = new SelectQueryBuilder(); //creates the query to be used

        Query.SelectColumns("id_in_ref as 'Incident Number'", "inc_created_date as'Date Created'", "replace(inc_location_address,';','') as 'Location Address'",
          "incident_category as 'Incident Type'", "borough as 'Borough'", "ward as 'Ward'", "id_st_ref as 'Station'", "incident_type as 'Incident Category'",
          "property_category as 'Property Category'", "fire_cause as 'Cause of Fire'", "id_desc as 'Building Description'",
          "WatchDesc as 'Watch'", "risk_cat as 'Risk Category'", "response_standard_met as 'Response'", "incident_stage", "Latitude", "Longitude",
          "Inc_Time_Stopped_Mobilising", "Origin_Of_Call", "Property_Type", "Property_Subclass", "oic_inc_name", "Fire_Size_ON_Arrival", "Fire_Damage_ON_CLOSE",
          "Fire_Size_Room_Origin", "Fire_Total_Damage_Area", "Fire_Distance_Adjacent_Property_Damaged", "Fire_Cause", "Ignition_Source", "Item_First_Ignited",
          "Fire_Main_Cause", "Adi_General", "Calendarid", "Fire_Start_Location", "Property_Class", "Property_Description", "attack_on_ff_yn", "attack_on_ff_type",
          "hazmat_involved_yn", "is_rtc_yn", "rtc_extrication_yn", "alarm_system_present_yn", "alarm_type", "conf_origin_yn", "derelict_yn", "alarm_operated_yn",
          "heat_smoke_only_yn", "susp_under_influence_yn", "fire_classification", "item_first_ignited_cat", "lup_name", "ss_ter_type", "ss_sec_type", "ss_type"
          , "victim_type", "victim_age", "victim_gender", "victim_ethnicity", "victim_was_rescued", "victim_rescued_by", "victim_rescue_method", "victim_nature_of_injury"
          , "victim_severity_of_injury", "inc_pk", "fa_group","incident_stage"); //Select Statement

        Query.SelectFromTable("incidentdim"); //table name for the FROM section

        Query.AddJoin(JoinType.LeftJoin, "[dmtreporting_dev].[dbo].[PropertyDim]", "Lup_Pk", Comparison.Equals, "incidentdim", "Inc_Property_Type"); //changed from inner join 04/12/2014
        Query.AddJoin(JoinType.LeftJoin, "[dmtreporting_dev].[dbo].[irs_additional_info]", "Adi_Fk_Inc", Comparison.Equals, "incidentdim", "Inc_Pk");
        Query.AddJoin(JoinType.LeftJoin, "[dmtreporting_dev].[dbo].[vw_IRS_Custom_Library]", "incidentnumber", Comparison.Equals, "incidentdim", "id_in_ref");
        Query.AddJoin(JoinType.LeftJoin, "[dmtreporting_dev].[dbo].[victimdim]", "vic_fk_inc", Comparison.Equals, "incidentdim", "id_in_ref");

        Query.AddWhere("id_in_ref", Comparison.Equals, IncidentNumber);

        var statement = Query.BuildQuery();

        return statement;

    }

    /// <summary>
    /// NarrativeLog Method: using the supplied incident number and the desired filter selected by the user, this method will retrieve the required dataset ready for populating the reports section
    /// </summary>
    /// <param name="incidentnumber">Requires you to pass the incident number to bring back relevant data (String)</param>
    /// /// <param name="FilterIndex">Requires you to pass either 0 or depending on when the incident was (pre or post NWFC (int)</param>
    
    public DataSet NarrativeLog(string incidentnumber, int FilterIndex)
    {
        //using the supplied incident number and the desired filter selected by the user, this method will retrieve the required dataset ready for populating the reports section
        var Query = new SelectQueryBuilder();
        string strSQLconnection;
        SQLConnection ConnectToDataBase;

        Query.SelectColumns("nar_act_time as 'Time'", "nar_log_text as 'Narrative Text'"); //Select Statement

        Query.SelectFromTable("incidentdim"); //table name for the FROM section

        Query.AddJoin(JoinType.LeftJoin, "[threetc_mis].[dbo].[nar_rative_log]", "nar_inc_id", Comparison.Equals, "incidentdim", "id_in_ref");

        string IncidentDate = IncidentData.Tables[0].Rows[0]["Date Created"].ToString();
        //string Date = IncidentDate.Substring(0, 10);
        DateTime Incidentdt = Convert.ToDateTime(IncidentDate);
        const string FireControlDate = "29/05/2014"; //date that we went to new control, used for narrative log formating 

        DateTime Controldt = Convert.ToDateTime(FireControlDate);
        // int results = DateTime.Compare(dt, Fdt);

        if (Incidentdt.Date < Controldt.Date && FilterIndex == 1)
        {
            Query.AddWhere("nar_log_entry", Comparison.Equals, "TEXT");

        }
        else
        { 
        }
        if (Incidentdt.Date > Controldt.Date && FilterIndex == 1)
        {

            WhereClause clause =
            Query.AddWhere("nar_log_text", Comparison.Like, "%Message%");
            clause.AddClause(LogicOperator.Or, Comparison.Like, "%INFORMATIVE%");
            clause.AddClause(LogicOperator.Or, Comparison.Like, "%RADIO%");
            clause.AddClause(LogicOperator.Or, Comparison.Like, "%ASSISTANCE%");
            clause.AddClause(LogicOperator.Or, Comparison.Like, "%FROM%");
            clause.AddClause(LogicOperator.Or, Comparison.Like, "%OTHER%");
        }
        else
        {
    
        }


        Query.AddWhere("id_in_ref", Comparison.Equals, incidentnumber);

        Query.AddOrderBy("nar_act_time", Sorting.Ascending);

        var statement = Query.BuildQuery();

        if (statement == null) throw new ArgumentNullException("incidentnumber");


        //connect to the database
        ConnectToDataBase = new SQLConnection();
        strSQLconnection = SQLConnect;

        ConnectToDataBase.connection_string = strSQLconnection;

        //set the sql statement to bind to the gridview
        ConnectToDataBase.Sql = statement;

        DataSet narDataset;
        using (narDataset = ConnectToDataBase.GetConnection)
        {
            if (narDataset == null) throw new ArgumentNullException("incidentnumber");

            return narDataset;
        }
    }

    /// <summary>
    /// IncidentEquipment Method: Using the supplied incident number this method brings back the equipment used at the incident
    /// </summary>
    /// <param name="IncidentNumber">Requires you to pass the incident number to bring back relevant data (String)</param>

    public DataSet IncidentEquipment(string IncidentNumber)
    {
        //Using the supplied incident number this method brings back the equipment used at the incident

        SQLConnection ConnectToDataBase = new SQLConnection();
        DataSet dataset = new DataSet();
        SelectQueryBuilder Query = new SelectQueryBuilder();

        Query.SelectColumns("Equip_Description as 'Equipment Description'", "Equip_Number_Used as 'Amount Used'");
        Query.SelectFromTable("incidentdim" + " left OUTER JOIN Equipment_Used ON incidentdim.Inc_Pk = Equipment_Used.Equ_Fk_Inc");
        //Query.AddJoin(JoinType.OuterJoin, "Equipment_Used ", "Equ_Fk_Inc", Comparison.Equals, "incidentdim", "Inc_Pk");
        Query.AddWhere("id_in_ref", Comparison.Equals, IncidentNumber);

        var EquipMentStatement = Query.BuildQuery();


        ConnectToDataBase.connection_string = SQLConnect;

        //set the sql statement to bind to the gridview
        ConnectToDataBase.Sql = EquipMentStatement;

        dataset = ConnectToDataBase.GetConnection;

        return dataset;
    }

    /// <summary>
    /// IncidentMobilisation Method: using the incident number thsi method brings back the mobilisations to the incident..
    /// </summary>
    /// <param name="Incidentnumber">Requires you to pass the incident number to bring back relevant data (String)</param>

    public DataSet IncidentMobilisation(string Incidentnumber)
    {
        //using the incident number thsi method brings back the mobilisations to the incident.

        SelectQueryBuilder Query = new SelectQueryBuilder(); //creates the query to be used
        DataSet Dataset = new DataSet();
        SQLConnection ConnectToDataBase = new SQLConnection();

        Query.SelectColumns("num_vehicles_deployed", "MB_CALL_SIGN", "ApplianceType", "MB_ARRIVE", "MB_LEAVE", "MB_MOBILE", "MB_OIC", "MB_RETURN",
             "MobilisationStatus", "RIGHT(CONVERT(CHAR(8),DATEADD(SECOND,Send_to_Mobile_int,0),108),5) AS Send_to_Mobile_int", "RIGHT(CONVERT(CHAR(8),DATEADD(SECOND,Mobile_to_Arrive_int,0),108),5) AS Mobile_to_Arrive_int", "Send_to_Leave_int", "OfficerCount",
             "PFStatus", "TheOrder", "[dmtreporting_dev].[dbo].[MB_MOBILISATIONS].Emergency", "ArrLatLong", "MobLatLong"); //Select Statement

        Query.SelectFromTable("incidentdim"); //table name for the FROM section


        Query.AddJoin(JoinType.LeftJoin, "[dmtreporting_dev].[dbo].[MB_MOBILISATIONS]", "MB_IN_REF", Comparison.Equals, "incidentdim", "id_in_ref");
        Query.AddJoin(JoinType.LeftJoin, "[dmtreporting_dev].[dbo].[vw_mobilisation_counts]", "MB_IN_REF", Comparison.Equals, "incidentdim", "id_in_ref");

        Query.AddWhere("id_in_ref", Comparison.Equals, Incidentnumber);

        Query.AddOrderBy("MB_ARRIVE", Sorting.Ascending);

        var statement = Query.BuildQuery();

        ConnectToDataBase.connection_string = SQLConnect;

        //set the sql statement to bind to the gridview
        ConnectToDataBase.Sql = statement;

        Dataset = ConnectToDataBase.GetConnection;

        return Dataset;

    }

    /// <summary>
    /// FormatSqlWhere Method: Takes a user written input string and manipulates to a SQL query string
    /// </summary>
    /// <param name="InputText">Text entered by user (String)</param>
    /// <param name="TypeOfReplace">Type of replace. 0 = Adds ' ' marks around each item. 1=Removes spaces (int)</param>

    public string FormatSqlWhere(string InputText, int TypeOfReplace)
    {
        //Takes a user written input string and manipulates to a SQL query string
       
            string[] SelectedItems = InputText.Split(',');

         
            //Type 0 adds ' ' marks around each item that has been entered
            if (TypeOfReplace == 0)
            {
                for (int i = 0; i < SelectedItems.Length; i++)
                {
                    SelectedItems[i] = SelectedItems[i].Replace(SelectedItems[i], "'" + SelectedItems[i] + "'");
                }
                InputText = string.Join(",", SelectedItems);
            }
            //Type 1 removes any spaces
            if (TypeOfReplace == 1)
            {
                for (int i = 0; i < SelectedItems.Length; i++)
                {
                   
                    SelectedItems[i] = SelectedItems[i].Replace(" ", "%");
                }
                InputText = string.Join(",", SelectedItems);
            }

        return InputText;
    }
    
}


/// <summary>
/// AdvancedSearch Class: This class holds the advanced search values. Also contains methods for the advanced search and Threetc Database search.
/// </summary>

public class AdvancedSearch : AdvIRS
{
    //This class holds the advanced search values.
    public string PumpCond { get; set; }
    public string StartDateCond { get; set; }
    public string ward_db { get; set; }
    public string StationCond { get; set; }
    public string EndDateCond { get; set; }
    public string AreaCond { get; set; }
    public string TimeCond { get; set; }
    public string RiskCond { get; set; }
    public string IncidentDate { get; set; }
    public string NarLogText { get; set; }
    public const string FireControlDate = "29/05/2014";
    public string fagroup_db { get; set; }
    public string OICsearch { get; set; }
    public string Address_search { get; set; }
    public string OfficerCallSign_search { get; set; }
    public string ADI_search { get; set; }
    public string CauseofFire_search { get; set; }
    public string PropCat_search { get; set; }
    public string Propsub_search { get; set; }
    public string Watch_search { get; set; }
    public string TargetCond { get; set; }
    public string BoroughCond { get; set; }
    public string IncidentCond { get; set; }
    public string IRSCond { get; set; }
    public string IncidentNumber { get; set; }
    public string IncidentCat { get; set; }
    public string EquipmentSelection { get; set; }
    public string SSType_search { get; set; }
    public string SSClass_search { get; set; }
    public int ChangedAdress { get; set; }
    public string RevisedAddress { get; set; }

    public int MaxRecords { get; set; }
    public int WatchCond { get; set; }
    public int SSType { get; set; }
    public int SSClass { get; set; }
    public int FAGroup_int { get; set; }

    public string SQL_Query { get; set; }

    public DateTime Incidentdt { get; set; }
    public DateTime Controldt { get; set; }

    public string[] NarrtiveSplit { get; set; }

    /// <summary>
    /// AdvancedSearchQuery Method: Used for Basic and Advanced Search
    /// </summary>
    /// <param name="QueryType"> type 1 = Advanced search, type 2= basic search(String)</param>
    
    public string AdvancedSearchQuery(int QueryType)
    {
        //used for Basic and Advanced Search

        SelectQueryBuilder Query = new SelectQueryBuilder(); //creates the query reference 


        if (MaxRecords > 0)
        {
            //Query.TopRecords = MaxRecords;

            Query.SelectColumns("Distinct id_in_ref as 'Incident Number'",
                "[dmtreporting_dev].[dbo].[incidentdim].inc_created_date as' Date Created'",
                "replace(inc_location_address,';','') as 'Location Address'",
                "[dmtreporting_dev].[dbo].[incidentdim].borough as 'Borough'",
                "[incident_category] AS 'Incident Type'", "incident_stage"); //Select Statement

        }


        else
        {
            Query.SelectColumns("Distinct id_in_ref as 'Incident Number'",
                "[dmtreporting_dev].[dbo].[incidentdim].inc_created_date as'Date Created'",
                "replace(inc_location_address,';','') as 'Location Address'", "incident_category as 'Incident Type'",
                "[dmtreporting_dev].[dbo].[incidentdim].borough as 'Borough'", "incident_stage",
                "LLCoordString", "id_easting", "id_northing", "ward");

        }

        Query.SelectFromTable("incidentdim");

        if (QueryType == 1)
        {
            Query.AddJoin(JoinType.LeftJoin, "[dmtreporting_dev].[dbo].[PropertyDim]", "Lup_Pk", Comparison.Equals,
                "incidentdim", "Inc_Property_Type");
            Query.AddJoin(JoinType.LeftJoin, "[dmtreporting_dev].[dbo].[irs_additional_info]", "Adi_Fk_Inc",
                Comparison.Equals, "incidentdim", "Inc_Pk");
            Query.AddJoin(JoinType.LeftJoin, "[dmtreporting_dev].[dbo].[vw_IRS_Custom_Library]", "incidentnumber",
                Comparison.Equals, "incidentdim", "id_in_ref");
            Query.AddJoin(JoinType.LeftJoin, "[dmtreporting_dev].[dbo].[victimdim]", "vic_fk_inc", Comparison.Equals,
                "incidentdim", "id_in_ref");
            Query.AddJoin(JoinType.LeftJoin, "[dmtreporting_dev].[dbo].[MB_MOBILISATIONS]", "MB_IN_REF",
                Comparison.Equals, "incidentdim", "id_in_ref");
            Query.AddJoin(JoinType.LeftJoin, "Equipment_Used ", "Equ_Fk_Inc", Comparison.Equals, "incidentdim", "Inc_Pk");
            Query.AddJoin(JoinType.LeftJoin, "[threetc_mis].[dbo].[nar_rative_log]", "[nar_inc_id]", Comparison.Equals,
                "incidentdim", "id_in_ref");
        }

        if (TimeCond == "0")
        {
            TimeCond = "3";
        }
        else
        {
            TimeCond = TimeCond;
        }

        if (PumpCond == "1")
        {
            Query.AddWhere("num_vehicles_deployed", Comparison.Equals, PumpCond);
        }
        if (PumpCond == "2")
        {
            Query.AddWhere("num_vehicles_deployed", Comparison.GreaterOrEquals, "2");
            Query.AddWhere("num_vehicles_deployed", Comparison.LessThan, "4");
        }
        if (PumpCond == "3")
        {
            Query.AddWhere("num_vehicles_deployed", Comparison.GreaterOrEquals, "3");
            Query.AddWhere("num_vehicles_deployed", Comparison.LessThan, "5");
        }
        if (PumpCond == "4")
        {
            Query.AddWhere("num_vehicles_deployed", Comparison.GreaterOrEquals, "4");
            Query.AddWhere("num_vehicles_deployed", Comparison.LessThan, "6");
        }
        if (PumpCond == "5")
        {
            Query.AddWhere("num_vehicles_deployed", Comparison.GreaterOrEquals, "6");
            Query.AddWhere("num_vehicles_deployed", Comparison.LessThan, "9");
        }
        if (PumpCond == "6")
        {
            Query.AddWhere("num_vehicles_deployed", Comparison.GreaterOrEquals, "9");
        }

        var clause = new WhereClause();

        if (FAGroup_int > 0)
        {
            Query.AddWhere("fa_group", Comparison.Equals, fagroup_db);
        }

        if (NarLogText.Length > 2)
        {
            if (Incidentdt.Date < Controldt.Date)
            {
                Query.AddWhere("nar_log_text", Comparison.Like, "TEXT");
            }
            else
            {
                Query.AddWhere("nar_log_entry", Comparison.Like, "Log Entry");
            }

        }

        else
        {
            // do nothing
        }

        if (NarLogText.Length > 1 && NarrtiveSplit.Length < 2)
        {
            clause = Query.AddWhere("nar_log_text", Comparison.Like, new SqlLiteral("'%" + NarLogText.ToUpper() + "%'"));
        }

        if (NarLogText.Length > 1 && NarrtiveSplit.Length >= 2)
        {
            clause = Query.AddWhere("nar_log_text", Comparison.Like, "SQLworkaround");

            foreach (string t in NarrtiveSplit)
            {
                clause.AddClause(LogicOperator.Or, Comparison.Like, "%" + t + "%");
            }
        }

        else
        {
            if (NarLogText.Length == 0)
            {
                //clause = Query.AddWhere("nar_log_text", Comparison.Like, new SqlLiteral("'%" + tb_NarLogSearch.Text.ToUpper() + "%'"));
            }
        }

        if (IncidentNumber.Length > 2)
        {
            Query.AddWhere("id_in_ref", Comparison.Equals, IncidentNumber);
        }

        if (oicincname.Length > 2)
        {
            Query.AddWhere("oic_inc_name", Comparison.Like, "%" + oicincname.ToUpper() + "%");
        }

        if (OfficerCallSign_search.Length > 1)
        {
            Query.AddWhere("MB_CALL_SIGN", Comparison.Equals, OfficerCallSign_search);
        }

        if (ADI_search.Length > 4)
        {
            Query.AddWhere("Adi_General", Comparison.Like, "%" + ADI_search + "%");
        }

        if (CauseofFire_search.Length > 3)
        {
            Query.AddWhere("fire_cause", Comparison.Like, "%" + CauseofFire_search + "%");
        }

        if (PropCat_search.Length > 1)
        {
            Query.AddWhere("property_category", Comparison.Equals, PropCat_search);
        }

        if (Propsub_search.Length > 1)
        {
            Query.AddWhere("lup_name", Comparison.Equals, Propsub_search);
        }

        if (Address_search.Length > 0)
        {
            
            Query.AddWhere("inc_location_address", Comparison.Like, "%" + Address_search + "%");
        }
        //else
        //{
        //    Query.AddWhere("Revised_Address", Comparison.Like, "%" + RevisedAddress + "%");
        //}

        if (WatchCond > 0)
        {
            Query.AddWhere("WatchDesc", Comparison.Equals, Watch_search);
        }

        if (ward_db.Length > 2)
        {
            Query.AddWhere("[dmtreporting_dev].[dbo].[incidentdim].ward", Comparison.In, ward_db);
        }

        if (AreaCond.Length > 1)
        {
            Query.AddWhere("cluster", Comparison.Equals, AreaCond);
        } //12/01/2015

        if (RiskCond.Length > 1)
        {
            Query.AddWhere("[dmtreporting_dev].[dbo].[incidentdim].risk_cat", Comparison.In, RiskCond);
        }

        if (TargetCond.Length > 1)
        {
            Query.AddWhere("PFStatus", Comparison.Equals, TargetCond);
        }

        if (IncidentCat.Length > 3)
        {
            Query.AddWhere("incident_category", Comparison.Equals, IncidentCat);
        }

        if (EquipmentSelection.Length > 1)
        {
            Query.AddWhere("Equip_Description", Comparison.In, EquipmentSelection);
        }

        if (IRSCond.Length > 1)
        {
            Query.AddWhere("incident_stage", Comparison.Equals, IRSCond);
        }

        if (StationCond.Length > 2)
        {
            Query.AddWhere("[dmtreporting_dev].[dbo].[incidentdim].admin_st_ref", Comparison.Equals, StationCond);
        }

        if (BoroughCond.Length > 1)
        {
            Query.AddWhere("[dmtreporting_dev].[dbo].[incidentdim].borough", Comparison.Equals, BoroughCond);
        }


        if (StartDateCond.Length == 10 && EndDateCond == string.Empty)
        {
            Query.AddWhere("CONVERT(DATE,[dmtreporting_dev].[dbo].[incidentdim].inc_created_date)", Comparison.Equals,
                new SqlLiteral("CONVERT(DATETIME," + "'" + StartDateCond + "'" + ",103)"));
        }
        if (StartDateCond.Length == 10)
        {
            Query.AddWhere("CONVERT(DATE,[dmtreporting_dev].[dbo].[incidentdim].inc_created_date)",
                Comparison.GreaterOrEquals, new SqlLiteral("CONVERT(DATETIME," + "'" + StartDateCond + "'" + ",103)"));
        }


        if (EndDateCond == string.Empty)
        {
        }
        else
        {
            Query.AddWhere("CONVERT(DATE,[dmtreporting_dev].[dbo].[incidentdim].inc_created_date)",
                Comparison.LessOrEquals, new SqlLiteral("CONVERT(DATETIME," + "'" + EndDateCond + "'" + ",103)"));
        }


        if (SSType > 0)
        {
            Query.AddWhere("[dmtreporting_dev].[dbo].[incidentdim].ss_ter_type", Comparison.Equals, SSType_search);
        }

        if (SSClass > 0)
        {
            Query.AddWhere("[dmtreporting_dev].[dbo].[incidentdim].ss_sec_type", Comparison.Equals, SSClass_search);
        }


        if (TimeCond.Equals("1") && EndDateCond == string.Empty && StartDateCond == string.Empty)
        {
            Query.AddWhere("[dmtreporting_dev].[dbo].[incidentdim].inc_created_date", Comparison.GreaterOrEquals,
                new SqlLiteral("Dateadd(Month, Datediff(Month, 0, DATEADD(m, -35, current_timestamp)), 0)"));
        }
        if (TimeCond.Equals("2") && EndDateCond == string.Empty && StartDateCond == string.Empty)
        {
            Query.AddWhere("[dmtreporting_dev].[dbo].[incidentdim].inc_created_date", Comparison.GreaterOrEquals,
                new SqlLiteral("Dateadd(Month, Datediff(Month, 0, DATEADD(m, -24, current_timestamp)), 0)"));
        }
        if (TimeCond.Equals("3") && EndDateCond == string.Empty && StartDateCond == string.Empty)
        {
            Query.AddWhere("[dmtreporting_dev].[dbo].[incidentdim].inc_created_date", Comparison.GreaterOrEquals,
                new SqlLiteral("Dateadd(Month, Datediff(Month, 0, DATEADD(m, -12, current_timestamp)), 0)"));
        }
        if (TimeCond.Equals("4") && EndDateCond == string.Empty && StartDateCond == string.Empty)
        {
            Query.AddWhere("[dmtreporting_dev].[dbo].[incidentdim].inc_created_date", Comparison.GreaterOrEquals,
                new SqlLiteral("Dateadd(Month, Datediff(Month, 0, DATEADD(m, -6, current_timestamp)), 0)"));
        }
        if (TimeCond.Equals("5") && EndDateCond == string.Empty && StartDateCond == string.Empty)
        {
            Query.AddWhere("[dmtreporting_dev].[dbo].[incidentdim].inc_created_date", Comparison.GreaterOrEquals,
                new SqlLiteral("Dateadd(Month, Datediff(Month, 0, DATEADD(m, -3, current_timestamp)), 0)"));
        }


        Query.AddOrderBy("[dmtreporting_dev].[dbo].[incidentdim].inc_created_date", Sorting.Descending);

        SQL_Query = Query.BuildQuery();


        return SQL_Query;
    }

    /// <summary>
    /// GetAdvancedSearchResults Method: Returns a dataset with search results
    /// </summary>
    /// <param name="Query"> type 1 = Pass the select query from AdvancedSearchQuery </param>

    public DataSet GetAdvancedSearchResults(string Query)
    {

        DataSet returnedResults = new DataSet();
             SQLConnection ConnectToDataBase;

        //connect to the database
        ConnectToDataBase = new SQLConnection
        {
            Sql = Query,
            connection_string = SQLConnect
        };

        //set the sql statement to bind to the gridview


        returnedResults = ConnectToDataBase.GetConnection;

        return returnedResults;

    }

    /// <summary>
    /// MISSearch Method: Searches ThreeTC databases for incidents.
    /// </summary>


    public string MISSearch() 
    {
        SelectQueryBuilder Query = new SelectQueryBuilder(); //creates the query reference 

        Query.SelectColumns("inc.inc_fk_in AS 'Incident Number'",
            "convert(VARCHAR(50), inc.inc_date_created, 113) AS [Incident Date]",
            "inc.inc_location_address AS [Incident Address]",
            "CASE WHEN inc.inc_incident_category = 1 THEN 'Fire' WHEN inc.inc_incident_category = 0 THEN 'False Alarm' WHEN inc.inc_incident_category = 2 THEN 'Special Service' ELSE 'Other/Non Attendance' END AS Category",
            "CASE WHEN inc.inc_stage = 1 THEN 'Not Started' WHEN inc.inc_stage = 2 THEN 'Not Completed' WHEN inc.inc_stage = 3 THEN 'Completed' WHEN inc.inc_stage = 4 THEN 'Checked' ELSE 'No Data' END AS 'IRS Stage'");

        Query.SelectFromTable("threetc_mis.dbo.inc_incident inc");

        Query.AddWhere("inc.inc_location_address", Comparison.Like, "%%" + Address_search + "%%");
        

        if (StartDateCond.Length == 10)
        {
            Query.AddWhere("CONVERT(DATE,inc.inc_date_created)",
                Comparison.GreaterOrEquals, new SqlLiteral("CONVERT(DATETIME," + "'" + StartDateCond + "'" + ",103)"));
        }

        if (EndDateCond == string.Empty)
        {
        }
        else
        {
            Query.AddWhere("CONVERT(DATE,inc.inc_date_created)",
                Comparison.LessOrEquals, new SqlLiteral("CONVERT(DATETIME," + "'" + EndDateCond + "'" + ",103)"));
        }

        Query.AddOrderBy("inc.inc_date_created", Sorting.Descending);


        SQL_Query = Query.BuildQuery();

        return SQL_Query;

    }
}



        
























