<%@ Page Title="" Language="C#" MasterPageFile="~/Faculty_side/Faculty_Master.Master" AutoEventWireup="true" CodeBehind="Topic_Add.aspx.cs" Inherits="TeachEasy.Faculty_side.TopicAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="main-content" style="min-width: 1349px;">
        <section class="section">
            <div class="section-header">
                <div class="section-header-back">
                    <a href="Manage_Topic.aspx" class="btn btn-icon"><i class="fas fa-arrow-left"></i></a>
                </div>
                <h1>Add New Topic</h1>
                <div class="section-header-breadcrumb">
                    <div class="breadcrumb-item active"><a href="Manage_Faculty.aspx">Home</a></div>
                    <div class="breadcrumb-item"><a href="Manage_Topic.aspx">Topic</a></div>
                    <div class="breadcrumb-item">Add New Topic</div>
                </div>
            </div>

            <div class="section-body">
                <h2 class="section-title">Add New Topic</h2>
                <p class="section-lead">
                    On this page you can add a new topic and fill in all fields.
           
                </p>

                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4>Write Topic Details</h4>
                            </div>
                            <div class="card-body">
                                <div class="form-group row mb-4">
                                    <asp:Label ID="Label1" runat="server" CssClass="col-form-label text-md-right col-12 col-md-3 col-lg-3" Text="Name"></asp:Label>
                                    <div class="col-sm-12 col-md-7">
                                        <asp:TextBox ID="TxtB_Title" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group row mb-4">
                                    <asp:Label ID="Label4" runat="server" CssClass="col-form-label text-md-right col-12 col-md-3 col-lg-3" Text="Description"></asp:Label>
                                    <div class="col-sm-12 col-md-7">
                                        <asp:TextBox ID="TxtB_Desc" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group row mb-4">
                                    <asp:Label ID="Label2" runat="server" CssClass="col-form-label text-md-right col-12 col-md-3 col-lg-3" Text="Select Subject"></asp:Label>
                                    <div class="col-sm-12 col-md-7">
                                        <asp:DropDownList ID="DrDoL_Subject" runat="server" CssClass="form-control selectric" DataSourceID="SDS_Subject" DataTextField="Subject_Name" DataValueField="Subject_ID" AutoPostBack="True" AppendDataBoundItems="True">
                                            <asp:ListItem Value="NULL">--Select--</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SDS_Subject" runat="server" ConnectionString="<%$ ConnectionStrings:TeachEasy_database %>" SelectCommand="SELECT * FROM [Subject]"></asp:SqlDataSource>
                                    </div>
                                </div>
                                <div class="form-group row mb-4">
                                    <asp:Label ID="Label3" runat="server" CssClass="col-form-label text-md-right col-12 col-md-3 col-lg-3" Text="Select Unit"></asp:Label>
                                    <div class="col-sm-12 col-md-7">
                                        <asp:DropDownList ID="DrDoL_Unit" runat="server" CssClass="form-control selectric" DataSourceID="SDS_Unit" DataTextField="Unit_Name" DataValueField="Unit_Id" AutoPostBack="True" AppendDataBoundItems="True">
                                            <asp:ListItem Value="NULL">--Select--</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SDS_Unit" runat="server" ConnectionString="<%$ ConnectionStrings:TeachEasy_database %>" SelectCommand="SELECT * FROM [Unit]"></asp:SqlDataSource>
                                    </div>
                                </div>
                                <div class="form-group row mb-4">
                                    <asp:Label ID="Label5" runat="server" CssClass="col-form-label text-md-right col-12 col-md-3 col-lg-3" Text="Select Chapter"></asp:Label>
                                    <div class="col-sm-12 col-md-7">
                                        <asp:DropDownList ID="DrDoL_Chapter" runat="server" CssClass="form-control selectric" DataSourceID="SDS_Chapter" DataTextField="Ch_title" DataValueField="Ch_Id">
                                            <asp:ListItem Value="NULL">--Select--</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SDS_Chapter" runat="server" ConnectionString="<%$ ConnectionStrings:TeachEasy_database %>" SelectCommand="SELECT * FROM [Chapter]">
                                        </asp:SqlDataSource>
                                    </div>
                                </div>
                                <div class="form-group row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3"></label>
                                    <div class="col-sm-12 col-md-7">
                                        <asp:Button ID="Add_btn" runat="server" Text="SUBMIT" OnClick="Add_btn_Click" CssClass="btn btn-primary" />
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
