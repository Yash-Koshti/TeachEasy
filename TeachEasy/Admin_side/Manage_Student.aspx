<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_side/Admin_Master.Master" AutoEventWireup="true" CodeBehind="Manage_Student.aspx.cs" Inherits="TeachEasy.Admin_side.ManageStudent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="main-content">
        <section class="section">
            <div class="section-header">
                <h1>Student</h1>
                <div class="section-header-button">
                    <asp:Button ID="Add_btn" runat="server" Text="Add New" CssClass="btn btn-success" OnClick="Add_btn_Click" />
                </div>
                <div class="section-header-breadcrumb">
                    <div class="breadcrumb-item active"><a href="Manage_Admin.aspx">Home</a></div>
                    <div class="breadcrumb-item">Student</div>
                </div>
            </div>
            <div class="section-body">
                <h2 class="section-title">Manage Student</h2>
                <p class="section-lead">
                    Here are you can manage all students.
                </p>

                <div class="row mt-4">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4>All Students</h4>
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
                                    <asp:GridView ID="GridView1" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CssClass="table table-striped" AutoGenerateColumns="False" DataKeyNames="S_Id" DataSourceID="SqlDataSource1">
                                        <Columns>
                                            <asp:BoundField DataField="S_Id" HeaderText="S_Id" ReadOnly="True" SortExpression="S_Id" />
                                            <asp:BoundField DataField="S_name" HeaderText="S_name" SortExpression="S_name" />
                                            <asp:TemplateField HeaderText="Profile_image" SortExpression="Profile_image">
                                                <ItemTemplate>
                                                    <asp:Image ID="Img_Profile_image" runat="server" ImageUrl='<%# Eval("Profile_image") %>' Height="40px" Width="40px" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="E_mail" HeaderText="E_mail" SortExpression="E_mail" />
                                            <asp:BoundField DataField="Ph_number" HeaderText="Ph_number" SortExpression="Ph_number" />
                                            <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                                            <asp:BoundField DataField="DOB" HeaderText="DOB" SortExpression="DOB" />
                                            <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:TeachEasy_database %>" SelectCommand="SELECT * FROM [Student]"></asp:SqlDataSource>
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
