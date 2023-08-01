<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="TeachEasy.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <!-- Required meta tags -->
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <!-- plugins:css -->
  <link rel="stylesheet" href="~/TE_CssClass_Files/vendors/feather/feather.css" />
  <link rel="stylesheet" href="~/TE_CssClass_Files/vendors/mdi/css/materialdesignicons.min.css" />
  <link rel="stylesheet" href="~/TE_CssClass_Files/vendors/ti-icons/css/themify-icons.css" />
  <link rel="stylesheet" href="~/TE_CssClass_Files/vendors/typicons/typicons.css" />
  <link rel="stylesheet" href="~/TE_CssClass_Files/vendors/simple-line-icons/css/simple-line-icons.css" />
  <link rel="stylesheet" href="~/TE_CssClass_Files/vendors/css/vendor.bundle.base.css" />
  <!-- endinject -->
  <!-- Plugin css for this page -->
  <link rel="stylesheet" href="~/TE_CssClass_Files/vendors/select2/select2.min.css" />
  <link rel="stylesheet" href="~/TE_CssClass_Files/vendors/select2-bootstrap-theme/select2-bootstrap.min.css" />
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="~/TE_CssClass_Files/css/vertical-layout-light/style.css" />
  <!-- endinject -->
  <link rel="shortcut icon" href="~/TE_CssClass_Files/images/favicon.png" />

</head>
<body>
    <form id="form1" runat="server">

        <div class="container-scroller">
            <div class="container-fluid page-body-wrapper full-page-wrapper">
              <div class="content-wrapper d-flex align-items-center auth px-0">
                <div class="row w-100 mx-0">
                  <div class="col-lg-4 mx-auto">
                    <div class="auth-form-light text-left py-5 px-4 px-sm-5">
                      <h4>Hello! let's get started</h4>
                      <h6 class="fw-light">Sign in to continue.</h6>
                        <br />
                        <br />
                        <div class="form-group">
                            <label for="exampleInputUsername1">Username</label>
                            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control form-control-lg"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Password</label>
                            <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control form-control-lg"></asp:TextBox>
                        </div>
                        <div class="mt-3">
                            <asp:Button ID="Button1" runat="server" Text="Sign-In" CssClass="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" OnClick="Button1_Click" />
                        </div>
                    </div>
                  </div>
                </div>
              </div>
              <!-- content-wrapper ends -->
            </div>
            <!-- page-body-wrapper ends -->
          </div>
          <!-- container-scroller -->
          <!-- plugins:js -->
          <script src="~/TE_CssClass_Files/vendors/js/vendor.bundle.base.js"></script>
          <!-- endinject -->
          <!-- Plugin js for this page -->
          <script src="~/TE_CssClass_Files/vendors/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
          <!-- End plugin js for this page -->
          <!-- inject:js -->
          <script src="~/TE_CssClass_Files/js/off-canvas.js"></script>
          <script src="~/TE_CssClass_Files/js/hoverable-collapse.js"></script>
          <script src="~/TE_CssClass_Files/js/template.js"></script>
          <script src="~/TE_CssClass_Files/js/settings.js"></script>
          <script src="~/TE_CssClass_Files/js/todolist.js"></script>
          <!-- endinject -->

    </form>
</body>
</html>
