<%@ Page Title="" Language="C#" MasterPageFile="~/Faculty_side/Faculty_Master.Master" AutoEventWireup="true" CodeBehind="Manage_Chapter.aspx.cs" Inherits="TeachEasy.Faculty_side.ManageChapter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="main-content">
        <section class="section">
            <div class="section-header">
                <h1>Chapter</h1>
                <div class="section-header-button">
                    <asp:Button ID="Add_btn" runat="server" Text="Add New" OnClick="Add_btn_Click" CssClass="btn btn-success" />
                </div>
                <div class="section-header-breadcrumb">
                    <div class="breadcrumb-item active"><a href="Manage_Faculty.aspx">Home</a></div>
                    <div class="breadcrumb-item">Chapter</div>
                </div>
            </div>
            <div class="section-body">
                <h2 class="section-title">Chapter</h2>
                <p class="section-lead">
                    Here are your chapters.               
                </p>

                <div class="row mt-4">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4>All Chapters</h4>
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
                                    <asp:GridView ID="GrV_Chapter" runat="server" CssClass="table table-striped" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AutoGenerateColumns="False" DataKeyNames="Ch_Id" DataSourceID="SDS_Chapter">
                                        <Columns>
                                            <asp:BoundField DataField="Ch_Id" HeaderText="Id" ReadOnly="True" SortExpression="Ch_Id" />
                                            <asp:BoundField DataField="Ch_title" HeaderText="Title" SortExpression="Ch_title" />
                                            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                                            <asp:BoundField DataField="Subject_Name" HeaderText="Subject" SortExpression="Subject_Name" />
                                            <asp:BoundField DataField="Unit_Name" HeaderText="Unit" SortExpression="Unit_Name" />
                                            <asp:TemplateField HeaderText="Edit / Delete">
                                                <ItemTemplate>
                                                    <a class="btn btn-primary btn-action mr-1" data-toggle="tooltip" title="Edit"><i class="fas fa-pencil-alt"></i></a>
                                                    <a class="btn btn-danger btn-action" data-toggle="tooltip" title="Delete" data-confirm="Are You Sure?|This action can not be undone. Do you want to continue?" data-confirm-yes="alert('Deleted')"><i class="fas fa-trash"></i></a>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SDS_Chapter" runat="server" ConnectionString="<%$ ConnectionStrings:TeachEasy_database %>" SelectCommand="SELECT [Ch_Id], [Ch_title], [Description], [Subject_Name], [Unit_Name] FROM [ChapterView]"></asp:SqlDataSource>
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

