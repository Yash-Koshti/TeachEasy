<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_side/Admin_Master.Master" AutoEventWireup="true" CodeBehind="Semester_Edit.aspx.cs" Inherits="TeachEasy.Admin_side.SemesterEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="main-content" style="min-width: 1349px;">
        <section class="section">
            <div class="section-header">
                <div class="section-header-back">
                    <a href="Manage_Semester.aspx" class="btn btn-icon"><i class="fas fa-arrow-left"></i></a>
                </div>
                <h1>Add New Semester</h1>
                <div class="section-header-breadcrumb">
                    <div class="breadcrumb-item active"><a href="Manage_Faculty.aspx">Home</a></div>
                    <div class="breadcrumb-item"><a href="Manage_Semester.aspx">Semester</a></div>
                    <div class="breadcrumb-item">Edit Semester</div>
                </div>
            </div>

            <div class="section-body">
                <h2 class="section-title">Edit Semester</h2>
                <p class="section-lead">
                    On this page you can edit semester.
           
                </p>

                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4>Write Semester Details</h4>
                            </div>
                            <div class="card-body">
                                <div class="form-group row mb-4">
                                    <asp:Label ID="Label1" runat="server" CssClass="col-form-label text-md-right col-12 col-md-3 col-lg-3" Text="Semester Name"></asp:Label>
                                    <div class="col-sm-12 col-md-7">
                                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3"></label>
                                    <div class="col-sm-12 col-md-7">
                                        <asp:Button ID="Update_btn" runat="server" Text="UPDATE" CssClass="btn btn-primary" OnClick="Update_btn_Click" />
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Button ID="Delete_btn" runat="server" Text="DELETE" CssClass="btn btn-primary" OnClick="Delete_btn_Click" />
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
