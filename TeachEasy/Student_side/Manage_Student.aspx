<%@ Page Title="" Language="C#" MasterPageFile="~/Student_side/Student_Master.Master" AutoEventWireup="true" CodeBehind="Manage_Student.aspx.cs" Inherits="TeachEasy.Student_side.ManageStudent" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="main-content">
        <section class="section">
            <div class="row">
                <div class="col-12 col-md-4">
                    <div class="card card-statistic-1">
                        <div class="card-icon bg-primary">
                            <i class="fas fa-circle"></i>
                        </div>
                        <div class="card-wrap">
                            <div class="card-header">
                                <h4>Total Lectures</h4>
                            </div>
                            <div class="card-body">
                                <asp:Label ID="Lbl_Total_Lectures" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-4">
                    <div class="card card-statistic-1">
                        <div class="card-icon bg-warning">
                            <i class="fas fa-circle"></i>
                        </div>
                        <div class="card-wrap">
                            <div class="card-header">
                                <h4>Attended Lectures</h4>
                            </div>
                            <div class="card-body">
                                <asp:Label ID="Lbl_Attended_Lectures" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-4">
                    <div class="card card-statistic-1">
                        <div class="card-icon bg-success">
                            <i class="far fa-file-alt"></i>
                        </div>
                        <div class="card-wrap">
                            <div class="card-header">
                                <h4>Exams Attended</h4>
                            </div>
                            <div class="card-body">
                                <asp:Label ID="Lbl_Exams_Attended" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <h4>Exams & Scores</h4>
                        </div>
                        <div class="card-body">
                            <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto" Width="989px">
                                <asp:Chart ID="Chart_All_Exams" runat="server" Width="3000px">
                                    <Series>
                                        <asp:Series Name="Total_Q" LabelAngle="45"></asp:Series>
                                        <asp:Series ChartArea="ChartArea1" Name="Correct_Q">
                                        </asp:Series>
                                    </Series>
                                    <ChartAreas>
                                        <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                                    </ChartAreas>
                                </asp:Chart>
                            </asp:Panel>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12 col-md-6">
                    <div class="card">
                        <div class="card-header">
                            <h4>Unit wise Analysis</h4>
                        </div>
                        <div class="card-body">
                            <asp:Panel ID="Pnl_Unit_wise" runat="server" ScrollBars="Auto" Width="454px">
                                <asp:Chart ID="Chart_Unit_Wise" runat="server" Width="450px">
                                    <Series>
                                        <asp:Series Name="Total_Q" Color="Blue" Label="Total Questions" YValuesPerPoint="2">
                                        </asp:Series>
                                        <asp:Series ChartArea="ChartArea1" Name="Correct_Q" Color="Lime" Label="Correct Answers" YValuesPerPoint="2">
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
                <div class="col-12 col-md-6">
                    <div class="card">
                        <div class="card-header">
                            <h4>Last Exam Analysis</h4>
                        </div>
                        <div class="card-body">
                            <asp:Panel ID="Pnl_Last_Exam" runat="server" ScrollBars="Auto" Width="454px">
                                <asp:Chart ID="Chart_Last_Exam" runat="server" Width="450px">
                                    <Series>
                                        <asp:Series Name="Total_Q" Color="Blue" Label="Total Questions" YValuesPerPoint="2">
                                        </asp:Series>
                                        <asp:Series ChartArea="ChartArea1" Name="Correct_Q" Color="Lime" Label="Correct Answers" YValuesPerPoint="2">
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
    </section>
    </div>
</asp:Content>
