<%@ Page Title="" Language="C#" MasterPageFile="~/Student_side/Student_Master.Master" AutoEventWireup="true" CodeBehind="Student_Exam_Question_Add.aspx.cs" Inherits="TeachEasy.Student_side.Student_Exam_QuestionAdd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="main-panel">
                <div class="content-wrapper">
                        <div class="col-md-6 grid-margin stretch-card">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Add Student Exam Details</h4>
                                    <div class="form-group">
                                        <asp:Label ID="Label1" runat="server" Text="Select Student Exam"></asp:Label>
                                        <asp:DropDownList ID="DrDoL_Student_Exam" runat="server" CssClass="btn btn-info dropdown-toggle" DataSourceID="SDS_Student_Exam" DataTextField="SE_Id" DataValueField="SE_Id"></asp:DropDownList>
                                        <asp:SqlDataSource ID="SDS_Student_Exam" runat="server" ConnectionString="<%$ ConnectionStrings:TeachEasy_database %>" SelectCommand="SELECT * FROM [Student_Exam]"></asp:SqlDataSource>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="Label2" runat="server" Text="Select Question"></asp:Label>
                                        <asp:DropDownList ID="DrDoL_Question" runat="server" CssClass="btn btn-info dropdown-toggle" DataSourceID="SDS_Question" DataTextField="Question" DataValueField="Q_id"></asp:DropDownList>
                                        <asp:SqlDataSource ID="SDS_Question" runat="server" ConnectionString="<%$ ConnectionStrings:TeachEasy_database %>" SelectCommand="SELECT * FROM [Questions]"></asp:SqlDataSource>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="Label3" runat="server" Text="Result"></asp:Label>
                                        <asp:RadioButtonList ID="RaBuL_Result" runat="server" CssClass="form-check-input" RepeatColumns="2">
                                            <asp:ListItem>Correct</asp:ListItem>
                                            <asp:ListItem>Wrong</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                    <asp:Button ID="Add_btn" runat="server" Text="SUBMIT" CssClass="btn btn-primary me-2" OnClick="Add_btn_Click" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="Cancel_btn" runat="server" Text="Cancel" CssClass="btn btn-light" OnClick="Cancel_btn_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                <!-- content-wrapper ends -->
                <!-- partial:../../partials/_footer.html -->
                <footer class="footer">
                  <div class="d-sm-flex justify-content-center justify-content-sm-between">
                    
                  </div>
                </footer>
                <!-- partial -->
              </div>
</asp:Content>
