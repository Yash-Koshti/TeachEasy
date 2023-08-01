<%@ Page Title="" Language="C#" MasterPageFile="~/Student_side/Student_Master.Master" AutoEventWireup="true" CodeBehind="Student_Exam_Add.aspx.cs" Inherits="TeachEasy.Student_side.Student_ExamAdd" %>
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
                                        <asp:Label ID="Label1" runat="server" Text="Select Student"></asp:Label>
                                        <asp:DropDownList ID="DrDoL_Admission" runat="server" CssClass="btn btn-info dropdown-toggle" DataSourceID="SDS_Admission" DataTextField="S_name" DataValueField="Admission_Id"></asp:DropDownList>
                                        <asp:SqlDataSource ID="SDS_Admission" runat="server" ConnectionString="<%$ ConnectionStrings:TeachEasy_database %>" SelectCommand="SELECT * FROM [Student_Exam_View]"></asp:SqlDataSource>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="Label2" runat="server" Text="Select Exam"></asp:Label>
                                        <asp:DropDownList ID="DrDoL_Exam" runat="server" CssClass="btn btn-info dropdown-toggle" DataSourceID="SDS_Exam" DataTextField="Exam_Name" DataValueField="Exam_Id"></asp:DropDownList>
                                        <asp:SqlDataSource ID="SDS_Exam" runat="server" ConnectionString="<%$ ConnectionStrings:TeachEasy_database %>" SelectCommand="SELECT * FROM [Exam]"></asp:SqlDataSource>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="Label3" runat="server" Text="Obtained Marks"></asp:Label>
                                        <asp:TextBox ID="TxtB_Marks" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
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
