<%@ Page Title="" Language="C#" MasterPageFile="~/Student_side/Student_Master.Master" AutoEventWireup="true" CodeBehind="Video.aspx.cs" Inherits="TeachEasy.Student_side.Video" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="main-content"> <%--style="min-width: 1349px;"--%>
    <section class="section">
        <div class="section-header">
            <h1>Video</h1>
            <div class="section-header-breadcrumb">
                <div class="breadcrumb-item active"><a href="Manage_Student.aspx">Home</a></div>
                <div class="breadcrumb-item"><a href="Video.aspx">Video</a></div>
            </div>
        </div>
        <div class="section-body">
            <h2 class="section-title">Study Time!</h2>
            <p class="section-lead">
              Your teachers had put real efforts to make these videos. Select one of them and start building your career.
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;
            </p>
            <div class="row">
                <div class="col-lg-12">
                    <div class="card">
                        <div class="card-header">
                            <h4>Filters</h4>
                            <div class="card-header-action">
                                <a data-collapse="#filter-card" class="btn btn-icon btn-info" href="#"><i class="fas fa-plus"></i></a>
                            </div>
                        </div>
                        <div class="collapse" id="filter-card">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-12 col-sm-3 col-sm-3">
                                        <b>Select subject</b>
                                        <br />
                                        <asp:DropDownList ID="DrDoL_Subject" runat="server" CssClass="form-control" DataSourceID="SDS_Subject" DataTextField="Subject_Name" DataValueField="Subject_ID" AutoPostBack="True" AppendDataBoundItems="True" OnSelectedIndexChanged="DrDoL_Subject_SelectedIndexChanged">
                                            <asp:ListItem Value="NULL">--Select--</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SDS_Subject" runat="server" ConnectionString="<%$ ConnectionStrings:TeachEasy_database %>" SelectCommand="SELECT * FROM [Subject] WHERE ([Sem_id] = @Sem_id)">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="Sem_id" SessionField="Sem_Id" Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </div>
                                    <div class="col-12 col-sm-3 col-sm-3">
                                        <b>Select Unit</b>
                                        <br />
                                        <asp:DropDownList ID="DrDoL_Unit" runat="server" CssClass="form-control" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SDS_Unit" DataTextField="Unit_Name" DataValueField="Unit_Id" OnSelectedIndexChanged="DrDoL_Unit_SelectedIndexChanged">
                                            <asp:ListItem Value="NULL">--Select--</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SDS_Unit" runat="server" ConnectionString="<%$ ConnectionStrings:TeachEasy_database %>" SelectCommand="SELECT * FROM [Unit]"></asp:SqlDataSource>
                                    </div>
                                    <div class="col-12 col-sm-3 col-sm-3">
                                        <b>Select Chapter</b>
                                        <br />
                                        <asp:DropDownList ID="DrDoL_Chapter" runat="server" CssClass="form-control" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SDS_Chapter" DataTextField="Ch_title" DataValueField="Ch_Id" OnSelectedIndexChanged="DrDoL_Chapter_SelectedIndexChanged">
                                            <asp:ListItem Value="NULL">--Select--</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SDS_Chapter" runat="server" ConnectionString="<%$ ConnectionStrings:TeachEasy_database %>" SelectCommand="SELECT * FROM [Chapter]">
                                        </asp:SqlDataSource>
                                    </div>
                                    <div class="col-12 col-sm-3 col-sm-3">
                                        <b>Select Topic</b>
                                        <br />
                                        <asp:DropDownList ID="DrDoL_Topic" runat="server" CssClass="form-control" AppendDataBoundItems="True" AutoPostBack="True" DataSourceID="SDS_Topic" DataTextField="Topic_name" DataValueField="Topic_Id" OnSelectedIndexChanged="DrDoL_Topic_SelectedIndexChanged">
                                            <asp:ListItem Value="NULL">--Select--</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="SDS_Topic" runat="server" ConnectionString="<%$ ConnectionStrings:TeachEasy_database %>" SelectCommand="SELECT * FROM [Topic]">
                                        </asp:SqlDataSource>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12 col-md-12 col-lg-12">
                    <asp:DataList ID="DL_Videos" runat="server" DataSourceID="SDS_DL_Videos" RepeatColumns="7">
                        <ItemTemplate>
                            <div class="card card-success">
                                <div class="card-body">
                                    <asp:HyperLink ID="HyperLink_Video" runat="server" NavigateUrl='<%# Eval("File_Path") %>' Text='<%# Eval("M_Title") %>' Target="_blank"></asp:HyperLink>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:SqlDataSource ID="SDS_DL_Videos" runat="server" ConnectionString="<%$ ConnectionStrings:TeachEasy_database %>" SelectCommand="SELECT * FROM [Material] WHERE (([M_Type] = @M_Type) AND ([Sem_Id] = @Sem_Id))">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="Video" Name="M_Type" Type="String" />
                            <asp:SessionParameter Name="Sem_Id" SessionField="Sem_Id" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
    </section>
</div>
</asp:Content>
