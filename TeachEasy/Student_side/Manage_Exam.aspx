<%@ Page Title="" Language="C#" MasterPageFile="~/Student_side/Student_Master.Master" AutoEventWireup="true" CodeBehind="Manage_Exam.aspx.cs" Inherits="TeachEasy.Student_side.Manage_Exam" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="main-content" style="min-width: 1349px;">
        <section class="section">
            <div class="section-header">
                <h1>Exam</h1>
                <div class="section-header-breadcrumb">
                    <div class="breadcrumb-item active"><a href="Manage_Student.aspx">Home</a></div>
                    <div class="breadcrumb-item">Exam</div>
                </div>
            </div>

            <div class="section-body">
                <h2 class="section-title">Exam</h2>
                <p class="section-lead">
                    Here you can select exams or create and customize your own.
               
                </p>

                <asp:Panel ID="Pnl_Main" runat="server">
                    <div class="card">
                        <div class="card-header">
                            <h4>Select/Edit your Exam</h4>
                        </div>
                        <div class="card-body">
                            <asp:Panel ID="Pnl_Prepare_Exam" runat="server">
                                <div class="row">
                                    <%--Row-1--%>
                                    <div class="col-lg-12 col-lg-12 col-lg-12">
                                        <div class="card align-items-center">
                                            <div class="card-body">
                                                <b>Select type of Exam</b>
                                                <br />
                                                <asp:DropDownList ID="DrDoL_Select_Exam" runat="server" CssClass="form-control dropdown-lg" OnSelectedIndexChanged="DrDoL_Select_Exam_SelectedIndexChanged" AutoPostBack="True">
                                                    <asp:ListItem>Standard</asp:ListItem>
                                                    <asp:ListItem>Custom</asp:ListItem>
                                                </asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <asp:Panel ID="Pnl_Standard" runat="server">
                                    <div class="row">
                                        <%--Row-2--%>
                                        <div class="col-12">
                                            <div class="card align-items-center">
                                                <div class="card-body">
                                                    <b>Select any exam</b>
                                                    <br />
                                                    <asp:ListBox ID="LstB_Standard_Exam" runat="server" CssClass="form-control" data-height="100%" Style="height: 100%; width: 935px;" DataSourceID="SDS_Standard_Exam" DataTextField="Exam_Name" DataValueField="Exam_Id"></asp:ListBox>
                                                    <asp:SqlDataSource ID="SDS_Standard_Exam" runat="server" ConnectionString="<%$ ConnectionStrings:TeachEasy_database %>" SelectCommand="SELECT * FROM [Exam] WHERE ([Exam_Type] = @Exam_Type)">
                                                        <SelectParameters>
                                                            <asp:ControlParameter ControlID="DrDoL_Select_Exam" Name="Exam_Type" PropertyName="SelectedValue" Type="String" DefaultValue="Standard" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </div>
                                                <div class="card-footer">
                                                    <asp:Button ID="Btn_Start_Standard_Exam" runat="server" CssClass="btn btn-danger me-2 btn-lg" Style="height: 60px; width: 167px; font-size: 23px;" Text="Start Exam" OnClick="Btn_Start_Standard_Exam_Click" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </asp:Panel>
                                <asp:Panel ID="Pnl_Custom" runat="server" Visible="False">
                                    <div class="row">
                                        <%--Row-3--%>
                                        <div class="col-12 col-sm-4 col-sm-4">
                                            <div class="card align-items-center">
                                                <div class="card-body">
                                                    <b>Exam Name</b>
                                                    <br />
                                                    <asp:TextBox ID="TxtB_Exam_Name" runat="server" CssClass="form-control"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="card align-items-center">
                                                <div class="card-body">
                                                    <b>Total Marks</b>
                                                    <br />
                                                    <asp:TextBox ID="TxtB_Total_Marks" runat="server" CssClass="form-control">10</asp:TextBox>
                                                    <br />
                                                    <asp:RequiredFieldValidator ID="ReqFVal_TxtB_Total_Marks" runat="server" ErrorMessage="*Enter Total Marks" ControlToValidate="TxtB_Total_Marks" ForeColor="Red"></asp:RequiredFieldValidator><br />
                                                    <asp:RangeValidator ID="RangeVal_TxtB_Total_Marks" runat="server" ErrorMessage="Enter any number from 1 to 100." ControlToValidate="TxtB_Total_Marks" ForeColor="Red" MaximumValue="100" MinimumValue="1" Type="Integer"></asp:RangeValidator>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-4 col-sm-4">
                                            <%--<div class="content-wrapper">--%>
                                            <div class="card align-items-center">
                                                <div class="card-body">
                                                    <b>Select Subject</b>
                                                    <br />
                                                    <asp:DropDownList ID="DrDoL_Subject" runat="server" CssClass="form-control" DataSourceID="SDS_Subject" DataTextField="Subject_Name" DataValueField="Subject_ID" OnSelectedIndexChanged="DrDoL_Subject_SelectedIndexChanged" AutoPostBack="True" AppendDataBoundItems="True">
                                                        <asp:ListItem Value="NULL">--Select--</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:SqlDataSource ID="SDS_Subject" runat="server" ConnectionString="<%$ ConnectionStrings:TeachEasy_database %>" SelectCommand="SELECT * FROM [Subject]"></asp:SqlDataSource>
                                                </div>
                                            </div>
                                            <div class="card align-items-center">
                                                <div class="card-body">
                                                    <b>Select Unit</b>
                                                    <br />
                                                    <asp:DropDownList ID="DrDoL_Unit" runat="server" CssClass="form-control" OnSelectedIndexChanged="DrDoL_Unit_SelectedIndexChanged" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SDS_Unit" DataTextField="Unit_Name" DataValueField="Unit_Id">
                                                        <asp:ListItem Value="NULL">--Select--</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:SqlDataSource ID="SDS_Unit" runat="server" ConnectionString="<%$ ConnectionStrings:TeachEasy_database %>" SelectCommand="SELECT * FROM [Unit]"></asp:SqlDataSource>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12 col-sm-4 col-sm-4">
                                            <div class="card align-items-center">
                                                <div class="card-body">
                                                    <b>Select Difficulty Level</b>
                                                    <br />
                                                    <asp:DropDownList ID="DrDoL_Difficulty_Level" runat="server" CssClass="form-control">
                                                        <asp:ListItem Value="NULL">--Select--</asp:ListItem>
                                                        <asp:ListItem>Easy</asp:ListItem>
                                                        <asp:ListItem>Medium</asp:ListItem>
                                                        <asp:ListItem>Hard</asp:ListItem>
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                            <asp:Panel ID="Pnl_Unit_Exam" runat="server" Visible="False">
                                                <div class="card align-items-center">
                                                    <div class="card-body">
                                                        <asp:Button ID="Btn_Start_Exam_By_Unit" runat="server" CssClass="btn btn-danger me-2 btn-lg" Style="height: 60px; width: 167px; font-size: 23px;" Text="Start Exam" OnClick="Btn_Start_Exam_By_Unit_Click" />
                                                    </div>
                                                </div>
                                            </asp:Panel>
                                        </div>
                                    </div>
                                </asp:Panel>
                                <asp:Panel ID="Pnl_AskAddChapters" runat="server" Visible="False">
                                    <div class="row">
                                        <%--Row-4--%>
                                        <div class="col-12">
                                            <div class="card align-items-center">
                                                <div class="card-body">
                                                    <asp:Panel ID="Pnl_AskAddChapters_Part1" runat="server">
                                                        <h4>Want to Select Chapters?</h4>
                                                        <div class="btn-group btn-group-lg offset-3">
                                                            <asp:Button ID="Btn_AskAddChapters_YES" runat="server" CssClass="btn btn-primary" Text="Yes" OnClick="Btn_AskAddChapters_YES_Click" />
                                                            <asp:Button ID="Btn_AskAddChapters_NO" runat="server" CssClass="btn btn-secondary" Text="No" OnClick="Btn_AskAddChapters_NO_Click" />
                                                        </div>
                                                    </asp:Panel>
                                                    <asp:Panel ID="Pnl_AskAddChapters_Part2" runat="server" Visible="False">
                                                        <asp:Button ID="Btn_Start_Exam_By_Subject" runat="server" CssClass="btn btn-danger me-2 btn-lg" Style="height: 60px; width: 167px; font-size: 23px;" Text="Start Exam" OnClick="Btn_Start_Exam_By_Subject_Click" />
                                                    </asp:Panel>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </asp:Panel>
                                <asp:Panel ID="Pnl_ShowAddChapters" runat="server">
                                    <div class="row">
                                        <%--Row-5--%>
                                        <div class="col-12 col-lg-5">
                                            <div class="card">
                                                <div class="card-body">
                                                    <b>Select Chapters</b>
                                                    <br />
                                                    <asp:ListBox ID="LstB_Chapter" runat="server" CssClass="form-control" data-height="100%" Style="height: 184px; width: 350px" SelectionMode="Multiple"></asp:ListBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12 col-lg-2">
                                            <div class="card">
                                                <div class="card-body">
                                                    <asp:Button ID="Btn_Chapter_Move_All" runat="server" CssClass="btn btn-primary me-2 btn-md offset-1" Text="Add All" OnClick="Btn_Chapter_Move_All_Click" />
                                                    <br />
                                                    <br />
                                                    <asp:Button ID="Btn_Chapter_Move_Right" runat="server" CssClass="btn btn-primary me-2 btn-md offset-1" Style="height: 36px; width: 72px; font-size: 20px" Text=">>" OnClick="Btn_Chapter_Move_Right_Click" />
                                                    <br />
                                                    <br />
                                                    <asp:Button ID="Btn_Chapter_Move_Left" runat="server" CssClass="btn btn-primary me-2 btn-md offset-1" Style="height: 36px; width: 72px; font-size: 20px" Text="<<" OnClick="Btn_Chapter_Move_Left_Click" />
                                                    <br />
                                                    <br />
                                                    <asp:Button ID="Btn_Chapter_Remove_All" runat="server" CssClass="btn btn-primary me-2 btn-sm offset-1" Style="height: 36px; width: 72px;" Text="Clear All" OnClick="Btn_Chapter_Remove_All_Click" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12 col-lg-5">
                                            <div class="card">
                                                <div class="card-body">
                                                    <b>Chapters Selected</b>
                                                    <br />
                                                    <asp:ListBox ID="LstB_Selected_Chapters" runat="server" CssClass="form-control" data-height="100%" Style="height: 184px; width: 350px" SelectionMode="Multiple"></asp:ListBox>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </asp:Panel>
                                <asp:Panel ID="Pnl_AskAddTopics" runat="server" Visible="False">
                                    <div class="row">
                                        <%--Row-6--%>
                                        <div class="col-12">
                                            <div class="card align-items-center">
                                                <div class="card-body">
                                                    <asp:Panel ID="Pnl_AskAddTopics_Part1" runat="server">
                                                        <h4 style="text-align: center">Want to Select Topics?</h4>
                                                        <div class="btn-group btn-group-lg offset-3">
                                                            <asp:Button ID="Btn_AskAddTopics_YES" runat="server" CssClass="btn btn-primary" Text="Yes" OnClick="Btn_AskAddTopics_YES_Click" />
                                                            <asp:Button ID="Btn_AskAddTopics_NO" runat="server" CssClass="btn btn-secondary" Text="No" OnClick="Btn_AskAddTopics_NO_Click" />
                                                        </div>
                                                    </asp:Panel>
                                                    <asp:Panel ID="Pnl_AskAddTopics_Part2" runat="server" Visible="False">
                                                        <asp:Button ID="Btn_Start_Exam_By_Chapter" runat="server" CssClass="btn btn-danger me-2 btn-lg" Style="height: 60px; width: 167px; font-size: 23px;" Text="Start Exam" OnClick="Btn_Start_Exam_By_Chapter_Click" />
                                                    </asp:Panel>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </asp:Panel>
                                <asp:Panel ID="Pnl_ShowAddTopics" runat="server">
                                    <div class="row">
                                        <%--Row-7--%>
                                        <div class="col-12 col-lg-5">
                                            <div class="card">
                                                <div class="card-body">
                                                    <b style="text-align: left">Select Topic</b>
                                                    <br />
                                                    <asp:ListBox ID="LstB_Topic" runat="server" CssClass="form-control" data-height="100%" Style="height: 100%; width: 350px;" AppendDataBoundItems="True"></asp:ListBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12 col-lg-2">
                                            <div class="card">
                                                <div class="card-body">
                                                    <asp:Button ID="Btn_Topic_Move_All" runat="server" CssClass="btn btn-primary me-2 btn-md offset-1" Text="Add All" OnClick="Btn_Topic_Move_All_Click" />
                                                    <br />
                                                    <br />
                                                    <asp:Button ID="Btn_Topic_Move_Right" runat="server" CssClass="btn btn-primary me-2 btn-md offset-1" Style="height: 36px; width: 72px; font-size: 20px;" Text=">>" OnClick="Btn_Topic_Move_Right_Click" />
                                                    <br />
                                                    <br />
                                                    <asp:Button ID="Btn_Topic_Move_Left" runat="server" CssClass="btn btn-primary me-2 btn-md offset-1" Style="height: 36px; width: 72px; font-size: 20px;" Text="<<" OnClick="Btn_Topic_Move_Left_Click" />
                                                    <br />
                                                    <br />
                                                    <asp:Button ID="Btn_Topic_Remove_All" runat="server" CssClass="btn btn-primary me-2 btn-sm offset-1" Style="height: 36px; width: 72px;" Text="Clear All" OnClick="Btn_Topic_Remove_All_Click" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12 col-lg-5">
                                            <div class="card">
                                                <div class="card-body">
                                                    <b style="text-align: right">Topics Selected</b>
                                                    <br />
                                                    <asp:ListBox ID="LstB_Selected_Topics" runat="server" CssClass="form-control" data-height="100%" Style="height: 100%; width: 350px;" SelectionMode="Multiple"></asp:ListBox>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <asp:Button ID="Btn_Start_Exam_By_Topic" runat="server" CssClass="btn btn-danger me-2 btn-lg offset-5" Style="height: 60px; width: 167px; font-size: 23px;" Text="Start Exam" OnClick="Btn_Start_Exam_By_Topic_Click" />
                                </asp:Panel>
                            </asp:Panel>

                        </div>
                        <div class="card-footer bg-whitesmoke">
                            Best Of Luck.
                   
                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel ID="Pnl_Start_Exam" runat="server" Visible="False">
                    <div class="row">
                        <div class="col-12">
                            <div class="content-wrapper">
                                <asp:DataList ID="DL_Questions" runat="server">
                                    <ItemTemplate>
                                        <div class="card card-info">
                                            <div class="card-body">
                                                <%Response.Write(SerialNumber() + ") "); %>
                                                <asp:HiddenField ID="HdnF_Q_id" runat="server" Value='<%# Eval("Q_id") %>' />
                                                <asp:Label ID="Lbl_Ques" runat="server" Text='<%# Eval("Question") %>'></asp:Label>
                                                <br />
                                                <asp:Image ID="Img_Question_img" runat="server" ImageUrl='<%#Eval("Question_image") %>' Style="width: 987px;" />
                                                <br />
                                                <div class="float-left">
                                                    <asp:RadioButton ID="RaBut_Opt_A" runat="server" CssClass="form-check-input" GroupName="options" />
                                                    <asp:Label ID="Label2" runat="server" Text='<%#Eval("Option_A") %>'></asp:Label>
                                                    <asp:Image ID="Img_Opt_A_img" runat="server" ImageUrl='<%#Eval("Option_A_image") %>' GroupName="options" Style="width: 987px;" />
                                                    <br />
                                                    <asp:RadioButton ID="RaBut_Opt_B" runat="server" CssClass="form-check-input" GroupName="options" />
                                                    <asp:Label ID="Label3" runat="server" Text='<%#Eval("Option_B") %>'></asp:Label>
                                                    <asp:Image ID="Img_Opt_B_img" runat="server" ImageUrl='<%# Eval("Option_B_image") %>' GroupName="options" Style="width: 987px;" />
                                                    <br />
                                                    <asp:RadioButton ID="RaBut_Opt_C" runat="server" CssClass="form-check-input" GroupName="options" />
                                                    <asp:Label ID="Label4" runat="server" Text='<%#Eval("Option_C") %>'></asp:Label>
                                                    <asp:Image ID="Img_Opt_C_img" runat="server" ImageUrl='<%# Eval("Option_C_image") %>' GroupName="options" Style="width: 987px;" />
                                                    <br />
                                                    <asp:RadioButton ID="RaBut_Opt_D" runat="server" CssClass="form-check-input" GroupName="options" />
                                                    <asp:Label ID="Label5" runat="server" Text='<%#Eval("Option_D") %>'></asp:Label>
                                                    <asp:Image ID="Img_Opt_D_img" runat="server" ImageUrl='<%# Eval("Option_D_image") %>' GroupName="options" Style="width: 987px;" />
                                                    <br />
                                                    <br />
                                                    <asp:Label ID="Label1" runat="server" Text='<%#Eval("Correct_option") %>'></asp:Label>
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:DataList>
                                <div class="card">
                                    <div class="card-body">
                                        <asp:Button ID="Btn_Submit_Exam" runat="server" Text="Submit" CssClass="btn btn-success btn-lg" OnClick="Btn_Submit_Exam_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </asp:Panel>
                <asp:Panel ID="Pnl_Exam_Finished" runat="server" Visible="False">
                    <div class="col-12 mb-4">
                        <div class="hero align-items-center bg-success text-white">
                            <div class="hero-inner text-center">
                                <h1>
                                    <asp:Label ID="Lbl_Wishing_Word" runat="server" Text=""></asp:Label></h1>
                                <p class="lead">
                                    You have successfully completed your exam.<br />
                                    Here is your result.
                                </p>
                                <h2>
                                    <asp:Label ID="Lbl_Obtained_Marks" runat="server" Text=""></asp:Label></h2>
                                <div class="mt-4">
                                    <a href="Manage_Student.aspx" class="btn btn-outline-white btn-lg btn-icon icon-left"><i class="fas fa-sign-in-alt"></i>Home</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </asp:Panel>
                <!-- content-wrapper ends -->
                <!-- partial -->
            </div>
        </section>
    </div>
</asp:Content>
