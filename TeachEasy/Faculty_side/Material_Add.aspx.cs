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
    public partial class MaterialAdd : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Fac_Id"] != null)
            {
                if (con.State != ConnectionState.Open)
                {
                    con.Open();
                }
            }
            else
            {
                Response.Redirect("~/Log_In.aspx");
            }
        }

        protected void Add_btn_Click(object sender, EventArgs e)
        {
            SqlCommand com = new SqlCommand("SELECT MAX(M_Id) FROM Material", con);
            string max_id_str = com.ExecuteScalar().ToString();
            int max_id = Convert.ToInt32(max_id_str);

            string file_path = "NO FILE SELECTED";
            if (FUp_Material.HasFile)
            {
                file_path = FUp_Material.FileName;
                FUp_Material.SaveAs(Server.MapPath("~/Faculty_side/Material_Files/") + file_path);
            }

            com = new SqlCommand("INSERT INTO Material VALUES(@id, @title, @type, @path, @sem, @sub, @unit, @ch, @topic)", con);
            com.Parameters.AddWithValue("@id", (max_id + 1).ToString());
            com.Parameters.AddWithValue("@title", TxtB_Title.Text);
            if (DrDoL_M_Type.SelectedValue != "NULL")
            {
                com.Parameters.AddWithValue("@type", DrDoL_M_Type.SelectedValue.ToString());
            }
            else
            {
                Response.Write("<script>alert('Please select Material Type.');</script>");
            }
            com.Parameters.AddWithValue("@path", "~/Faculty_side/Material_Files/" + file_path);
            if (DrDoL_Semester.SelectedValue != "NULL")
            {
                com.Parameters.AddWithValue("@sem", DrDoL_Semester.SelectedValue);
            }
            else
            {
                Response.Write("<script>alert('Please select Semester.');</script>");
            }

            if (DrDoL_Subject.SelectedValue != "NULL")
            {
                com.Parameters.AddWithValue("@sub", DrDoL_Subject.SelectedValue);
            }
            else
            {
                com.Parameters.AddWithValue("@sub", DBNull.Value);
            }

            if (DrDoL_Unit.SelectedValue != "NULL")
            {
                com.Parameters.AddWithValue("@unit", DrDoL_Unit.SelectedValue);
            }
            else
            {
                com.Parameters.AddWithValue("@unit", DBNull.Value);
            }

            if (DrDoL_Chapter.SelectedValue != "NULL")
            {
                com.Parameters.AddWithValue("@ch", DrDoL_Chapter.SelectedValue);
            }
            else
            {
                com.Parameters.AddWithValue("@ch", DBNull.Value);
            }

            if (DrDoL_Topic.SelectedValue != "NULL")
            {
                com.Parameters.AddWithValue("@topic", DrDoL_Topic.SelectedValue);
            }
            else
            {
                com.Parameters.AddWithValue("@topic", DBNull.Value);
            }


            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }
            com.ExecuteNonQuery();

            Response.Redirect("Manage_Material.aspx");
        }

        protected void DrDoL_Semester_SelectedIndexChanged(object sender, EventArgs e)
        {
            SDS_Subject.SelectCommand = "SELECT * FROM Subject WHERE Sem_Id=" + DrDoL_Semester.SelectedValue;
            SDS_Subject.DataBind();

            DrDoL_Subject.Items.Clear();
            DrDoL_Subject.Items.Add(new ListItem("--Select--","NULL"));
            DrDoL_Subject.DataBind();
        }

        protected void DrDoL_Subject_SelectedIndexChanged(object sender, EventArgs e)
        {
            SDS_Chapter.SelectCommand = "SELECT * FROM Chapter WHERE Subject_id=" + DrDoL_Subject.SelectedValue + "AND Unit_Id=" + DrDoL_Unit.SelectedValue;
            SDS_Chapter.DataBind();

            DrDoL_Chapter.Items.Clear();
            DrDoL_Chapter.Items.Add(new ListItem("--Select--", "NULL"));
            DrDoL_Chapter.DataBind();
        }

        protected void DrDoL_Unit_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DrDoL_Subject.SelectedValue != "NULL")
            {
                SDS_Chapter.SelectCommand = "SELECT * FROM Chapter WHERE Subject_id=" + DrDoL_Subject.SelectedValue + "AND Unit_Id=" + DrDoL_Unit.SelectedValue;
                SDS_Chapter.DataBind();

                DrDoL_Chapter.Items.Clear();
                DrDoL_Chapter.Items.Add(new ListItem("--Select--", "NULL"));
                DrDoL_Chapter.DataBind();
            }
            else
            {
                Response.Write("<script>alert('Please select Subject.');</script>");
            }
        }

        protected void DrDoL_Chapter_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DrDoL_Chapter.SelectedValue != "NULL")
            {
                SDS_Topic.SelectCommand = "SELECT * FROM Topic WHERE Ch_Id=" + DrDoL_Chapter.SelectedValue;
                SDS_Topic.DataBind();

                DrDoL_Topic.Items.Clear();
                DrDoL_Topic.Items.Add(new ListItem("--Select--", "NULL"));
                DrDoL_Topic.DataBind();
            }
            else
            {
                DrDoL_Topic.Items.Clear();
                DrDoL_Topic.Items.Add(new ListItem("--Select--", "NULL"));
                DrDoL_Topic.DataBind();
            }
        }

        protected void Add_btn_Click1(object sender, EventArgs e)
        {

        }
    }
}