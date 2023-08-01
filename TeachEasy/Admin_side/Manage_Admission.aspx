<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_side/Admin_Master.Master" AutoEventWireup="true" CodeBehind="Manage_Admission.aspx.cs" Inherits="TeachEasy.Admin_side.ManageAdmission" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="main-content" style="min-width: 1349px;">
        <section class="section">
            <div class="section-header">
                <h1>Admission</h1>
                <div class="section-header-button">
                    <asp:Button ID="Add_btn" runat="server" Text="Add New" OnClick="Add_btn_Click" CssClass="btn btn-success" />
                </div>
                <div class="section-header-breadcrumb">
                    <div class="breadcrumb-item active"><a href="Manage_Admin.aspx">Home</a></div>
                    <div class="breadcrumb-item">Admission</div>
                </div>
            </div>
            <div class="section-body">
                <h2 class="section-title">Manage Admission</h2>
                <p class="section-lead">
                    Here you can manage admission of every student.
                </p>

                <div class="row mt-4">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4>All Admission details</h4>
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
                                    <asp:GridView ID="GridView1" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CssClass="table table-striped" AutoGenerateColumns="False" DataKeyNames="Admission_Id" DataSourceID="SDS_Admission">
                                        <Columns>
                                            <asp:CommandField SelectText="Edit" ShowSelectButton="True" />
                                            <asp:BoundField DataField="Admission_Id" HeaderText="Admission_Id" ReadOnly="True" SortExpression="Admission_Id" />
                                            <asp:BoundField DataField="S_name" HeaderText="S_name" SortExpression="S_name" />
                                            <asp:BoundField DataField="Admission_Date" HeaderText="Admission_Date" SortExpression="Admission_Date" />
                                            <asp:BoundField DataField="Semester" HeaderText="Semester" SortExpression="Semester" />
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SDS_Admission" runat="server" ConnectionString="<%$ ConnectionStrings:TeachEasy_database %>" SelectCommand="SELECT Admission.Admission_Id, Student.S_name, Admission.Admission_Date, Semester.Semester FROM Admission INNER JOIN Student ON Admission.S_Id = Student.S_Id INNER JOIN Semester ON Admission.Sem_Id = Semester.Sem_id"></asp:SqlDataSource>
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
