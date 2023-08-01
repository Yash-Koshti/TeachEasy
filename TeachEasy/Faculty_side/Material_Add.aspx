<%@ Page Title="" Language="C#" MasterPageFile="~/Faculty_side/Faculty_Master.Master" AutoEventWireup="true" CodeBehind="Material_Add.aspx.cs" Inherits="TeachEasy.Faculty_side.MaterialAdd" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="main-content">
        <section class="section">
          <div class="section-header">
            <div class="section-header-back">
              <a href="Manage_Material.aspx" class="btn btn-icon"><i class="fas fa-arrow-left"></i></a>
            </div>
            <h1>Upload New Material</h1>
            <div class="section-header-breadcrumb">
              <div class="breadcrumb-item active"><a href="Manage_Faculty.aspx">Home</a></div>
              <div class="breadcrumb-item"><a href="Manage_Material.aspx">Material</a></div>
              <div class="breadcrumb-item">Upload New Material</div>
            </div>
          </div>

          <div class="section-body">
            <h2 class="section-title">Upload New Material</h2>
            <p class="section-lead">
              On this page you can upload a new material and fill in all fields.
            </p>

            <div class="row">
              <div class="col-12">
                <div class="card">
                  <div class="card-header">
                    <h4>Write Material Details</h4>
                  </div>
                  <div class="card-body">
                    <div class="form-group row mb-4">
                      <asp:Label ID="Label1" runat="server" CssClass="col-form-label text-md-right col-12 col-md-3 col-lg-3" Text="Title"></asp:Label>
                      <div class="col-sm-12 col-md-7">
                        <asp:TextBox ID="TxtB_Title" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                      </div>
                    </div>
                    <div class="form-group row mb-4">
                      <asp:Label ID="Label2" runat="server" CssClass="col-form-label text-md-right col-12 col-md-3 col-lg-3" Text="Material Type"></asp:Label>
                      <div class="col-sm-12 col-md-7">
                        <asp:DropDownList ID="DrDoL_M_Type" runat="server" CssClass="form-control selectric" AutoPostBack="True">
                              <asp:ListItem Value="--Select--">--Select--</asp:ListItem>
                              <asp:ListItem>Video</asp:ListItem>
                              <asp:ListItem>PDF</asp:ListItem>
                          </asp:DropDownList>
                          <asp:RequiredFieldValidator ID="ReqFVal_DrDoL_M_Type" runat="server" ErrorMessage="*Please select material type" ControlToValidate="DrDoL_M_Type" SetFocusOnError="True" InitialValue="--Select--"></asp:RequiredFieldValidator>
                         
                      </div>
                    </div>
                    <div class="form-group row mb-4">
                          <div class="row">
                              <div class="col-12 col-sm-2 col-sm-2">
                                <asp:Label ID="Label3" runat="server" CssClass="col-form-label text-md-right col-12 col-md-3 col-lg-3" Text="Select Semester"></asp:Label>
                                <asp:DropDownList ID="DrDoL_Semester" runat="server" CssClass="form-control selectric" DataSourceID="SDS_Semester" DataTextField="Semester" DataValueField="Sem_id" AutoPostBack="True" OnSelectedIndexChanged="DrDoL_Semester_SelectedIndexChanged" AppendDataBoundItems="True">
                                    <asp:ListItem Value="NULL">--Select--</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SDS_Semester" runat="server" ConnectionString="<%$ ConnectionStrings:TeachEasy_database %>" SelectCommand="SELECT * FROM [Semester]"></asp:SqlDataSource>
                                  <asp:RequiredFieldValidator ID="ReqFVal_DrDoL_Semester" runat="server" ErrorMessage="*Please select semester" ControlToValidate="DrDoL_Semester" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                  <br />          
                              </div>
                        <%--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>
                              <div class="col-12 col-sm-2 col-sm-2">          
                                <asp:Label ID="Label4" runat="server" CssClass="col-form-label text-md-right col-12 col-md-3 col-lg-3" Text="Select Subject"></asp:Label>
                                <asp:DropDownList ID="DrDoL_Subject" runat="server" CssClass="form-control selectric" DataSourceID="SDS_Subject" DataTextField="Subject_Name" DataValueField="Subject_ID" AutoPostBack="True" OnSelectedIndexChanged="DrDoL_Subject_SelectedIndexChanged" AppendDataBoundItems="True">
                                    <asp:ListItem Value="NULL">--Select--</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SDS_Subject" runat="server" ConnectionString="<%$ ConnectionStrings:TeachEasy_database %>" SelectCommand="SELECT * FROM [Subject]"></asp:SqlDataSource>
                              </div>
                                        
                        <%--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>
                              <div class="col-12 col-sm-2 col-sm-2">
                                <asp:Label ID="Label5" runat="server" CssClass="col-form-label text-md-right col-12 col-md-3 col-lg-3" Text="Select Unit"></asp:Label>
                                <asp:DropDownList ID="DrDoL_Unit" runat="server" CssClass="form-control selectric" DataSourceID="SDS_Unit" DataTextField="Unit_Name" DataValueField="Unit_Id" AutoPostBack="True" OnSelectedIndexChanged="DrDoL_Unit_SelectedIndexChanged" AppendDataBoundItems="True">
                                    <asp:ListItem Value="NULL">--Select--</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SDS_Unit" runat="server" ConnectionString="<%$ ConnectionStrings:TeachEasy_database %>" SelectCommand="SELECT * FROM [Unit]"></asp:SqlDataSource>
                              </div>
                              <div class="col-12 col-sm-3 col-sm-3">
                                <asp:Label ID="Label6" runat="server" CssClass="col-form-label text-md-right col-12 col-md-3 col-lg-3" Text="Select Chapter"></asp:Label>
                                <asp:DropDownList ID="DrDoL_Chapter" runat="server" CssClass="form-control selectric" DataSourceID="SDS_Chapter" DataTextField="Ch_title" DataValueField="Ch_Id" AutoPostBack="True" OnSelectedIndexChanged="DrDoL_Chapter_SelectedIndexChanged" AppendDataBoundItems="True">
                                    <asp:ListItem Value="NULL">--Select--</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SDS_Chapter" runat="server" ConnectionString="<%$ ConnectionStrings:TeachEasy_database %>" SelectCommand="SELECT * FROM [Chapter]"></asp:SqlDataSource>
                              </div>          
                        <%--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;--%>
                              <div class="col-12 col-sm-3 col-sm-3">
                                <asp:Label ID="Label7" runat="server" CssClass="col-form-label text-md-right col-12 col-md-3 col-lg-3" Text="Select Topic"></asp:Label>
                                <asp:DropDownList ID="DrDoL_Topic" runat="server" CssClass="form-control selectric" DataSourceID="SDS_Topic" DataTextField="Topic_name" DataValueField="Topic_Id" AppendDataBoundItems="True">
                                    <asp:ListItem Value="NULL">--Select--</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SDS_Topic" runat="server" ConnectionString="<%$ ConnectionStrings:TeachEasy_database %>" SelectCommand="SELECT * FROM [Topic]"></asp:SqlDataSource>
                              </div>
                          </div>
                    </div>
                    <div class="form-group row mb-4">
                      <asp:Label ID="Label8" runat="server" CssClass="col-form-label text-md-right col-12 col-md-3 col-lg-3" Text="Select File"></asp:Label>
                      <div class="col-sm-12 col-md-7">
                        <asp:FileUpload ID="FUp_Material" runat="server" CssClass="form-control" />                        
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
