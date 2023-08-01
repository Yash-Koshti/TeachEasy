<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_side/Admin_Master.Master" AutoEventWireup="true" CodeBehind="Subject_Edit.aspx.cs" Inherits="TeachEasy.Admin_side.SubjectEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="main-content" style="min-width: 1349px;">
        <section class="section">
            <div class="section-header">
                <div class="section-header-back">
                    <a href="Manage_Subject.aspx" class="btn btn-icon"><i class="fas fa-arrow-left"></i></a>
                </div>
                <h1>Edit Subject</h1>
                <div class="section-header-breadcrumb">
                    <div class="breadcrumb-item active"><a href="Manage_Admin.aspx">Home</a></div>
                    <div class="breadcrumb-item"><a href="Manage_Subject.aspx">Subject</a></div>
                    <div class="breadcrumb-item">Edit Subject</div>
                </div>
            </div>

            <div class="section-body">
                <h2 class="section-title">Edit Subject</h2>
                <p class="section-lead">
                    On this page you can edit subject.
           
                </p>

                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4>Edit Subject Details</h4>
                            </div>
                            <div class="card-body">
                                <div class="form-group row mb-4">
                                    <asp:Label ID="Label1" runat="server" CssClass="col-form-label text-md-right col-12 col-md-3 col-lg-3" Text="Subject Name"></asp:Label>
                                    <div class="col-sm-12 col-md-7">
                                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group row mb-4">
                                    <asp:Label ID="Label2" runat="server" CssClass="col-form-label text-md-right col-12 col-md-3 col-lg-3" Text="Subject Type"></asp:Label>
                                    <div class="col-sm-12 col-md-7">
                                        <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group row mb-4">
                                    <asp:Label ID="Label3" runat="server" CssClass="col-form-label text-md-right col-12 col-md-3 col-lg-3" Text="Subject Category"></asp:Label>
                                    <div class="col-sm-12 col-md-7">
                                        <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group row mb-4">
                                    <asp:Label ID="Label4" runat="server" CssClass="col-form-label text-md-right col-12 col-md-3 col-lg-3" Text="Select Semester"></asp:Label>
                                    <div class="col-sm-12 col-md-7">
                                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control selectric" DataSourceID="SqlDataSource1" DataTextField="Semester" DataValueField="Sem_id"></asp:DropDownList>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TeachEasy_database %>" SelectCommand="SELECT * FROM [Semester]"></asp:SqlDataSource>
                                    </div>
                                </div>
                                <div class="form-group row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3"></label>
                                    <div class="col-sm-12 col-md-7">
                                        <asp:Button ID="Update_btn" runat="server" Text="UPDATE" OnClick="Update_btn_Click" CssClass="btn btn-primary me-2" />
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Button ID="Delete_btn" runat="server" Text="DELETE" OnClick="Delete_btn_Click" CssClass="btn btn-primary me-2" />
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
