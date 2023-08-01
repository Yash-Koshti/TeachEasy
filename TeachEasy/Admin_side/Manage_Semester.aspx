<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_side/Admin_Master.Master" AutoEventWireup="true" CodeBehind="Manage_Semester.aspx.cs" Inherits="TeachEasy.Admin_side.ManageSemester" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="main-content" style="min-width: 1349px;">
        <section class="section">
            <div class="section-header">
                <h1>Semester</h1>
                <div class="section-header-breadcrumb">
                    <div class="breadcrumb-item active"><a href="Manage_Admin.aspx">Home</a></div>
                    <div class="breadcrumb-item">Semester</div>
                </div>
            </div>
            <div class="section-body">
                <h2 class="section-title">Manage Semester</h2>
                <p class="section-lead">
                    Here you can manage all semesters.
                </p>

                <div class="row mt-4">
                    <div class="col-12 col-lg-7">
                        <div class="card">
                            <div class="card-header">
                                <h4>All Semester</h4>
                            </div>
                            <div class="card-body">
                                <div class="float-left">
                                </div>
                                <div class="float-right">
                                    <div class="input-group">
                                        <input type="text" class="form-control" placeholder="Search">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary"><i class="fas fa-search"></i></button>
                                        </div>
                                    </div>
                                </div>

                                <div class="clearfix mb-3"></div>

                                <div class="table-responsive">
                                    <asp:GridView ID="GridView1" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CssClass="table table-striped" AutoGenerateColumns="False" DataKeyNames="Sem_id" DataSourceID="SDS_Semester">
                                        <Columns>
                                            <asp:CommandField SelectText="Edit" ShowSelectButton="True" />
                                            <asp:BoundField DataField="Sem_id" HeaderText="Sem_id" ReadOnly="True" SortExpression="Sem_id" />
                                            <asp:BoundField DataField="Semester" HeaderText="Semester" SortExpression="Semester" />
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SDS_Semester" runat="server" ConnectionString="<%$ ConnectionStrings:TeachEasy_database %>" SelectCommand="SELECT * FROM [Semester]"></asp:SqlDataSource>
                                </div>
                                <div class="float-right">
                                    <nav>
                                        <ul class="pagination">
                                            <li class="page-item disabled">
                                                <a class="page-link" href="#" aria-label="Previous">
                                                    <span aria-hidden="true">&laquo;</span>
                                                    <span class="sr-only">Previous</span>
                                                </a>
                                            </li>
                                            <li class="page-item active">
                                                <a class="page-link" href="#">1</a>
                                            </li>
                                            <li class="page-item">
                                                <a class="page-link" href="#">2</a>
                                            </li>
                                            <li class="page-item">
                                                <a class="page-link" href="#">3</a>
                                            </li>
                                            <li class="page-item">
                                                <a class="page-link" href="#" aria-label="Next">
                                                    <span aria-hidden="true">&raquo;</span>
                                                    <span class="sr-only">Next</span>
                                                </a>
                                            </li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-lg-5">
                        <div class="card">
                            <div class="card-header">
                                <h4>Add new Semester</h4>
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
                                        <asp:Button ID="Add_btn" runat="server" Text="ADD" OnClick="Add_btn_Click" CssClass="btn btn-primary me-2" />
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
