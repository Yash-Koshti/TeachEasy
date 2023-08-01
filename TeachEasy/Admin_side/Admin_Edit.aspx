<%@ Page Title="" Language="C#" MasterPageFile="~/Admin_side/Admin_Master.Master" AutoEventWireup="true" CodeBehind="Admin_Edit.aspx.cs" Inherits="TeachEasy.Admin_side.AdminEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="main-content" style="min-width: 1349px;">
        <section class="section">
          <div class="section-header">
            <h1>Profile</h1>
            <div class="section-header-breadcrumb">
              <div class="breadcrumb-item active"><a href="Manage_Admin.aspx">Home</a></div>
              <div class="breadcrumb-item">Profile</div>
            </div>
          </div>
          <div class="section-body">
            <h2 class="section-title">Hi, <%Response.Write(Session["Admin_name"]); %>!</h2>
            <p class="section-lead">
              Change information about yourself on this page.
            </p>

            <div class="row mt-sm-4">
              <div class="col-12 col-md-12 col-lg-5">
                <div class="card profile-widget">
                  <div class="profile-widget-header">
                      <img alt="image" src="../TE_CssClass_Files/assets/img/avatar/avatar-1.png" class="rounded-circle profile-widget-picture">
                    <div class="profile-widget-items">
                      <div class="profile-widget-item">
                        <div class="profile-widget-item-label">Admins</div>
                        <div class="profile-widget-item-value">1</div>
                      </div>
                    </div>
                  </div>
                  <div class="profile-widget-description">
                    <div class="profile-widget-name"><%Response.Write(Session["Admin_name"]); %></div>
                    <table class="table table-striped" border="1">
                        <tr>
                            <td>Name</td>
                            <td><%Response.Write(Session["Admin_name"]); %></td>
                        </tr>
                    </table>
                  </div>
                </div>
              </div>
              <div class="col-12 col-md-12 col-lg-7">
                <div class="card">
                  <%--<form method="post" class="needs-validation" novalidate="">--%>
                    <div class="card-header">
                      <h4>Edit Profile</h4>
                    </div>
                    <div class="card-body">
                        <div class="row">                               
                          <div class="form-group col-12 col-md-6">
                              <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>
                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <br />
                            <br />
                              <asp:TextBox ID="TxtB_Uname" runat="server" CssClass="form-control"></asp:TextBox>
                            <div class="invalid-feedback">
                              <asp:RequiredFieldValidator ID="ReqFVal_TxtB_Uname" runat="server" ErrorMessage="*Please fill in the name" ControlToValidate="TxtB_Uname" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                          </div>
                            <div class="form-group col-12 col-md-5">
                                <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
                                <br />
                                <br />
                                <asp:TextBox ID="TxtB_Pwd" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                                <div class="invalid-feedback">
                                  <asp:RequiredFieldValidator ID="ReqFVal_TxtB_Pwd" runat="server" ErrorMessage="*Please fill in the password" ControlToValidate="TxtB_Pwd" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer text-center">
                        <asp:Button ID="Update_btn" runat="server" Text="Save Changes" CssClass="btn btn-primary me-2" OnClick="Update_btn_Click" />
                    </div>
                  <%--</form>--%>
                </div>
              </div>
            </div>
          </div>
        </section>
      </div>
</asp:Content>
