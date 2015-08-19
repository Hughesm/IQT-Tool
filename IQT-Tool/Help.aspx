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
                    <h3>Tool update 1.1</h3>
                    <p class="blog-post-meta">August 11th, 2015 by <a href="http://mysite/Person.aspx?accountname=gmfs%5Chughesm">Mike</a></p>
                    <p>
                        The tool has been updated to version 1.1; this update fixes several text issues and adds the Insurance Report creation facility.
                    </p>
                    <blockquote>
                        Fixes:
                        <ul>
                            <li>Reports now show the incident stage properly now</li>     
                            <li>jelp section now displays correct contact information.</li>                                                 
                        </ul>
                        New Features:
						 <ul>
                             <li>Added Insurance Report creation for certain users.</li>
                             <li>Added OIC search to the basic search.</li> 
                             <li>Added IRS Stage search to basic search.</li>                                                      
                         </ul>
                    </blockquote>
                    <p>This update adds and fixes several key areas of the tool readying it for release this quarter.</p>

                    <p>If you require any additional search criteria please get in touch.</p>

                </div>
                
                <div class="blog-post">
                    <h3>Tool update 0.9</h3>
                    <p class="blog-post-meta">July 18th, 2015 by <a href="http://mysite/Person.aspx?accountname=gmfs%5Chughesm">Mike</a></p>
                    <p>
                        The tool has been updated to version 0.9; this is an update that includes several fixes and improvements readying for release.
                    </p>
                    <blockquote>
                        Fixes:
                        <ul>
                            <li>Fixed an issue where the incorrect amount of results was showing when using an address search</li>
                            <li>Fixed and issue where the advanced tool was still reachable.</li>
                            
                        </ul>
                        New Features:
						 <ul>
                             <li>Update jQuery, issues with viewing the tool on an iOS device are now resolved.</li>
                             <li>Added a radio selection to the address search, users can now search for incidents where there address has been changed.</li>
                             <li>Added Windows authentication to the site.</li>
                           
                         </ul>
                    </blockquote>
                    <p>This update adds and fixes several key areas of the tool readying it for release this quarter.</p>

                    <p>If you require any additional search criteria please get in touch.</p>

                </div>
                
                <div class="blog-post">
                    <h3>Tool update 0.8</h3>
                    <p class="blog-post-meta">April 01, 2015 by <a href="http://mysite/Person.aspx?accountname=gmfs%5Chughesm">Mike</a></p>
                    <p>
                        The tool has been updated to version 0.8; this is an update that includes several fixes and improvements readying for release.
                    </p>
                    <blockquote>
                        <ul>
                            <li>Fixed an issue where the user couldnt bring back large Narrative logs.</li>
                            <li>Fixed an issue involving the hide/show logic.</li>
                            
                        </ul>
                        New Features:
						 <ul>
                             <li>Updated bootstrap for modal box fixes.</li>
                             <li>Updated bootstrap for font and icon fixes.</li>
                             <li>Viewing an Incident in IRS now opens in a new window.</li>
                             <li>Added ongoing incidents to search results (Narrative log is only available after stop message.</li>
                             <li>Added logic to cater for commas in address search.</li>
                             <li>Improved the Address search.</li>
                             <li>Changed the reports sidebar to include tools for exporting</li>
                         </ul>
                    </blockquote>
                    <p>This update adds and fixes several key areas of the tool readying it for release this quarter.</p>

                    <p>If you require any additional search criteria please get in touch.</p>

                </div>
                
                


                <div class="blog-post">
                    <h3>Tool update 0.7</h3>
                    <p class="blog-post-meta">March 06, 2015 by <a href="http://mysite/Person.aspx?accountname=gmfs%5Chughesm">Mike</a></p>
                    <p>
                        The tool has been updated to version 0.7; this is an update that includes several fixes and improvements to the entire tool:
                    </p>
                    <blockquote>
                        <ul>
                            <li>Fixed an issue where the user would export the search results and not have Northing and Easting.</li>
                            <li>Fixed and issue where some address searches were not bringing back the correct results.</li>
                            <li>Fixed and issue where the narrative log search would fail to work if spaces were included.</li>

                        </ul>
                        New Features:
						 <ul>
                             <li>Disabled Advanced Search for a future release.</li>
                             <li>Added Narrative log to Basic Search.</li>
                             <li>Added Officer Callsign to Basic Search.</li>
                             <li>Basic Search by default now searches all instances across all GMFRS, unless the criteria specifies otherwise. (Limited to the past 2 years).</li>
                             <li>Added logic to cater for commas in address search.</li>
                         </ul>
                    </blockquote>
                    <p>This update has removed the advanced search section of this tool for release in Phase 3. Phase 2 will now release with basic search only. </p>

                    <p>If you require any additional search criteria please get in touch.</p>

                </div>

                <div class="blog-post">
                    <h3>Tool update 0.62</h3>
                    <p class="blog-post-meta">February 11, 2015 by <a href="http://mysite/Person.aspx?accountname=gmfs%5Chughesm">Mike</a></p>
                    <p>
                        The tool has been updated to version 0.62; this is a minor update that includes several fixes and improvements to the entire tool:
                         
                    </p>
                    <blockquote>
                        <ul>
                            <li>Fixed an issue selecting a property type would not affect the search criteria.</li>
                            <li>Fixed an issue where selecting OIC would not display the corresponding drop down.</li>
                            <li>Fixed an issue where selecting Address would not display the corresponding text box.</li>
                            <li>Fixed an issue where selecting Ward would not display the corresponding drop down.</li>
                            <li>Fixed an issue where selecting IRS would not display the corresponding drop down.</li>
                            <li>Fixed an issue where selecting OIC would not display the corresponding drop down.</li>
                            <li>Fixed an issue where selecting Officer Number would not display the corresponding drop down.</li>
                            <li>Fixed an issue where the returned search results would display an incorrect number.</li>
                            <li>Fixed an issue with the Narrative Log filter (coding change for efficiency).</li>

                        </ul>
                        New Features:
						 <ul>
                             <li>Added the search criteria for an Equipment Search</li>
                             <li>Server side handling of search requests has been improved to handle asynchronous requests</li>
                             <li>Server side handling of reports and searches have been improved with class re-write.</li>
                             <li>Added the search criteria for Confined to Room of origin.</li>
                             <li>jQuery update for interface elements (v2).</li>
                             <li>Added Error logic when selecting a Ward before selecting a Borough/Station</li>

                         </ul>
                    </blockquote>
                    <p>This minor update fixes and updates mainly the user interface where buttons were not working as intended. This process will continue for the next few release. Please get in touch if section you need is not displaying correctly for a quick fix.</p>
                    <p>
                        This version has also disabled the the Maps in the Results section in perpetration for the GIS upgrade coming in April. The Maps section will return before then for a trial test.
                       
                    </p>
                    <p>Also in development are various tool tips and hints and a reset query button.</p>

                </div>



                <!-- /.blog-sidebar -->
                <nav>
                    <ul class="pager">
                        <li><a href="Help_1.aspx">Previous</a></li>
                        <li><a href="#">Next</a></li>
                    </ul>
                </nav>

            </div>
            <!-- /.blog-main -->


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

