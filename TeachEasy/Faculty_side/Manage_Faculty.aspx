<%@ Page Title="" Language="C#" MasterPageFile="~/Faculty_side/Faculty_Master.Master" AutoEventWireup="true" CodeBehind="Manage_Faculty.aspx.cs" Inherits="TeachEasy.Faculty_side.ManageFaculty" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="main-content" style="min-width: 1349px;">
        <section class="section">
            <div class="row">
                <div class="col-12 col-md-4">
                    <div class="card card-statistic-1">
                        <div class="card-icon bg-primary">
                            <i class="far fa-user"></i>
                        </div>
                        <div class="card-wrap">
                            <div class="card-header">
                                <h4>Total Students</h4>
                            </div>
                            <div class="card-body">
                                <asp:Label ID="Lbl_Total_Students" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-4">
                    <div class="card card-statistic-1">
                        <div class="card-icon bg-warning">
                            <i class="far fa-file-pdf"></i>
                        </div>
                        <div class="card-wrap">
                            <div class="card-header">
                                <h4>Total Documents</h4>
                            </div>
                            <div class="card-body">
                                <asp:Label ID="Lbl_Total_Documents" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-4">
                    <div class="card card-statistic-1">
                        <div class="card-icon bg-success">
                            <i class="fas fa-video"></i>
                        </div>
                        <div class="card-wrap">
                            <div class="card-header">
                                <h4>Total Videos</h4>
                            </div>
                            <div class="card-body">
                                <asp:Label ID="Lbl_Total_Videos" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <h4>Students who have attended latest Exam</h4>
                        </div>
                        <div class="card-body">
                            <div class="float-left">
                                <b>Exam Name :</b>&nbsp;&nbsp;<asp:Label ID="Lbl_Exam_Name" runat="server" Text=""></asp:Label>
                            </div>
                            <div class="float-right">
                                <b>Total Marks :</b>&nbsp;&nbsp;<asp:Label ID="Lbl_Total_Marks" runat="server" Text=""></asp:Label>
                            </div>

                            <div class="clearfix mb-3"></div>

                            <div class="table-responsive">
                                <asp:GridView ID="GrV_Last_Exam" runat="server" CssClass="table table-striped table-md" GridLines="None"></asp:GridView>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</asp:Content>
