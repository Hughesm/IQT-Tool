using System;
using System.DirectoryServices;
using System.Drawing;
using System.Web.UI;

public partial class _Default : Page
{
    string user;

    protected void Page_Load(object sender, EventArgs e)
    {
        WindowsAuth();

    }
    //grabs the users login credientials and logs user in the datalayer
    public void WindowsAuth()
    {
        try
        {
            WindowsAuthentication WinAuth = new WindowsAuthentication
            {
                ActivDirName = User.Identity.Name,

            };

            WinAuth.FullName = WinAuth.GetFullName();
            WinAuth.UserName = WinAuth.GetUsername();
            user = Page.User.Identity.Name;

            Name.Text = WinAuth.FullName + " ";
            userlogin.Text = WinAuth.UserName;


        }
        catch (Exception err)
        {
            userlogin.Visible = true;
            userlogin.ForeColor = Color.Red;
            userlogin.Text = "An error has occurred logging you in. " + err.Message;
            //Label1.Text += err.Message;
        }
    }


    protected void userlogin_Click(object sender, EventArgs e)
    {
        try
        {
            Response.Redirect("http://mysite/Person.aspx?accountname=gmfs%5C" + user);
        }
        catch (Exception exec)
        {
            Console.WriteLine(exec);
        }
    }
}








