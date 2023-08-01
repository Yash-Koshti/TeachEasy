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
    public partial class TopicAdd : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Fac_Id"] != null)
            {
                if (!IsPostBack)
                {
                    if (con.State != ConnectionState.Open)
                    {
                        con.Open();
                    }

                    SqlCommand com = new SqlCommand("SELECT Subject_id FROM Faculty_Subject WHERE Fac_Id=" + Session["Fac_Id"], con);
                    string sub_id = com.ExecuteScalar().ToString();

                    SDS_Subject.SelectCommand = "SELECT * FROM Subject WHERE Subject_Id=" + sub_id;
                    SDS_Subject.DataBind();
                    DrDoL_Subject.DataBind();
                }
            }
            else
            {
                Response.Redirect("~/Log_In.aspx");
            }
        }

        protected void Add_btn_Click(object sender, EventArgs e)
        {
            SqlCommand com = new SqlCommand("SELECT MAX(Topic_Id) FROM Topic", con);
            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }
            string max_id_str = com.ExecuteScalar().ToString();
            int max_id = Convert.ToInt32(max_id_str);

            com = new SqlCommand("INSERT INTO Topic VALUES(@id, @name, @desc, @ch)", con);
            com.Parameters.AddWithValue("@id", (max_id + 1).ToString());
            com.Parameters.AddWithValue("@name", TxtB_Title.Text);
            com.Parameters.AddWithValue("@desc", TxtB_Desc.Text);
            com.Parameters.AddWithValue("@ch", DrDoL_Chapter.SelectedValue);

            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }
            com.ExecuteNonQuery();

            Response.Redirect("Manage_Topic.aspx");
        }

        protected void Cancel_btn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Manage_Topic.aspx");
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