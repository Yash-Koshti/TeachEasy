<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_side/Admin_Master.Master" AutoEventWireup="true" CodeBehind="Faculty_Subject_Edit.aspx.cs" Inherits="TeachEasy.Admin_side.Faculty_SubjectEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="main-content" style="min-width: 1349px;">
        <section class="section">
            <div class="section-header">
                <div class="section-header-back">
                    <a href="Manage_Faculty_Subject.aspx" class="btn btn-icon"><i class="fas fa-arrow-left"></i></a>
                </div>
                <h1>Edit Faculty Subject</h1>
                <div class="section-header-breadcrumb">
                    <div class="breadcrumb-item active"><a href="Manage_Faculty.aspx">Home</a></div>
                    <div class="breadcrumb-item"><a href="Manage_Faculty_Subject.aspx">Faculty Subject</a></div>
                    <div class="breadcrumb-item">Edit Faculty Subject</div>
                </div>
            </div>

            <div class="section-body">
                <h2 class="section-title">Edit Faculty Subject</h2>
                <p class="section-lead">
                    On this page you can alot subjects to one or more faculty and fill in all fields.
           
                </p>

                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4>Write Faculty Subject Details</h4>
                            </div>
                            <div class="card-body">
                                <div class="form-group row mb-4">
                                    <asp:Label ID="Label3" runat="server" CssClass="col-form-label text-md-right col-12 col-md-3 col-lg-3" Text="Select Faculty"></asp:Label>
                                    <div class="col-sm-12 col-md-7">
                                        <asp:DropDownList ID="DrDoL_Faculty" runat="server" CssClass="form-control selectric" DataSourceID="SDS_Faculty" DataTextField="Fac_Name" DataValueField="Fac_Id"></asp:DropDownList>
                                        <asp:SqlDataSource ID="SDS_Faculty" runat="server" ConnectionString="<%$ ConnectionStrings:TeachEasy_database %>" SelectCommand="SELECT * FROM [Faculty]"></asp:SqlDataSource>
                                    </div>
                                </div>
                                <div class="form-group row mb-4">
                                    <asp:Label ID="Label4" runat="server" CssClass="col-form-label text-md-right col-12 col-md-3 col-lg-3" Text="Select Subject"></asp:Label>
                                    <div class="col-sm-12 col-md-7">
                                        <asp:DropDownList ID="DrDoL_Subject" runat="server" CssClass="form-control selectric" DataSourceID="SDS_Subject" DataTextField="Subject_Name" DataValueField="Subject_ID"></asp:DropDownList>
                                        <asp:SqlDataSource ID="SDS_Subject" runat="server" ConnectionString="<%$ ConnectionStrings:TeachEasy_database %>" SelectCommand="SELECT * FROM [Subject]"></asp:SqlDataSource>
                                    </div>
                                </div>
                                <div class="form-group row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3"></label>
                                    <div class="col-sm-12 col-md-7">
                                        <asp:Button ID="Update_btn" runat="server" Text="UPDATE" CssClass="btn btn-primary me-2" OnClick="Update_btn_Click" />
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Button ID="Delete_btn" runat="server" Text="DELETE" CssClass="btn btn-primary me-2" OnClick="Delete_btn_Click" />
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
