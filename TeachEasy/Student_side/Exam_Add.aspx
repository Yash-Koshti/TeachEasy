<%@ Page Title="" Language="C#" MasterPageFile="~/Student_side/Student_Master.Master" AutoEventWireup="true" CodeBehind="Exam_Add.aspx.cs" Inherits="TeachEasy.Student_side.ExamAdd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="main-panel">
                <div class="content-wrapper">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Add Exam Details</h4>
                                    <div class="form-group">
                                      <asp:Label ID="Label1" runat="server" Text="Exam Name"></asp:Label>
                                        <asp:TextBox ID="TxtB_Name" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                      <asp:Label ID="Label2" runat="server" Text="Exam Type"></asp:Label>
                                        <asp:TextBox ID="TxtB_Type" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                      <asp:Label ID="Label3" runat="server" Text="Total Marks"></asp:Label>
                                        <asp:TextBox ID="TxtB_Total_Marks" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="Label4" runat="server" Text="Select Semester"></asp:Label>
                                        <asp:DropDownList ID="DrDoL_Semester" runat="server" CssClass="btn btn-info dropdown-toggle" DataSourceID="SDS_Semester" DataTextField="Semester" DataValueField="Sem_id" AutoPostBack="True" OnSelectedIndexChanged="DrDoL_Semester_SelectedIndexChanged"></asp:DropDownList>
                                        <asp:SqlDataSource ID="SDS_Semester" runat="server" ConnectionString="<%$ ConnectionStrings:TeachEasy_database %>" SelectCommand="SELECT * FROM [Semester]"></asp:SqlDataSource>
                                        
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        
                                        <asp:Label ID="Label5" runat="server" Text="Select Subject"></asp:Label>
                                        <asp:DropDownList ID="DrDoL_Subject" runat="server" CssClass="btn btn-info dropdown-toggle" DataSourceID="SDS_Subject" DataTextField="Subject_Name" DataValueField="Subject_ID" AutoPostBack="True" OnSelectedIndexChanged="DrDoL_Subject_SelectedIndexChanged"></asp:DropDownList>
                                        <asp:SqlDataSource ID="SDS_Subject" runat="server" ConnectionString="<%$ ConnectionStrings:TeachEasy_database %>" SelectCommand="SELECT * FROM [Subject]"></asp:SqlDataSource>
                                        
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        
                                        <asp:Label ID="Label6" runat="server" Text="Select Unit"></asp:Label>
                                        <asp:DropDownList ID="DrDoL_Unit" runat="server" CssClass="btn btn-info dropdown-toggle" DataSourceID="SDS_Unit" DataTextField="Unit_Name" DataValueField="Unit_Id" AutoPostBack="True" OnSelectedIndexChanged="DrDoL_Unit_SelectedIndexChanged"></asp:DropDownList>
                                        <asp:SqlDataSource ID="SDS_Unit" runat="server" ConnectionString="<%$ ConnectionStrings:TeachEasy_database %>" SelectCommand="SELECT * FROM [Unit]"></asp:SqlDataSource>
                                        
                                        <br />
                                        <br />
                                        
                                        <asp:Label ID="Label7" runat="server" Text="Select Chapter"></asp:Label>
                                        <asp:DropDownList ID="DrDoL_Chapter" runat="server" CssClass="btn btn-info dropdown-toggle" DataSourceID="SDS_Chapter" DataTextField="Ch_title" DataValueField="Ch_Id" AutoPostBack="True" OnSelectedIndexChanged="DrDoL_Chapter_SelectedIndexChanged"></asp:DropDownList>
                                        <asp:SqlDataSource ID="SDS_Chapter" runat="server" ConnectionString="<%$ ConnectionStrings:TeachEasy_database %>" SelectCommand="SELECT * FROM [Chapter]"></asp:SqlDataSource>
                                        
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        
                                        <asp:Label ID="Label8" runat="server" Text="Select Topic"></asp:Label>
                                        <asp:DropDownList ID="DrDoL_Topic" runat="server" CssClass="btn btn-info dropdown-toggle" DataSourceID="SDS_Topic" DataTextField="Topic_name" DataValueField="Topic_Id"></asp:DropDownList>
                                        <asp:SqlDataSource ID="SDS_Topic" runat="server" ConnectionString="<%$ ConnectionStrings:TeachEasy_database %>" SelectCommand="SELECT * FROM [Topic]"></asp:SqlDataSource>
                                    </div>
                                    <asp:Button ID="Add_btn" runat="server" Text="SUBMIT" CssClass="btn btn-primary me-2" OnClick="Add_btn_Click" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="Cancel_btn" runat="server" Text="Cancel" CssClass="btn btn-light" OnClick="Cancel_btn_Click" />
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
