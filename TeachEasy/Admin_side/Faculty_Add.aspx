<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_side/Admin_Master.Master" AutoEventWireup="true" CodeBehind="Faculty_Add.aspx.cs" Inherits="TeachEasy.Admin_side.Faculty_Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="main-content" style="min-width: 1349px;">
        <section class="section">
            <div class="section-header">
                <div class="section-header-back">
                    <a href="Manage_Faculty.aspx" class="btn btn-icon"><i class="fas fa-arrow-left"></i></a>
                </div>
                <h1>Add New Faculty</h1>
                <div class="section-header-breadcrumb">
                    <div class="breadcrumb-item active"><a href="Manage_Faculty.aspx">Home</a></div>
                    <div class="breadcrumb-item"><a href="Manage_Faculty.aspx">Faculty</a></div>
                    <div class="breadcrumb-item">Add New Faculty</div>
                </div>
            </div>

            <div class="section-body">
                <h2 class="section-title">Add New Faculty</h2>
                <p class="section-lead">
                    On this page you can add a new faculty and fill in all fields.
           
                </p>

                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4>Write Faculty Details</h4>
                            </div>
                            <div class="card-body">
                                <div class="form-group row mb-4">
                                    <asp:Label ID="Label1" runat="server" CssClass="col-form-label text-md-right col-12 col-md-3 col-lg-3" Text="Name"></asp:Label>
                                    <div class="col-sm-12 col-md-7">
                                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group row mb-4">
                                    <asp:Label ID="Label2" runat="server" CssClass="col-form-label text-md-right col-12 col-md-3 col-lg-3" Text="Email address"></asp:Label>
                                    <div class="col-sm-12 col-md-7">
                                        <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group row mb-4">
                                    <asp:Label ID="Label3" runat="server" CssClass="col-form-label text-md-right col-12 col-md-3 col-lg-3" Text="Phone Number"></asp:Label>
                                    <div class="col-sm-12 col-md-7">
                                        <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group row mb-4">
                                    <asp:Label ID="Label4" runat="server" CssClass="col-form-label text-md-right col-12 col-md-3 col-lg-3" Text="Qualification"></asp:Label>
                                    <div class="col-sm-12 col-md-7">
                                        <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group row mb-4">
                                    <asp:Label ID="Label5" runat="server" CssClass="col-form-label text-md-right col-12 col-md-3 col-lg-3" Text="Gender"></asp:Label>
                                    <div class="col-sm-12 col-md-7">
                                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" CssClass="form-check-input" RepeatColumns="3">
                                            <asp:ListItem Value="M">Male</asp:ListItem>
                                            <asp:ListItem Value="F">Female</asp:ListItem>
                                            <asp:ListItem Value="O">Other</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                </div>
                                <div class="form-group row mb-4">
                                    <asp:Label ID="Label6" runat="server" CssClass="col-form-label text-md-right col-12 col-md-3 col-lg-3" Text="Date Of Birth"></asp:Label>
                                    <div class="col-sm-12 col-md-7">
                                        <asp:TextBox ID="TextBox5" runat="server" TextMode="Date"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group row mb-4">
                                    <asp:Label ID="Label7" runat="server" CssClass="col-form-label text-md-right col-12 col-md-3 col-lg-3" Text="Profile Image"></asp:Label>
                                    <div class="col-sm-12 col-md-7">
                                        <asp:FileUpload ID="FileUpload1" runat="server" />
                                    </div>
                                </div>
                                <div class="form-group row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3"></label>
                                    <div class="col-sm-12 col-md-7">
                                        <asp:Button ID="Add_btn" runat="server" Text="SUBMIT" OnClick="Add_btn_Click" CssClass="btn btn-primary me-2" />
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
