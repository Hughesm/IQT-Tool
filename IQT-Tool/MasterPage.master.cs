using System;
using System.Web;
using System.Web.Security;
using IRS;

public partial class MasterPage : System.Web.UI.MasterPage
{
    WindowsAuthentication WinAuth = new WindowsAuthentication();
    private const string AntiXsrfTokenKey = "__AntiXsrfToken";
    private const string AntiXsrfUserNameKey = "__AntiXsrfUserName";
    private string _antiXsrfTokenValue;

    // string ActiveDebug = "false";


    protected void Page_Init(object sender, EventArgs e)
    {
        //Session["ActiveDebug"] = ActiveDebug;
        MySession.Current.ActiveDebug = "false";
       // string login = System.Security.Principal.WindowsIdentity.GetCurrent().Name;

        // The code below helps to protect against Cross site forgery attacks
        var requestCookie = Request.Cookies[AntiXsrfTokenKey];
        Guid requestCookieGuidValue;
        if (requestCookie != null && Guid.TryParse(requestCookie.Value, out requestCookieGuidValue))
        {
            // Use the Anti-XSRF token from the cookie
            _antiXsrfTokenValue = requestCookie.Value;
            Page.ViewStateUserKey = _antiXsrfTokenValue;
        }
        else
        {
            // Generate a new Anti-XSRF token and save to the cookie
            _antiXsrfTokenValue = Guid.NewGuid().ToString("N");
            Page.ViewStateUserKey = _antiXsrfTokenValue;

            var responseCookie = new HttpCookie(AntiXsrfTokenKey)
            {
                HttpOnly = true,
                Value = _antiXsrfTokenValue
            };
            if (FormsAuthentication.RequireSSL && Request.IsSecureConnection)
            {
                responseCookie.Secure = true;
            }
            Response.Cookies.Set(responseCookie);
        }

        Page.PreLoad += master_Page_PreLoad;




    }
    protected void OnSelectedIndexChanged(object sender, EventArgs e)
    {

        if (IncidentValue.Text == string.Empty) { Response.Redirect("Search.aspx"); } else { Response.Redirect("Reports.aspx?ID=" + Server.UrlEncode(IncidentValue.Text)); }
        Session["IncidentNumber"] = IncidentValue.Text;

    }

    protected void SubmitInc_Click(object sender, EventArgs e)
    {
        Response.Redirect("Reports.aspx?ID=" + IncidentValue);
    }

    public void DeactivateDebug_Click(object sender, EventArgs e)
    {
        MySession.Current.ActiveDebug = "true";


    }

    public void ActvateDebug_Click(object sender, EventArgs e)
    {
        MySession.Current.ActiveDebug = "false";


    }

    public void BadgeChange()
    {

    }


    protected void master_Page_PreLoad(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Set Anti-XSRF token
            ViewState[AntiXsrfTokenKey] = Page.ViewStateUserKey;
            ViewState[AntiXsrfUserNameKey] = Context.User.Identity.Name ?? String.Empty;
        }
        else
        {
            // Validate the Anti-XSRF token
            if ((string)ViewState[AntiXsrfTokenKey] != _antiXsrfTokenValue
                || (string)ViewState[AntiXsrfUserNameKey] != (Context.User.Identity.Name ?? String.Empty))
            {
                throw new InvalidOperationException("Validation of Anti-XSRF token failed.");
            }
        }
    }

    protected void IAT_OnClick(object sender, EventArgs e)
    {
        WinAuth.AddArea(WindowsAuthentication.PerformancePortal.Iat);


        WinAuth.TrackerSql();

        Response.Redirect("http://hq-ict-09440v:8080/CorVu/g?IncidentAnalysisTool_Live");


    }

    protected void IKPI_OnClick(object sender, EventArgs e)
    {
        WinAuth.AddArea((WindowsAuthentication.PerformancePortal.Kpi));


        WinAuth.TrackerSql();

        Response.Redirect("http://hq-ict-09440v:8080/CorVu/g?KPITool");

    }

    protected void Framework_OnClick(object sender, EventArgs e)
    {
        WinAuth.AddArea((WindowsAuthentication.PerformancePortal.Framework));
        WinAuth.TrackerSql();
        Response.Redirect("http://hq-ict-09440v:8080/CorVu/g?KPIFramework");
    }

    protected void Benchmarking_OnClick(object sender, EventArgs e)
    {
        WinAuth.AddArea((WindowsAuthentication.PerformancePortal.Ibt));
        WinAuth.TrackerSql();
        Response.Redirect("http://hq-ict-09440v:8080/CorVu/g?InternalBenchMarkingToolv7");
    }

    protected void QuarterlyTool_OnClick(object sender, EventArgs e)
    {
        WinAuth.AddArea((WindowsAuthentication.PerformancePortal.Qrt));
        WinAuth.TrackerSql();
        Response.Redirect("http://hq-ict-09440v:8080/CorVu/g?qtr");
    }

    protected void QueryTool_OnClick(object sender, EventArgs e)
    {
        WinAuth.AddArea((WindowsAuthentication.PerformancePortal.Iqt));
        WinAuth.TrackerSql();
        Response.Redirect("http://hq-ict-12592v/misdv/");
    }

    protected void KPIScore_OnClick(object sender, EventArgs e)
    {
        WinAuth.AddArea((WindowsAuthentication.PerformancePortal.Ckpi));
        WinAuth.TrackerSql();
        Response.Redirect("http://hq-ict-09440v:8080/CorVu/g?KPI_New_Dev");
    }

    protected void StationScore_OnClick(object sender, EventArgs e)
    {
        WinAuth.AddArea((WindowsAuthentication.PerformancePortal.Ss));
        WinAuth.TrackerSql();
        Response.Redirect("http://hq-ict-09440v:8080/CorVu/g?Station_Scorecards_V5");
    }

    protected void Mos_OnClick(object sender, EventArgs e)
    {
        WinAuth.AddArea((WindowsAuthentication.PerformancePortal.Mos));
        WinAuth.TrackerSql();
        Response.Redirect("http://hq-ict-09440v:8080/CorVu3/g?MOSv20");
    }

    protected void Emergency_OnClick(object sender, EventArgs e)
    {
        WinAuth.AddArea((WindowsAuthentication.PerformancePortal.Er));
        WinAuth.TrackerSql();
        Response.Redirect("http://hq-ict-09440v:8080/CorVu/g?EmergencyResponse_dev");

    }



}



