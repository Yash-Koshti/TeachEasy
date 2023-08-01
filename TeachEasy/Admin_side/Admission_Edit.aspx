<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_side/Admin_Master.Master" AutoEventWireup="true" CodeBehind="Admission_Edit.aspx.cs" Inherits="TeachEasy.Admin_side.AdmissionEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="main-content" style="min-width: 1349px;">
        <section class="section">
            <div class="section-header">
                <div class="section-header-back">
                    <a href="Manage_Admission.aspx" class="btn btn-icon"><i class="fas fa-arrow-left"></i></a>
                </div>
                <h1>Edit Admission</h1>
                <div class="section-header-breadcrumb">
                    <div class="breadcrumb-item active"><a href="Manage_Admin.aspx">Home</a></div>
                    <div class="breadcrumb-item"><a href="Manage_Admission.aspx">Admission</a></div>
                    <div class="breadcrumb-item">Edit Admission</div>
                </div>
            </div>

            <div class="section-body">
                <h2 class="section-title">Edit Admission</h2>
                <p class="section-lead">
                    On this page you can update student's admission to the system and fill in all fields.
           
                </p>

                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4>Update Admission Details</h4>
                            </div>
                            <div class="card-body">
                                <div class="form-group row mb-4">
                                    <asp:Label ID="Label1" runat="server" CssClass="col-form-label text-md-right col-12 col-md-3 col-lg-3" Text="Select Student"></asp:Label>
                                    <div class="col-sm-12 col-md-7">
                                        <asp:DropDownList ID="DrDoL_Student" runat="server" CssClass="form-control selectric" DataSourceID="SDS_Student" DataTextField="S_name" DataValueField="S_Id" AppendDataBoundItems="True">
                                            <asp:ListItem Value="NULL">-- Select --</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SDS_Student" runat="server" ConnectionString="<%$ ConnectionStrings:TeachEasy_database %>" SelectCommand="SELECT * FROM [Student]"></asp:SqlDataSource>
                                    </div>
                                </div>
                                <div class="form-group row mb-4">
                                    <asp:Label ID="Label2" runat="server" CssClass="col-form-label text-md-right col-12 col-md-3 col-lg-3" Text="Select Semester"></asp:Label>
                                    <div class="col-sm-12 col-md-7">
                                        <asp:DropDownList ID="DrDoL_Semester" runat="server" CssClass="form-control selectric" DataSourceID="SDS_Semester" DataTextField="Semester" DataValueField="Sem_id" AppendDataBoundItems="True">
                                            <asp:ListItem Value="NULL">-- Select --</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SDS_Semester" runat="server" ConnectionString="<%$ ConnectionStrings:TeachEasy_database %>" SelectCommand="SELECT * FROM [Semester]"></asp:SqlDataSource>
                                    </div>
                                </div>
                                <div class="form-group row mb-4">
                                    <asp:Label ID="Label3" runat="server" CssClass="col-form-label text-md-right col-12 col-md-3 col-lg-3" Text="Select Admission Date"></asp:Label>
                                    <div class="col-sm-12 col-md-7">
                                        <asp:TextBox ID="TxtB_Date" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
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
