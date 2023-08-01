<%@ Page Title="" Language="C#" MasterPageFile="~/Faculty_side/Faculty_Master.Master" AutoEventWireup="true" CodeBehind="Manage_Question_Bank.aspx.cs" Inherits="TeachEasy.Faculty_side.Manage_QuestionBank" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="main-content" style="min-width: 1349px;">
        <section class="section">
            <div class="section-header">
                <h1>Question Bank</h1>
                <div class="section-header-button">
                    <asp:Button ID="Add_btn" runat="server" Text="Add New" CssClass="btn btn-success" OnClick="Add_btn_Click" />                    
                </div>
                <div class="section-header-breadcrumb">
                    <div class="breadcrumb-item active"><a href="Manage_Faculty.aspx">Home</a></div>
                    <div class="breadcrumb-item">Question Bank</div>
                </div>
            </div>
            <div class="section-body">
                <h2 class="section-title">Questions</h2>
                <p class="section-lead">
                  Here are your added questions.
                </p>

                <div class="row mt-4">
                  <div class="col-12">
                    <div class="card">
                      <div class="card-header">
                        <h4>All Questions</h4>
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
                            <asp:GridView ID="GrV_Question_Bank" runat="server" CssClass="table table-striped" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AutoGenerateColumns="False" DataKeyNames="Q_id" DataSourceID="SDS_Question_Bank">
                                <Columns>
                                    <asp:BoundField DataField="Q_id" HeaderText="Q_id" ReadOnly="True" SortExpression="Q_id" />
                                    <asp:BoundField DataField="Topic_name" HeaderText="Topic_name" SortExpression="Topic_name" />
                                    <asp:BoundField DataField="Question" HeaderText="Question" SortExpression="Question" />
                                    <asp:TemplateField HeaderText="Q image" SortExpression="Question_image">
                                        <ItemTemplate>
                                            <asp:Image ID="Img_Que_img" runat="server" CssClass="mr-3" ImageUrl='<%# Eval("Question_image") %>' Width="300px" Height="100%" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Option_A" HeaderText="Option_A" SortExpression="Option_A" />
                                    <asp:TemplateField HeaderText="A_image" SortExpression="Option_A_image">
                                        <ItemTemplate>
                                            <asp:Image ID="Img_Opt_A_img" runat="server" CssClass="mr-3" ImageUrl='<%# Eval("Option_A_image") %>' Width="300px" Height="100%" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Option_B" HeaderText="Option_B" SortExpression="Option_B" />
                                    <asp:TemplateField HeaderText="B_image" SortExpression="Option_B_image">
                                        <ItemTemplate>
                                            <asp:Image ID="Img_Opt_B_img" runat="server" CssClass="mr-3" ImageUrl='<%# Eval("Option_B_image") %>' Width="300px" Height="100%" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Option_C" HeaderText="Option_C" SortExpression="Option_C" />
                                    <asp:TemplateField HeaderText="C_image" SortExpression="Option_C_image">
                                        <ItemTemplate>
                                            <asp:Image ID="Img_Opt_C_img" runat="server" CssClass="mr-3" ImageUrl='<%# Eval("Option_C_image") %>' Width="300px" Height="100%" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Option_D" HeaderText="Option_D" SortExpression="Option_D" />
                                    <asp:TemplateField HeaderText="D_image" SortExpression="Option_D_image">
                                        <ItemTemplate>
                                            <asp:Image ID="Img_Opt_D_img" runat="server" CssClass="mr-3" ImageUrl='<%# Eval("Option_D_image") %>' Width="300px" Height="100%" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Difficulty_level" HeaderText="Diffi lvl" SortExpression="Difficulty_level" />
                                    <asp:BoundField DataField="Correct_option" HeaderText="Ans" SortExpression="Correct_option" />
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SDS_Question_Bank" runat="server" ConnectionString="<%$ ConnectionStrings:TeachEasy_database %>" SelectCommand="SELECT [Q_id], [Topic_name], [Question], [Question_image], [Option_A], [Option_A_image], [Option_B], [Option_B_image], [Option_C], [Option_C_image], [Option_D], [Option_D_image], [Difficulty_level], [Correct_option] FROM [Student_Exam_View]"></asp:SqlDataSource>
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
