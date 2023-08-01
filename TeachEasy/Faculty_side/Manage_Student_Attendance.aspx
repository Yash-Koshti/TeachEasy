<%@ Page Title="" Language="C#" MasterPageFile="~/Faculty_side/Faculty_Master.Master" AutoEventWireup="true" CodeBehind="Manage_Student_Attendance.aspx.cs" Inherits="TeachEasy.Faculty_side.Manage_StudentAttendance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="main-content" style="min-width: 1349px;">
        <section class="section">
            <div class="section-header">
                <h1>Student Attendance</h1>
                <div class="section-header-button">
                    <asp:Button ID="Add_btn" runat="server" Text="Add New" OnClick="Add_btn_Click" CssClass="btn btn-success" />
                </div>
                <div class="section-header-breadcrumb">
                    <div class="breadcrumb-item active"><a href="Manage_Faculty.aspx">Home</a></div>
                    <div class="breadcrumb-item">Student Attendance</div>
                </div>
            </div>
            <div class="section-body">
                <h2 class="section-title">Student Attendance</h2>
                <p class="section-lead">
                    Here is Student Attendance.
                </p>

                <div class="row mt-4">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4>All Student Attendance</h4>
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
                                    <%--<asp:GridView ID="" runat="server"  AutoGenerateColumns="False" DataKeyNames="SA_Id" DataSourceID="SDS_Student_Attendance">
                                        <Columns>
                                            <asp:CommandField SelectText="Edit" ShowSelectButton="True" />
                                            <asp:BoundField DataField="SA_Id" HeaderText="SA_Id" ReadOnly="True" SortExpression="SA_Id" />
                                            <asp:BoundField DataField="FS_Id" HeaderText="FS_Id" SortExpression="FS_Id" />
                                            <asp:BoundField DataField="Admission_Id" HeaderText="Admission_Id" SortExpression="Admission_Id" />
                                            <asp:BoundField DataField="Month" HeaderText="Month" SortExpression="Month" />
                                            <asp:BoundField DataField="Total_lectures" HeaderText="Total_lectures" SortExpression="Total_lectures" />
                                            <asp:BoundField DataField="Present_lectures" HeaderText="Present_lectures" SortExpression="Present_lectures" />
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SDS_Student_Attendance" runat="server" ConnectionString="<%$ ConnectionStrings:TeachEasy_database %>" SelectCommand="SELECT * FROM [Student_Attendance]"></asp:SqlDataSource>--%>
                                    <asp:GridView ID="GrV_Student_Attendance" runat="server" CssClass="table table-striped" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                                        <Columns>
                                            <asp:CommandField SelectText="Edit" ShowSelectButton="True" />
                                        </Columns>
                                    </asp:GridView>
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
