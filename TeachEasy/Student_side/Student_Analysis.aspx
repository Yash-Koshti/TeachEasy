<%@ Page Title="" Language="C#" MasterPageFile="~/Student_side/Student_Master.Master" AutoEventWireup="true" CodeBehind="Student_Analysis.aspx.cs" Inherits="TeachEasy.Student_side.Student_Analysis" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<%@ Import Namespace="System" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="main-content" style="min-width: 1349px;">
        <section class="section">
            <div class="section-header">
                <h1>Analysis</h1>
                <div class="section-header-breadcrumb">
                    <div class="breadcrumb-item active"><a href="Manage_Student.aspx">Home</a></div>
                    <div class="breadcrumb-item">Analysis</div>
                </div>
            </div>

            <div class="section-body">
                <h2 class="section-title">Student Analysis</h2>
                <p class="section-lead">
                    Here is your analysis based on your examinations.
           
                </p>

                <div class="row mt-4">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4>Exam Analysis</h4>
                            </div>
                            <div class="card-body">
                                <div class="float-left">
                                    <b>Select Exam</b>
                                    <br />
                                    <asp:DropDownList ID="DrDoL_Exam" runat="server" CssClass="form-control dropdown-lg" DataSourceID="SDS_Exam" DataTextField="Exam_Name" DataValueField="Exam_Id" OnSelectedIndexChanged="DrDoL_Exam_SelectedIndexChanged" AppendDataBoundItems="True" AutoPostBack="True">
                                        <asp:ListItem Value="NULL">--Select--</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SDS_Exam" runat="server" ConnectionString="<%$ ConnectionStrings:TeachEasy_database %>" SelectCommand="SELECT * FROM [Exams_of_Student_View] WHERE ([Admission_Id] = @Admission_Id)">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="Admission_Id" SessionField="Admission_Id" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>
                                <div class="clearfix mb-3"></div>

                                <%--here was chart code--%>
                                <asp:Chart ID="Chart_Exam_wise" runat="server" Width="488px">
                                    <Series>
                                        <asp:Series Name="Total_Q" Color="Blue" Label="Total Questions">
                                        </asp:Series>
                                        <asp:Series ChartArea="ChartArea1" Name="Correct_Q" Color="Lime" Label="Correct Answers">
                                        </asp:Series>
                                    </Series>
                                    <ChartAreas>
                                        <asp:ChartArea Name="ChartArea1">
                                        </asp:ChartArea>
                                    </ChartAreas>
                                </asp:Chart>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row mt-4">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4>Subject wise Analysis</h4>
                            </div>
                            <div class="card-body">
                                <div class="float-left">
                                    <b>Select Subject</b>
                                    <br />
                                    <asp:DropDownList ID="DrDoL_Subject" runat="server" CssClass="form-control dropdown-lg" DataSourceID="SDS_Subject" DataTextField="Subject_Name" DataValueField="Subject_ID" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="DrDoL_Subject_SelectedIndexChanged">
                                        <asp:ListItem Value="NULL">--Select--</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SDS_Subject" runat="server" ConnectionString="<%$ ConnectionStrings:TeachEasy_database %>" SelectCommand="SELECT * FROM [Subject]"></asp:SqlDataSource>
                                </div>
                                <div class="clearfix mb-3"></div>

                                <asp:Panel ID="Pnl_Subject_wise" runat="server" ScrollBars="Auto" Width="989px">
                                    <asp:Chart ID="Chart_Subject_Wise" runat="server" Width="2500px">
                                        <Series>
                                            <asp:Series Name="Total_Q" Color="Blue" Label="Total Questions" ChartType="Spline" YValuesPerPoint="2">
                                            </asp:Series>
                                            <asp:Series ChartArea="ChartArea1" Name="Correct_Q" Color="Lime" ChartType="Spline" Label="Correct Answers" YValuesPerPoint="2">
                                            </asp:Series>
                                        </Series>
                                        <ChartAreas>
                                            <asp:ChartArea Name="ChartArea1">
                                            </asp:ChartArea>
                                        </ChartAreas>
                                    </asp:Chart>
                                </asp:Panel>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row mt-4">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4>Unit wise Analysis</h4>
                            </div>
                            <div class="card-body">
                                <div class="float-left">
                                    <b>Select Unit</b>
                                    <br />
                                    <asp:DropDownList ID="DrDoL_Unit" runat="server" CssClass="form-control dropdown-lg" DataSourceID="SDS_Unit" DataTextField="Unit_Name" DataValueField="Unit_Id" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="DrDoL_Unit_SelectedIndexChanged">
                                        <asp:ListItem Value="NULL">--Select--</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SDS_Unit" runat="server" ConnectionString="<%$ ConnectionStrings:TeachEasy_database %>" SelectCommand="SELECT * FROM [Unit]"></asp:SqlDataSource>
                                </div>
                                <div class="clearfix mb-3"></div>

                                <asp:Panel ID="Pnl_Unit_wise" runat="server" ScrollBars="Auto" Width="659px">
                                    <asp:Chart ID="Chart_Unit_Wise" runat="server" Width="1500px">
                                        <Series>
                                            <asp:Series Name="Total_Q" Color="Blue" Label="Total Questions" ChartType="Spline" YValuesPerPoint="2">
                                            </asp:Series>
                                            <asp:Series ChartArea="ChartArea1" Name="Correct_Q" Color="Lime" ChartType="Spline" Label="Correct Answers" YValuesPerPoint="2">
                                            </asp:Series>
                                        </Series>
                                        <ChartAreas>
                                            <asp:ChartArea Name="ChartArea1">
                                            </asp:ChartArea>
                                        </ChartAreas>
                                    </asp:Chart>
                                </asp:Panel>
                            </div>
                        </div>
                    </div>                    
                </div>
                <div class="row mt-4">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4>Chapter wise Analysis</h4>
                            </div>
                            <div class="card-body">
                                <div class="float-left">
                                    <b>Select Chapter</b>
                                    <br />
                                    <asp:DropDownList ID="DrDoL_Chapter" runat="server" CssClass="form-control dropdown-lg" DataSourceID="SDS_Chapter" DataTextField="Ch_title" DataValueField="Ch_Id" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="DrDoL_Chapter_SelectedIndexChanged">
                                        <asp:ListItem Value="NULL">--Select--</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SDS_Chapter" runat="server" ConnectionString="<%$ ConnectionStrings:TeachEasy_database %>" SelectCommand="SELECT * FROM [Chapter]"></asp:SqlDataSource>
                                </div>
                                <div class="clearfix mb-3"></div>

                                <asp:Panel ID="Pnl_Chapter_wise" runat="server" ScrollBars="Auto" Width="989px">
                                    <asp:Chart ID="Chart_Chapter_Wise" runat="server" Width="2500px">
                                        <Series>
                                            <asp:Series Name="Total_Q" Color="Blue" Label="Total Questions" ChartType="Spline" YValuesPerPoint="2">
                                            </asp:Series>
                                            <asp:Series ChartArea="ChartArea1" Name="Correct_Q" Color="Lime" ChartType="Spline" Label="Correct Answers" YValuesPerPoint="2">
                                            </asp:Series>
                                        </Series>
                                        <ChartAreas>
                                            <asp:ChartArea Name="ChartArea1">
                                            </asp:ChartArea>
                                        </ChartAreas>
                                    </asp:Chart>
                                </asp:Panel>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row mt-4">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4>Topic wise Analysis</h4>
                            </div>
                            <div class="card-body">
                                <div class="float-left">
                                    <b>Select Topic</b>
                                    <br />
                                    <asp:DropDownList ID="DrDoL_Topic" runat="server" CssClass="form-control dropdown-lg" DataSourceID="SDS_Topic" DataTextField="Topic_name" DataValueField="Topic_Id" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="DrDoL_Topic_SelectedIndexChanged">
                                        <asp:ListItem Value="NULL">--Select--</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="SDS_Topic" runat="server" ConnectionString="<%$ ConnectionStrings:TeachEasy_database %>" SelectCommand="SELECT * FROM [Topic]"></asp:SqlDataSource>
                                </div>
                                <div class="clearfix mb-3"></div>

                                <asp:Panel ID="Pnl_Topic_wise" runat="server" ScrollBars="Auto" Width="989px">
                                    <asp:Chart ID="Chart_Topic_Wise" runat="server" Width="2500px">
                                        <Series>
                                            <asp:Series Name="Total_Q" Color="Blue" Label="Total Questions" ChartType="Spline" YValuesPerPoint="2">
                                            </asp:Series>
                                            <asp:Series ChartArea="ChartArea1" Name="Correct_Q" Color="Lime" ChartType="Spline" Label="Correct Answers" YValuesPerPoint="2">
                                            </asp:Series>
                                        </Series>
                                        <ChartAreas>
                                            <asp:ChartArea Name="ChartArea1">
                                            </asp:ChartArea>
                                        </ChartAreas>
                                    </asp:Chart>
                                </asp:Panel>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</asp:Content>
