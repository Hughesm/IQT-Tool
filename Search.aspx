<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Search.aspx.cs" Inherits="Search" UICulture="en-gb" Culture="en-gb" EnableEventValidation="false" %>

<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit, Version=1.0.10123.0, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <script>

        $(document).ready(function () {

            $("#BroughCol").hide();
            $("#StationCol").hide();

            if ($("#<%=DD_area.ClientID%>").val() === "0") {

                $("#BroughCol").hide();
            }
            else {

                $("#BroughCol").show();

            }
            if ($("#<%=DropDownListBorough.ClientID%>").val() === "0") {

                $("#StationCol").hide();
            }
            else {

                $("#StationCol").show();

            }

        });


    </script>
    <script>
        $(document).ready(function () {

            $("#alert").hide();

            if ($("#<%=TextBox1.ClientID%>").val() === "0") {

                $("#alert").slideDown("slow");
            }

        });
    </script>

    <script>
        $(document).ready(function () {

            $("#<%=tbEndDate.ClientID%>").datepicker({ dateFormat: "dd/mm/yy", changeYear: true });
            $("#<%=tbStartDate.ClientID%>").datepicker({ dateFormat: "dd/mm/yy", changeYear: true });


        });
    </script>



    <asp:TextBox ID="TextBox1" runat="server" CssClass="hidden"></asp:TextBox>
    <div class="form-horizontal" role="form">

        <div class="container">

            <div class="page-header">
                <h3>Basic Search</h3>
            </div>
            <h5>Enter any information you have into the boxes below and the results will be automatically displayed in the Results section of this page.</h5>
            <div class="well">
                <div>
                    <div class="row" id="incnumber">
                        <%--Incident Number Entry --%>
                        <div class="col-xs-6 col-md-4">
                            <asp:Label ID="lbl_IncNumber" runat="server" Text="Incident Number: "></asp:Label>
                            <asp:TextBox ID="tb_incidentNumber" runat="server" AutoPostBack="True" CausesValidation="true" Width="168px" CssClass="form-control"
                                placeholder="Incident Number"></asp:TextBox>


                            <asp:FilteredTextBoxExtender ID="AjaxNumbersonly" runat="server" TargetControlID="tb_incidentNumber" ValidChars="1234567890"></asp:FilteredTextBoxExtender>
                        </div>
                    </div>
                    <br />

                    <div class="row" id="boroughdiv">
                        <div class=" col-xs-9 col-md-3">
                            <div class="col-md-2" id="AreaCol">
                                <asp:Label ID="lbl_Area" runat="server" Text="Area: "></asp:Label>
                                <asp:DropDownList ID="DD_area" runat="server" DataSourceID="Area" CssClass="btn btn-default dropdown-toggle"
                                    DataTextField="Area" DataValueField="Area" AutoPostBack="True" AppendDataBoundItems="true" EnableViewState="false">
                                    <asp:ListItem Value="0">Select Area</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="Area" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>"
                                    SelectCommand="SELECT DISTINCT [Area] FROM [PerformanceDimNew]"></asp:SqlDataSource>
                            </div>
                        </div>
                        <div class="col-md-2" id="BroughCol">

                            <%--Borough Selection --%>
                            <asp:Label ID="lbl_Borough" runat="server" Text="Borough: "></asp:Label>

                            <asp:DropDownList ID="DropDownListBorough" runat="server" DataSourceID="Borough" CssClass="btn btn-default dropdown-toggle"
                                DataTextField="L4_Desc" DataValueField="L4_Desc" AutoPostBack="True" AppendDataBoundItems="true" EnableViewState="false">
                                <asp:ListItem Value="0">Select Borough</asp:ListItem>
                            </asp:DropDownList>

                            <asp:SqlDataSource ID="Borough" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>"
                                SelectCommand="SELECT DISTINCT [L4_Desc] FROM [PerformanceDimNew] where Area=@AreaFilter">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DD_area" PropertyName="SelectedValue"
                                        Name="AreaFilter" Type="String" DefaultValue="Manchester" />
                                </SelectParameters>

                            </asp:SqlDataSource>

                        </div>

                        <div class="col-xs-9 col-md-2" id="StationCol">
                            <asp:Label ID="lbl_Station" runat="server" Text="Station: "></asp:Label>

                            <asp:DropDownList ID="DropDownListStation" runat="server" DataSourceID="Station" CssClass="btn btn-default dropdown-toggle"
                                DataTextField="L5_Desc" DataValueField="L5_Desc" AutoPostBack="True" AppendDataBoundItems="true" EnableViewState="false">
                                <asp:ListItem Value="0">Select Station</asp:ListItem>
                            </asp:DropDownList>

                            <asp:SqlDataSource ID="Station" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>"
                                SelectCommand="SELECT DISTINCT [L5_Desc]  FROM [PerformanceDimNew] WHERE L4_Desc=@BoroughFilter">

                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DropDownListBorough" PropertyName="SelectedValue"
                                        Name="BoroughFilter" Type="String" DefaultValue="BOLTON" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>

                    </div>

                    <br />


                    <div class="row" id="AddressCol">
                        <%--Address Entry --%>
                        <div class="col-xs-9 col-md-4">
                            <asp:Label ID="lbl_address" runat="server" Text="Enter Address: "></asp:Label>
                            <asp:TextBox ID="tb_address" runat="server" AutoPostBack="True" CssClass="form-control" placeholder="Enter Incident Address"></asp:TextBox>
                        </div>

                    </div>
                    <br />


                    <div class="row" id="Incident">
                        <div class=" col-xs-9 col-md-2">
                            <%--Incident Category Entry --%>
                            <asp:Label ID="lbl_Incident" runat="server" Text="Incident Category: "></asp:Label>

                            <asp:DropDownList ID="DropDownIncident_Catergory" runat="server" DataSourceID="incident_category" CssClass="btn btn-default dropdown-toggle"
                                DataTextField="Incident Category" DataValueField="Incident Category" AutoPostBack="True" AppendDataBoundItems="true">
                                <asp:ListItem Value="0">Select Category</asp:ListItem>
                            </asp:DropDownList>

                            <asp:SqlDataSource ID="incident_category" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>"
                                SelectCommand="SELECT DISTINCT CASE when [incident_category] ='false alarm' then 'False Alarm' when [incident_category] ='fire' then 'Fire' when [incident_category] ='other none clg' then 'Other None CLG' else [incident_category] end as 'Incident Category' FROM [incidentdim] where [incident_category] is not null ORDER BY 'Incident Category' asc"></asp:SqlDataSource>
                        </div>
                    </div>




                    <br />

                    <div class="row" id="narhh">
                        <div class="col-lg-4" id="narLogSearch">
                            <asp:Label ID="lbl_NarLogSearch" runat="server" Text="Search Narrative Log:"></asp:Label>
                            <asp:TextBox ID="tb_NarLogSearch" runat="server" AutoPostBack="true" CssClass="form-control" placeholder="Keyword Search"></asp:TextBox>
                        </div>
                        <div class=" col-xs-6 col-md-2">
                            <asp:Label ID="lbl_OIC" runat="server" Text="Officer Call Sign:"></asp:Label>
                            <asp:DropDownList ID="DD_OfficerCallSign" runat="server" DataSourceID="OfficeData" CssClass="btn btn-default"
                                DataTextField="OfficerCount" DataValueField="OfficerCount" AutoPostBack="True" AppendDataBoundItems="true" EnableViewState="false">
                                <asp:ListItem Value="0">Select Officer:</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="OfficeData" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>"
                                SelectCommand="SELECT DISTINCT MB_CALL_SIGN AS OfficerCount FROM dbo.MB_MOBILISATIONS AS MB_MOBILISATIONS_1 WHERE (MB_CALL_SIGN LIKE 'GG%')OR (MB_CALL_SIGN LIKE 'GS%') OR (MB_CALL_SIGN LIKE 'GA%')OR (MB_CALL_SIGN LIKE 'GB%')OR (MB_CALL_SIGN LIKE 'GW%')OR (MB_CALL_SIGN LIKE 'GE%')"></asp:SqlDataSource>
                        </div>                      

                    </div>
                      <br />
                    <div class="row">
                        <div class="col-md-2" id="oicsearch">
                            <asp:Label ID="lbl_OICSearch" runat="server" Text="OIC:"></asp:Label>
                            <asp:TextBox ID="tb_OICSearch" runat="server" AutoPostBack="true" CssClass="form-control" placeholder="Search for an OIC"></asp:TextBox>
                        </div>
                        <div class="col-xs-6 col-md-2" id="irsStatus">
                            <asp:Label ID="lbl_irsstatus" runat="server" Text="IRS Status:"></asp:Label>
                            <asp:DropDownList ID="dd_irs" runat="server" CssClass="btn btn-default dropdown-toggle" AutoPostBack="True" EnableViewState="false">
                                <asp:ListItem>Select Status:</asp:ListItem>
                                <asp:ListItem>Not Started</asp:ListItem>
                                <asp:ListItem>Checked</asp:ListItem>
                                <asp:ListItem>Completed</asp:ListItem>
                                <asp:ListItem>Not Completed</asp:ListItem>
                                <asp:ListItem>Archived</asp:ListItem>
                                <asp:ListItem>Not Completed</asp:ListItem>
                            </asp:DropDownList>
                            </div>

                    </div>
                    <br />
                    <div class="row" id="Date">
                        <div class="col-md-2">
                            <asp:Label ID="lbl_StartDate" runat="server" Text="Enter Start Date: "></asp:Label>

                            <asp:TextBox ID="tbStartDate" runat="server" AutoPostBack="true" CssClass="form-control" Width="168px" />

                        </div>


                        <%--Date end Selector  --%>
                        <div class="col-md-2">
                            <asp:Label ID="lbl_EndDate" runat="server" Text="Enter End Date: "></asp:Label>

                            <asp:TextBox ID="tbEndDate" runat="server" AutoPostBack="true" CssClass="form-control" Width="168px" />

                        </div>
                    </div>
                    <%--Date start Selector  --%>



                    <%--Results --%>
                </div>
            </div>
            <div class="alert alert-info alert-dismissible" role="alert" id="alert">
                <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <strong>Info:</strong>
                <asp:Label ID="noresults" runat="server" Text="Label"></asp:Label>
            </div>

            <div class="page-header">
                <h3>Results</h3>
            </div>
            <div class="row">
                <div class="col-md-3">
                    <asp:Label ID="lbl_MaxRecords" runat="server" Text="Number of Records:"></asp:Label>
                    <asp:DropDownList ID="dd_MaxRecords" runat="server" AutoPostBack="True" CssClass="btn btn-default">

                        <asp:ListItem Value="0">All</asp:ListItem>
                        <asp:ListItem Value="1">100</asp:ListItem>
                        <asp:ListItem Value="2">75</asp:ListItem>
                        <asp:ListItem Value="3">50</asp:ListItem>
                        <asp:ListItem Value="4">25</asp:ListItem>
                        <asp:ListItem Value="5">10</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <br />
         
                <h5>
                    <br />
                    <asp:Label ID="lblResults" runat="server" Visible="false"></asp:Label>
                </h5>
                <asp:UpdatePanel ID="AdvResults" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>



                        <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover" OnRowDataBound="GridView1_RowDataBound"
                            OnSelectedIndexChanged="OnSelectedIndexChanged" AllowPaging="true" OnPageIndexChanging="OnPaging" AutoGenerateColumns="false">
                            <Columns>
                                <asp:ButtonField Text="Select" CommandName="Select" ItemStyle-Width="30" ControlStyle-CssClass="btn btn-info" ButtonType="Button" HeaderText="Select Incident" />


                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <div class="row" id="ExportExcel">

                    <div class="col-xs-6 col-md-4">
                        <asp:Button runat="server" Text="Export to Excel" OnClick="Button1_Click" CssClass="btn btn-default" ToolTip="Export search results to an excel file." />
                    </div>
                </div>


                <asp:Label ID="Label1" runat="server" Visible="true"></asp:Label>
           
        </div>
    </div>
    <asp:Label ID="debug1" runat="server" Text="Label"></asp:Label>
    <asp:Label ID="debug2" runat="server" Text="Label"></asp:Label>
    <asp:Label ID="debug3" runat="server" Text="Label"></asp:Label>
    <br />
    <div class="panel-footer">
        <div class="col-md-6 col-md-push-4">
            <p>Advanced IRS Query Tool for <a href="http://manchesterfire.gov.uk">Greater Manchester Fire and Rescue</a>  <a href="https://twitter.com/manchesterfire">|@manchesterfire</a></p>
            <div class="col-md-2 col-md-push-3">
                <p><a href="#">Back to top</a> </p>
            </div>
        </div>
    </div>


</asp:Content>




