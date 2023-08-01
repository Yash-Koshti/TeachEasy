<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add New Data.aspx.cs" Inherits="TeachEasy.Add_New_Data" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
                INSERT NEW DATA :-<br />
                <br />
                Name:
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                <br />
                Profile Image:
                <asp:FileUpload ID="FileUpload1" runat="server" />
                <br />
                E-mail:
                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                <br />
                Ph No.:
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                <br />
                Gender:
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatColumns="3">
                    <asp:ListItem Value="M">Male</asp:ListItem>
                    <asp:ListItem Value="F">Female</asp:ListItem>
                    <asp:ListItem Value="O">Other</asp:ListItem>
                </asp:RadioButtonList>
                <br />
                DOB:
                <asp:Calendar ID="Calendar1" runat="server" FirstDayOfWeek="Sunday"></asp:Calendar>
                <br />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="SUBMIT" />
                <br />
            <br />
            <asp:Panel ID="Panel1" runat="server">
                <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                    </Columns>
                    <FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
                    <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
                    <RowStyle BackColor="#DEDFDE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#594B9C" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#33276A" />
                </asp:GridView>
                <br />
                <asp:Label ID="Label1" runat="server" Text="To delete select the row."></asp:Label>
                </asp:Panel>
        </div>
    </form>
</body>
</html>
