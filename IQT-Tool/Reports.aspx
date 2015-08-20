<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Reports.aspx.cs" Inherits="Reports" Async="true" EnableEventValidation="false" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <a id="simple-menu" href="#sidr" class="btn btn-primary btn-xs">Tools &raquo;</a>

    <div id="sidr">

        <ul>
           <%-- <li class=""><a href="#" runat="server">Incident Overview</a></li>
            <li><a data-toggle="collapse" runat="server" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne" data-spy="scroll" data-target="headingOne">Narrative Log</a></li>
            <li><a data-toggle="collapse" runat="server" data-parent="#accordion" href="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo" data-spy="scroll" data-target="headingTwo">Incident Information</a></li>
            <li><a data-toggle="collapse" runat="server" data-parent="#accordion" href="#collapseFour" aria-expanded="true" aria-controls="collapseFour" data-spy="scroll" data-target="headingFour">
                <asp:Label ID="lbl_side_cause" runat="server" Text="Fire Cause Information"></asp:Label>
            </a></li>
            <li><a href="#">Casualty Information</a></li>
            <li><a href="#">Resource Usage</a></li>
            <li><a href="#">Maps</a></li>--%>
            <li></li>
            <li><asp:LinkButton ID="ExportWord" runat="server" Text="Export Narrative Log" OnClick="ExportWord_Click"></asp:LinkButton></li>
            <li><asp:LinkButton ID="InsuranceReport" runat="server" Text="Create Insurance Report" data-toggle="modal" OnClick="InsuranceReport_Click"></asp:LinkButton></li>
            <li><asp:LinkButton ID="ViewIncident" runat="server" Text="View Incident In IRS" OnClick="GotoIncident"></asp:LinkButton></li>
                      
        </ul>
    </div>

    <script>
        $(document).ready(function () {
            $('#simple-menu').sidr();
    <%--        $('#<%=tb_Station.ClientID%>').attr('readonly', 'readonly');

            $('#<%=tb_DateCreated.ClientID%>').attr('readonly', 'readonly');
            $('#<%=tb_IncidentType.ClientID%>').attr('readonly', 'readonly');
            $('#<%=tb_RiskCat.ClientID%>').attr('readonly', 'readonly');--%>

        });



    </script>



       
    
    <div class="container">


        <div class="page-header">
            <h4>Incident Overview</h4>
        </div>
        <div class="well">
            <div class="row">
                <div class="col-md-6" id="IncidentStage">
                    <!-- Incident Overview start-->
                    <asp:Label ID="lbl_incidentstage" runat="server" Text="IRS Stage:" Visible="true"></asp:Label>
                    <asp:Label ID="lbl_IRSStage" runat="server"></asp:Label>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-2" id="IncidentNumber" runat="server">
                    <asp:Label ID="lbl_IncidentNumber" runat="server" Text="Incident Number:"></asp:Label>
                    <asp:TextBox ID="tb_IncidentNumber" runat="server" Width="168px" CssClass="form-control"></asp:TextBox>
                </div>

                <div class="col-md-2" id="DateCreated" runat="server">
                    <asp:Label ID="lbl_DateCreated" runat="server" Text="Incident Created:"></asp:Label>
                    <asp:TextBox ID="tb_DateCreated" runat="server" Width="168px" CssClass="form-control"></asp:TextBox>
                </div>

                <div class="col-md-2" id="IncidentTypedeic" runat="server">
                    <asp:Label ID="lbl_IncidentType" runat="server" Text="Incident Type:"></asp:Label>
                    <asp:TextBox ID="tb_IncidentType" runat="server" CssClass="form-control"></asp:TextBox>
                </div>

                <div class="col-md-2" id="RiskCat" runat="server">
                    <asp:Label ID="lbl_RiskCat" runat="server" Text="Risk Category:"></asp:Label>
                    <asp:TextBox ID="tb_RiskCat" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4" id="Address" runat="server">
                    <asp:Label ID="lbl_Address" runat="server" Text="Incident Address:"></asp:Label>
                    <asp:TextBox ID="tb_Address" runat="server" CssClass="form-control" Width="355px"></asp:TextBox>
                </div>

                <div class="col-md-2" id="Borough" runat="server">
                    <asp:Label ID="lbl_Borough" runat="server" Text="Borough:"></asp:Label>
                    <asp:TextBox ID="tb_Borough" runat="server" CssClass="form-control"></asp:TextBox>
                </div>

                <div class="col-md-3" id="Ward" runat="server">
                    <asp:Label ID="lbl_Ward" runat="server" Text="Ward:"></asp:Label>
                    <asp:TextBox ID="tb_Ward" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>


            <div class="row">

                <div class="col-md-2" id="Station" runat="server">
                    <asp:Label ID="lbl_Station" runat="server" Text="Responding Station:"></asp:Label>
                    <asp:TextBox ID="tb_Station" runat="server" CssClass="form-control"></asp:TextBox>
                </div>

                <div class="col-md-2" id="Crew" runat="server">
                    <asp:Label ID="lbl_Crew" runat="server" Text="Initial Watch:"></asp:Label>
                    <asp:TextBox ID="tb_Crew" runat="server" CssClass="form-control"></asp:TextBox>
                </div>

                <div class="row">
                    <div class="col-md-2" id="ProperyCategory" runat="server">
                        <asp:Label ID="lbl_ProperyCategory" runat="server" Text="Property Category:"></asp:Label>
                        <asp:TextBox ID="tb_PropertyCategory" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                    <div class="col-md-2" id="CauseofFire" runat="server">
                        <asp:Label ID="lbl_CauseofFire" runat="server" Text="Cause of Fire:"></asp:Label>
                        <asp:TextBox ID="tb_CauseofFire" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                    <div class="col-md-2" id="IncidentCategory" runat="server">
                        <asp:Label ID="lbl_IncidentCategory" runat="server" Text="Incident Category:"></asp:Label>
                        <asp:TextBox ID="tb_IncidentCategory" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
            </div>
        </div>
        <!-- Incident Overview end-->


        <div class="alert alert-danger alert-dismissible" role="alert" runat="server" id="Results" visible="false">
            <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
            <strong>Info:</strong>
            <asp:Label ID="lblResults" runat="server" Text="Label" Visible="false"></asp:Label>
        </div>


        <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">

            <!-- Narrative Log Start-->
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingOne">
                    <h4 class="panel-title">
                        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                            <asp:Label ID="lbl_accor_NarrativeLog" runat="server" Text="Narrative Log"></asp:Label>
                        </a>
                    </h4>
                </div>
                <div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-2 col-md-offset-10">
                                <asp:DropDownList ID="dd_narfilter" runat="server" AutoPostBack="True" CssClass="btn btn-default">
                                    <asp:ListItem Value="0">Entire Log</asp:ListItem>
                                    <asp:ListItem Value="1">Messages Only</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <asp:UpdatePanel ID="NarLogPanel" runat="server" UpdateMode="Conditional">
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="dd_narfilter" EventName="SelectedIndexChanged" />
                                    </Triggers>
                                    <ContentTemplate>
                                        <br />
                                        <asp:GridView ID="GridView1" runat="server" CssClass="table table-hover" OnRowDataBound="GridView1_RowDataBound"
                                            AllowPaging="true" OnPageIndexChanging="OnPaging" RowStyle-Wrap="true">
                                        </asp:GridView>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Narrative Log End -->
            <!-- Incident Info Start -->
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingTwo">
                    <h4 class="panel-title">
                        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                            <asp:Label ID="lbl_accor_incidentInfor" runat="server" Text="Incident Information"></asp:Label>
                        </a>
                    </h4>
                </div>

                <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                    <div class="panel-body">


                        <div class="row">
                            <div class="col-md-2" id="incCreatedDate" runat="server">
                                <asp:Label ID="lbl_incCreatedDate" runat="server" Text="Incident Created:"></asp:Label>
                                <asp:TextBox ID="tb_incCreatedDate" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col-md-2" id="StopMessage" runat="server">
                                <asp:Label ID="lbl_StopMessage" runat="server" Text="Time of Stop:"></asp:Label>
                                <asp:TextBox ID="tb_StopMessage" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col-md-2" id="CallOrigin" runat="server">
                                <asp:Label ID="lbl_CallOrigin" runat="server" Text="Origin of Call"></asp:Label>
                                <asp:TextBox ID="tb_CallOrigin" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col-md-2" id="FireClass" runat="server">
                                <asp:Label ID="lbl_FireClass" runat="server" Text="Fire Classification:"></asp:Label>
                                <asp:TextBox ID="tb_FireClass" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-4" id="BuildingDesc" runat="server">
                                <asp:Label ID="lbl_BuildingDesc" runat="server" Text="Initial Incident Type:"></asp:Label>
                                <asp:TextBox ID="tb_BuildingDesc" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col-md-2" id="PropertyType" runat="server">
                                <asp:Label ID="lbl_PropertyType" runat="server" Text="Type Property:"></asp:Label>
                                <asp:TextBox ID="tb_PropertyType" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col-md-3" id="lupname" runat="server">
                                <asp:Label ID="lbl_lupname" runat="server" Text="Incident Involving(?):"></asp:Label>
                                <asp:TextBox ID="tb_lupname" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col-md-2" id="oic" runat="server">
                                <asp:Label ID="lbl_oic" runat="server" Text="Officer in Charge:"></asp:Label>
                                <asp:TextBox ID="tb_oic" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <br />
                        <div class="row" id="checkboxes">
                            <div class="col-md-2" id="Derelict" runat="server">
                                <asp:Label ID="lbl_Derelict" runat="server" Text="Derelict:"></asp:Label>
                                <asp:CheckBox ID="CB_Derelict" runat="server" />
                            </div>
                            <div class="col-md-2" id="UnderInfluence" runat="server">
                                <asp:Label ID="lbl_UnderInfluence" runat="server" Text="  Under the Influence:"></asp:Label>
                                <asp:CheckBox ID="CB_UnderInfluence" runat="server" />
                            </div>
                            <div class="col-md-2" id="ConfOrigin" runat="server">
                                <asp:Label ID="lbl_ConfOrigin" runat="server" Text="Confined to Origin:"></asp:Label>
                                <asp:CheckBox ID="CB_ConfOrigin" runat="server" />
                            </div>
                            <div class="col-md-2" id="alarm_system_present" runat="server">
                                <asp:Label ID="lbl_alarm_system_present" runat="server" Text="Alarm Present:"></asp:Label>
                                <asp:CheckBox ID="CB_alarm_system_present" runat="server" />
                            </div>
                            <div class="col-md-1" id="RTC" runat="server">
                                <asp:Label ID="lbl_RTC" runat="server" Text="RTC:"></asp:Label>
                                <asp:CheckBox ID="CB_RTC" runat="server" />
                            </div>
                            <div class="col-md-2" id="RtcExtrication" runat="server">
                                <asp:Label ID="lbl_RtcExtrication" runat="server" Text="Extrication Made:"></asp:Label>
                                <asp:CheckBox ID="CB_RtcExtrication" runat="server" />
                            </div>
                        </div>
                        <br />
                        <div class="row" id="checkboxes2">
                            <div class="col-md-2" id="attack_on_ff" runat="server">
                                <asp:Label ID="lbl_attack_on_ff" runat="server" Text="Fire Fighter Attacked:"></asp:Label>
                                <asp:CheckBox ID="CB_attack_on_ff" runat="server" />
                            </div>
                            <div class="col-md-2" id="attack_on_ff_type" runat="server">

                                <asp:Label ID="lbl_attack_on_ff_type" runat="server" Text="Type of Attack:"></asp:Label>
                                <asp:TextBox ID="tb_attack_on_ff_type" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col-md-2" id="hazmat" runat="server">
                                <asp:Label ID="lbl_hazmat" runat="server" Text="Hazmat Incident:"></asp:Label>
                                <asp:CheckBox ID="CB_hazmat" runat="server" />
                            </div>
                            <div class="col-md-3" id="HeatnSmoke" runat="server">
                                <asp:Label ID="lbl_HeatnSmoke" runat="server" Text="Heat and Smoke Only:"></asp:Label>
                                <asp:CheckBox ID="CB_HeatnSmoke" runat="server" />
                            </div>
                        </div>



                        <div class="row" id="AdiGen">
                            <div class="col-md-6">
                                <asp:Label ID="lbl_AdiGen" runat="server" Text="IRS Notes:"></asp:Label>
                                <asp:TextBox ID="tb_AdiGen" runat="server" CssClass="form-control" TextMode="MultiLine" Width="500px" Height="60px"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <!-- Incident Info end -->
            <!-- Specialist info start -->

            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingFour">
                    <h4 class="panel-title">
                        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                            <asp:Label ID="lbl_accor_CauseInfor" runat="server" Text="Fire Cause Information"></asp:Label>
                        </a>
                    </h4>
                </div>
                <div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
                    <div class="panel-body">

                        <asp:Label ID="lbl_info" runat="server" Text="" Visible="false"></asp:Label>

                        <div class="row" id="fireanditems">
                            <div class="col-md-3" id="StartLocation" runat="server">
                                <asp:Label ID="lbl_StartLocation" runat="server" Text="Fire Start Location:"></asp:Label>
                                <asp:TextBox ID="tb_StartLocation" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col-md-3" id="IgnitionSource" runat="server">

                                <asp:Label ID="lbl_IgnitionSource" runat="server" Text="Source of Ignition:"></asp:Label>
                                <asp:TextBox ID="tb_IgnitionSource" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col-md-3" id="ItemIgnited" runat="server">
                                <asp:Label ID="lbl_ItemIgnited" runat="server" Text="Item First Ignited:"></asp:Label>
                                <asp:TextBox ID="tb_ItemIgnited" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col-md-3" id="MainCause" runat="server">
                                <asp:Label ID="lbl_MainCause" runat="server" Text="Main Cause of Fire:"></asp:Label>
                                <asp:TextBox ID="tb_MainCause" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>

                        </div>

                        <div class="row" id="FireAlarm">
                            <div class="col-md-3" id="alarmOperated" runat="server">
                                <asp:Label ID="lbl_alarmOperated" runat="server" Text="Alarm Operated:"></asp:Label>
                                <asp:TextBox ID="tb_alarmOperated" runat="server" CssClass="form-control"> </asp:TextBox>
                            </div>
                            <div class="col-md-3" id="AlarmType" runat="server">
                                <asp:Label ID="lbl_AlarmType" runat="server" Text="Alarm Type Present:"></asp:Label>
                                <asp:TextBox ID="tb_AlarmType" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col-md-3" id="faGroup" runat="server">
                                <asp:Label ID="lbl_faGroup" runat="server" Text="Fire Alarm Grouping:"></asp:Label>
                                <asp:TextBox ID="tb_faGroup" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>

                        <div class="row" id="SpecialService">
                            <div class="col-md-3" id="SsTerType" runat="server">
                                <asp:Label ID="lbl_SsTerType" runat="server" Text="Special Service Rescue Area(?):"></asp:Label>
                                <asp:TextBox ID="tb_SsTerType" runat="server" CssClass="form-control"></asp:TextBox>

                            </div>
                            <div class="col-md-3" id="SsSecType" runat="server">
                                <asp:Label ID="lbl_SsSecType" runat="server" Text="Special Service Rescue Type:"></asp:Label>
                                <asp:TextBox ID="tb_SsSecType" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="col-md-3" id="SsType" runat="server">
                                <asp:Label ID="lbl_SsType" runat="server" Text="Special Service Rescue Type:"></asp:Label>
                                <asp:TextBox ID="tb_SsType" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <!-- Specialist info end-->
            <!-- Casualty info start-->
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingFive">
                    <h4 class="panel-title">
                        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                            <asp:Label ID="lbl_accor_CasualtyInfor" runat="server" Text="Casualty Information"></asp:Label>
                        </a>
                    </h4>
                </div>
                <div id="collapseFive" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFive">
                    <div class="panel-body">

                        <div class="row" id="casinfo" runat="server">
                            <div class="col-md-4" id="CasualtyInfo" runat="server">
                                <asp:Label ID="lbl_CasInfo" runat="server" Text="" Visible="false"></asp:Label>
                            </div>
                        </div>
                        <div class="row" id="victim1" runat="server">

                            <div class="col-md-2" id="VictimType" runat="server">
                                <asp:Label ID="lbl_VictimType" runat="server" Text="Type of Casualty:"></asp:Label>
                                <asp:TextBox ID="tb_VictimType" runat="server" CssClass="textbox"></asp:TextBox>
                            </div>
                            <div class="col-md-2" id="NatureInjury" runat="server">
                                <asp:Label ID="lbl_NatureInjury" runat="server" Text="Nature of Injury:"></asp:Label>
                                <asp:TextBox ID="tb_NatureInjury" runat="server" CssClass="textbox"></asp:TextBox>
                            </div>
                            <div class="col-md-2" id="Severity" runat="server">
                                <asp:Label ID="lbl_Severity" runat="server" Text="Severity of Injury:"></asp:Label>
                                <asp:TextBox ID="tb_Severity" runat="server" CssClass="textbox"></asp:TextBox>
                            </div>
                            <div class="col-md-2" id="VictimAge" runat="server">
                                <asp:Label ID="lbl_VictimAge" runat="server" Text="Age of Victim:"></asp:Label>
                                <asp:TextBox ID="tb_VictimAge" runat="server" CssClass="textbox"></asp:TextBox>
                            </div>
                        </div>
                        <div class="row" id="victim2" runat="server">
                            <div class="col-md-2" id="VictimGender" runat="server">
                                <asp:Label ID="lbl_VictimGender" runat="server" Text="Gender:"></asp:Label>
                                <asp:TextBox ID="tb_VictimGender" runat="server" CssClass="textbox"></asp:TextBox>
                            </div>
                            <div class="col-md-2" id="VictimEthnicity" runat="server">
                                <asp:Label ID="lbl_VictimEthnicity" runat="server" Text="Ethnicity:"></asp:Label>
                                <asp:TextBox ID="tb_VictimEthnicity" runat="server" CssClass="textbox"></asp:TextBox>
                            </div>
                            <div class="col-md-2" id="VictimRescued" runat="server">
                                <asp:Label ID="lbl_VictimRescued" runat="server" Text="Was Casualty Rescued?:"></asp:Label>
                                <asp:TextBox ID="tb_VictimRescued" runat="server" CssClass="textbox"></asp:TextBox>
                            </div>
                            <div class="col-md-2" id="VictimRescuedby" runat="server">
                                <asp:Label ID="lbl_VictimRescuedby" runat="server" Text="Who rescued the casualty:"></asp:Label>
                                <asp:TextBox ID="tb_VictimRescuedby" runat="server" CssClass="textbox"></asp:TextBox>
                            </div>
                            <div class="col-md-2" id="RescuemMethod" runat="server">
                                <asp:Label ID="lbl_RescuemMethod" runat="server" Text="Method of Rescue:"></asp:Label>
                                <asp:TextBox ID="tb_RescuemMethod" runat="server" CssClass="textbox"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Casualty info end-->
            <!-- Resource info Start-->
            <div class="panel panel-default">
                <div class="panel-heading" role="tab" id="headingSix">
                    <h4 class="panel-title">
                        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseSix" aria-expanded="false" aria-controls="collapseSix">
                            <asp:Label ID="lbl_accor_ApplianceMovements" runat="server" Text="Resource Usage"></asp:Label>
                        </a>
                    </h4>
                </div>
                <div id="collapseSix" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingSix">
                    <div class="panel-body">

                        <asp:Label ID="lbl_NumPumps" runat="server" Text="Number of Pumps Attended:"></asp:Label>
                        <asp:Label ID="tb_NumPumps" runat="server" Text=""></asp:Label>
                        <br />
                        <asp:Label ID="lbl_OfficerNum" runat="server" Text="Number of Officers sent:"></asp:Label>
                        <asp:Label ID="tb_OfficerNum" runat="server" Text=""></asp:Label>
                        <br />
                        <asp:Label ID="lbl_Emergency" runat="server" Text="Was Incident an Emergency:"></asp:Label>
                        <asp:Label ID="tb_Emergency" runat="server" Text=""></asp:Label>
                        <br />

                        <br />
                        <asp:GridView ID="GridMobs" runat="server" CssClass="table table-bordered" Width="600px" AutoGenerateColumns="false" ToolTip="Mobilisation Targets take into consideration if the incident is an emergency, if not, then meeting the target is not applicable.">
                            <Columns>
                                <asp:BoundField DataField="MB_CALL_SIGN" HeaderText="Call Sign" />

                                <asp:BoundField DataField="ApplianceType" HeaderText="Appliance Type" />
                                <asp:BoundField DataField="MobilisationStatus" HeaderText="Mobilised From" />
                                <asp:BoundField DataField="MB_MOBILE" HeaderText="Appliance Mobile" />
                                <asp:BoundField DataField="MB_ARRIVE" HeaderText="Appliance Arrived" />
                                <asp:BoundField DataField="MB_RETURN" HeaderText="Appliance Returned" />
                                <asp:BoundField DataField="Send_to_Mobile_int" HeaderText="Turn Out Time (secs)" />
                                <asp:BoundField DataField="Mobile_to_Arrive_int" HeaderText="Time to Incident (secs)" />
                                <asp:BoundField DataField="PFStatus" HeaderText="Target Met" />
                            </Columns>
                        </asp:GridView>

                        <asp:Label ID="lbl_TotalTime" runat="server" Text="Total Incident Time:"></asp:Label>
                        <asp:Label ID="tb_TotalTime" runat="server" Text=""></asp:Label>


                        <div class="page-header"></div>
                        <asp:Label ID="lbl_EquipmentUsed" runat="server" Text="Equipment Used:"></asp:Label>
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12">
                                    <asp:UpdatePanel ID="Mobsupdate" runat="server">
                                        <ContentTemplate>
                                            <asp:GridView ID="GridView2" runat="server" CssClass="table table-bordered" Width="600px" AllowPaging="true" OnPageIndexChanging="MobsPaging">
                                            </asp:GridView>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

            </div>

        </div>
        <div class="well">
            <p><strong>Maps have been disabled for this release</strong></p>
            <div id="map" height="180px">  </div>
            
            <script>
    L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
    attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">Mapbox</a>',
    maxZoom: 18,
    id: 'your.mapbox.project.id',
    accessToken: 'your.mapbox.public.access.token'
}).addTo(map);
    
</script>
        </div>
    </div>

  <%--  <script>
        function onLoad_CreateGISURL() {
            var easting = Xrm.Page.getAttribute("con_easting");
            var northing = Xrm.Page.getAttribute("con_northing");
            var eastingVal = easting.getValue();
            var northingVal = northing.getValue();
            var url = "http://hq-ict-08374s/gmfrswebmaplayers/?x=392800&y=403200&resolution=0.1&marklocation=true";
            var iFrame = "IFRAME_GIS";
            if (eastingVal) {
                Xrm.Page.getControl(iFrame).setSrc(url);
            }
            else {
            }
        }

    </script>--%>


    <asp:Label ID="debug1" runat="server" Text="Label"></asp:Label>
    <br />
    <asp:Label ID="debug2" runat="server" Text="Label"></asp:Label>

    <br />
    <asp:Label ID="debug3" runat="server" Text="Label"></asp:Label>
    <br />


    <asp:TextBox ID="Lat" runat="server" Text="Label" Width="300px" Visible="false"></asp:TextBox>
    <asp:TextBox ID="MobLat" runat="server" Text="Label" Width="300px" Visible="false"></asp:TextBox>


    <asp:Label ID="Label3" runat="server" Text="Label" Visible="false" ></asp:Label>
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








