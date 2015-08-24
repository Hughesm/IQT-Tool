<%@ Page AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" Language="C#" MasterPageFile="~/MasterPage.master" Title="" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="jumbotron">

        <div class="container">

            <h2>Welcome to the Incident Query Tool</h2>

            <p>
              Welcome <asp:Label ID="Name" runat="server" Text=""></asp:Label>to the Incident Query Tool. This tool will allow you perform searches on all incidents and allow you to view the incident details.
            </p>
                    
        </div>
    </div>

    <div class="container">
     
        <div class="row">
            <div class="col-md-4">
                <h2>Basic Search</h2>
                <p>Perform a search with basic information. Use this search if you have limited incident information.</p>

                <p><a class="btn btn-primary" href="Search.aspx" role="button">Search Incidents &raquo;</a></p>
            </div>
            <div class="col-md-4">
                <h2>Advanced Search</h2>
                <p>Currently in Development. This search will perform an advanced incident search. Use this search if you want to create a detailed search with specific criteria.</p>
                <p><a class="btn btn-primary" href="#" role="button">Advanced Search &raquo;</a></p>

            </div>
            <div class="col-md-4">

                <h2>Reports</h2>
                <p> This page shows pre-generated reports based on completed Incidents. Reports include; Casualty and Fatality data, Deliberate Fires and reports going back to 2013. </p>
                <p><a class="btn btn-primary" href="http://hq-ict-12592v/PerformancePortal/IncidentReports.aspx" role="button">View Reports &raquo;</a></p>
            </div>
        </div>

        <!-- Other Sections End-->
        
        

        <footer>
            <p>&copy; Greater Manchester Fire and Rescue <%: DateTime.Now.Year %> (v1.1) </p>
           <p>Logged in as:
                
               <asp:label id="Label2" runat="server" text="Label" Visible="false"></asp:label>
            
               <asp:LinkButton ID="userlogin" runat="server" OnClick="userlogin_Click">LinkButton</asp:LinkButton>
            </p>
        </footer>
    </div>
  





</asp:Content>

