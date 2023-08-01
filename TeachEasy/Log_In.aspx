<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Log_In.aspx.cs" Inherits="TeachEasy.Log_in" %>

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
            <div class="container-fluid page-body-wrapper full-page-wrapper">
                <div class="content-wrapper d-flex align-items-center auth px-0">
                    <div class="row w-100 mx-0">
                        <div class="col-lg-4 mx-auto">
                            <div class="auth-form-light text-left py-5 px-4 px-sm-5">
                                <h2 class="text-center">Hello!</h2>
                                <br />
                                <h5 class="text-center">let's get started</h5>
                                <h5 class="fw-light text-center">Sign in to continue.</h5>
                                <br />
                                <div class="form-group dropdown">
                                    <label for="exampleInputPassword1">Select Role <b class="ti-user"></b></label>
                                    <br />
                                    <asp:DropDownList ID="DrDoL_User_Type" runat="server" CssClass="btn btn-info dropdown-toggle btn-sm" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="DrDoL_User_Type_SelectedIndexChanged" Style="color: white;">
                                        <asp:ListItem Value="NULL">--Select--</asp:ListItem>
                                        <asp:ListItem >Faculty</asp:ListItem>
                                        <asp:ListItem >Student</asp:ListItem><%--Selected="True"--%>
                                    </asp:DropDownList>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputUsername1">User Name</label>
                                    <asp:TextBox ID="TxtB_Uname" runat="server" CssClass="form-control form-control-lg">E</asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RFV_Uname" runat="server" ErrorMessage="*Please enter User Name" ControlToValidate="TxtB_Uname" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <asp:TextBox ID="TxtB_Pwd" runat="server" CssClass="form-control form-control-lg" TextMode="SingleLine">teacheasy</asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RFV_Pwd" runat="server" ErrorMessage="*Please enter Password" ControlToValidate="TxtB_Pwd" ForeColor="Red"></asp:RequiredFieldValidator>
                                </div>
                                <div class="mt-3 text-center">
                                    <asp:Button ID="Btn_Sign_in" runat="server" Text="Sign-In" CssClass="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" OnClick="Btn_Sign_in_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- content-wrapper ends -->
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
