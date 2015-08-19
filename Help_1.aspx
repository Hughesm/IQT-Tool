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
                    <h3>Tool update 0.55</h3>
                    <p class="blog-post-meta">January 15, 2015 by <a href="http://mysite/Person.aspx?accountname=gmfs%5Chughesm">Mike</a></p>
                    <p>
                        The tool has been updated to version 0.55; this update includes several fixes and improvements to the Advanced and Basic search,
                         and adds several features requested by the PMWG.
                    </p>
                    <blockquote>
                        <ul>
                            <li>The Reports page now displays errors correctly</li>
                            <li>The Narrative Log search has been disabled. </li>
                        </ul>
                        New Features:
						 <ul>
                             <li>Added Narrative Log filter, you can now choose to see only informative and assistance messages</li>
                             <li>Added 'Area' drop downs to Basic and Advanced searches. Choosing an Area will now inform and display the correct borough drop down.</li>
                             <li>Added the ability to Export Advanced search results <strong>Please be aware that an error message will show, just click 'Yes' to import into excel</strong> </li>
                         </ul>
                    </blockquote>
                    <p>The tool has been updated to version 0.55 and added several features that were requested at the PMWG on the 9th January.</p>
                    <p>
                        Still in development is the ability to filter map on the Reports page to display other mobilisations. There is also an outstanding issues around exporting the results, 
                        due to server limitations we cannot offer a fully featured solution to exporting yet.
                    </p>
                    <p>We have disabled the Narrative Log search for this release while we develop a quicker way for the search to be made.</p>
                </div>
                
                <div class="blog-post">
                <h3>Tool update 0.5</h3>
                <p class="blog-post-meta">January 8, 2015 by <a href="http://mysite/Person.aspx?accountname=gmfs%5Chughesm">Mike</a></p>
                <p>
                    The tool has been updated to version 0.5; this update includes several fixes and improvements to the Advanced and basic Search,
                         and fixes several issues around error handling and layouts a list of fixes is here:
                </p>
                <blockquote>
                    <ul>
                        <li>Better error handling when using Basic Search</li>
                        <li>Fixed Advanced Search box layouts</li>
                        <li>Fixed an issue where selecting 'Other' or 'Other None CLG' would cause all drop downs to appear</li>
                        <li>Fixed an issue with drop downs boxes where they would disappear under other boxes</li>
                        <li><strong>Insurance Reports are currently not generating at this moment in time</strong></li>

                    </ul>
                    New Features:
						 <ul>
                             <li>Added different map markers for initial pump mobilisation</li>
                             <li>Added Windows Authentication</li>
                             <li>Added new date picker driven by jQuery</li>
                             <li>Added Ward to Advanced Search</li>
                             <li>Added multi select list box for risk categories on Advanced Search</li>
                             <li>Added  limited Mobile Device controls for date and number entry</li>
                         </ul>
                </blockquote>
                <p>
                    This release is in preparation for a larger test base (mainly the PMWG). It's important that as more users start testing this tool that it works the way they expect it to. Using jQuery we are able
					 to leverage a range methods that allow user prompts to be displayed dynamically and show important information when needed.
                </p>

                <p>
                    With the inclusion of Windows Authentication we are able to govern what areas of the tool can be accessed. For example the creation of insurance reports will now only be able to be generated by
					 the correct team members.
                </p>

                <p>List boxes are being trialled with this release, please provide feedback through the links to the right.</p>


            </div>

           <div class="blog-post">
                    <h3>Tool update 0.4</h3>
                    <p class="blog-post-meta">January 2, 2015 by <a href="http://mysite/Person.aspx?accountname=gmfs%5Chughesm">Mike</a></p>
                    <p>
                        The tool has been updated to version 0.4; this update includes several fixes and improvements to the Advanced Search,
                         and fixes several issues that stopped the user from searching the IRS notes. Please see below for a full fix list:
                    </p>
                    <blockquote>
                        <ul>
                            <li>Improved the dynamic SQL query for quicker IRS and Narrative Log searches</li>
                            <li>Borough dropdowns now work the way they were intended to</li>
                            <li>Station dropdowns now display the full name rather than the station code</li>
                            <li>Station dropdowns are now hidden untill a Borough is picked</li>
                            <li>By default the the search function brings back the last 3 months and not all incidents with the chosen criteria (known issues with not displaying on the dropdown)</li>
                            <li>Implemented touch capability for touch devices</li>
                            <li>Added GMFRS logo for tiles on Windows 8+ devices</li>
                            <li>Added link to the Performance Portal on the main navbar</li>
                            <li>Changed default font to segoe ui</li>
                            <li>Help section layout updated</li>
                            <li>The Reports map now shows the mobilisation address of the first pump in attendance. (Note Fire Control data accuracy for this feature is under review).</li>
                        </ul>
                    </blockquote>
                    <p>
                        This release fixed several issues with the advanced search and several issues surrounding dropdowns. Users also reported issues with searching the narritive log 
                  for keywords (some searches taking up 2 minutes) this has now been resolved and should be as quick as the rest of the tool). The map in the reports section has now been 
                  updated to show initial mobilisation (you may need to zoom out a little).
                    </p>
                    <p>There is still an outstanding issue loading large incidents; a minor fix has been added to allow the narrative log to be read. A solution is incomming</p>

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

