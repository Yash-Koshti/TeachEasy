<%@ Page Title="" Language="C#" MasterPageFile="~/Faculty_side/Faculty_Master.Master" AutoEventWireup="true" CodeBehind="Question_Bank_Add.aspx.cs" Inherits="TeachEasy.Faculty_side.Question_Bank_Add" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="main-content">
        <section class="section">
          <div class="section-header">
            <div class="section-header-back">
              <a href="Manage_Question_Bank.aspx" class="btn btn-icon"><i class="fas fa-arrow-left"></i></a>
            </div>
            <h1>Upload New Question</h1>
            <div class="section-header-breadcrumb">
              <div class="breadcrumb-item active"><a href="Manage_Faculty.aspx">Home</a></div>
              <div class="breadcrumb-item"><a href="Manage_Question_Bank.aspx">Question Bank</a></div>
              <div class="breadcrumb-item">Upload New Question</div>
            </div>
          </div>

          <div class="section-body">
            <h2 class="section-title">Upload New Question</h2>
            <p class="section-lead">
              On this page you can upload a new Question and fill in all fields.
            </p>

            <div class="row">
              <div class="col-12">
                <div class="card">
                  <div class="card-header">
                    <h4>Write Question Details</h4>
                  </div>
                  <div class="card-body">
                    <div class="form-group row mb-4">
                          <div class="row offset-1">
                              <div class="col-12 col-md-4 col-lg-2">          
                                <asp:Label ID="Label4" runat="server" CssClass="col-form-label text-md-right col-12 col-md-3 col-lg-3" Text="Select Subject"></asp:Label>
                                <asp:DropDownList ID="DrDoL_Subject" runat="server" CssClass="form-control selectric" DataSourceID="SDS_Subject" DataTextField="Subject_Name" DataValueField="Subject_ID" AutoPostBack="True" OnSelectedIndexChanged="DrDoL_Subject_SelectedIndexChanged" AppendDataBoundItems="True">
                                    <asp:ListItem Value="NULL">--Select--</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SDS_Subject" runat="server" ConnectionString="<%$ ConnectionStrings:TeachEasy_database %>" SelectCommand="SELECT * FROM [Subject]"></asp:SqlDataSource>
                              </div>
                                        
                        <%--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>
                              <div class="col-12 col-md-4 col-lg-2">
                                <asp:Label ID="Label5" runat="server" CssClass="col-form-label text-md-right col-12 col-md-3 col-lg-3" Text="Select Unit"></asp:Label>
                                  <br />
                                <asp:DropDownList ID="DrDoL_Unit" runat="server" CssClass="form-control selectric" DataSourceID="SDS_Unit" DataTextField="Unit_Name" DataValueField="Unit_Id" AutoPostBack="True" OnSelectedIndexChanged="DrDoL_Unit_SelectedIndexChanged" AppendDataBoundItems="True">
                                    <asp:ListItem Value="NULL">--Select--</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SDS_Unit" runat="server" ConnectionString="<%$ ConnectionStrings:TeachEasy_database %>" SelectCommand="SELECT * FROM [Unit]"></asp:SqlDataSource>
                              </div>
                              <div class="col-12 col-md-8 col-lg-4">
                                <asp:Label ID="Label6" runat="server" CssClass="col-form-label text-md-right col-12 col-md-3 col-lg-3" Text="Select Chapter"></asp:Label>
                                <asp:DropDownList ID="DrDoL_Chapter" runat="server" CssClass="form-control selectric" DataSourceID="SDS_Chapter" DataTextField="Ch_title" DataValueField="Ch_Id" AutoPostBack="True" OnSelectedIndexChanged="DrDoL_Chapter_SelectedIndexChanged" AppendDataBoundItems="True">
                                    <asp:ListItem Value="NULL">--Select--</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SDS_Chapter" runat="server" ConnectionString="<%$ ConnectionStrings:TeachEasy_database %>" SelectCommand="SELECT * FROM [Chapter]"></asp:SqlDataSource>
                              </div>          
                        <%--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>
                              <div class="col-12 col-md-8 col-lg-3">
                                <asp:Label ID="Label7" runat="server" CssClass="col-form-label text-md-right col-12 col-md-3 col-lg-3" Text="Select Topic"></asp:Label>
                                <asp:DropDownList ID="DrDoL_Topic" runat="server" CssClass="form-control selectric" DataSourceID="SDS_Topic" DataTextField="Topic_name" DataValueField="Topic_Id" AppendDataBoundItems="True">
                                    <asp:ListItem Value="NULL">--Select--</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SDS_Topic" runat="server" ConnectionString="<%$ ConnectionStrings:TeachEasy_database %>" SelectCommand="SELECT * FROM [Topic]"></asp:SqlDataSource>
                              </div>
                          </div>
                    </div>
                    <div class="form-group row mb-4">
                      <asp:Label ID="Label1" runat="server" CssClass="col-form-label text-md-right col-12 col-md-3 col-lg-3" Text="Question"></asp:Label>
                      <div class="col-sm-12 col-md-7">
                        <asp:TextBox ID="TxtB_Question" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                      </div>
                    </div>
                    <div class="form-group row mb-4">
                      <asp:Label ID="Label2" runat="server" CssClass="col-form-label text-md-right col-12 col-md-3 col-lg-3" Text="Question Image"></asp:Label>
                      <div class="col-sm-12 col-md-7">
                        <asp:FileUpload ID="FUp_QI" runat="server" CssClass="form-control" />
                        <asp:Image ID="Img_Question" runat="server" />                        
                      </div>
                    </div>
                    <div class="form-group row mb-4">
                      <asp:Label ID="Label8" runat="server" CssClass="col-form-label text-md-right col-12 col-md-3 col-lg-3" Text="Option A"></asp:Label>
                      <div class="col-sm-12 col-md-7">
                        <asp:TextBox ID="TxtB_Op_A" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>                        
                      </div>
                    </div>
                    <div class="form-group row mb-4">
                        <asp:Label ID="Label3" runat="server" CssClass="col-form-label text-md-right col-12 col-md-3 col-lg-3" Text="Option A Image"></asp:Label>
                        <div class="col-sm-12 col-md-7">
                            <asp:FileUpload ID="FUp_Op_A" runat="server" CssClass="form-control"  />
                            <asp:Image ID="Img_Op_A" runat="server" />
                        </div>
                    </div>
                    <div class="form-group row mb-4">
                        <asp:Label ID="Label9" runat="server" CssClass="col-form-label text-md-right col-12 col-md-3 col-lg-3" Text="Option B"></asp:Label>
                        <div class="col-sm-12 col-md-7">
                            <asp:TextBox ID="TxtB_Op_B" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group row mb-4">
                        <asp:Label ID="Label10" runat="server" CssClass="col-form-label text-md-right col-12 col-md-3 col-lg-3" Text="Option B Image"></asp:Label>
                        <div class="col-sm-12 col-md-7">
                            <asp:FileUpload ID="FUp_Op_B" runat="server" CssClass="form-control"  />
                            <asp:Image ID="Img_Op_B" runat="server" />
                        </div>
                    </div>
                    <div class="form-group row mb-4">
                        <asp:Label ID="Label11" runat="server" CssClass="col-form-label text-md-right col-12 col-md-3 col-lg-3" Text="Option C"></asp:Label>
                        <div class="col-sm-12 col-md-7">
                            <asp:TextBox ID="TxtB_Op_C" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group row mb-4">
                        <asp:Label ID="Label12" runat="server" CssClass="col-form-label text-md-right col-12 col-md-3 col-lg-3" Text="Option C Image"></asp:Label>
                        <div class="col-sm-12 col-md-7">
                            <asp:FileUpload ID="FUp_Op_C" runat="server" CssClass="form-control"  />
                            <asp:Image ID="Img_Op_C" runat="server" />
                        </div>
                    </div>
                    <div class="form-group row mb-4">
                        <asp:Label ID="Label13" runat="server" CssClass="col-form-label text-md-right col-12 col-md-3 col-lg-3" Text="Option D"></asp:Label>
                        <div class="col-sm-12 col-md-7">
                            <asp:TextBox ID="TxtB_Op_D" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group row mb-4">
                        <asp:Label ID="Label14" runat="server" CssClass="col-form-label text-md-right col-12 col-md-3 col-lg-3" Text="Option D Image"></asp:Label>
                        <div class="col-sm-12 col-md-7">
                            <asp:FileUpload ID="FUp_Op_D" runat="server" CssClass="form-control"  />
                            <asp:Image ID="Img_Op_D" runat="server" />
                        </div>
                    </div>
                    <div class="form-group row mb-4">
                        <asp:Label ID="Label15" runat="server" CssClass="col-form-label text-md-right col-12 col-md-3 col-lg-3" Text="Difficulty Level"></asp:Label>
                        <div class="col-sm-12 col-md-7">
                            <asp:RadioButtonList ID="RaBuL_Dif_Lvl" runat="server" CssClass="form-check-input" RepeatColumns="3" CellPadding="7">
                                <asp:ListItem Value="Easy">Easy</asp:ListItem>
                                <asp:ListItem Value="Medium">Medium</asp:ListItem>
                                <asp:ListItem Value="Hard">Hard</asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                    </div>
                    <div class="form-group row mb-4">
                        <asp:Label ID="Label16" runat="server" CssClass="col-form-label text-md-right col-12 col-md-3 col-lg-3" Text="Correct Option"></asp:Label>
                        <div class="col-sm-12 col-md-7">
                            <asp:RadioButtonList ID="RaBuL_Co_Op" runat="server" CssClass="form-check-input" RepeatColumns="4" CellPadding="7">
                                <asp:ListItem>A</asp:ListItem>
                                <asp:ListItem>B</asp:ListItem>
                                <asp:ListItem>C</asp:ListItem>
                                <asp:ListItem>D</asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                    </div>
                    <div class="form-group row mb-4">
                      <label class="col-form-label text-md-right col-12 col-md-3 col-lg-3"></label>
                      <div class="col-sm-12 col-md-7">
                        <asp:Button ID="Add_btn" runat="server" Text="SUBMIT" CssClass="btn btn-primary" OnClick="Add_btn_Click" />
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
