<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Student_Add.aspx.cs" Inherits="TeachEasy.Student_side.Student_Add" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <!-- Required meta tags -->
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <!-- plugins:css -->
  <link rel="stylesheet" href="../TE_CssClass_Files/vendors/feather/feather.css" />
  <link rel="stylesheet" href="../TE_CssClass_Files/vendors/mdi/css/materialdesignicons.min.css" />
  <link rel="stylesheet" href="../TE_CssClass_Files/vendors/ti-icons/css/themify-icons.css" />
  <link rel="stylesheet" href="../TE_CssClass_Files/vendors/typicons/typicons.css" />
  <link rel="stylesheet" href="../TE_CssClass_Files/vendors/simple-line-icons/css/simple-line-icons.css" />
  <link rel="stylesheet" href="../TE_CssClass_Files/vendors/css/vendor.bundle.base.css" />
  <!-- endinject -->
  <!-- Plugin css for this page -->
  <link rel="stylesheet" href="../TE_CssClass_Files/vendors/select2/select2.min.css" />
  <link rel="stylesheet" href="../TE_CssClass_Files/vendors/select2-bootstrap-theme/select2-bootstrap.min.css" />
  <!-- End plugin css for this page -->
  <!-- inject:css -->
  <link rel="stylesheet" href="../TE_CssClass_Files/css/vertical-layout-light/style.css" />
  <!-- endinject -->
  <link rel="shortcut icon" href="../TE_CssClass_Files/images/favicon.png" />

</head>
<body>
    <form id="form1" runat="server">
        <div class="container-scroller">
            <nav class="navbar default-layout col-lg-12 col-12 p-0 fixed-top d-flex align-items-top flex-row">
              <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-start">
                <div class="me-3">
                  <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-bs-toggle="minimize">
                    <span class="icon-menu"></span>
                  </button>
                </div>
                <div>
                  <h3><b>TeachEasy</b></h3>
                </div>
              </div>
              <div class="navbar-menu-wrapper d-flex align-items-top"> 
                <ul class="navbar-nav">
                  <li class="nav-item font-weight-semibold d-none d-lg-block ms-0">
                    <h1 class="welcome-text">Hello, <span class="text-black fw-bold">Admin</span></h1>
                  </li>
                </ul>
                

              </div>
            </nav>
            <!-- partial -->
            <div class="container-fluid page-body-wrapper">
              <!-- partial:../../partials/_settings-panel.html -->
              <div id="right-sidebar" class="settings-panel">
                <i class="settings-close ti-close"></i>
                
                <div class="tab-content" id="setting-content">
                  
                  <!-- To do section tab ends -->
                  
                  <!-- chat tab ends -->
                </div>
              </div>
              <!-- partial -->
              <!-- partial:../../partials/_sidebar.html -->
              <nav class="sidebar sidebar-offcanvas" id="sidebar">
                <ul class="nav">
                  <li class="nav-item">
                    <a class="nav-link" href="Manage_Student.aspx">
                      <i class="mdi mdi-grid-large menu-icon"></i>
                      <span class="menu-title">Dashboard</span>
                    </a>
                  </li>

                  <li class="nav-item nav-category">pages</li>
                  <li class="nav-item">
                    <a class="nav-link" id="down-usr-page" data-bs-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth">
                      <i class="menu-icon mdi mdi-account-circle-outline"></i>
                      <span class="menu-title">User Pages</span>
                      <i class="menu-arrow"></i>
                    </a>
                    <div class="collapse down-usr-page1" id="auth">
                      <ul class="nav flex-column sub-menu">
                        <li class="nav-item"> <a class="nav-link" href="../Log_In.aspx"> Login </a></li>
                        <li class="nav-item"> <a class="nav-link" href="../Admin_side/Manage_Admin.aspx"> Admin </a></li>
                        <li class="nav-item"> <a class="nav-link" href="../Faculty_side/Manage_Faculty.aspx"> Faculty </a></li>
                        <li class="nav-item"> <a class="nav-link" href="Manage_Student.aspx"> Student </a></li>
                        <li class="nav-item"> <a class="nav-link" href="../Semester/Manage_Semester.aspx"> Semester </a></li>
                        <li class="nav-item"> <a class="nav-link" href="../Unit/Manage_Unit.aspx"> Unit </a></li>
                      </ul>
                    </div>
                  </li>
                  
                </ul>
              </nav>
              <!-- partial -->
              <div class="main-panel">
                <div class="content-wrapper">
                        <div class="col-md-6 grid-margin stretch-card">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Add Student Details</h4>
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
                                        <asp:Label ID="Label4" runat="server" Text="Gender"></asp:Label>
                                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" CssClass="form-check-input" RepeatColumns="3">
                                            <asp:ListItem Value="M">Male</asp:ListItem>
                                            <asp:ListItem Value="F">Female</asp:ListItem>
                                            <asp:ListItem Value="O">Other</asp:ListItem>
                                        </asp:RadioButtonList>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="Label5" runat="server" Text="Date Of Birth"></asp:Label>
                                        <asp:TextBox ID="TextBox4" runat="server" TextMode="Date"></asp:TextBox>
                                    </div>
                                    <div class="form-group">
                                        <asp:Label ID="Label6" runat="server" Text="Profile Image"></asp:Label>
                                        <asp:FileUpload ID="FileUpload1" runat="server" />
                                    </div>
                                    <asp:Button ID="Add_btn" runat="server" Text="SUBMIT" OnClick="Add_btn_Click" CssClass="btn btn-primary me-2" />
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
              <!-- main-panel ends -->
            </div>
            <!-- page-body-wrapper ends -->
          </div>


    </form>

    <!-- container-scroller -->
    <!-- plugins:js -->
    <script src="../TE_CssClass_Files/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <script src="../TE_CssClass_Files/vendors/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="../TE_CssClass_Files/js/off-canvas.js"></script>
    <script src="../TE_CssClass_Files/js/hoverable-collapse.js"></script>
    <script src="../TE_CssClass_Files/js/template.js"></script>
    <script src="../TE_CssClass_Files/js/settings.js"></script>
    <script src="../TE_CssClass_Files/js/todolist.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page-->
    <!-- End custom js for this page-->
</body>
</html>
