<%@ Page Title="" Language="C#" MasterPageFile="~/Faculty_side/Faculty_Master.Master" AutoEventWireup="true" CodeBehind="Exam_Add.aspx.cs" Inherits="TeachEasy.Faculty_side.ExamAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="main-content">
        <section class="section">
            <div class="section-header">
                <div class="section-header-back">
                    <a href="Manage_Exam.aspx" class="btn btn-icon"><i class="fas fa-arrow-left"></i></a>
                </div>
                <h1>Upload New Exam</h1>
                <div class="section-header-breadcrumb">
                    <div class="breadcrumb-item active"><a href="Manage_Faculty.aspx">Home</a></div>
                    <div class="breadcrumb-item"><a href="Manage_Exam.aspx">Exam</a></div>
                    <div class="breadcrumb-item">Upload New Exam</div>
                </div>
            </div>

            <div class="section-body">
                <h2 class="section-title">Upload New Exam</h2>
                <p class="section-lead">
                    On this page you can upload a new exam and fill in all fields.
           
                </p>

                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4>Write Question Exam</h4>
                            </div>
                            <div class="card-body">
                                <div class="form-group row mb-4">
                                    <div class="row">
                                        <div class="col-12 col-md-6 col-lg-2">
                                            <asp:Label ID="Label17" runat="server" Text="Select Semester"></asp:Label>
                                            <asp:DropDownList ID="DrDoL_Semester" runat="server" CssClass="form-control selectric" DataSourceID="SDS_Semester" DataTextField="Semester" DataValueField="Sem_id" AutoPostBack="True" OnSelectedIndexChanged="DrDoL_Semester_SelectedIndexChanged">
                                                <asp:ListItem Value="NULL">--Select--</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="SDS_Semester" runat="server" ConnectionString="<%$ ConnectionStrings:TeachEasy_database %>" SelectCommand="SELECT * FROM [Semester]"></asp:SqlDataSource>
                                        </div>
                                        <div class="col-12 col-md-6 col-lg-2">
                                            <asp:Label ID="Label4" runat="server" CssClass="col-form-label text-md-right col-12 col-md-3 col-lg-3" Text="Select Subject"></asp:Label>
                                            <asp:DropDownList ID="DrDoL_Subject" runat="server" CssClass="form-control selectric" DataSourceID="SDS_Subject" DataTextField="Subject_Name" DataValueField="Subject_ID" AutoPostBack="True" OnSelectedIndexChanged="DrDoL_Subject_SelectedIndexChanged" AppendDataBoundItems="True">
                                                <asp:ListItem Value="NULL">--Select--</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="SDS_Subject" runat="server" ConnectionString="<%$ ConnectionStrings:TeachEasy_database %>" SelectCommand="SELECT * FROM [Subject]"></asp:SqlDataSource>
                                        </div>

                                        <%--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>
                                        <div class="col-12 col-md-6 col-lg-2">
                                            <asp:Label ID="Label5" runat="server" CssClass="col-form-label text-md-right col-12 col-md-3 col-lg-3" Text="Select Unit"></asp:Label>
                                            <br />
                                            <asp:DropDownList ID="DrDoL_Unit" runat="server" CssClass="form-control selectric" DataSourceID="SDS_Unit" DataTextField="Unit_Name" DataValueField="Unit_Id" AutoPostBack="True" OnSelectedIndexChanged="DrDoL_Unit_SelectedIndexChanged" AppendDataBoundItems="True">
                                                <asp:ListItem Value="NULL">--Select--</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="SDS_Unit" runat="server" ConnectionString="<%$ ConnectionStrings:TeachEasy_database %>" SelectCommand="SELECT * FROM [Unit]"></asp:SqlDataSource>
                                        </div>
                                        <div class="col-12 col-md-6 col-lg-3">
                                            <asp:Label ID="Label6" runat="server" CssClass="col-form-label text-md-right col-12 col-md-3 col-lg-3" Text="Select Chapter"></asp:Label>
                                            <asp:DropDownList ID="DrDoL_Chapter" runat="server" CssClass="form-control selectric" DataSourceID="SDS_Chapter" DataTextField="Ch_title" DataValueField="Ch_Id" AutoPostBack="True" OnSelectedIndexChanged="DrDoL_Chapter_SelectedIndexChanged" AppendDataBoundItems="True">
                                                <asp:ListItem Value="NULL">--Select--</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="SDS_Chapter" runat="server" ConnectionString="<%$ ConnectionStrings:TeachEasy_database %>" SelectCommand="SELECT * FROM [Chapter]"></asp:SqlDataSource>
                                        </div>
                                        <%--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>
                                        <div class="col-12 col-md-6 col-lg-3">
                                            <asp:Label ID="Label7" runat="server" CssClass="col-form-label text-md-right col-12 col-md-3 col-lg-3" Text="Select Topic"></asp:Label>
                                            <asp:DropDownList ID="DrDoL_Topic" runat="server" CssClass="form-control selectric" DataSourceID="SDS_Topic" DataTextField="Topic_name" DataValueField="Topic_Id" AppendDataBoundItems="True">
                                                <asp:ListItem Value="NULL">--Select--</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="SDS_Topic" runat="server" ConnectionString="<%$ ConnectionStrings:TeachEasy_database %>" SelectCommand="SELECT * FROM [Topic]"></asp:SqlDataSource>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group row mb-4">
                                    <asp:Label ID="Label1" runat="server" CssClass="col-form-label text-md-right col-12 col-md-3 col-lg-3" Text="Exam Name"></asp:Label>
                                    <div class="col-sm-12 col-md-7">
                                        <asp:TextBox ID="TxtB_Name" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group row mb-4">
                                    <asp:Label ID="Label8" runat="server" CssClass="col-form-label text-md-right col-12 col-md-3 col-lg-3" Text="Total Marks"></asp:Label>
                                    <div class="col-sm-12 col-md-7">
                                        <asp:TextBox ID="TxtB_Total_Marks" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3"></label>
                                    <div class="col-sm-12 col-md-7">
                                        <asp:Button ID="Add_btn" runat="server" Text="SUBMIT" CssClass="btn btn-primary" OnClick="Add_btn_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</asp:Content>
