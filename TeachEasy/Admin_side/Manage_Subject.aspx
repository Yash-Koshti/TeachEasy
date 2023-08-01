<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_side/Admin_Master.Master" AutoEventWireup="true" CodeBehind="Manage_Subject.aspx.cs" Inherits="TeachEasy.Admin_side.ManageSubject" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="main-content" style="min-width: 1349px;">
        <section class="section">
            <div class="section-header">
                <h1>Subject</h1>
                <div class="section-header-button">
                    <asp:Button ID="Add_btn" runat="server" Text="Add New" OnClick="Add_btn_Click" CssClass="btn btn-success" />
                </div>
                <div class="section-header-breadcrumb">
                    <div class="breadcrumb-item active"><a href="Manage_Admin.aspx">Home</a></div>
                    <div class="breadcrumb-item">Subject</div>
                </div>
            </div>
            <div class="section-body">
                <h2 class="section-title">Manage Subject</h2>
                <p class="section-lead">
                    Here you can manage all subjects.
                </p>

                <div class="row mt-4">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4>All Subjects</h4>
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
                                    <asp:GridView ID="GridView1" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CssClass="table table-striped" AutoGenerateColumns="False" DataKeyNames="Subject_ID" DataSourceID="SDS_Subject">
                                        <Columns>
                                            <asp:CommandField SelectText="Edit" ShowSelectButton="True" />
                                            <asp:BoundField DataField="Subject_ID" HeaderText="Subject_ID" ReadOnly="True" SortExpression="Subject_ID" />
                                            <asp:BoundField DataField="Subject_Name" HeaderText="Subject_Name" SortExpression="Subject_Name" />
                                            <asp:BoundField DataField="Subject_Type" HeaderText="Subject_Type" SortExpression="Subject_Type" />
                                            <asp:BoundField DataField="Subject_category" HeaderText="Subject_category" SortExpression="Subject_category" />
                                            <asp:BoundField DataField="Sem_id" HeaderText="Sem_id" SortExpression="Sem_id" />
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SDS_Subject" runat="server" ConnectionString="<%$ ConnectionStrings:TeachEasy_database %>" SelectCommand="SELECT * FROM [Subject]"></asp:SqlDataSource>
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
                </div>
            </div>
        </section>
    </div>
</asp:Content>
