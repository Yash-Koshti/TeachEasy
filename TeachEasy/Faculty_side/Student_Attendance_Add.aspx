<%@ Page Title="" Language="C#" MasterPageFile="~/Faculty_side/Faculty_Master.Master" AutoEventWireup="true" CodeBehind="Student_Attendance_Add.aspx.cs" Inherits="TeachEasy.Faculty_side.Student_AttendanceAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="main-content" style="min-width: 1349px;">
        <section class="section">
            <div class="section-header">
                <div class="section-header-back">
                    <a href="Manage_Student_Attendance.aspx" class="btn btn-icon"><i class="fas fa-arrow-left"></i></a>
                </div>
                <h1>Add New Student Attendance</h1>
                <div class="section-header-breadcrumb">
                    <div class="breadcrumb-item active"><a href="Manage_Faculty.aspx">Home</a></div>
                    <div class="breadcrumb-item"><a href="Manage_Student_Attendance.aspx">Student Attendance</a></div>
                    <div class="breadcrumb-item">Add New Student Attendance</div>
                </div>
            </div>

            <div class="section-body">
                <h2 class="section-title">Add New Student Attendance</h2>
                <p class="section-lead">
                    On this page you can add a new student attendance and fill in all fields.
           
                </p>

                <div class="row">
                    <div class="col-12 col-md-7">
                        <div class="card">
                            <div class="card-header">
                                <h4>Write Student Attendance Details</h4>
                            </div>
                            <div class="card-body">
                                <div class="form-group row mb-4">
                                    <asp:Label ID="Label2" runat="server" CssClass="col-form-label text-md-right col-12 col-md-3 col-lg-3" Text="Select Semester"></asp:Label>
                                    <div class="col-sm-12 col-md-7">
                                        <asp:DropDownList ID="DrDoL_Semester" runat="server" CssClass="form-control selectric" AppendDataBoundItems="True" DataSourceID="SDS_Semester" DataTextField="Semester" DataValueField="Sem_id" AutoPostBack="True" OnSelectedIndexChanged="DrDoL_Semester_SelectedIndexChanged">
                                            <asp:ListItem Value="NULL">--Select--</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SDS_Semester" runat="server" ConnectionString="<%$ ConnectionStrings:TeachEasy_database %>" SelectCommand="SELECT [Sem_id], [Semester] FROM [Faculty_Subject_View] WHERE ([Fac_Id] = @Fac_Id)">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="Fac_Id" SessionField="Fac_Id" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </div>
                                </div>
                                <div class="form-group row mb-4">
                                    <asp:Label ID="Label3" runat="server" CssClass="col-form-label text-md-right col-12 col-md-3 col-lg-3" Text="Month"></asp:Label>
                                    <div class="col-sm-12 col-md-7">
                                        <asp:DropDownList ID="DrDoL_Month" runat="server" CssClass="form-control selectric">
                                            <asp:ListItem Value="NULL">--Select--</asp:ListItem>
                                            <asp:ListItem Value="1">January</asp:ListItem>
                                            <asp:ListItem Value="2">February</asp:ListItem>
                                            <asp:ListItem Value="3">March</asp:ListItem>
                                            <asp:ListItem Value="4">April</asp:ListItem>
                                            <asp:ListItem Value="5">May</asp:ListItem>
                                            <asp:ListItem Value="6">June</asp:ListItem>
                                            <asp:ListItem Value="7">July</asp:ListItem>
                                            <asp:ListItem Value="8">August</asp:ListItem>
                                            <asp:ListItem Value="9">September</asp:ListItem>
                                            <asp:ListItem Value="10">October</asp:ListItem>
                                            <asp:ListItem Value="11">November</asp:ListItem>
                                            <asp:ListItem Value="12">December</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="form-group row mb-4">
                                    <asp:Label ID="Label1" runat="server" CssClass="col-form-label text-md-right col-12 col-md-3 col-lg-3" Text="Select Subject"></asp:Label>
                                    <div class="col-sm-12 col-md-7">
                                        <asp:DropDownList ID="DrDoL_FS" runat="server" CssClass="form-control selectric" DataSourceID="SDS_FS" DataTextField="Subject_Name" DataValueField="FS_Id" AppendDataBoundItems="True">
                                            <asp:ListItem Value="NULL">--Select--</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SDS_FS" runat="server" ConnectionString="<%$ ConnectionStrings:TeachEasy_database %>" SelectCommand="SELECT * FROM [Faculty_Subject_View] WHERE ([Fac_Id] = @Fac_Id)">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="Fac_Id" SessionField="Fac_Id" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </div>
                                </div>
                                <div class="form-group row mb-4">
                                    <asp:Label ID="Label4" runat="server" CssClass="col-form-label text-md-right col-12 col-md-3 col-lg-3" Text="Total Lectures"></asp:Label>
                                    <div class="col-sm-12 col-md-7">
                                        <asp:TextBox ID="TxtB_Total_Lec" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-md-5">
                        <div class="card">
                            <div class="card-header">
                                <h4>Enter Present Lectures for each Student</h4>
                            </div>
                            <div class="card-body p-0">
                                <div class="table-responsive">
                                    <asp:GridView ID="GrV_Attendance_Table" runat="server" CssClass="table table-striped table-md" GridLines="None">
                                        <Columns>
                                            <asp:TemplateField HeaderText="Present Lectures">
                                                <ItemTemplate>
                                                    <asp:TextBox ID="TxtB_Present_Lec" runat="server" CssClass="form-control" TextMode="Number" Width="110px"></asp:TextBox>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </div>
                            <div class="card-footer">
                                <div class="form-group row mb-4">
                                    <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3 offset-1"></label>
                                    <div class="col-sm-12 col-md-7">
                                        <asp:Button ID="Add_btn" runat="server" Text="SUBMIT" OnClick="Add_btn_Click" CssClass="btn btn-primary offset-1" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</asp:Content>
