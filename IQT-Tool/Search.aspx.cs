using System;
using System.Data;
using System.Drawing;
using System.Globalization;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRS;

public partial class Search : Page
{

    string SelectedValue;
    AdvancedSearch BasicSearch = new AdvancedSearch();
    DataTable IncidentTable = new DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {
        DoBasicSearch();

        MySession.Current.ActiveDebug = "false";

        if (MySession.Current.ActiveDebug == "true")
        { debug1.Visible = true; debug2.Visible = true; debug3.Visible = true; }
        else { debug1.Visible = false; debug2.Visible = false; debug3.Visible = false; }
    }


    protected DataSet sqlqueryBasic()
    {


        //get and set class properties


        if (DropDownListBorough.SelectedIndex == 0)
        {
            BasicSearch.BoroughCond = "0";
        }
        else
        {
            BasicSearch.BoroughCond = DropDownListBorough.SelectedValue;
        }
        BasicSearch.incidentcategory = DropDownIncident_Catergory.SelectedValue;
        BasicSearch.StartDateCond = tbStartDate.Text;
        BasicSearch.EndDateCond = tbEndDate.Text;

        BasicSearch.StationCond = DropDownListStation.SelectedValue;
        if (BasicSearch.StationCond.Length > 2) { BasicSearch.StationCond = BasicSearch.StationCond.Substring(0, 3); }
        BasicSearch.AreaCond = DD_area.SelectedValue;
        BasicSearch.Address_search = tb_address.Text.Replace(",", " ");
        BasicSearch.Address_search = BasicSearch.FormatSqlWhere(BasicSearch.Address_search, 1);
        BasicSearch.oicincname = tb_OICSearch.Text;
        if(dd_irs.SelectedIndex == 0) {BasicSearch.IRSCond = "0";}else{     BasicSearch.IRSCond = dd_irs.SelectedValue;}

        
        BasicSearch.IncidentNumber = tb_incidentNumber.Text;
        BasicSearch.IncidentCat = DropDownIncident_Catergory.SelectedValue;
        BasicSearch.RiskCond = "0";
        BasicSearch.NarLogText = tb_NarLogSearch.Text.ToUpper();
        BasicSearch.OICsearch = "0";
        BasicSearch.OfficerCallSign_search = DD_OfficerCallSign.SelectedValue;
        BasicSearch.ADI_search = "0";
        BasicSearch.CauseofFire_search = "0";
        BasicSearch.PropCat_search = "0";
        BasicSearch.Propsub_search = "0";
        BasicSearch.WatchCond = 0;
        BasicSearch.TargetCond = "0";
        //BasicSearch.IRSCond = "0";
        BasicSearch.ward = "0";
        BasicSearch.ward_db = "0";
        BasicSearch.IncidentCond = "0";
        BasicSearch.TimeCond = "2"; //2 years
        BasicSearch.EquipmentSelection = "0";
       

        if (dd_MaxRecords.SelectedIndex == 0) { BasicSearch.MaxRecords = 3000; }
        if (dd_MaxRecords.SelectedIndex == 1) { BasicSearch.MaxRecords = 100; }
        if (dd_MaxRecords.SelectedIndex == 2) { BasicSearch.MaxRecords = 75; }
        if (dd_MaxRecords.SelectedIndex == 3) { BasicSearch.MaxRecords = 50; }
        if (dd_MaxRecords.SelectedIndex == 4) { BasicSearch.MaxRecords = 25; }
        if (dd_MaxRecords.SelectedIndex == 5) { BasicSearch.MaxRecords = 10; }

        BasicSearch.NarLogText = BasicSearch.FormatSqlWhere(BasicSearch.NarLogText, 1); //formats Narrative log search for SQL query.

        BasicSearch.NarrtiveSplit = BasicSearch.NarLogText.Split(','); //places formatted string into an array
            
        //set sql query
        BasicSearch.SQL_Query = BasicSearch.AdvancedSearchQuery(1);//changed from 0 on 06/03/2015 for release of search tool
        //get the search for dataset
        debug1.Text = BasicSearch.SQL_Query;
        return BasicSearch.GetAdvancedSearchResults(BasicSearch.SQL_Query);

    }

    public void DoBasicSearch()
    {
        try
        {
            DataSet incidentData = new DataSet();
            incidentData = sqlqueryBasic();
            GridView1.AutoGenerateColumns = true;
            GridView1.DataSource = incidentData;

            IncidentTable = incidentData.Tables[0]; //check incomming data in table format

            GridView1.DataSource = IncidentTable;

            GridView1.DataBind();

            GridView1.UseAccessibleHeader = true;
            GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;

            lblResults.Visible = true;
            lblResults.ForeColor = Color.Green;
            lblResults.Text = "Your search has returned " +
                              incidentData.Tables[0].Select("'Incident Number' IS NOT NULL").Length.ToString() +
                              " records.";
            AdvResults.Update();
        }
        catch (Exception exec)
        { Console.WriteLine(exec); }

    }

    //selecting items from the grid
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType != DataControlRowType.DataRow) return;
        e.Row.Attributes["onmouseover"] = "this.style.backgroundColor='aquamarine';";
        e.Row.Attributes["onmouseout"] = "this.style.backgroundColor='white';";
      
    }

    protected void OnSelectedIndexChanged(object sender, EventArgs e)
    {
        SelectedValue = GridView1.SelectedRow.Cells[2].Text;
        SQLConnection.Global.SelectedIncident = SelectedValue;
        //Label1.Text = Global.SelectedIncident;


     //   Response.Redirect("Reports.aspx?ID=" + Server.UrlEncode(GridView1.SelectedRow.Cells[1].Text));
        Server.Transfer("Reports.aspx?ID=" + Server.UrlEncode(GridView1.SelectedRow.Cells[1].Text));



        MySession.Current.IncNumber = GridView1.SelectedRow.Cells[1].Text;
    }

    public static void OpenNewBrowserWindow(string Url, Control control)
    {
        ScriptManager.RegisterStartupScript(control, control.GetType(), "Open", "window.open('" + Url + "');", true);
    }

    protected void OnPaging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataBind();

        GridView1.UseAccessibleHeader = true;
        GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
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
        GridView1.Columns[6].HeaderText = "IRS Stage";
        // GridView1.Columns[8].Visible = true; //advsearch long and lat coords
        //  GridView1.Columns[7].Visible = true;
        // GridView1.Columns[8].Visible = true;
        // GridView1.Columns[9].Visible = true;
        // GridView1.Columns[10].Visible = true;

        GridView1.AllowPaging = false;
        GridView1.DataBind();

        StringWriter stringWrite = new StringWriter();
        HtmlTextWriter htmlWrite = new HtmlTextWriter(stringWrite);
        GridView1.RenderControl(htmlWrite);
        Response.Write(stringWrite.ToString());

        // GridView1.Columns[7].Visible = false;
        // GridView1.Columns[8].Visible = false;
        // GridView1.Columns[9].Visible = false;
        // GridView1.Columns[10].Visible = false;

        Response.End();

    }

    public override void VerifyRenderingInServerForm(Control control)
    {
        //base.VerifyRenderingInServerForm(control);
    }

       
}