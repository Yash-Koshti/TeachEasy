<%@ Page Title="" Language="C#" MasterPageFile="~/Faculty_side/Faculty_Master.Master" AutoEventWireup="true" CodeBehind="Chapter_Edit.aspx.cs" Inherits="TeachEasy.Faculty_side.ChapterEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="main-content" style="min-width: 1349px;">
        <section class="section">
            <div class="section-header">
                <div class="section-header-back">
                    <a href="Manage_Chapter.aspx" class="btn btn-icon"><i class="fas fa-arrow-left"></i></a>
                </div>
                <h1>Edit Chapter</h1>
                <div class="section-header-breadcrumb">
                    <div class="breadcrumb-item active"><a href="Manage_Faculty.aspx">Home</a></div>
                    <div class="breadcrumb-item"><a href="Manage_Chapter.aspx">Chapter</a></div>
                    <div class="breadcrumb-item">Edit Chapter</div>
                </div>
            </div>

            <div class="section-body">
                <h2 class="section-title">Edit Chapter</h2>
                <p class="section-lead">
                    On this page you can edit chapter.
           
                </p>

                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4>Write Chapter Details</h4>
                            </div>
                            <div class="card-body">
                                <div class="form-group row mb-4">
                                    <asp:Label ID="Label1" runat="server" CssClass="col-form-label text-md-right col-12 col-md-3 col-lg-3" Text="Title"></asp:Label>
                                    <div class="col-sm-12 col-md-7">
                                        <asp:TextBox ID="TxtB_Title" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
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
                                    <asp:Label ID="Label4" runat="server" CssClass="col-form-label text-md-right col-12 col-md-3 col-lg-3" Text="Description"></asp:Label>
                                    <div class="col-sm-12 col-md-7">
                                        <asp:TextBox ID="TxtB_Desc" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3"></label>
                                    <div class="col-sm-12 col-md-7">
                                        <asp:Button ID="Update_btn" runat="server" Text="UPDATE" OnClick="Update_btn_Click" CssClass="btn btn-primary" />
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
