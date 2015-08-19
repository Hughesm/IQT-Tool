<%@ Page Language="C#" AutoEventWireup="true" CodeFile="InsuranceReport.aspx.cs" Inherits="InsuranceReport" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Insurance Report</title>
    <link href="Content/CSS/bootstrap-theme.css" rel="stylesheet" />
    <link href="Content/CSS/bootstrap.css" rel="stylesheet" />
    <link href="Content/CSS/bootstrap-print.css" rel="stylesheet" />
    <link href="Content/CSS/bootstrap-print.min.css" rel="stylesheet" />
    <script src="Content/Scripts/jquery-2.1.1.min.js"></script>
    <script src="Content/Scripts/jquery-ui.js"></script>


</head>
    
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="asm" runat="server" />
        <br />
        <div class="container hidden-print"">
            <div class="hidden-print">
                <div class="row">
                    <input id="add" type="button" value="+" />
                    <input id="sub" type="button" value="-" />
                </div>
            </div>
        </div>
        <div class="container">
                                  <div class="col-xs-12 col-p-12">
                <div class="pull-right">
                    <div class="row">
                        <img src="Content/Images/gmfrs_insureV4.png" />
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="form-inline">
                <div class="form-group">
                    <div class="col-xs-6 col-p-6">
                        <label class="control-label">Your Reference:</label>
                        <asp:TextBox ID="tb_yourfref" runat="server" CssClass="form-control" BorderColor="White" BorderStyle="None"></asp:TextBox>
                           
                    </div>
                    <div class="col-xs-6">
                        <label class="control-label">Our Reference:</label>
                        <asp:Label ID="lbl_OurRef" runat="server" Text="PS/HP/DQ" ></asp:Label>
                    </div>
                    <div class="col-xs-6 text-right">
                    </div>
                </div>
                <br />
            </div>
            <br />
            <div class="row">
                <hr />
            </div>
            <div class="col-xs-6 col-p-6">
                <h4>Call Infomation:</h4>
            </div>
            <br />
            <div class="col-xs-10 col-p-10">
                <div class="form-horizontal">
                    <div class="form-group">
                        <label class="control-label">Incident Reference:</label>
                        <asp:Label ID="lbl_IncRef" runat="server" Text="1407009829"></asp:Label>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Address of Occurence:</label>
                        <asp:Label ID="lbl_address" runat="server" Text="5 EVERTON ROAD NORTH REDDISH STOCKPORT SK5 6NP"></asp:Label>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Date and Time of Call:</label>
                        <asp:Label ID="lbl_datecall" runat="server" Text="28/07/2014 09:47:48"></asp:Label>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Time Under Control:</label>
                        <asp:Label ID="lbl_incidentEnd" runat="server" Text="28/07/2014 09:47:48"></asp:Label>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Method of Contact:</label>
                        <asp:Label ID="lbl_methodcontact" runat="server" Text="Person(Landline)"></asp:Label>
                    </div>
                </div>
            </div>
            <div class="row"></div>
            <div class="row">
                <hr />
            </div>
            <div class="col-xs-6">
                <h4>Incident Infomation:</h4>
            </div>
            <div class="col-xs-8 col-p-8">
                <div class="form-horizontal">

                    <div class="form-group">
                        <label class="control-label">Type of Property:</label>
                        <asp:Label ID="lbl_proptype" runat="server" Text="Building - Dwelling - House - single occupancy"></asp:Label>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Origin of Fire:</label>
                        <asp:Label ID="lbl_originoffire" runat="server" Text="Utility Room"></asp:Label>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Officer in Charge:</label>
                        <asp:Label ID="lbl_oic" runat="server" Text="WM BAGLEY"></asp:Label>
                    </div>
                    <div class="page-break"></div>
                    <div class="form-group">

                        <asp:Label ID="lbl_gridanounce"  runat="server" Text="Equipment Used:" Font-Bold="True"></asp:Label>
                        <br />
                        <br />
                        <div class="col-md-12 col-md-push-1">
                            <asp:UpdatePanel ID="Mobsupdate" runat="server">
                                <ContentTemplate>
                                    <asp:GridView ID="EqupmentUsedGrid" runat="server" AllowPaging="true" OnPageIndexChanging="EqupmentUsedGrid_PageIndexChanging" Width="300px">
                                    </asp:GridView>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <div id="breakpage1"></div>
        <div class="container">
            <footer>
                <img src="Content/Images/presentation%20banner.jpg" />
            </footer>
        </div>
             <div class="container">
            <div class="hidden-print">
                <div class="row">
                    <input id="add2" type="button" value="+" />
                    <input id="sub2" type="button" value="-" />
                </div>
            </div>
        </div>
        <div class="container">
            <div class="col-xs-12 col-p-12">
                <div class="pull-right">
                    <div class="row">
                          <img src="Content/Images/gmfrs_insureV4.png" />
                    </div>
                </div>
            </div>
            <div class="row"></div>
            <div class="row">
                <hr />
            </div>
        </div>
    

        <div class="container">

            <div class="col-xs-6 col-p-6">
                <h4>Damage Infomation:</h4>
            </div>
            <br />
            <div class="col-xs-10 col-p-10">
                <div class="form-horizontal">
                    <div class="form-group">
                        <label class="control-label">Estimated extent of damage on FRS arrival:</label>
                        <asp:Label ID="lbl_sizeonarrive" runat="server" Text="1407009829"></asp:Label>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Estimated extent of damage on incident close:</label>
                        <asp:Label ID="lbl_damageonclose" runat="server" Text="5 EVERTON ROAD NORTH REDDISH STOCKPORT SK5 6NP"></asp:Label>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Estimated size of the fire's room of origin (sq/m):</label>
                        <asp:Label ID="lbl_roomoforigin" runat="server" Text="28/07/2014 09:47:48"></asp:Label>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Total area damaged (sq/m):</label>
                        <asp:Label ID="lbl_totaldamage" runat="server" Text="28/07/2014 09:47:48"></asp:Label>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Distance to any adjacent property affected:</label>
                        <asp:Label ID="lbl_distanceadjacent" runat="server" Text="Person(Landline)" BorderStyle="None"></asp:Label>
                    </div>
                </div>
            </div>
            <div class="row"></div>
            <div class="row">
                <hr />
            </div>

            <div class="col-xs-6">
                <h4>Cause Infomation:</h4>
            </div>
            <div class="col-xs-8 col-p-8">
                <div class="form-horizontal">

                    <div class="form-group">
                        <label class="control-label">Supposed cause of fire:</label>
                        <asp:Label ID="lbl_firecause" runat="server" Text="Building - Dwelling - House - single occupancy"></asp:Label>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Source of Ignition:</label>
                        <asp:Label ID="lbl_ignitionsource" runat="server" Text="Utility Room"></asp:Label>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Material of item first ignited:</label>
                        <asp:Label ID="lbl_itemfirstigntited" runat="server" Text="WM BAGLEY"></asp:Label>
                    </div>
                    <div class="form-group">
                        <label class="control-label">Defect, act or ommission giving rise to ignition:</label>
                        <asp:Label ID="lbl_maincause" runat="server" Text="WM BAGLEY"></asp:Label>
                    </div>
                    <div class="form-group">
                        <div class="col-xs-8">
                            <label class="control-label">Log Text:</label>
                        </div>
                        <div class="col-xs-8" id="text">
                            <asp:TextBox ID="tb_adi" runat="server" CssClass="form-control" Width="500px" Height="150px" Rows="3" TextMode="MultiLine" BorderColor="White" BorderStyle="None"  ></asp:TextBox>
                         
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <div id="pagebreak2">
            <br />
            <br />
            <br />
            <br />
        </div>

        <div class="container">
            <footer>
                <img src="Content/Images/presentation%20banner.jpg" />
            </footer>
        </div>
        <script type="text/javascript">

            $("#add").click(function () {
                $("#breakpage1").append("<br/>");
            });

            $("#sub").click(function () {
                $("#breakpage1").find("br").remove();

            });

            $("#add2").click(function () {
                $("#pagebreak2").append("<br/>");
            });

            $("#sub2").click(function () {
                $("#pagebreak2").find("br").remove();

            });

         
        </script>



    </form>


</body>
</html>
