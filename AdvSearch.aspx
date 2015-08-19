<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AdvSearch.aspx.cs" Inherits="AdvSearch" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


<script>
    function BindIncidentEvents() {

        $("#alert").hide();

        $("#AreaCol").removeClass("hidden");
        $("#BroughCol").addClass("hidden");
        $("#StationCol").addClass("hidden"); 




        $("#removeIncidentCat").toggleClass("hidden");

        if ($("#<%= DD_PropCat.ClientID %>").val() === "0") {

           
        } else {

            $("#PropertySubType").removeClass("hidden");

        }

        if ($("#<%= DD_area.ClientID %>").val() === "0") {

            $("#BroughCol").addClass("hidden");
        } else {

            $("#BroughCol").removeClass("hidden");

        }
        if ($("#<%= DropDownListBorough.ClientID %>").val() === "0") {

            $("#StationCol").addClass("hidden");
        } else {

            $("#StationCol").removeClass("hidden");

        }

    };

</script>

<script>

    function BindEvents() {

        if ($("#<%= DropDownIncident_Catergory.ClientID %>").val() === "0") {
            $("#<%= lbl_CauseofFireSearch.ClientID %>").hide();
            $("#<%= DD_CauseofFireSearch.ClientID %>").hide();
            $("#<%= lbl_SSType.ClientID %>").hide();
            $("#<%= DD_SSType.ClientID %>").hide();
            $("#<%= lbl_SSClass.ClientID %>").hide();
            $("#<%= DD_SSClass.ClientID %>").hide();
            $("#<%= lbl_FireClass.ClientID %>").hide();
            $("#<%= DD_FirecLASS.ClientID %>").hide();
            $("#<%= lbl_FaGroup.ClientID %>").hide();
            $("#<%= DD_FaGroup.ClientID %>").hide();
        };

        if ($("#<%= DropDownIncident_Catergory.ClientID %>").val() === "False Alarm") {
            $("#<%= lbl_CauseofFireSearch.ClientID %>").hide();
            $("#<%= DD_CauseofFireSearch.ClientID %>").hide();
            $("#<%= lbl_SSType.ClientID %>").hide();
            $("#<%= DD_SSType.ClientID %>").hide();
            $("#<%= lbl_SSClass.ClientID %>").hide();
            $("#<%= DD_SSClass.ClientID %>").hide();
            $("#<%= lbl_FireClass.ClientID %>").hide();
            $("#<%= DD_FirecLASS.ClientID %>").hide();
            $("#<%= lbl_FaGroup.ClientID %>").show();
            $("#<%= DD_FaGroup.ClientID %>").show();

        };

        if ($("#<%= DropDownIncident_Catergory.ClientID %>").val() === "Fire") {

            $("#<%= lbl_CauseofFireSearch.ClientID %>").show();
            $("#<%= DD_CauseofFireSearch.ClientID %>").show();
            $("#<%= lbl_FireClass.ClientID %>").show();
            $("#<%= DD_FirecLASS.ClientID %>").show();

            $("#<%= lbl_SSType.ClientID %>").hide();
            $("#<%= DD_SSType.ClientID %>").hide();
            $("#<%= lbl_SSClass.ClientID %>").hide();
            $("#<%= DD_SSClass.ClientID %>").hide();

            $("#<%= lbl_FaGroup.ClientID %>").hide();
            $("#<%= DD_FaGroup.ClientID %>").hide();
        };

        if ($("#<%= DropDownIncident_Catergory.ClientID %>").val() === "Special Service") {
            $("#<%= lbl_CauseofFireSearch.ClientID %>").hide();
            $("#<%= DD_CauseofFireSearch.ClientID %>").hide();
            $("#<%= lbl_SSType.ClientID %>").show();
            $("#<%= DD_SSType.ClientID %>").show();
            $("#<%= lbl_SSClass.ClientID %>").show();
            $("#<%= DD_SSClass.ClientID %>").show();
            $("#<%= lbl_FireClass.ClientID %>").hide();
            $("#<%= DD_FirecLASS.ClientID %>").hide();
            $("#<%= lbl_FaGroup.ClientID %>").hide();
            $("#<%= DD_FaGroup.ClientID %>").hide();
        };
        if ($("#<%= DropDownIncident_Catergory.ClientID %>").val() === "Other") {
            $("#<%= lbl_CauseofFireSearch.ClientID %>").hide();
            $("#<%= DD_CauseofFireSearch.ClientID %>").hide();
            $("#<%= lbl_SSType.ClientID %>").hide();
            $("#<%= DD_SSType.ClientID %>").hide();
            $("#<%= lbl_SSClass.ClientID %>").hide();
            $("#<%= DD_SSClass.ClientID %>").hide();
            $("#<%= lbl_FireClass.ClientID %>").hide();
            $("#<%= DD_FirecLASS.ClientID %>").hide();
            $("#<%= lbl_FaGroup.ClientID %>").hide();
            $("#<%= DD_FaGroup.ClientID %>").hide();
        };
        if ($("#<%= DropDownIncident_Catergory.ClientID %>").val() === "Other None CLG") {
            $("#<%= lbl_CauseofFireSearch.ClientID %>").hide();
            $("#<%= DD_CauseofFireSearch.ClientID %>").hide();
            $("#<%= lbl_SSType.ClientID %>").hide();
            $("#<%= DD_SSType.ClientID %>").hide();
            $("#<%= lbl_SSClass.ClientID %>").hide();
            $("#<%= DD_SSClass.ClientID %>").hide();
            $("#<%= lbl_FireClass.ClientID %>").hide();
            $("#<%= DD_FirecLASS.ClientID %>").hide();
            $("#<%= lbl_FaGroup.ClientID %>").hide();
            $("#<%= DD_FaGroup.ClientID %>").hide();
        };

    };


</script>


<script>
    $(document).ready(function() {


        $("#<%= tbEndDate.ClientID %>").datepicker({ dateFormat: "dd/mm/yy", changeYear: true });
        $("#<%= tbStartDate.ClientID %>").datepicker({ dateFormat: "dd/mm/yy", changeYear: true });

    });
</script>

<script>
    function BindPropertyEvents() {


        if ($("#<%= DD_PropCat.ClientID %>").val() === "0") {

           
        } else {
            $("#PropertySubType").removeClass("hidden");
        }
    }


</script>


<script id="btnfilters">


    $(document).ready(function() {

        var miscSearchvisibletest = false;
        var IncicatSelected = 0;

        function Refresh() {
            location.reload();
        };

        $(".row, #SortedFilters").sortable({
            connectWith: ".wellDrag",
            tolerance: "intersect",
            stop: function(ev, ui) {
                if (($(ui.item).attr("id") === "btn_IncCat")) {
                    $("#IncidentSearch").removeClass("hidden");
                    $("#incsearchh5").removeClass("hidden");
                    $("#btn_IncCat").toggleClass("btn-primary btn-success");
                    if ($("#removeFilters").hasClass("hidden")) {
                        $("#removeFilters").removeClass("hidden");
                        $("#SortedFilters").toggleClass("wellDrag col-md-12 wellDrag col-md-11");
                    }

                } else if (($(ui.item).attr("id") === "btn_PropCat")) {
                    $("#PropertySearch").removeClass("hidden");
                    $("#btn_PropCat").toggleClass("btn-primary btn-success");
                    if ($("#removeFilters").hasClass("hidden")) {
                        $("#removeFilters").removeClass("hidden");
                        $("#SortedFilters").toggleClass("wellDrag col-md-12 wellDrag col-md-11");
                    }

                } else if (($(ui.item).attr("id") === "btn_Area")) {
                    $("#AreaCol").removeClass("hidden");
                    $("#btn_Area").toggleClass("btn-primary btn-success");
                    if ($("#removeFilters").hasClass("hidden")) {
                        $("#removeFilters").removeClass("hidden");
                        $("#SortedFilters").toggleClass("wellDrag col-md-12 wellDrag col-md-11");
                    }

                } else if (($(ui.item).attr("id") === "btn_Address")) {
                    $("#address").removeClass("hidden");
                    $("#btn_Address").toggleClass("btn-primary btn-success");
                    $("#MobSelection").removeClass("hidden");
                    if ($("#removeFilters").hasClass("hidden")) {
                        $("#removeFilters").removeClass("hidden");
                        $("#SortedFilters").toggleClass("wellDrag col-md-12 wellDrag col-md-11");
                    }

                } else if (($(ui.item).attr("id") === "btn_Ward")) {
                    $("#btn_Ward").removeClass("hidden");
                    $("#btn_Ward").toggleClass("btn-primary btn-success");
                    if ($("#removeFilters").hasClass("hidden")) {
                        $("#removeFilters").removeClass("hidden");
                        $("#SortedFilters").toggleClass("wellDrag col-md-12 wellDrag col-md-11");
                    }

                    if ($("#BroughCol").hasClass("hidden")) {
                        $("#WardAlert").toggleClass("alert alert alert-info alert-dismissible hidden alert alert alert-info alert-dismissible");
                        $("#WardAlert").html("<strong>Warning:</strong> Please select a Borough before you select a Ward.");
                    } else {
                        $("#btn_Ward").toggleClass("btn-primary btn-success");
                        if ($("#MobSelection").hasClass("well hidden")) {
                            $("#MobSelection").removeClass("hidden");
                        };
                        $("#WardCol").toggleClass("col-md-2 hidden col-md-2");
                    }
                } else if (($(ui.item).attr("id") === "btn_Watch")) {
                    $("#watchCol").removeClass("hidden");
                    if ($("#removeFilters").hasClass("hidden")) {
                        $("#removeFilters").removeClass("hidden");
                        $("#SortedFilters").toggleClass("wellDrag col-md-12 wellDrag col-md-11");
                    }

                    $("#MobSelection").removeClass("hidden");
                } else if (($(ui.item).attr("id") === "btn_NumPumps")) {
                    if ($("#removeFilters").hasClass("hidden")) {
                        $("#removeFilters").removeClass("hidden");
                        $("#SortedFilters").toggleClass("wellDrag col-md-12 wellDrag col-md-11");
                    }

                    $("#Pumpscol").removeClass("hidden");
                    $("#MobSelection").removeClass("hidden");
                } else if (($(ui.item).attr("id") === "btn_MobTarger")) {
                    $("#targetmet").removeClass("hidden");
                    $("#btn_MobTarger").toggleClass("btn-primary btn-success");
                    $("#MobSelection").removeClass("hidden");
                    if ($("#removeFilters").hasClass("hidden")) {
                        $("#removeFilters").removeClass("hidden");
                        $("#SortedFilters").toggleClass("wellDrag col-md-12 wellDrag col-md-11");
                    }

                } else if (($(ui.item).attr("id") === "btn_RiskCat")) {
                    if ($("#removeFilters").hasClass("hidden")) {
                        $("#removeFilters").removeClass("hidden");
                        $("#SortedFilters").toggleClass("wellDrag col-md-12 wellDrag col-md-11");
                    }
                    $("#RiskCatSearch").removeClass("hidden");
                    $("#MobSelection").removeClass("hidden");
                 

                } else if (($(ui.item).attr("id") === "btn_NarLog")) {
                    if ($("#removeFilters").hasClass("hidden")) {
                        $("#removeFilters").removeClass("hidden");
                        $("#SortedFilters").toggleClass("wellDrag col-md-12 wellDrag col-md-11");
                    }
                   
                    $("#NarIRSseach").removeClass("hidden");
                    $("#Narfilters").removeClass("hidden");
                    $("#narLogSearch").removeClass("hidden");
                    $("#IRSsearch").removeClass("hidden");

                } else if (($(ui.item).attr("id") === "btn_OiC")) {
                    if ($("#removeFilters").hasClass("hidden")) {
                        $("#removeFilters").removeClass("hidden");
                        $("#SortedFilters").toggleClass("wellDrag col-md-12 wellDrag col-md-11");
                    }
                    $("#miscSearch").removeClass("hidden");
                    $("#oicsearch").removeClass("hidden");
                    $("#OICfilters").removeClass("hidden");
                } else if (($(ui.item).attr("id") === "btn_IRSstatues")) {
                    if ($("#removeFilters").hasClass("hidden")) {
                        $("#removeFilters").removeClass("hidden");
                        $("#SortedFilters").toggleClass("wellDrag col-md-12 wellDrag col-md-11");
                    }
                    $("#irschecked").removeClass("hidden");
                    $("#OICfilters").removeClass("hidden");
                    $("#miscSearch").removeClass("hidden");
                } else if (($(ui.item).attr("id") === "btn_Equip")) {
                    if ($("#removeFilters").hasClass("hidden")) {
                        $("#removeFilters").removeClass("hidden");
                        $("#SortedFilters").toggleClass("wellDrag col-md-12 wellDrag col-md-11");
                    }
                    $("#EquipmentSearch").removeClass("hidden");
                    $("#miscSearch").removeClass("hidden");

                } else if (($(ui.item).attr("id") === "btn_date")) {
                    if ($("#removeFilters").hasClass("hidden")) {
                        $("#removeFilters").removeClass("hidden");
                        $("#SortedFilters").toggleClass("wellDrag col-md-12 wellDrag col-md-11");
                    }
                    $("#btn_Equip").removeClass("hidden");
                    $("#startdate").removeClass("hidden");
                    $("#enddate").removeClass("hidden");
                    $("#DateSearch").removeClass("hidden");

                }

            }
        }).disableSelection();


        $("#removeFilters").click(function() {
           // Refresh();
            undo();
        });


    });

</script>
    
<script>
    function undo() {
        $(".row, #SortedFilters").sortable("cancel");
    }
</script>


<div class="form-horizontal" role="form">

<div class="container" id="content">

<div class="page-header">
    <h3>Advanced Search (In Development)</h3>
</div>
<h5>Construct your search by dragging and dropped the tags onto the 'well' below:</h5>

<div class="well" id="filters">
    <div class="row">

        <div class="btn btn-primary" id="btn_IncCat">Incident Category</div>
        <div class="btn btn-primary" id="btn_PropCat">Property Type</div>
        <div class="btn btn-primary" id="btn_Address">Incident Address</div>
        <div class="btn btn-primary" id="btn_Ward">Incident Ward</div>
        <div class="btn btn-primary" id="btn_Watch">Watch</div>
        <div class="btn btn-primary" id="btn_NumPumps">Pump Number</div>
    </div>
    <br/>
    <div class="row" id="layer2">
        <div class="btn btn-primary" id="btn_MobTarger">Mobilisation Target</div>
        <div class="btn btn-primary" id="btn_RiskCat">Risk Category</div>
        <div class="btn btn-primary" id="btn_NarLog">Narrative Log/IRS Notes</div>
        <div class="btn btn-primary" id="btn_OiC">OIC</div>
        <div class="btn btn-primary" id="btn_Equip">Equipment Type</div>
        <div class="btn btn-primary" id="btn_IRSstatues">IRS Status/Callsign</div>
        <div class="btn btn-primary" id="btn_date">Date Range</div>

    </div>
</div>

<%--Incident Selection --%>

<div class="form-inline" role="form">
    <h5 id="SelectedFilters">Drag and drop your filters onto this well:</h5>
    <div class="row">

        <div class="wellDrag col-md-12" id="SortedFilters">
            <div class="btn btn-success" id="btn_Area">Mobilisation Location</div>

        </div>
        <div class="col-md-1 hidden" id="removeFilters">
            <button type="button" class="btn btn-danger">
                <span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
                
            </button>
        </div>

    </div>
    <h5 id="incsearchh5" class="hidden">Use these filters for Incident Type Searches</h5>
    <div id="IncidentSearch" class="well hidden">
        <asp:UpdatePanel ID="IncidentCatPanel" runat="server">
            <ContentTemplate>
                <script type="text/javascript">
                    Sys.Application.add_load(BindEvents);
                </script>
                <div class="row">

                    <div class="col-md-2" id="IncidentCatSearch" runat="server">
                        <asp:Label ID="lbl_Incident" runat="server" Text="Incident Category: "></asp:Label>

                        <asp:DropDownList ID="DropDownIncident_Catergory" runat="server" DataSourceID="incident_category" CssClass="btn btn-default"
                                          DataTextField="incident_category" DataValueField="incident_category" AutoPostBack="True" AppendDataBoundItems="true">
                            <asp:ListItem Value="0">Select Category</asp:ListItem>
                        </asp:DropDownList>

                        <asp:SqlDataSource ID="incident_category" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>"
                                           SelectCommand="SELECT DISTINCT incident_category FROM [incidentdim] ORDER BY incident_category ASC">
                        </asp:SqlDataSource>
                        <!---->
                    </div>

                </div>
                <div class="row">

                    <div class="col-md-3" id="FireCause" runat="server">
                        <asp:Label ID="lbl_CauseofFireSearch" runat="server" Text="Cause of Fire:"/>
                        <asp:DropDownList ID="DD_CauseofFireSearch" runat="server" DataSourceID="Cause" CssClass="btn btn-default"
                                          DataTextField="fire_cause" DataValueField="fire_cause" AutoPostBack="True" EnableViewState="false" AppendDataBoundItems="true">
                            <asp:ListItem Value="0">Select Cause:</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="Cause" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>"
                                           SelectCommand="SELECT DISTINCT [fire_cause] FROM [incidentdim] where fire_cause is not null">
                        </asp:SqlDataSource>
                        <!---->
                    </div>

                    <div class="col-md-2" id="FireClassificationDiv" runat="server">
                        <asp:Label ID="lbl_FireClass" runat="server" Text="Fire Classification:"></asp:Label>
                        <asp:DropDownList ID="DD_FirecLASS" runat="server" DataSourceID="FireClass" CssClass="btn btn-default"
                                          DataTextField="fire_classification" DataValueField="fire_classification" AutoPostBack="True" EnableViewState="false" AppendDataBoundItems="true">
                            <asp:ListItem Value="0">Select:</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="FireClass" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>"
                                           SelectCommand="SELECT DISTINCT [fire_classification] FROM [incidentdim] where fire_classification is not null">
                        </asp:SqlDataSource>
                        <!---->
                    </div>

                </div>

                <div class="row">

                    <div class="col-md-2" id="AlarmCause" runat="server">
                        <asp:Label ID="lbl_FaGroup" runat="server" Text="Activation Reason:"></asp:Label>
                        <asp:DropDownList ID="DD_FaGroup" runat="server" DataSourceID="FireGroup" CssClass="btn btn-default"
                                          DataTextField="fa_group" DataValueField="fa_group" AutoPostBack="True" EnableViewState="false" AppendDataBoundItems="true">
                            <asp:ListItem Value="0">Select:</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="FireGroup" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>"
                                           SelectCommand="SELECT DISTINCT [fa_group] FROM [incidentdim] where fa_group is not null">
                        </asp:SqlDataSource>
                    </div>

                </div>
                <!---->
                <div class="row">

                    <div class="col-md-3" id="SpecialCause" runat="server">
                        <asp:Label ID="lbl_SSType" runat="server" Text="Special Service Type:"></asp:Label>
                        <asp:DropDownList ID="DD_SSType" runat="server" DataSourceID="SSType" CssClass="btn btn-default"
                                          DataTextField="SPECIAL_SERVICE_TYPE" DataValueField="SPECIAL_SERVICE_TYPE" AutoPostBack="True" AppendDataBoundItems="true" EnableViewState="false">
                            <asp:ListItem Value="0">Select Type:</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SSType" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>"
                                           SelectCommand="SELECT DISTINCT [SPECIAL_SERVICE_TYPE] FROM [SpecialServiceDim] where SPECIAL_SERVICE_TYPE is not null">
                        </asp:SqlDataSource>
                        <!---->
                    </div>

                    <div class="col-md-2" id="SpecialSecondCause" runat="server">

                        <asp:Label ID="lbl_SSClass" runat="server" Text="Special Service Class:"></asp:Label>
                        <asp:DropDownList ID="DD_SSClass" runat="server" DataSourceID="SSClass" CssClass="btn btn-default"
                                          DataTextField="SPECIAL_SERVICE_CLASS" DataValueField="SPECIAL_SERVICE_CLASS" AutoPostBack="True" AppendDataBoundItems="true" EnableViewState="false">
                            <asp:ListItem Value="0">Select Type:</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SSClass" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>"
                                           SelectCommand="SELECT DISTINCT [SPECIAL_SERVICE_CLASS] FROM [SpecialServiceDim] where SPECIAL_SERVICE is not null AND SPECIAL_SERVICE_TYPE=@SSFilter">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DD_SSType" PropertyName="SelectedValue"
                                                      Name="SSFilter" Type="String" DefaultValue="RTC"/>
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>

                </div>

            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</div>


<h5 id="propsearchh5" class="hidden">Use these filters for Property Type Searches</h5>

<div id="PropertySearch" class="well hidden">
    <div class="form-inline" role="form">
        <asp:UpdatePanel ID="PropertyUpdatePanel" runat="server">
            <ContentTemplate>
                <script type="text/javascript">
                    Sys.Application.add_load(BindPropertyEvents);
                </script>

                <div class="row">
                    <div class="col-md-3" id="PropertyType" runat="server">
                        <asp:Label ID="lbl_PropertyTypeSearch" runat="server" Text="Property Type:"></asp:Label>
                        <asp:DropDownList ID="DD_PropCat" runat="server" AutoPostBack="True" DataTextField="property_category" OnSelectedIndexChanged="DD_area_SelectedIndexChanged"
                                          DataValueField="property_category" DataSourceID="PropertyCat" CssClass="btn btn-default" AppendDataBoundItems="true" EnableViewState="false">
                            <asp:ListItem Value="0">Select Type:</asp:ListItem>
                        </asp:DropDownList>

                        <asp:SqlDataSource ID="PropertyCat" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>"
                                           SelectCommand="SELECT distinct case when property_category = 'OutdoorStructure' then 'Outdoor Structure' 
                                when property_category = 'NonResidential' then 'Non Residential'
                                when property_category = 'RoadVehicle' then 'Road Vehicle'
                                when property_category = 'OtherResidential' then 'Other Residential'
                                when property_category = 'RailVehicle' then 'Rail Vehicle'
                                else property_category 
                                end as property_category 
                                FROM incidentdim
                                where property_category is not null">
                        </asp:SqlDataSource>
                    </div>

                    <div class="col-md-2 hidden" id="PropertySubType" runat="server">
                        <asp:Label ID="lbl_PropertySubType" runat="server" Text="Property Subtype:"></asp:Label>
                        <asp:DropDownList ID="DD_PropertySubType" runat="server" AutoPostBack="True" DataTextField="lup_name" OnSelectedIndexChanged="DD_area_SelectedIndexChanged"
                                          DataValueField="lup_name" DataSourceID="PropertySubTypeData" CssClass="btn btn-default" AppendDataBoundItems="true" EnableViewState="false">
                            <asp:ListItem Value="0">Select Type:</asp:ListItem>
                        </asp:DropDownList>

                        <asp:SqlDataSource ID="PropertySubTypeData" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>"
                                           SelectCommand="select distinct lup_name from incidentdim where property_category=@PTFilter and lup_name is not null order by lup_name asc">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DD_PropCat" PropertyName="SelectedValue"
                                                      Name="PTFilter" Type="String" DefaultValue="RTC"/>
                            </SelectParameters>

                        </asp:SqlDataSource>
                    </div>

                </div>

            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</div>


<h5 id="MobSelectioh5" class="">Use these filters for address and mobilisation based searches.</h5>

<div id="MobSelection" class="well">
    <div class="form-inline" role="form">
        <asp:UpdatePanel ID="IncidentMobPanel" runat="server">
            <ContentTemplate>
                <script type="text/javascript">
                    Sys.Application.add_load(BindIncidentEvents);
                </script>

                <div class="row">
                <%--Borough Selection --%>
                <asp:UpdatePanel ID="AreaBorStaPanel" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <div class="col-md-3" id="AreaCol">
                            <asp:Label ID="lbl_Area" runat="server" Text="Area: "></asp:Label>
                            <asp:DropDownList ID="DD_area" runat="server" DataSourceID="Area" CssClass="btn btn-default"
                                              DataTextField="Area" DataValueField="Area" AutoPostBack="True" AppendDataBoundItems="true" EnableViewState="false"
                                              OnSelectedIndexChanged="DD_area_SelectedIndexChanged">
                                <asp:ListItem Value="0">Select Area</asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="Area" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>"
                                               SelectCommand="SELECT DISTINCT [Area] FROM [PerformanceDimNew]">
                            </asp:SqlDataSource>
                        </div>

                        <div class="col-md-2" id="BroughCol">
                            <asp:Label ID="lbl_Borough" runat="server" Text="Borough:"></asp:Label>

                            <asp:DropDownList ID="DropDownListBorough" runat="server" OnSelectedIndexChanged="DD_area_SelectedIndexChanged" DataSourceID="Borough" CssClass="btn btn-default"
                                              DataTextField="L4_Desc" DataValueField="L4_Desc" AutoPostBack="True" AppendDataBoundItems="true" EnableViewState="false">
                                <asp:ListItem Value="0">Select Borough</asp:ListItem>
                            </asp:DropDownList>

                            <asp:SqlDataSource ID="Borough" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>"
                                               SelectCommand="SELECT DISTINCT [L4_Desc] FROM [PerformanceDimNew] where Area=@AreaFilter">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DD_area" PropertyName="SelectedValue"
                                                          Name="AreaFilter" Type="String" DefaultValue="Manchester"/>
                                </SelectParameters>

                            </asp:SqlDataSource>
                        </div>

                        <div class="col-md-2" id="StationCol">
                            <asp:Label ID="lbl_Station" runat="server" Text="Station: "></asp:Label>

                            <asp:DropDownList ID="DropDownListStation" runat="server" DataSourceID="Station" CssClass="btn btn-default"
                                              DataTextField="L5_Desc" DataValueField="L5_Desc" AutoPostBack="True" AppendDataBoundItems="true" EnableViewState="false"
                                              OnSelectedIndexChanged="DD_area_SelectedIndexChanged">
                                <asp:ListItem Value="0">Select Station</asp:ListItem>
                            </asp:DropDownList>

                            <asp:SqlDataSource ID="Station" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>"
                                               SelectCommand="SELECT DISTINCT [L5_Desc]  FROM [PerformanceDimNew] WHERE L4_Desc=@BoroughFilter">

                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DropDownListBorough" PropertyName="SelectedValue"
                                                          Name="BoroughFilter" Type="String" DefaultValue="BOLTON"/>
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>
                        <div class="col-md-2 hidden" id="WardCol">
                            <asp:Label ID="lbl_ward" runat="server" Text="Ward: "></asp:Label>

                            <asp:ListBox ID="LB_Ward" runat="server" DataSourceID="SQLWard" CssClass="btn btn-default" SelectionMode="Multiple"
                                         DataTextField="WARD" DataValueField="WARD" AutoPostBack="True" AppendDataBoundItems="true" EnableViewState="true" OnSelectedIndexChanged="DD_area_SelectedIndexChanged">
                                <asp:ListItem Value="0">Select Ward</asp:ListItem>
                            </asp:ListBox>

                            <asp:SqlDataSource ID="SQLWard" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>"
                                               SelectCommand="SELECT DISTINCT [WARD]  FROM [Borough] WHERE Borough =@BoroughFilter">

                                <SelectParameters>
                                    <asp:ControlParameter ControlID="DropDownListBorough" PropertyName="SelectedValue"
                                                          Name="BoroughFilter" Type="String" DefaultValue="BOLTON"/>
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>

                    </ContentTemplate>
                </asp:UpdatePanel>
            </ContentTemplate>
        </asp:UpdatePanel>
        <!---->

    </div>

    <br/>
    <div class="row">

        <div class="col-md-2 hidden" id="Pumpscol">
            <asp:Label ID="lbl_NumberofPumpsSearch" runat="server" Text="Number of Pumps:"></asp:Label>
            <asp:DropDownList ID="dd_NumberofPumpsSearch" runat="server" AutoPostBack="True" CssClass="btn btn-default">
                <asp:ListItem Value="0">Number of Pumps:</asp:ListItem>
                <asp:ListItem Value="1">1</asp:ListItem>
                <asp:ListItem Value="2">2-3</asp:ListItem>
                <asp:ListItem Value="3">3-4</asp:ListItem>
                <asp:ListItem Value="4">5-6</asp:ListItem>
                <asp:ListItem Value="5">7-8</asp:ListItem>
                <asp:ListItem Value="6">9+</asp:ListItem>
            </asp:DropDownList>
        </div>

        <div class="col-md-2 hidden" id="targetmet">
            <!---->
            <asp:Label ID="lbl_TargetMetSearch" runat="server" Text="Mobilisation Target:"></asp:Label>
            <asp:DropDownList ID="DD_TargetMetSearch" runat="server" DataSourceID="Target" CssClass="btn btn-default"
                              DataTextField="PFStatus" DataValueField="PFStatus" AutoPostBack="True" AppendDataBoundItems="true" EnableViewState="false" OnSelectedIndexChanged="DD_area_SelectedIndexChanged">
                <asp:ListItem Value="0">Select:</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="Target" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>"
                               SelectCommand="SELECT DISTINCT [PFStatus] FROM [MB_MOBILISATIONS] where PFStatus  is not null order by PFStatus desc">
            </asp:SqlDataSource>
        </div>

        <div class="col-md-2 hidden" id="RiskCatSearch" runat="server">
            <asp:Label ID="lbl_RiskCatSearch" runat="server" Text="Search Risk Category:"></asp:Label>
            <asp:ListBox ID="DD_RiskCatSearch" runat="server" DataSourceID="Category" CssClass="btn btn-default"
                         DataTextField="risk_cat" DataValueField="risk_cat" AutoPostBack="True" AppendDataBoundItems="true" EnableViewState="false" SelectionMode="Multiple">
            </asp:ListBox>

            <asp:SqlDataSource ID="Category" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>"
                               SelectCommand="SELECT DISTINCT [risk_cat] FROM [incidentdim] where risk_cat <> ''">
            </asp:SqlDataSource>
        </div>
        <div class="col-md-2 hidden" id="watchCol">
            <!---->
            <asp:Label ID="lbl_WatchSearch" runat="server" Text="Watch:"></asp:Label>

            <asp:DropDownList ID="DD_WatchSearch" runat="server" DataSourceID="Watch" CssClass="btn btn-default"
                              DataTextField="WatchDesc" DataValueField="WatchDesc" AutoPostBack="True" AppendDataBoundItems="true" EnableViewState="false" OnSelectedIndexChanged="DD_area_SelectedIndexChanged">
                <asp:ListItem Value="0">Select Watch:</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="Watch" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>"
                               SelectCommand="SELECT DISTINCT [WatchDesc] FROM [incidentdim] where WatchDesc is not null">
            </asp:SqlDataSource>
        </div>


        <div class="col col-md-3 hidden" id="address">
            <asp:Label ID="lbl_address" runat="server" Text="Enter Incident Address: "></asp:Label>
            <asp:TextBox ID="tb_address" runat="server" AutoPostBack="True" CssClass="form-control" placeholder="Enter Incident Address"></asp:TextBox>
        </div>


    </div>


</div>


</div>
<div class="alert alert alert-info alert-dismissible hidden" role="alert" id="WardAlert">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span></button>

</div>

<h5 id="Narfilters" class="hidden">Use these filters to search the Narrative Log and additional IRS notes.</h5>

<div id="NarIRSseach" class="well hidden">
    <div class="form-group-sm">
        <div class="row">
            <div class="col-lg-4 hidden" id="narLogSearch">
                <asp:Label ID="lbl_NarLogSearch" runat="server" Text="Search Narrative Log:"></asp:Label>
                <asp:TextBox ID="tb_NarLogSearch" runat="server" AutoPostBack="true" CssClass="form-control" ToolTip="Disabled for this release" placeholder="Keyword Search"></asp:TextBox>
            </div>

        </div>
    </div>

    <br/>
    <div class="row">
        <div class="col-lg-4 hidden" id="IRSsearch">
            <!---->
            <div class="form-group-sm">
                <asp:Label ID="lbl_ADISearch" runat="server" Text="Search IRS Notes:"></asp:Label>
                <asp:TextBox ID="tb_ADISearch" runat="server" AutoPostBack="true" CssClass="form-control" placeholder="Keyword Search"></asp:TextBox>
                <!---->
            </div>
        </div>
    </div>

</div>

<!---->
<h5 id="OICfilters" class="hidden">Use these filters to narrow your search criteria based on officers and IRS Completed Stage.</h5>

<div id="miscSearch" class="well hidden">

    <div class="row">
        <div class="col-md-3 hidden" id="oicsearch">
            <asp:Label ID="lbl_OICSearch" runat="server" Text="OIC:"></asp:Label>
            <asp:TextBox ID="tb_OICSearch" runat="server" AutoPostBack="true" CssClass="form-control" placeholder="Search for an OIC"></asp:TextBox>
        </div>

        <div class="col-md-4 hidden" id="irschecked">
            <asp:Label ID="lbl_IRSCheckedSearch" runat="server" Text="IRS Status:"></asp:Label>
            <asp:DropDownList ID="DD_IRSCheckedSearch" runat="server" DataSourceID="IRS" CssClass="btn btn-default"
                              DataTextField="incident_stage" DataValueField="incident_stage" AutoPostBack="True" AppendDataBoundItems="true" EnableViewState="false" OnSelectedIndexChanged="DD_area_SelectedIndexChanged">
                <asp:ListItem Value="0">Select Stage:</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="IRS" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>"
                               SelectCommand="SELECT DISTINCT [incident_stage] FROM [incidentdim] where incident_stage  is not null">
            </asp:SqlDataSource>
            <br/>

            <asp:Label ID="lbl_OIC" runat="server" Text="Officer Call Sign:"></asp:Label>
            <asp:DropDownList ID="DD_OfficerCallSign" runat="server" DataSourceID="OfficeData" CssClass="btn btn-default"
                              DataTextField="OfficerCount" DataValueField="OfficerCount" AutoPostBack="True" AppendDataBoundItems="true" EnableViewState="false" OnSelectedIndexChanged="DD_area_SelectedIndexChanged">
                <asp:ListItem Value="0">Select Officer:</asp:ListItem>
            </asp:DropDownList>
            <asp:SqlDataSource ID="OfficeData" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>"
                               SelectCommand="SELECT DISTINCT MB_CALL_SIGN AS OfficerCount FROM dbo.MB_MOBILISATIONS AS MB_MOBILISATIONS_1 WHERE (MB_CALL_SIGN LIKE 'GG%')OR (MB_CALL_SIGN LIKE 'GS%') OR (MB_CALL_SIGN LIKE 'GA%')OR (MB_CALL_SIGN LIKE 'GB%')OR (MB_CALL_SIGN LIKE 'GW%')OR (MB_CALL_SIGN LIKE 'GE%')">
            </asp:SqlDataSource>

        </div>
    </div>
    <div class="row">
        <div class="col-md-3 hidden" id="EquipmentSearch">
            <asp:Label ID="lbl_equipment" runat="server" Text="Equipment Used:"></asp:Label>
            <asp:ListBox ID="LB_Equipment" runat="server" DataSourceID="SQLEquipment" CssClass="btn btn-default" SelectionMode="Multiple" Height="300px"
                         DataTextField="vueqt_description" DataValueField="vueqt_description" AutoPostBack="true" AppendDataBoundItems="true" EnableViewState="false" OnSelectedIndexChanged="DD_area_SelectedIndexChanged">
                <asp:ListItem Value="0">Select Equipment</asp:ListItem>
            </asp:ListBox>

            <asp:SqlDataSource ID="SQLEquipment" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>"
                               SelectCommand="SELECT DISTINCT vueqt_description FROM [threetc_mis].[dbo].[vueqt_equipment_type]">
            </asp:SqlDataSource>
        </div>
    </div>
</div>


<h5 id="datefilters" class="hidden">Use these filters to define a single date or date range.</h5>

<div id="DateSearch" class="well hidden">
    <div class="row">
        <div class="col-md-2 hidden" id="startdate">
            <%--Date start Selector  --%>
            <asp:Label ID="lbl_StartDate" runat="server" Text="Enter Start Date: "></asp:Label>

            <asp:TextBox ID="tbStartDate" runat="server" AutoPostBack="true" CssClass="form-control"/>

        </div>

        <div class="col-md-2 hidden" id="enddate">
            <%--Date end Selector  --%>
            <asp:Label ID="lbl_EndDate" runat="server" Text="Enter End Date: "></asp:Label>

            <asp:TextBox ID="tbEndDate" runat="server" AutoPostBack="true" CssClass="form-control"/>

        </div>
        <!-- -->
    </div>

</div>

<div id="debug">
    <asp:Label ID="debug1" runat="server" Text="Label"></asp:Label>
    <asp:Label ID="debug2" runat="server" Text="Label"></asp:Label>
    <asp:Label ID="debug3" runat="server" Text="Label"></asp:Label>
    <asp:Label ID="Label1" runat="server" Text="Label" CssClass="hidden"></asp:Label>
</div>

<div class="page-header">
    <h3>Results</h3>
</div>

<div class="row" id="TimeScaleDiv">
    <div class="row">
        <div class="col-md-6 col-md-offset-8">
            <asp:Label ID="lbl_TimeScale" runat="server" Text="Select Time Period:"></asp:Label>
            <asp:DropDownList ID="DD_TimeScale" runat="server" AutoPostBack="True" EnableViewState="false" CssClass="btn btn-default">
                <asp:ListItem Value="0">Select:</asp:ListItem>
                <asp:ListItem Value="1">3 Years</asp:ListItem>
                <asp:ListItem Value="2">2 Years</asp:ListItem>
                <asp:ListItem Value="3">12 Months</asp:ListItem>
                <asp:ListItem Value="4">6 Months</asp:ListItem>
                <asp:ListItem Value="5">3 Months</asp:ListItem>
            </asp:DropDownList>
        </div>

    </div>
</div>

<h5>Showing results for the following selection:</h5>

<div class="well">
    <asp:UpdatePanel ID="AdvResults" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:GridView ID="AdvSearchResults" runat="server" CssClass="table table-hover" OnRowDataBound="GridView1_RowDataBound"
                          OnSelectedIndexChanged="OnSelectedIndexChanged" AllowPaging="true" OnPageIndexChanging="OnPaging" AutoGenerateColumns="false">
                <Columns>
                    <asp:ButtonField Text="Select" CommandName="Select" ItemStyle-Width="30" ControlStyle-CssClass="btn btn-info" ButtonType="Button"
                                     HeaderText="Select Incident">

                        <ControlStyle CssClass="btn btn-info"></ControlStyle>

                        <ItemStyle Width="30px"></ItemStyle>
                    </asp:ButtonField>
                    <asp:BoundField DataField="Incident Number" HeaderText="Incident Number"/>
                    <asp:BoundField DataField="Date Created" HeaderText="Date Created"/>
                    <asp:BoundField DataField="Location Address" HeaderText="Location Address"/>
                    <asp:BoundField DataField="Incident Type" HeaderText="Incident Type"/>
                    <asp:BoundField DataField="Borough" HeaderText="Borough"/>
                    <asp:BoundField DataField="IRS Stage" HeaderText="IRS Stage"/>
                    <asp:BoundField DataField="LLCoordString" HeaderText="MobLatLong" Visible="false"/>
                    <asp:BoundField DataField="id_easting" HeaderText="Easting" Visible="false"/>
                    <asp:BoundField DataField="id_northing" HeaderText="Northing" Visible="false"/>
                    <asp:BoundField DataField="ward" HeaderText="ward" Visible="false"/>
                </Columns>
            </asp:GridView>
        </ContentTemplate>
    </asp:UpdatePanel>
    <div class="row" id="ExportExcel">

        <div class="col-md-4">
            <asp:Button ID="Button1" runat="server" Text="Export to Excel" OnClick="Button1_Click" CssClass="btn btn-default" ToolTip="Export search results to an excel file."/>
        </div>
    </div>
</div>

<asp:Label ID="lblResults" runat="server" Visible="false"></asp:Label>
<br/>


</div>
<br/>
<div class="panel-footer">
    <div class="col-md-6 col-md-push-4">
        <p>Advanced IRS Query Tool for <a href="http://manchesterfire.gov.uk">Greater Manchester Fire and Rescue</a> <a href="https://twitter.com/manchesterfire">|@manchesterfire</a>
        </p>
        <div class="col-md-2 col-md-push-3">
            <p>
                <a href="#">Back to top</a>
            </p>
        </div>
    </div>
</div>


</asp:Content>