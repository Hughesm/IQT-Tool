<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Help.aspx.cs" Inherits="Help" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="container">

        <div class="blog-header">
            <h1 class="blog-title">Advanced Query Tool Help</h1>
            <p class="lead blog-description">This section will provide help on using the tool as well as update you on any changes.</p>

        </div>

        <div class="row">

            <div class="col-sm-8 blog-main">
                
                    <div class="blog-post">
                    <h3>Tool Update 0.3</h3>
                    <p class="blog-post-meta">December 15, 2014 by <a href="http://mysite/Person.aspx?accountname=gmfs%5Chughesm">Mike</a></p>
                    <p>
                        The tool has been updated to version 0.3. This update includes changes to the layout of the Advanced and Basic searches and fixed several issues that 
                  stopped the user from searching. Please see below for a full fix and new features list:
                    </p>
                    <blockquote>
                        <ul>
                            <li>Changed the layout of the use inputs to better refelct the categories of other tools</li>
                            <li>Textboxes, labels and checkboxes now appear dynamically based on the users choices</li>
                            <li>Fixed an issue where long gaps between textboxes would appear on the reports page </li>
                            <li>Added jQuery functionality</li>
                            <li>The results of the Advanced and Basic searches are now spread over multiple 'pages' rather than one big list</li>
                        </ul>
                        <p>New Features:</p>
                        <ul>
                            <li>Users can now open a sidebar on the Reports page to access external links and navigate the page</li>
                            <li>The Reports sidebar now has a direct link to the IRS page of the selected Incident</li>
                            <li>The Reports page now has a map indicating the location of the incident</li>
                            <li>You can now use the Advanced Tool to search on officer call signs (Requested by Merl Forrer)</li>
                            <li>Paging of Basic Seach results is now active</li>
                            <li>Basic Search results now show the IRS completion stage</li>
                            <li>Added debug mode to Settings</li>
                            <li>Navbar incident number search is now fully functional</li>
                            <li>You can now search the Narrative log and IRS additional notes for keywords</li>
                            <li>You can now search for specific a specific OIC on the advanced search tool</li>
                        </ul>
                    </blockquote>
                    <p>
                        Some feedback regarding officer searches has been implemented with this release. Development has mostly revlolved around adding better usability for the end user,
                  additions like IRS completion and paging of search results should improve user navigation and cause less stress on the system. 
                    </p>
                    <p>
                        The biggest addition with this release is the map. Located in the Report section of the tool it gives the user a visual aid to where the incident took place. This feature
                  will recieve several updates in the future to hopefully include initial mobilisation location, and when the Automatic vehicle localization systems (AVLS, also known as GPS vehicle localisation) 
                  becomes available to us we aim to include travel route.
                    </p>
                </div>
                
                
                
                

                
 <div class="blog-post">
                    <h3>Tool Update 0.2</h3>
                    <p class="blog-post-meta">November 15, 2014 by <a href="http://mysite/Person.aspx?accountname=gmfs%5Chughesm">Mike</a></p>
                    <p>The tool has been updated to version 0.2. This update introduces the Advanced Search and has several fixes please see below for more info:</p>
                    <blockquote>
                        <ul>
                            <li>Fixed an issue where selecting reports before searching would crash the tool</li>
                            <li>Textboxes, labels and checkboxes now appear based on the users choices</li>
                            <li>The results of the Advanced and Basic searches are now spread over multiple 'pages' rather than one big list</li>
                            <li>Fixed an issue where the tool would not scale dynamically on handheld devices</li>
                            <li>Improved the speed of the dynamic SQL query for the basic search</li>

                        </ul>
                        <p>New Features:</p>
                        <ul>
                            <li>Adavanced Search is now available</li>
                            <li>The Reports page has new layout </li>
                            <li>The tool is now live for limited testing</li>
                            <li>Implemented extra error handling and user prompts</li>
                        </ul>
                    </blockquote>
                    <p>
                        With the addition of the Advanced Search we have entered a new stage of development where most features and fixes will be focused on user experience and bug
                    fixing. The tool has also been published so that people with older browerser versions can view it, there are some issues with this and some functionality is limited,
                    if you have an older web browser (Internet Explorer 8) and wish to use the tool to us full capablilty please get in touch with the ICT service desk and request an
                    Internet Explorer upgrade (version 11).
                    </p>


                </div>

           <div class="blog-post">
                        <h3>Tool update 0.1</h3>
                        <p class="blog-post-meta">November 1, 2014 by <a href="http://mysite/Person.aspx?accountname=gmfs%5Chughesm">Mike</a></p>
                        <p>This is the first release made available to the end user for testing, please see below for changes:</p>
                        <blockquote>
                            <ul>
                                <li>Basic Search and Reports are now active</li>
                                <li>Added auto scaling for mobile devices</li>
                                <li>Added placeholder for Incident Number search on the navbar</li>
                                <li>Added front page links</li>
                            </ul>
                        </blockquote>
                        <p>
                            With this being the first development release please be mindful that you will experience bugs and slowness, if you do experience any issues where you can not use the tool
                        at all please get in contact with the <a href="mailto:infosystems@manchesterfire.gov.uk?Subject=Advanced%20Query%20Help" target="_top">system admin team.</a>
                        </p>


                    </div>

           <!-- /.blog-sidebar -->
        <nav>
            <ul class="pager">
                <li><a href="Help_2.aspx">Previous</a></li>
                <li><a href="Help.aspx">Next</a></li>
            </ul>
        </nav>
            
          </div>  <!-- /.blog-main -->
       

         <div class="col-sm-3 col-sm-offset-1 blog-sidebar">
                <div class="sidebar-module sidebar-module-inset">
                    <div class="well">
                        <h4>About</h4>
                        <p>The IRS Advanced Query Tool was built to help facilitate the searching of IRS. etc.</p>
                    </div>
                </div>
                <div class="sidebar-module sidebar-module-inset">
                    <div class="well">
                        <h4>Contact us</h4>
                        <p>For assistance on how to access, navigate or report a bug whilst the tool is in development, contact the Systems Training & Support team:</p>
                        <p>Tel: (7) 70 4038</p>
                        <p>Email: <a href="mailto:systemstraining@manchesterfire.gov.uk?Subject=IQT%20Help" target="_top">systemstraining@manchesterfire.gov.uk</a></p>
                    </div>
                </div>
                <div class="sidebar-module sidebar-module-inset">
                    <div class="well">
                        <h4>Training</h4>
                        <p>Training material is available please please contact the Systems Training & Support team</p>
                        <p>Tel: (7) 70 4038</p>
                        <p>Email: <a href="mailto:systemstraining@manchesterfire.gov.uk?Subject=IQT%20Help" target="_top">infosystems@manchesterfire.gov.uk</a></p>
                    </div>
                </div>

            </div>

            
    </div>
    </div>
    
       

   
    <!-- /.container -->
    <div class="panel-footer">
        <div class="col-md-6 col-md-push-4">
            <p>Advanced IRS Query Tool for <a href="http://manchesterfire.gov.uk">Greater Manchester Fire and Rescue</a>  <a href="https://twitter.com/manchesterfire">|@manchesterfire</a>.</p>
            <div class="col-md-2 col-md-push-3">
                <p><a href="#">Back to top</a> </p>
            </div>
        </div>
    </div>




</asp:Content>

