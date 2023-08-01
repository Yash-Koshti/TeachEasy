<%@ Page Title="" Language="C#" MasterPageFile="~/Faculty_side/Faculty_Master.Master" AutoEventWireup="true" CodeBehind="Faculty_Edit.aspx.cs" Inherits="TeachEasy.Faculty_side.FacultyEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="main-content">
        <section class="section">
          <div class="section-header">
            <h1>Profile</h1>
            <div class="section-header-breadcrumb">
              <div class="breadcrumb-item active"><a href="Manage_Faculty.aspx">Home</a></div>
              <div class="breadcrumb-item">Profile</div>
            </div>
          </div>
          <div class="section-body">
            <h2 class="section-title">Hi, <%Response.Write(Session["Fac_Name"]); %>!</h2>
            <p class="section-lead">
              Change information about yourself on this page.
            </p>

            <div class="row mt-sm-4">
              <div class="col-12 col-md-12 col-lg-5">
                <div class="card profile-widget">
                  <div class="profile-widget-header">
                      <asp:Image ID="Img_Profile_Image" runat="server" CssClass="rounded-circle profile-widget-picture" />
                    <div class="profile-widget-items">
                      <div class="profile-widget-item">
                        <div class="profile-widget-item-label">Subjects</div>
                        <div class="profile-widget-item-value">1</div>
                      </div>
                    </div>
                  </div>
                  <div class="profile-widget-description">
                    <div class="profile-widget-name"><%Response.Write(Session["Fac_Name"]); %></div>
                    <table class="table table-striped" border="1">
                        <tr>
                            <td>E-Mail</td>
                            <td><%Response.Write(Session["E_mail"]); %></td>
                        </tr>
                        <tr>
                            <td>Phone Number</td>
                            <td><%Response.Write(Session["Ph_number"]); %></td>
                        </tr><tr>
                            <td>Qualification</td>
                            <td><%Response.Write(Session["Qualification"]); %></td>
                        </tr><tr>
                            <td>Gender</td>
                            <td><%Response.Write(Session["Gender"]); %></td>
                        </tr><tr>
                            <td>Date of Birth</td>
                            <td><%Response.Write(DateTime.Parse(Session["DOB"].ToString()).ToShortDateString()); %></td>
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
                          <div class="form-group col-md-6 col-12">
                              <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>
                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <br />
                            <br />
                              <asp:TextBox ID="TxtB_Name" runat="server" CssClass="form-control"></asp:TextBox>
                            <div class="invalid-feedback">
                              <asp:RequiredFieldValidator ID="ReqFVal_TxtB_Name" runat="server" ErrorMessage="*Please fill in the name" ControlToValidate="TxtB_Name" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                          </div>
                          <div class="form-group col-md-6 col-12">
                              <asp:Label ID="Label2" runat="server" Text="Gender"></asp:Label>
                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                              <asp:RadioButtonList ID="RaBuL_Gender" runat="server" CssClass="form-check-input" RepeatColumns="3" CellPadding="7">
                                <asp:ListItem Value="M">Male</asp:ListItem>
                                <asp:ListItem Value="F">Female</asp:ListItem>
                                <asp:ListItem Value="O">Other</asp:ListItem>
                              </asp:RadioButtonList>
                            <div class="invalid-feedback">
                              <asp:RequiredFieldValidator ID="ReqFVal_RaBuL_Gender" runat="server" ErrorMessage="*Please select gender" ControlToValidate="RaBuL_Gender" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                          </div>
                        </div>
                        <div class="row">
                          <div class="form-group col-md-6 col-12">
                              <asp:Label ID="Label3" runat="server" Text="Email address"></asp:Label>
                              <br />
                              <br />
                              <asp:TextBox ID="TxtB_Email" runat="server" CssClass="form-control"></asp:TextBox>
                            <div class="invalid-feedback">
                              <asp:RequiredFieldValidator ID="ReqFVal_TxtB_Email" runat="server" ErrorMessage="*Please fill in the email" ControlToValidate="TxtB_Email" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                          </div>
                          <div class="form-group col-md-6 col-12">
                              <asp:Label ID="Label4" runat="server" Text="Phone Number"></asp:Label>
                              <br />
                              <br />
                              <asp:TextBox ID="TxtB_Ph_num" runat="server" CssClass="form-control"></asp:TextBox>
                            <div class="invalid-feedback">
                              <asp:RequiredFieldValidator ID="ReqFVal_TxtB_Ph_num" runat="server" ErrorMessage="*Please fill in the phone number" ControlToValidate="TxtB_Ph_num" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                          </div>
                        </div>
                        <div class="row">
                          <div class="form-group col-md-6 col-12">
                              <asp:Label ID="Label5" runat="server" Text="Date Of Birth"></asp:Label>
                              <br />
                              <br />
                              <asp:TextBox ID="TxtB_DOB" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                            <div class="invalid-feedback">
                              <asp:RequiredFieldValidator ID="ReqFVal_TxtB_DOB" runat="server" ErrorMessage="*Please fill in the date of birth" ControlToValidate="TxtB_DOB" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                          </div>
                            <div class="form-group col-md-6 col-12">
                                <asp:Label ID="Label7" runat="server" Text="Password"></asp:Label>
                                <br />
                                <br />
                                <asp:TextBox ID="TxtB_Pwd" runat="server" CssClass="form-control"></asp:TextBox>
                                <div class="invalid-feedback">
                                  <asp:RequiredFieldValidator ID="ReqFVal_TxtB_Pwd" runat="server" ErrorMessage="*Please fill in the password" ControlToValidate="TxtB_Pwd" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                          <div class="form-group col-md-6 col-12">
                            <asp:Label ID="Label6" runat="server" Text="Profile Image"></asp:Label>
                            <br />
                            <br />
                            <asp:FileUpload ID="FUp_Profile_Image" runat="server" CssClass="form-control" />
                            <div class="invalid-feedback">
                                <asp:RequiredFieldValidator ID="ReqFVal_FUp_Profile_Image" runat="server" ErrorMessage="*Please select an image" ControlToValidate="FUp_Profile_Image" ForeColor="Red"></asp:RequiredFieldValidator>
                            </div>
                          </div>
                          <div class="form-group col-md-6 col-12">
                            <asp:Label ID="Label8" runat="server" Text="Qualification"></asp:Label>
                            <br />
                            <br />
                            <asp:TextBox ID="TxtB_Qualifi" runat="server" CssClass="form-control"></asp:TextBox>
                            <div class="invalid-feedback">
                                <asp:RequiredFieldValidator ID="ReqFVal_TxtB_Qualifi" runat="server" ErrorMessage="*Please fill in the qualification" ControlToValidate="TxtB_Qualifi" ForeColor="Red"></asp:RequiredFieldValidator>
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
