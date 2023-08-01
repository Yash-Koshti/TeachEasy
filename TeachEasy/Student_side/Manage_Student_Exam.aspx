<%@ Page Title="" Language="C#" MasterPageFile="~/Student_side/Student_Master.Master" AutoEventWireup="true" CodeBehind="Manage_Student_Exam.aspx.cs" Inherits="TeachEasy.Student_side.Manage_StudentExam" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="main-panel">
                <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" SelectText="Edit" />
                    </Columns>
                </asp:GridView>
                <br />
                <br />
                <asp:Button ID="Add_btn" runat="server" Text="ADD" OnClick="Add_btn_Click" CssClass="btn btn-success" />
                <!-- content-wrapper ends -->
                <!-- partial:../../partials/_footer.html -->
                <footer class="footer">
                  <div class="d-sm-flex justify-content-center justify-content-sm-between">
                    
                  </div>
                </footer>
                <!-- partial -->
              </div>
</asp:Content>
