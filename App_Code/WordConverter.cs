using System;
using System.IO;
using System.Net;
using System.Web;

namespace App_Code
{
    public class Converter : IHttpModule
    {
        public void Init(HttpApplication app)
        {
            app.BeginRequest += new EventHandler(app_BeginRequest);
        }
        void app_BeginRequest(object sender, EventArgs e)
        {
            HttpContext.Current.Response.Clear();
            // Check if ToWord exists in the query string parameters
            if (HttpContext.Current.Request.QueryString["ToWord"] != null)
            {
                // Set the buffer to true
                HttpContext.Current.Response.Buffer = true;
                // Create a new HttpWebRequest to the same url
                HttpWebRequest webRequest = (HttpWebRequest)WebRequest.Create(HttpContext.Current.Request.Url.ToString().Split('?')[0]);
                // Set the credentials to default credentials: used if you are under proxy server
                webRequest.Credentials = CredentialCache.DefaultCredentials;
                // Get the response as stream
                Stream stream = webRequest.GetResponse().GetResponseStream();
                // Set the content type of the response on msword
                HttpContext.Current.Response.ContentType = "application/msword";
                // Read the response as string
                string pageHTML = new StreamReader(stream).ReadToEnd();
                // Write it to the response
                HttpContext.Current.Response.Write(pageHTML.ToString());
                // Complete the Request
                ((HttpApplication)sender).CompleteRequest();
                // End the response.
                HttpContext.Current.Response.End();
            }

        }
        public void Dispose()
        {
        }
    }
}
