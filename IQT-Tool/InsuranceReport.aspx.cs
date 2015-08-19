using System;
using System.Data;
using System.Drawing;
using System.IO;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using IRS;

public partial class InsuranceReport : Page
{
    string IncNumber;
    string Type;
        //="Fire";


    protected void Page_Load(object sender, EventArgs e)
    {
        IncNumber = 
            Request.QueryString["ID"];
            //"1508005565"; 
        Type = Request.QueryString["Type"];
        
        GetIncidentEquipment();

        SetIncidentInfo();
    }


    protected void EqupmentUsedGrid_PageIndexChanging(object sender, System.Web.UI.WebControls.GridViewPageEventArgs e)
    {
        EqupmentUsedGrid.PageIndex = e.NewPageIndex;
        EqupmentUsedGrid.DataBind();
        EqupmentUsedGrid.UseAccessibleHeader = true;
        EqupmentUsedGrid.HeaderRow.TableSection = TableRowSection.TableHeader;
        Mobsupdate.Update(); //update (update)panel
    }

    protected void GetIncidentEquipment()
    {

        DataSet Equipment = new DataSet();
        AdvancedSearch EquipRetrieve = new AdvancedSearch();
        Equipment = EquipRetrieve.IncidentEquipment(IncNumber);

        if (Equipment.Tables[0].Rows[0]["Equipment Description"].ToString() == "")
        {
            lbl_gridanounce.ForeColor = Color.Red;
            lbl_gridanounce.Text = "No Equipment was entered into our system for this incident.";
        }
        else
        {
            try
            {
                lbl_gridanounce.Text = "Equipment Used at this incident:";
                EqupmentUsedGrid.AutoGenerateColumns = true;
                EqupmentUsedGrid.DataSource = Equipment;

                EqupmentUsedGrid.DataBind();
                EqupmentUsedGrid.UseAccessibleHeader = true;
                EqupmentUsedGrid.HeaderRow.TableSection = TableRowSection.TableHeader;
            }
            catch (Exception exception)
            {
                lbl_gridanounce.Text = exception.ToString();
            }
        }

    }

    protected void SetIncidentInfo()
    {
        try
        {
            DataSet Incident = new DataSet();
            AdvancedSearch IncidentRetrieve = new AdvancedSearch();
            Incident = IncidentRetrieve.PopulateIncidentData(IncNumber);

            //Our References
            lbl_OurRef.Text = OurReference();

            //Call Information
            lbl_IncRef.Text = Incident.Tables[0].Rows[0]["Incident Number"].ToString();
            lbl_address.Text = Incident.Tables[0].Rows[0]["Location Address"].ToString();
            lbl_datecall.Text = Incident.Tables[0].Rows[0]["Date Created"].ToString();
            lbl_incidentEnd.Text = Incident.Tables[0].Rows[0]["Inc_Time_Stopped_Mobilising"].ToString();
            lbl_methodcontact.Text = Incident.Tables[0].Rows[0]["Origin_Of_Call"].ToString();

            //Incident Information
            lbl_proptype.Text = Incident.Tables[0].Rows[0]["Property_Type"].ToString() + " " + Incident.Tables[0].Rows[0]["Property_Subclass"].ToString();
            if (Incident.Tables[0].Rows[0]["Item_First_Ignited"].ToString() == "")
            { lbl_originoffire.Text = lbl_originoffire.Text = Incident.Tables[0].Rows[0]["Fire_Main_Cause"].ToString(); ; }
            else { lbl_originoffire.Text = "No data was entered into our system."; };
            lbl_oic.Text = Incident.Tables[0].Rows[0]["oic_inc_name"].ToString();

            //Damage Information
            if (Incident.Tables[0].Rows[0]["Fire_Size_On_Arrival"].ToString() == "")
            { lbl_sizeonarrive.Text = "N/A"; }
            else { lbl_sizeonarrive.Text = Incident.Tables[0].Rows[0]["Fire_Size_On_Arrival"].ToString(); };

            if (Incident.Tables[0].Rows[0]["Fire_Damage_On_Close"].ToString() == "")
            { lbl_damageonclose.Text = "N/A"; }
            else { lbl_damageonclose.Text = Incident.Tables[0].Rows[0]["Fire_Damage_On_Close"].ToString(); };

            if (Incident.Tables[0].Rows[0]["Fire_Size_Room_Origin"].ToString() == "")
            { lbl_roomoforigin.Text = "N/A"; }
            else { lbl_roomoforigin.Text = Incident.Tables[0].Rows[0]["Fire_Size_Room_Origin"].ToString(); };

            if (Incident.Tables[0].Rows[0]["Fire_Total_Damage_Area"].ToString() == "")
            { lbl_totaldamage.Text = "N/A"; }
            else { lbl_totaldamage.Text = Incident.Tables[0].Rows[0]["Fire_Total_Damage_Area"].ToString(); };

            //Cause Information
            if (Incident.Tables[0].Rows[0]["Fire_Cause"].ToString() == "")
            { lbl_firecause.Text = "N/A"; }
            else { lbl_firecause.Text = Incident.Tables[0].Rows[0]["Fire_Cause"].ToString(); };

            if (Incident.Tables[0].Rows[0]["Ignition_Source"].ToString() == "")
            { lbl_ignitionsource.Text = "N/A"; }
            else { lbl_ignitionsource.Text = Incident.Tables[0].Rows[0]["Ignition_Source"].ToString(); };

            if (Incident.Tables[0].Rows[0]["Item_First_Ignited"].ToString() == "")
            { lbl_itemfirstigntited.Text = "N/A"; }
            else { lbl_itemfirstigntited.Text = Incident.Tables[0].Rows[0]["Item_First_Ignited"].ToString(); };

            if (Incident.Tables[0].Rows[0]["Fire_Main_Cause"].ToString() == "")
            { lbl_maincause.Text = "N/A"; }
            else { lbl_maincause.Text = Incident.Tables[0].Rows[0]["Fire_Main_Cause"].ToString(); };

            tb_adi.Text = Incident.Tables[0].Rows[0]["Adi_General"].ToString();
          



        }
        catch (Exception excep)
        {

            lbl_gridanounce.Text = excep.ToString();
        }       

    }

    public string OurReference()
    {
        string[] loggeduser = { @"GMFS\PorterS", @"GMFS\hughesm", @"GMFS\leechc", @"GMFS\peersh", @"GMFS\Wilkinsonam", @"GMFS\penningtonc", @"GMFS\kershawm" };
        string[] incidentType = { "Fire", "Special Service", "False Alarm" };

        string user = User.Identity.Name;

        string reference;

        switch(Array.IndexOf(incidentType, Type))
        {
            case 0:
                Type = "Fire";
                break;
            case 1:
                Type = "SS";
                break;
            case 2:
                Type = "FA";
                break;            
            default:
                Type = "Fire";
                break;
        }
    
        switch (Array.IndexOf(loggeduser, user))
        {
            case 0:
                reference = "SP/" + Type;
                break;
            case 1:
                reference = "MH/" + Type;
                break;
            case 2:
                reference = "CL/" + Type;
                break;
            case 3:
                reference = "HP/" + Type;
                break;
            case 4:
                reference = "MW/" + Type;
                break;
            case 5:
                reference = "CP/" + Type;
                break;
            case 6:
                reference = "MK/" + Type;
                break;
            default:
                reference = "SP/" + Type;
                break;
        }

        return reference;
    }
}