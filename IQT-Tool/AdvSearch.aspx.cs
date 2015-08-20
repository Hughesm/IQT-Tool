using System;
using System.Data;
using System.Drawing;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRS;

/// <summary>
/// debug1 is set to show the main SQL query
/// debug2 Not currently set 
/// debug3 Not currently set 
/// </summary>




public partial class AdvSearch : Page
{
    AdvIRS _incidentSearch = new AdvIRS();
    DataSet IncidentData = new DataSet();
    DataTable IncidentTable = new DataTable();

    public string SelectedValue;


    
    
   
    protected void Page_Load(object sender, EventArgs e)
    {

        BindResultsToGrid();

        DD_TimeScale.SelectedIndex = 3;
        if (MySession.Current.ActiveDebug == "true") { debug1.Visible = true; debug2.Visible = true; debug3.Visible = true; } 
        else { debug1.Visible = false; debug2.Visible = false; debug3.Visible = false; }


    }

    public override void VerifyRenderingInServerForm(Control control)
    {
        //base.VerifyRenderingInServerForm(control);
    }


    protected DataSet QueryBuilder()
    {
        AdvancedSearch AdvancedQuery = new AdvancedSearch
        {
            PumpCond = dd_NumberofPumpsSearch.SelectedValue,
            WatchCond = DD_WatchSearch.SelectedIndex,
            StartDateCond = tbStartDate.Text,
            EndDateCond = tbEndDate.Text,
            AreaCond = DD_area.SelectedValue,
            fagroup_db = DD_FaGroup.SelectedValue,
            FAGroup_int = DD_FaGroup.SelectedIndex,
            OICsearch = tb_OICSearch.Text,
            OfficerCallSign_search = DD_OfficerCallSign.SelectedValue,
            ADI_search = tb_ADISearch.Text,
            CauseofFire_search = DD_CauseofFireSearch.SelectedValue,
            PropCat_search = DD_PropCat.SelectedValue,
            Propsub_search = DD_PropertySubType.SelectedValue,
            Address_search = tb_address.Text,
            Watch_search = DD_WatchSearch.SelectedValue,
            TargetCond = DD_TargetMetSearch.SelectedValue,
            IRSCond = DD_IRSCheckedSearch.SelectedValue,
            RiskCond = DD_RiskCatSearch.SelectedValue,
            IncidentCat = DropDownIncident_Catergory.SelectedValue,
            IncidentCond = DropDownIncident_Catergory.SelectedValue,
            TimeCond = DD_TimeScale.SelectedValue,
            StationCond = DropDownListStation.SelectedValue,
            ward_db = LB_Ward.SelectedValue,
            IncidentNumber =  "0",
            SSType_search = DD_SSType.SelectedValue,
            SSType =  DD_SSType.SelectedIndex,
            SSClass_search = DD_SSClass.SelectedValue,
            SSClass = DD_SSClass.SelectedIndex,
           oicincname = "0"
        }; //creates new reference for search

        AdvancedQuery.SSType_search = DD_SSType.SelectedValue;
        AdvancedQuery.SSClass_search = DD_SSClass.SelectedValue;

        AdvancedQuery.Incidentdt = Convert.ToDateTime(AdvancedQuery.IncidentDate);
        AdvancedQuery.Controldt = Convert.ToDateTime(AdvancedSearch.FireControlDate);

        AdvancedQuery.NarLogText = tb_NarLogSearch.Text.ToUpper();

        if (DropDownListBorough.SelectedIndex == 0)
        {
            AdvancedQuery.BoroughCond = "0";
        }
        else
        {
            AdvancedQuery.BoroughCond = DropDownListBorough.SelectedValue;
        }


        AdvancedQuery.EquipmentSelection = String.Join(",", LB_Equipment.Items.Cast<ListItem>()
                                                   .Where(i => i.Selected));
        if (AdvancedQuery.EquipmentSelection == String.Empty)
        {
            AdvancedQuery.EquipmentSelection = "0";
        }
        else
        {
            AdvancedQuery.EquipmentSelection = _incidentSearch.FormatSqlWhere(AdvancedQuery.EquipmentSelection.Trim('"'), 0);
        }
        
        if (AdvancedQuery.StationCond.Length > 2)
        { AdvancedQuery.StationCond = AdvancedQuery.StationCond.Substring(0, 3); }
        else { AdvancedQuery.StationCond = DropDownListStation.SelectedValue; }


        if (AdvancedQuery.StartDateCond.Length > 1) { AdvancedQuery.IncidentDate = tbStartDate.Text; } else { AdvancedQuery.IncidentDate = DateTime.Today.ToString(CultureInfo.InvariantCulture); }

        if (LB_Ward.SelectedIndex > 0) { AdvancedQuery.ward_db = LB_Ward_Selected(); }

        if (DD_RiskCatSearch.SelectedIndex > 0) { AdvancedQuery.riskcat = ListBoxMethod(); }

        AdvancedQuery.NarLogText = _incidentSearch.FormatSqlWhere(AdvancedQuery.NarLogText, 1); //formats Narrative log search for SQL query.

        AdvancedQuery.NarrtiveSplit = AdvancedQuery.NarLogText.Split(','); //places formatted string into an array

        //creates sql query based on user input
       AdvancedQuery.SQL_Query = AdvancedQuery.AdvancedSearchQuery(1);

        debug1.Text = AdvancedQuery.SQL_Query;

       //goes and get the dataset needed
       return AdvancedQuery.GetAdvancedSearchResults(AdvancedQuery.SQL_Query);


    }

   
    public void BindResultsToGrid()
    {
        
        IncidentData = QueryBuilder();

        try
        {
            //Bind dataset to the gridview
            AdvSearchResults.AutoGenerateColumns = false;
            IncidentTable = IncidentData.Tables[0];


            AdvSearchResults.DataSource = IncidentTable; //can be changed to a dataset incidentTable might be used for sorting later


            AdvSearchResults.DataBind();

            AdvSearchResults.UseAccessibleHeader = true;
            AdvSearchResults.HeaderRow.TableSection = TableRowSection.TableHeader;
            
           
            lblResults.Visible = true;
            lblResults.ForeColor = Color.Green;
            lblResults.Text = "Your search has returned " + IncidentData.Tables[0].Select("'Incident Number' IS NOT NULL").Length + " records.";

            AdvResults.Update();

        }

        catch (Exception err)
        {
            lblResults.Visible = true;
            lblResults.ForeColor = Color.Red;
            lblResults.Text = "An error has occurred loading data into the table view. ";
            lblResults.Text += err.Message;

            Console.WriteLine(err.ToString());
        }
    } 

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType != DataControlRowType.DataRow) return;
        e.Row.Attributes["onmouseover"] = "this.style.backgroundColor='aquamarine';";
        e.Row.Attributes["onmouseout"] = "this.style.backgroundColor='white';";
        e.Row.ToolTip = "Click to select this Incident.";
       

    }

    protected void OnSelectedIndexChanged(object sender, EventArgs e) //takes the user selection of an incident and redirects them to the report page
    {
        SelectedValue = AdvSearchResults.SelectedRow.Cells[1].Text;
        SQLConnection.Global.SelectedIncident = SelectedValue;


        Response.Redirect("Reports.aspx?ID=" + Server.UrlEncode(AdvSearchResults.SelectedRow.Cells[1].Text));

    }

    protected void OnPaging(object sender, GridViewPageEventArgs e)
    {
        AdvSearchResults.PageIndex = e.NewPageIndex;
        AdvSearchResults.DataBind();
        AdvSearchResults.UseAccessibleHeader = true;
        AdvSearchResults.HeaderRow.TableSection = TableRowSection.TableHeader;
    }

    public string ListBoxMethod()
    {
        //used when cosntructing the query and not in the html
        var Selected = String.Join(",", DD_RiskCatSearch.Items.Cast<ListItem>()
            .Where(i => i.Selected));

        _incidentSearch.FormatSqlWhere(Selected, 0);


        return Selected;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Clear();
        Response.Buffer = true;
        Response.Charset = "";
        var time = DateTime.Now;
        string date = time.ToString(CultureInfo.InvariantCulture);

        Response.AddHeader("content-disposition", "attachment;filename=" + date + "_IRS_Advanced_Tool_Export" + ".xls");
        Response.ContentType = "application/vnd.ms-excel";

        AdvSearchResults.Columns[7].Visible = true;
        AdvSearchResults.Columns[8].Visible = true;
        AdvSearchResults.Columns[9].Visible = true;
        AdvSearchResults.Columns[10].Visible = true;
        

        AdvSearchResults.AllowPaging = false;
        AdvSearchResults.DataBind();

        StringWriter stringWrite = new StringWriter();
        HtmlTextWriter htmlWrite = new HtmlTextWriter(stringWrite);
        AdvSearchResults.RenderControl(htmlWrite);
        Response.Write(stringWrite.ToString());

        AdvSearchResults.Columns[7].Visible = false;
        AdvSearchResults.Columns[8].Visible = false;
        AdvSearchResults.Columns[9].Visible = false;
        AdvSearchResults.Columns[10].Visible = false;
    

        Response.End();



    }

    protected void DD_area_SelectedIndexChanged(object sender, EventArgs e)
    {
        AdvResults.Update();
    }

    public string LB_Ward_Selected()
    {

        string SelectedWard = String.Join(",", LB_Ward.Items.Cast<ListItem>()
                                                   .Where(i => i.Selected));

        SelectedWard = _incidentSearch.FormatSqlWhere(SelectedWard, 0);
        

        return SelectedWard;

    }

   
}











