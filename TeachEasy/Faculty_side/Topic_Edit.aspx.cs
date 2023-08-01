using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace TeachEasy.Faculty_side
{
    public partial class TopicEdit : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");
        static String id;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Fac_Id"] != null)
            {
                if (!IsPostBack)
                {
                    id = Request.QueryString["id"];

                    if (con.State != ConnectionState.Open)
                    {
                        con.Open();
                    }

                    SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM Topic WHERE Topic_Id=@id", con);
                    adp.SelectCommand.Parameters.AddWithValue("@id", id);
                    DataTable dt = new DataTable();
                    adp.Fill(dt);

                    TxtB_Title.Text = dt.Rows[0][1].ToString();
                    TxtB_Desc.Text = dt.Rows[0][2].ToString();
                    DrDoL_Chapter.SelectedValue = dt.Rows[0][3].ToString();
                }
            }
            else
            {
                Response.Redirect("~/Log_In.aspx");
            }
        }

        protected void Update_btn_Click(object sender, EventArgs e)
        {
            id = Request.QueryString["id"];
            SqlCommand com = new SqlCommand("UPDATE Topic SET Topic_name=@name, Description=@desc, Ch_Id=@ch WHERE Topic_Id=@id", con);
            com.Parameters.AddWithValue("@id", id);
            com.Parameters.AddWithValue("@name", TxtB_Title.Text);
            com.Parameters.AddWithValue("@desc", TxtB_Desc.Text);
            com.Parameters.AddWithValue("@ch", DrDoL_Chapter.SelectedValue);

            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }
            com.ExecuteNonQuery();
        }

        protected void DrDoL_Subject_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DrDoL_Subject.SelectedValue != "NULL")
            {
                SDS_Chapter.SelectCommand = "select * from chapter where subject_id=" + DrDoL_Subject.SelectedValue + "and unit_id=" + DrDoL_Unit.SelectedValue;
                SDS_Chapter.DataBind();
                DrDoL_Chapter.DataBind();
            }
            else
            {
                Response.Write("<script>alert('Please select subject.');</script>");
            }
        }

        protected void DrDoL_Unit_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DrDoL_Unit.SelectedValue != "NULL")
            {
                SDS_Chapter.SelectCommand = "select * from chapter where subject_id=" + DrDoL_Subject.SelectedValue + "and unit_id=" + DrDoL_Unit.SelectedValue;
                SDS_Chapter.DataBind();
                DrDoL_Chapter.DataBind();
            }
            else
            {
                Response.Write("<script>alert('Please select unit.');</script>");
            }
        }
    }
}