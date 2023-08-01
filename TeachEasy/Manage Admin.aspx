<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Manage Admin.aspx.cs" Inherits="TeachEasy.Manage_Admin" %>

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
        <div>

            <div>
            <asp:GridView ID="GridView1" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" CssClass="table table-striped">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                </Columns>
            </asp:GridView>
            <br />
            ID: <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
            <br />
            Name:
            <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"></asp:TextBox>
            <br />
            Password:
            <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Add_btn" runat="server" Text="ADD" OnClick="Add_btn_Click" CssClass="btn btn-success" />
&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Delete_btn" runat="server" OnClick="Delete_btn_Click" Text="DELETE" CssClass="btn btn-success" />
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="Update_btn" runat="server" Text="UPDATE" OnClick="Update_btn_Click" CssClass="btn btn-success" />
            <br />
            </div>

        </div>

    </form>
</body>
</html>
