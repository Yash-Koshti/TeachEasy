using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace TeachEasy.Student_side
{
    public partial class Documents : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["S_Id"] != null)
            {
                if (!IsPostBack)
                {
                    if (con.State != ConnectionState.Open)
                    {
                        con.Open();
                    }
                }
            }
            else
            {
                Response.Redirect("~/Log_In.aspx");
            }
        }

        protected void DrDoL_Subject_SelectedIndexChanged(object sender, EventArgs e)
        {
            SDS_Chapter.SelectCommand = "SELECT * FROM Chapter WHERE Subject_Id=" + DrDoL_Subject.SelectedValue.ToString();
            SDS_Chapter.DataBind();
            DrDoL_Chapter.DataBind();

            SDS_DL_Docs.SelectCommand = "SELECT * FROM Material WHERE M_Type='PDF' AND Subject_Id=" + DrDoL_Subject.SelectedValue.ToString();
            SDS_DL_Docs.DataBind();
            DL_Docs.DataBind();
        }

        protected void DrDoL_Unit_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DrDoL_Subject.SelectedValue != "NULL")
            {
                SDS_Chapter.SelectCommand = "SELECT * FROM Chapter WHERE Subject_Id=" + DrDoL_Subject.SelectedValue.ToString() + "AND Unit_Id=" + DrDoL_Unit.SelectedValue.ToString();
                SDS_Chapter.DataBind();
                DrDoL_Chapter.DataBind();

                SDS_DL_Docs.SelectCommand = "SELECT * FROM Material WHERE M_Type='PDF' AND Subject_Id=" + DrDoL_Subject.SelectedValue.ToString() + " AND Unit_Id=" + DrDoL_Unit.SelectedValue.ToString();
                SDS_DL_Docs.DataBind();
                DL_Docs.DataBind();
            }
            else
            {
                Response.Write("<script>alert('Please select Subject.');</script>");
            }
        }

        protected void DrDoL_Chapter_SelectedIndexChanged(object sender, EventArgs e)
        {
            SDS_Topic.SelectCommand = "SELECT * FROM Topic WHERE Ch_Id=" + DrDoL_Chapter.SelectedValue.ToString();
            SDS_Topic.DataBind();
            DrDoL_Topic.DataBind();

            SDS_DL_Docs.SelectCommand = "SELECT * FROM Material WHERE M_Type='PDF' AND Ch_Id=" + DrDoL_Chapter.SelectedValue.ToString();
            SDS_DL_Docs.DataBind();
            DL_Docs.DataBind();
        }

        protected void DrDoL_Topic_SelectedIndexChanged(object sender, EventArgs e)
        {
            SDS_DL_Docs.SelectCommand = "SELECT * FROM Material WHERE M_Type='PDF' AND Topic_Id=" + DrDoL_Topic.SelectedValue.ToString();
            SDS_DL_Docs.DataBind();
            DL_Docs.DataBind();
        }
    }
}