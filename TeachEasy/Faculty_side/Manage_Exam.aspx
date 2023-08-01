<%@ Page Title="" Language="C#" MasterPageFile="~/Faculty_side/Faculty_Master.Master" AutoEventWireup="true" CodeBehind="Manage_Exam.aspx.cs" Inherits="TeachEasy.Faculty_side.ManageExam" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="main-content" style="min-width: 1349px;">
        <section class="section">
            <div class="section-header">
                <h1>Exam</h1>
                <div class="section-header-button">
                    <asp:Button ID="Add_btn" runat="server" Text="Add New" CssClass="btn btn-success" OnClick="Add_btn_Click" />
                </div>
                <div class="section-header-breadcrumb">
                    <div class="breadcrumb-item active"><a href="Manage_Faculty.aspx">Home</a></div>
                    <div class="breadcrumb-item">Exam</div>
                </div>
            </div>
            <div class="section-body">
                <h2 class="section-title">Exam</h2>
                <p class="section-lead">
                    Here are your uploaded exams.
               
                </p>

                <div class="row mt-4">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4>All Exams</h4>
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
                                    <asp:GridView ID="GrV_Exam" runat="server" CssClass="table table-striped" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AutoGenerateColumns="False" DataKeyNames="Exam_Id" DataSourceID="SDS_Exam">
                                        <Columns>
                                            <asp:BoundField DataField="Exam_Id" HeaderText="Exam_Id" ReadOnly="True" SortExpression="Exam_Id" />
                                            <asp:BoundField DataField="Exam_Name" HeaderText="Exam_Name" SortExpression="Exam_Name" />
                                            <asp:BoundField DataField="Exam_Type" HeaderText="Exam_Type" SortExpression="Exam_Type" />
                                            <asp:BoundField DataField="Total_Marks" HeaderText="Total_Marks" SortExpression="Total_Marks" />
                                            <asp:TemplateField HeaderText="Delete">
                                                <ItemTemplate>
                                                    <a class="btn btn-danger btn-action" data-toggle="tooltip" title="Delete" data-confirm="Are You Sure?|This action can not be undone. Do you want to continue?" data-confirm-yes="alert('Deleted')"><i class="fas fa-trash"></i></a>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SDS_Exam" runat="server" ConnectionString="<%$ ConnectionStrings:TeachEasy_database %>" SelectCommand="SELECT [Exam_Id], [Exam_Name], [Exam_Type], [Total_Marks] FROM [Exam] WHERE ([Exam_Type] = @Exam_Type)">
                                        <SelectParameters>
                                            <asp:Parameter DefaultValue="Standard" Name="Exam_Type" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
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
