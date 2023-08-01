<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_side/Admin_Master.Master" AutoEventWireup="true" CodeBehind="Faculty_Edit.aspx.cs" Inherits="TeachEasy.Admin_side.Faculty_Edit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="main-panel">
                <div class="content-wrapper">
                        <div class="col-md-6 grid-margin stretch-card">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Update Faculty Details</h4>
                                    <div class="form-group">
                                      <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>
                                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                      <asp:Label ID="Label2" runat="server" Text="Email address"></asp:Label>
                                        <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                      <asp:Label ID="Label3" runat="server" Text="Phone Number"></asp:Label>
                                        <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                      <asp:Label ID="Label4" runat="server" Text="Qualification"></asp:Label>
                                        <asp:TextBox ID="TextBox4" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="Label5" runat="server" Text="Gender"></asp:Label>
                                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" CssClass="form-check-input" RepeatColumns="3">
                                            <asp:ListItem Value="M">Male</asp:ListItem>
                                            <asp:ListItem Value="F">Female</asp:ListItem>
                                            <asp:ListItem Value="O">Other</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="Label6" runat="server" Text="Date Of Birth"></asp:Label>
                                        <asp:TextBox ID="TextBox5" runat="server" TextMode="Date"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="Label7" runat="server" Text="Profile Image"></asp:Label>
                                        <asp:FileUpload ID="FileUpload1" runat="server" />
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="Label8" runat="server" Text="Password"></asp:Label>
                                        <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                                    </div>
                                    <asp:Button ID="Update_btn" runat="server" Text="UPDATE" CssClass="btn btn-primary me-2" OnClick="Update_btn_Click" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="Delete_btn" runat="server" Text="DELETE" CssClass="btn btn-primary me-2" OnClick="Delete_btn_Click" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="Cancel_btn" runat="server" Text="CANCEL" CssClass="btn btn-light" OnClick="Cancel_btn_Click" />
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
