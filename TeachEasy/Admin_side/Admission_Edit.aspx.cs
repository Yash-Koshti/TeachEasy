using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace TeachEasy.Admin_side
{
    public partial class AdmissionEdit : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");
        static String id;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin_id"] != null)
            {
                if (!IsPostBack)
                {
                    id = Request.QueryString["id"];

                    if (con.State != ConnectionState.Open)
                    {
                        con.Open();
                    }

                    SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM Admission WHERE Admission_Id=@id", con);
                    adp.SelectCommand.Parameters.AddWithValue("@id", id);
                    DataTable dt = new DataTable();
                    adp.Fill(dt);

                    DrDoL_Student.SelectedValue = dt.Rows[0][1].ToString();
                    TxtB_Date.Text = dt.Rows[0][2].ToString();
                    DrDoL_Semester.SelectedValue = dt.Rows[0][3].ToString();
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

            SqlCommand com = new SqlCommand("UPDATE Admission SET S_Id=@stu, Admission_Date=@date, Sem_Id=@sem WHERE Admission_Id=@id", con);
            com.Parameters.AddWithValue("@id", id);
            com.Parameters.AddWithValue("@stu", DrDoL_Student.SelectedValue);
            com.Parameters.AddWithValue("@date", TxtB_Date.Text);
            com.Parameters.AddWithValue("@sem", DrDoL_Semester.SelectedValue);
            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }
            com.ExecuteNonQuery();

            Response.Redirect("Manage_Admission.aspx");
        }

        protected void Delete_btn_Click(object sender, EventArgs e)
        {
            SqlCommand com = new SqlCommand("DELETE FROM Admission WHERE Admission_Id=" + id, con);

            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }
            com.ExecuteNonQuery();

            Response.Redirect("Manage_Admission.aspx");
        }
        protected void Go_back_btn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Manage_Admission.aspx");
        }
    }
}