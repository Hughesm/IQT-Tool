using System;
using System.Data;
using System.Drawing;
using System.IO;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRS;

public partial class Reports : Page
{
    public string IncNumber;

    public string Lattitude;
    public string Longitude;
    public string IncidentType;        //set in ExtractIncidentInfomation() used to test and unhide objects

    DataSet IncidentData = new DataSet(); //holds data to be used to populate objects
    DataSet Equipment = new DataSet();
    DataSet NarrativeLog = new DataSet();
    DataSet IncidentMobilisation = new DataSet();
    string IRSNumber; // set in GetIncidentData()
    string MobLatLng;// set in GetIncidentData()
    //string ArrLatLng;// set in GetIncidentData()

    AdvIRS SelectedIncident = new AdvIRS();

    protected void Page_Load(object sender, EventArgs e)
    {

        {

            if (MySession.Current.ActiveDebug == "true") { debug1.Visible = true; debug2.Visible = true; debug3.Visible = true; }
            else { debug1.Visible = false; debug2.Visible = false; debug3.Visible = false; }

            IncNumber = Server.UrlDecode(Request.QueryString["ID"]);

            Thread T1 = new Thread(SetIncidentData);
            Thread T3 = new Thread(MobsData);
            Thread T4 = new Thread(UsedEquip);


            T1.Start();
            T3.Start();
            T4.Start();

            T1.Join();
            T3.Join();
            T4.Join();

            GetIncidentData();
            //alters page dependent on user selections

            PageAlterations();


        }
    }

    public void SetIncidentData()
    {
        SelectedIncident.IncidentData = SelectedIncident.PopulateIncidentData(IncNumber);
        Thread.Sleep(0);

    }

    public void MobsData()
    {
        IncidentMobilisation = SelectedIncident.IncidentMobilisation(IncNumber);
        MobilisationData(IncidentMobilisation);
        Thread.Sleep(0);
    }

    public void UsedEquip()
    {
        Equipment = SelectedIncident.IncidentEquipment(IncNumber);
        ExtractIncidentEquipment(Equipment);
        Thread.Sleep(0);
    }



    public void GetIncidentData()
    {
        NarrativeLog = SelectedIncident.NarrativeLog(IncNumber, dd_narfilter.SelectedIndex);
        ExtractNarrativeLog(NarrativeLog);

        //Use IncidentData
        try
        {
            SelectedIncident.inclocationaddress = SelectedIncident.IncidentData.Tables[0].Rows[0]["Location Address"].ToString();
            tb_Address.Text = SelectedIncident.inclocationaddress;

            SelectedIncident.idinref = SelectedIncident.IncidentData.Tables[0].Rows[0]["Incident Number"].ToString();
            tb_IncidentNumber.Text = SelectedIncident.idinref;

            SelectedIncident.inccreateddate = SelectedIncident.IncidentData.Tables[0].Rows[0]["Date Created"].ToString();
            tb_DateCreated.Text = SelectedIncident.inccreateddate;
            tb_incCreatedDate.Text = SelectedIncident.inccreateddate;

            SelectedIncident.borough = SelectedIncident.IncidentData.Tables[0].Rows[0]["Borough"].ToString();
            tb_Borough.Text = SelectedIncident.borough;

            SelectedIncident.ward = SelectedIncident.IncidentData.Tables[0].Rows[0]["Ward"].ToString();
            tb_Ward.Text = SelectedIncident.ward;

            SelectedIncident.idstref = SelectedIncident.IncidentData.Tables[0].Rows[0]["Station"].ToString();
            tb_Station.Text = SelectedIncident.idstref;

            SelectedIncident.fagroup = SelectedIncident.IncidentData.Tables[0].Rows[0]["fa_group"].ToString();
            tb_faGroup.Text = SelectedIncident.fagroup;

            SelectedIncident.propertycategory = SelectedIncident.IncidentData.Tables[0].Rows[0]["Property Category"].ToString();
            tb_PropertyCategory.Text = SelectedIncident.propertycategory;

            SelectedIncident.PropertyType = SelectedIncident.IncidentData.Tables[0].Rows[0]["Property_Type"].ToString();
            tb_PropertyType.Text = SelectedIncident.PropertyType;

            SelectedIncident.firecause = SelectedIncident.IncidentData.Tables[0].Rows[0]["Cause of Fire"].ToString();
            tb_CauseofFire.Text = SelectedIncident.firecause;

            SelectedIncident.iddesc = SelectedIncident.IncidentData.Tables[0].Rows[0]["Building Description"].ToString();
            tb_BuildingDesc.Text = SelectedIncident.iddesc;

            SelectedIncident.WatchDesc = SelectedIncident.IncidentData.Tables[0].Rows[0]["Watch"].ToString();
            tb_Crew.Text = SelectedIncident.WatchDesc;

            SelectedIncident.riskcat = SelectedIncident.IncidentData.Tables[0].Rows[0]["Risk Category"].ToString();
            tb_RiskCat.Text = SelectedIncident.riskcat;

            SelectedIncident.fireclassification = SelectedIncident.IncidentData.Tables[0].Rows[0]["fire_classification"].ToString();
            tb_FireClass.Text = SelectedIncident.fireclassification;

            SelectedIncident.lupname = SelectedIncident.IncidentData.Tables[0].Rows[0]["lup_name"].ToString();
            tb_lupname.Text = SelectedIncident.lupname;//

            IRSNumber = SelectedIncident.IncidentData.Tables[0].Rows[0]["inc_pk"].ToString();


            SelectedIncident.incidentcategory = SelectedIncident.IncidentData.Tables[0].Rows[0]["Incident Type"].ToString();
            tb_IncidentType.Text = SelectedIncident.incidentcategory;
            IncidentType = SelectedIncident.incidentcategory; //

            IRSNumber = SelectedIncident.IncidentData.Tables[0].Rows[0]["inc_pk"].ToString();

            SelectedIncident.IncTimeStoppedMobilising = SelectedIncident.IncidentData.Tables[0].Rows[0]["Inc_Time_Stopped_Mobilising"].ToString();
            tb_StopMessage.Text = SelectedIncident.IncTimeStoppedMobilising;

            SelectedIncident.OriginOfCall = SelectedIncident.IncidentData.Tables[0].Rows[0]["Origin_Of_Call"].ToString();
            tb_CallOrigin.Text = SelectedIncident.OriginOfCall;

            SelectedIncident.oicincname = SelectedIncident.IncidentData.Tables[0].Rows[0]["oic_inc_name"].ToString();
            tb_oic.Text = SelectedIncident.oicincname;

            SelectedIncident.AdiGeneral = SelectedIncident.IncidentData.Tables[0].Rows[0]["Adi_General"].ToString();
            tb_AdiGen.Text = SelectedIncident.AdiGeneral;

            SelectedIncident.sstype = SelectedIncident.IncidentData.Tables[0].Rows[0]["ss_type"].ToString();
            tb_SsType.Text = SelectedIncident.sstype;

            SelectedIncident.sstertype = SelectedIncident.IncidentData.Tables[0].Rows[0]["ss_ter_type"].ToString();
            tb_SsTerType.Text = SelectedIncident.sstertype;

            SelectedIncident.FireStartLocation = SelectedIncident.IncidentData.Tables[0].Rows[0]["Fire_Start_Location"].ToString();
            tb_StartLocation.Text = SelectedIncident.FireStartLocation;

            SelectedIncident.IgnitionSource = SelectedIncident.IncidentData.Tables[0].Rows[0]["Ignition_Source"].ToString();
            tb_IgnitionSource.Text = SelectedIncident.IgnitionSource;

            SelectedIncident.ItemFirstIgnited = SelectedIncident.IncidentData.Tables[0].Rows[0]["Item_First_Ignited"].ToString();
            tb_ItemIgnited.Text = SelectedIncident.ItemFirstIgnited;

            SelectedIncident.FireMainCause = SelectedIncident.IncidentData.Tables[0].Rows[0]["Fire_Main_Cause"].ToString();
            tb_MainCause.Text = SelectedIncident.FireMainCause;

            SelectedIncident.Latitude = SelectedIncident.IncidentData.Tables[0].Rows[0]["Latitude"].ToString();
            Lattitude = SelectedIncident.Latitude;//

            SelectedIncident.Longitude = SelectedIncident.IncidentData.Tables[0].Rows[0]["Longitude"].ToString();
            Longitude = SelectedIncident.Longitude;//

            Lat.Text = Lattitude + " , " + Longitude;


            SelectedIncident.victimtype = SelectedIncident.IncidentData.Tables[0].Rows[0]["victim_type"].ToString();
            tb_VictimAge.Text = SelectedIncident.victimtype;

            SelectedIncident.victimage = SelectedIncident.IncidentData.Tables[0].Rows[0]["victim_age"].ToString();
            tb_VictimAge.Text = SelectedIncident.victimage;


            SelectedIncident.victimgender = SelectedIncident.IncidentData.Tables[0].Rows[0]["victim_gender"].ToString();
            tb_VictimGender.Text = SelectedIncident.victimgender;


            SelectedIncident.victimethnicity = SelectedIncident.IncidentData.Tables[0].Rows[0]["victim_ethnicity"].ToString();
            tb_VictimEthnicity.Text = SelectedIncident.victimethnicity;


            SelectedIncident.victimwasrescued = SelectedIncident.IncidentData.Tables[0].Rows[0]["victim_was_rescued"].ToString();
            tb_VictimRescued.Text = SelectedIncident.victimwasrescued;


            SelectedIncident.victimrescuedby = SelectedIncident.IncidentData.Tables[0].Rows[0]["victim_rescued_by"].ToString();
            tb_VictimRescuedby.Text = SelectedIncident.victimrescuedby;


            SelectedIncident.victimrescuemethod = SelectedIncident.IncidentData.Tables[0].Rows[0]["victim_rescue_method"].ToString();
            tb_RescuemMethod.Text = SelectedIncident.victimrescuemethod;


            SelectedIncident.victimnatureofinjury = SelectedIncident.IncidentData.Tables[0].Rows[0]["victim_nature_of_injury"].ToString();
            tb_NatureInjury.Text = SelectedIncident.victimnatureofinjury;


            SelectedIncident.victimnatureofinjury = SelectedIncident.IncidentData.Tables[0].Rows[0]["victim_severity_of_injury"].ToString();
            tb_Severity.Text = SelectedIncident.victimnatureofinjury;


        }
        catch (Exception err)
        {
            lblResults.Visible = true;
            lblResults.ForeColor = Color.Red;
            lblResults.Text = "An error has occurred loading data, Check if the Incident has been started in IRS. (ExtractIncidentInfomation)";
            lblResults.Text += err.Message;
        }




    } //main method

    public void MobilisationData(DataSet MobsIncident)
    {

        try
        {

            //then bind dataset to the gridview
            GridMobs.AutoGenerateColumns = false;
            GridMobs.DataSource = MobsIncident;
            GridMobs.DataBind();
            GridMobs.UseAccessibleHeader = true;
            GridMobs.HeaderRow.TableSection = TableRowSection.TableHeader;

            if (MobsIncident.Tables[0].Rows[0]["OfficerCount"].ToString() == string.Empty)
            {
                tb_OfficerNum.Text = "No Officers were sent to this incident";
                tb_OfficerNum.ForeColor = Color.Red;
            }
            else { tb_OfficerNum.Text = MobsIncident.Tables[0].Rows[0]["OfficerCount"].ToString(); }

            tb_NumPumps.Text = MobsIncident.Tables[0].Rows[0]["num_vehicles_deployed"].ToString();

            var totalSeconds = Int32.Parse(MobsIncident.Tables[0].Rows[0]["Send_to_Leave_int"].ToString());
            var span = TimeSpan.FromSeconds(totalSeconds);
            tb_TotalTime.Text = span.ToString(@"hh\:mm\:ss") + " secs";


            if (MobsIncident.Tables[0].Rows[0]["Emergency"].ToString() == "1")
            {
                if (tb_Emergency != null) tb_Emergency.Text = "Yes";
            }
            else
            {
                if (tb_Emergency != null) tb_Emergency.Text = "No";
            }

            MobLatLng = MobsIncident.Tables[0].Rows[0]["MobLatLong"].ToString();
            //ArrLatLng = MobsIncident.Tables[0].Rows[0]["ArrLatLong"].ToString();

            MobLat.Text = MobLatLng;

        }


        catch (Exception err)
        {
            Results.Visible = true;
            lblResults.Visible = true;
            lblResults.ForeColor = Color.Red;
            lblResults.Text = "An error has occurred loading data into the table view. Check Incident has been started in IRS. (MobsData)";
            lblResults.Text += err.Message;
        }

    } //extracts mobs data KEEP

    public void ExtractNarrativeLog(DataSet narDataset)
    {

        try
        {

            GridView1.AutoGenerateColumns = true;
            GridView1.DataSource = narDataset;


            GridView1.DataBind();
            GridView1.UseAccessibleHeader = true;
            GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;

        }

        catch (Exception err)
        {
            Results.Visible = true;
            lblResults.Visible = true;
            lblResults.ForeColor = Color.Red;
            lblResults.Text = "An error has occurred loading data into the table view. (Narrative Log)";
            lblResults.Text += err.Message;
        }

    } // Extracts Narrative Log KEEP

    public void ExtractIncidentEquipment(DataSet IncidentEquipment)
    {

        try
        {

            if (IncidentEquipment.Tables[0].Rows[0]["Equipment Description"].ToString() == "")
            {
                lbl_EquipmentUsed.ForeColor = Color.Red;
                lbl_EquipmentUsed.Text = "No Equipment was entered into IRS.";
            }
            else
            {
                lbl_EquipmentUsed.Visible = false;
                GridView2.AutoGenerateColumns = true;
                GridView2.DataSource = IncidentEquipment;

                GridView2.DataBind();
                GridView2.UseAccessibleHeader = true;
                GridView2.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
        }
        catch (Exception exec)
        {
            lbl_EquipmentUsed.Text = exec.ToString();
        }

    } //KEEP


    protected void tb_AdiGen_Load(object sender, EventArgs e)
    {
        int charRows;
        int chars;
        var tbCOntent = tb_AdiGen.Text;
        tb_AdiGen.Columns = 10;
        chars = tbCOntent.Length;
        charRows = chars / tb_AdiGen.Columns;
        int remaining = chars - charRows * tb_AdiGen.Columns;
        if (remaining == 0)
        {
            tb_AdiGen.Rows = charRows;
            tb_AdiGen.TextMode = TextBoxMode.MultiLine;
        }
        else
        {
            tb_AdiGen.Rows = charRows + 1;
            tb_AdiGen.TextMode = TextBoxMode.MultiLine;
        }

    } //expand textbox

    public void PageAlterations() //alters page dependent on user selections 
    {
        switch (IncidentType)
        {
            case "":
                NothingSelected();
                break;
            case "False Alarm":
                FASelected();
                break;
            case "Fire":
                FireSelected();
                break;
            case "Special Service":
                SpecialService();
                break;
            case "Other None CLG":
                OtherClg();
                break;
            default: NothingSelected();
                break;

        }
        if (tb_CauseofFire.Text == string.Empty) { CauseofFire.Visible = false; }
        if (tb_IncidentCategory.Text == string.Empty) { IncidentCategory.Visible = false; }

        alarmOperated.Visible = SelectedIncident.IncidentData.Tables[0].Rows[0]["Property Category"].ToString() != "RoadVehicle";

        if (SelectedIncident.IncidentData.Tables[0].Rows[0]["susp_under_influence_yn"].ToString() == "Yes") { CB_UnderInfluence.Checked = true; }
        else { CB_UnderInfluence.Checked = false; UnderInfluence.Visible = false; }//show if under influence

        if (SelectedIncident.IncidentData.Tables[0].Rows[0]["attack_on_ff_yn"].ToString() == "Yes") { CB_attack_on_ff.Checked = true; lbl_attack_on_ff.Visible = true; }
        else { CB_attack_on_ff.Checked = false; attack_on_ff.Visible = false; } //show if its attack on ff

        if (SelectedIncident.IncidentData.Tables[0].Rows[0]["attack_on_ff_yn"].ToString() == "Yes") { tb_attack_on_ff_type.Text = IncidentData.Tables[0].Rows[0]["attack_on_ff_type"].ToString(); lbl_attack_on_ff_type.Visible = true; }
        else { attack_on_ff_type.Visible = false; } //show type of attack on ff

        if (SelectedIncident.IncidentData.Tables[0].Rows[0]["rtc_extrication_yn"].ToString() == "Yes") { CB_RtcExtrication.Checked = true; RtcExtrication.Visible = true; }
        else { CB_RtcExtrication.Checked = false; RtcExtrication.Visible = false; }

        if (SelectedIncident.IncidentData.Tables[0].Rows[0]["is_rtc_yn"].ToString() == "Yes") { CB_RTC.Checked = true; RTC.Visible = true; }
        else { CB_RTC.Checked = false; RTC.Visible = false; } //show if its a rtc                                                 

        if (SelectedIncident.IncidentData.Tables[0].Rows[0]["heat_smoke_only_yn"].ToString() == "Yes")
        {
            CB_HeatnSmoke.Checked = true; HeatnSmoke.Visible = false; MainCause.Visible = false; ItemIgnited.Visible = false; IgnitionSource.Visible = false;
            StartLocation.Visible = false;
        }
        else
        {
            HeatnSmoke.Visible = false;
        }

        alarmOperated.Visible = SelectedIncident.IncidentData.Tables[0].Rows[0]["alarm_operated_yn"].ToString() == "Yes";

        if (SelectedIncident.IncidentData.Tables[0].Rows[0]["alarm_system_present_yn"].ToString() == "Yes") { CB_alarm_system_present.Checked = true; CB_alarm_system_present.Visible = true; alarm_system_present.Visible = true; }
        else { CB_alarm_system_present.Checked = false; alarm_system_present.Visible = false; } //show if alarm present

        if (SelectedIncident.IncidentData.Tables[0].Rows[0]["alarm_system_present_yn"].ToString() == "Yes") { tb_AlarmType.Text = SelectedIncident.IncidentData.Tables[0].Rows[0]["alarm_type"].ToString(); }
        else { AlarmType.Visible = false; } //if alarm is present what type?

        if (SelectedIncident.IncidentData.Tables[0].Rows[0]["derelict_yn"].ToString() == "Yes") { CB_Derelict.Checked = true; Derelict.Visible = true; }
        else { CB_Derelict.Checked = false; Derelict.Visible = false; } //show if dereclict

        if (SelectedIncident.IncidentData.Tables[0].Rows[0]["conf_origin_yn"].ToString() == "Yes") { CB_ConfOrigin.Checked = true; ConfOrigin.Visible = true; }
        else { CB_ConfOrigin.Checked = false; ConfOrigin.Visible = false; } //show if fire was confined to origin

        if (SelectedIncident.IncidentData.Tables[0].Rows[0]["hazmat_involved_yn"].ToString() == "Yes") { CB_hazmat.Checked = true; hazmat.Visible = true; }
        else { CB_hazmat.Checked = false; hazmat.Visible = false; } //show if hazmat involved

        if (tb_VictimType.Text == string.Empty && tb_VictimAge.Text == string.Empty && tb_VictimGender.Text == string.Empty &&
         tb_VictimEthnicity.Text == string.Empty && tb_VictimRescuedby.Text == string.Empty && tb_VictimRescued.Text == string.Empty &&
         tb_RescuemMethod.Text == string.Empty && tb_NatureInjury.Text == string.Empty && tb_Severity.Text == string.Empty)
        {
            casinfo.Visible = true; lbl_CasInfo.Visible = true; lbl_CasInfo.Text = "No Casualty Information has been entered into IRS"; lbl_CasInfo.ForeColor = Color.Red;

            victim1.Visible = false;
            victim2.Visible = false;
        }

        if (tb_StartLocation.Text == string.Empty && tb_IgnitionSource.Text == string.Empty && tb_MainCause.Text == string.Empty && tb_alarmOperated.Text == string.Empty &&
            tb_AlarmType.Text == string.Empty && tb_faGroup.Text == string.Empty)
        {
            lbl_info.Text = "No Additional Information for this incident was entered into IRS."; lbl_info.Visible = true; lbl_info.ForeColor = Color.Red;
        }

        switch (SelectedIncident.IncidentData.Tables[0].Rows[0]["incident_stage"].ToString())
        {
            case "Completed":
                lbl_IRSStage.ForeColor = Color.Green;
                lbl_IRSStage.Text = "Completed";
                break;
            case "Checked":
                lbl_IRSStage.ForeColor = Color.Green;
                lbl_IRSStage.Text = "Checked";
                break;
            case "Not Completed":
                lbl_IRSStage.ForeColor = Color.Red;
                lbl_IRSStage.Text = "Not Completed";
                break;
            case "Not Started":
                lbl_IRSStage.ForeColor = Color.Red;
                lbl_IRSStage.Text = "Not Started";
                break;
            case "Archived":
                lbl_IRSStage.ForeColor = Color.Blue;
                lbl_IRSStage.Text = "Archived";
                break;

        }

    }

    protected void GotoIncident(object sender, EventArgs e) //view incident in IRS
    {
        string test = "http://hq-ict-12592v/Portal/DesktopModules/AssetCoModules/MIS/IncidentRecordingSystem/IRS.aspx?pageID=291&mID=2814&iid=" + IRSNumber;

        OpenNewBrowserWindow(test, this);
        //Response.Redirect(test);
    }

    public void OtherClg()
    {
        MainCause.Visible = false; ItemIgnited.Visible = false; IgnitionSource.Visible = false;
        StartLocation.Visible = false; alarmOperated.Visible = false; alarmOperated.Visible = false;
        SsTerType.Visible = false; SsType.Visible = false; SsSecType.Visible = false;
        SsTerType.Visible = false; SsType.Visible = false;

        lbl_info.ForeColor = Color.Red;
        lbl_info.Visible = true;
        lbl_info.Text = "No Information to display";
        lbl_CauseofFire.Visible = false; tb_CauseofFire.Visible = false;
        // lbl_side_cause.Text = "Other Information";
        lbl_accor_CauseInfor.Text = "Other Information";

        lbl_SsTerType.Visible = false;
        lbl_SsType.Visible = false;
        tb_SsSecType.Visible = false; tb_SsTerType.Visible = false; tb_SsType.Visible = false;
        if (tb_FireClass.Text == string.Empty) { FireClass.Visible = false; }


    }

    public void NothingSelected()
    {
        MainCause.Visible = false; ItemIgnited.Visible = false; IgnitionSource.Visible = false;
        StartLocation.Visible = false; alarmOperated.Visible = false; alarmOperated.Visible = false;
        SsTerType.Visible = false; SsType.Visible = false; SsSecType.Visible = false;
        SsTerType.Visible = false; SsType.Visible = false;

        lbl_accor_CauseInfor.Text = "Other Information";

        if (tb_IncidentCategory.Text == string.Empty) { tb_IncidentCategory.Visible = false; lbl_IncidentCategory.Visible = false; }
        else { tb_IncidentCategory.Text = IncidentData.Tables[0].Rows[0]["Incident Category"].ToString(); lbl_IncidentCategory.Visible = true; }

    }

    public void SpecialService()
    {
        lbl_accor_CauseInfor.Text = "Special Service Information";

        MainCause.Visible = false; ItemIgnited.Visible = false; IgnitionSource.Visible = false;
        StartLocation.Visible = false; alarmOperated.Visible = false; alarmOperated.Visible = false; faGroup.Visible = false;

        if (tb_SsSecType.Text == string.Empty)
        {
            SsSecType.Visible = false;
        }
        else
        { tb_SsSecType.Text = IncidentData.Tables[0].Rows[0]["ss_sec_type"].ToString(); lbl_SsSecType.Visible = true; }

    }

    public void FASelected()
    {
        lbl_accor_CauseInfor.Text = "False Alarm Information";
        lbl_info.Text = "No False Alarm Information Available....(?)";

        MainCause.Visible = false; ItemIgnited.Visible = false; IgnitionSource.Visible = false;
        StartLocation.Visible = false; alarmOperated.Visible = false; alarmOperated.Visible = false;
        SsTerType.Visible = false; SsType.Visible = false; SsSecType.Visible = false;
        SsTerType.Visible = false; SsType.Visible = false;

        if (tb_alarmOperated.Text == string.Empty) { alarmOperated.Visible = false; }

        if (tb_FireClass.Text == string.Empty) { FireClass.Visible = false; }
    }

    public void FireSelected()
    {
        SsTerType.Visible = false; SsType.Visible = false;
        SsSecType.Visible = false;

        if (tb_MainCause.Text == string.Empty) { MainCause.Visible = false; }
        if (tb_faGroup.Text == string.Empty)
        {
            faGroup.Visible = false;
            lbl_faGroup.Visible = false;
            tb_faGroup.Visible = false;
        }
        if (tb_ItemIgnited.Text == string.Empty) { ItemIgnited.Visible = false; }
        if (tb_IgnitionSource.Text == string.Empty) { IgnitionSource.Visible = false; }
        if (tb_StartLocation.Text == string.Empty) { StartLocation.Visible = false; }
        if (tb_alarmOperated.Text == string.Empty) { alarmOperated.Visible = false; }
        if (tb_faGroup.Text == string.Empty) { lbl_faGroup.Visible = false; tb_faGroup.Visible = false; }
    }

    protected void OnPaging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataBind();
        GridView1.UseAccessibleHeader = true;
        GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
        NarLogPanel.Update();
    }

    protected void MobsPaging(object sender, GridViewPageEventArgs e)
    {
        GridView2.PageIndex = e.NewPageIndex;
        GridView2.DataBind();
        GridView2.UseAccessibleHeader = true;
        GridView2.HeaderRow.TableSection = TableRowSection.TableHeader;
        Mobsupdate.Update();
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType != DataControlRowType.DataRow) return;
        e.Row.Attributes["onmouseover"] = "this.style.backgroundColor='aquamarine';";
        e.Row.Attributes["onmouseout"] = "this.style.backgroundColor='white';";
        e.Row.ToolTip = "Click to select this Incident.";

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[1].Attributes.Add("style", "word-break:break-all;word-wrap:break-word;");
        }
    }

    protected void ExportPDF_Click(object sender, EventArgs e)
    {

    }

    protected void ExportWord_Click(object sender, EventArgs e)
    {
        CreateDocument();

    }

    public override void VerifyRenderingInServerForm(Control control)
    {
        // base.VerifyRenderingInServerForm(control);
    }

    public void CreateDocument()
    {
        Response.Clear();
        Response.Buffer = true;
        Response.AddHeader("content-disposition", "attachment;filename=" + tb_IncidentNumber.Text + "_Narrative_Log_export" + ".doc");

        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.ContentType = "application/vnd.word";

        StringWriter stringWrite = new StringWriter();
        HtmlTextWriter htmlWrite = new HtmlTextWriter(stringWrite);

        GridView1.AllowPaging = false;
        GridView1.DataBind();
        GridView1.RenderControl(htmlWrite);

        Response.Output.Write(stringWrite);

        Response.Flush();

        Response.End();



    }

    public static void OpenNewBrowserWindow(string Url, Control control) //uses scriptmanager to force JS to open a new window (server side controlled isntead of client)
    {
        ScriptManager.RegisterStartupScript(control, control.GetType(), "Open", "window.open('" + Url + "');", true);
    }


    protected void InsuranceReport_Click(object sender, EventArgs e)
    {

        string[] loggeduser = { @"GMFS\PorterS", @"GMFS\hughesm", @"GMFS\leechc", @"GMFS\peersh", @"GMFS\Wilkinsonam", @"GMFS\penningtonc", @"GMFS\kershawm" };
        string user = User.Identity.Name;

        //var results = Array.FindAll(loggeduser, s => s.Equals(user)); linq 
        bool userexists = Array.IndexOf(loggeduser, user) >= 0;

        try
        {
            if (userexists == true)
            {
                string test = Server.UrlEncode("InsuranceReport.aspx?ID=" + IncNumber + "&Type=" + tb_IncidentType.Text);

                Response.Redirect("InsuranceReport.aspx?ID=" + IncNumber + "&Type=" + IncidentType);

            }
            else
            {
                Response.Redirect("Reports.aspx?ID=" + IncNumber);

            }
        }
        catch (Exception exec)
        {
            Console.WriteLine(exec);
        }


    }
}








