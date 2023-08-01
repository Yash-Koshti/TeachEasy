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
    public partial class MaterialEdit : System.Web.UI.Page
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

                    SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM Material WHERE M_Id=@id", con);
                    adp.SelectCommand.Parameters.AddWithValue("@id", id);
                    DataTable dt = new DataTable();
                    adp.Fill(dt);

                    TxtB_Title.Text = dt.Rows[0][1].ToString();
                    DrDoL_M_Type.SelectedValue = dt.Rows[0][2].ToString();
                    DrDoL_Semester.SelectedValue = dt.Rows[0][4].ToString();
                    DrDoL_Subject.SelectedValue = dt.Rows[0][5].ToString();
                    DrDoL_Unit.SelectedValue = dt.Rows[0][6].ToString();
                    DrDoL_Chapter.SelectedValue = dt.Rows[0][7].ToString();
                    DrDoL_Topic.SelectedValue = dt.Rows[0][8].ToString();
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

            string file_path = "NO FILE SELECTED";
            if (FUp_Material.HasFile)
            {
                file_path = FUp_Material.FileName;
                FUp_Material.SaveAs(Server.MapPath("~/Faculty_side/Material_Files/") + file_path);
            }

            SqlCommand com = new SqlCommand("UPDATE Material SET M_Title=@title, M_Type=@type, File_Path=@path, Sem_Id=@sem, Subject_Id=@sub, Unit_Id=@unit, Ch_Id=@ch, Topic_Id=@topic WHERE M_Id=@id", con);
            com.Parameters.AddWithValue("@id", id);
            com.Parameters.AddWithValue("@title", TxtB_Title.Text);
            com.Parameters.AddWithValue("@type", DrDoL_M_Type.SelectedValue.ToString());
            com.Parameters.AddWithValue("@path", "~/Faculty_side/Material_Files/" + file_path);
            if (DrDoL_Semester.SelectedValue != "NULL")
            {
                com.Parameters.AddWithValue("@sem", DrDoL_Semester.SelectedValue);
            }
            else
            {
                com.Parameters.AddWithValue("@sem", DBNull.Value);
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
        }

        protected void Delete_btn_Click(object sender, EventArgs e)
        {
            SqlCommand com = new SqlCommand("DELETE FROM Material WHERE M_Id=" + id, con);

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
            DrDoL_Subject.DataBind();
        }

        protected void DrDoL_Subject_SelectedIndexChanged(object sender, EventArgs e)
        {
            SDS_Chapter.SelectCommand = "SELECT * FROM Chapter WHERE Subject_id=" + DrDoL_Subject.SelectedValue + "AND Unit_Id=" + DrDoL_Unit.SelectedValue;
            SDS_Chapter.DataBind();
            DrDoL_Chapter.DataBind();
        }

        protected void DrDoL_Unit_SelectedIndexChanged(object sender, EventArgs e)
        {
            SDS_Chapter.SelectCommand = "SELECT * FROM Chapter WHERE Subject_id=" + DrDoL_Subject.SelectedValue + "AND Unit_Id=" + DrDoL_Unit.SelectedValue;
            SDS_Chapter.DataBind();
            DrDoL_Chapter.DataBind();
        }

        protected void DrDoL_Chapter_SelectedIndexChanged(object sender, EventArgs e)
        {
            SDS_Topic.SelectCommand = "SELECT * FROM Topic WHERE Ch_Id=" + DrDoL_Chapter.SelectedValue;
            SDS_Topic.DataBind();
            DrDoL_Topic.DataBind();
        }
    }
}