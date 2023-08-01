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
    public partial class Student_AttendanceEdit : System.Web.UI.Page
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

                    SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM Student_Attendance where SA_Id=@id", con);
                    adp.SelectCommand.Parameters.AddWithValue("@id", id);
                    DataTable dt = new DataTable();
                    adp.Fill(dt);

                    DrDoL_FS.SelectedValue = dt.Rows[0][1].ToString();
                    SqlCommand com = new SqlCommand("SELECT S_name FROM Admission_View WHERE Admission_Id=" + dt.Rows[0][2].ToString(), con);
                    Lbl_S_name.Text = com.ExecuteScalar().ToString();
                    DrDoL_Month.SelectedValue = dt.Rows[0][3].ToString();
                    TxtB_Total_Lec.Text = dt.Rows[0][4].ToString();
                    TxtB_Present_Lec.Text = dt.Rows[0][5].ToString();
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

            SqlCommand com = new SqlCommand("UPDATE Student_Attendance SET FS_Id=@fs, Month=@mon, Total_lectures=@ttl_lec, Present_lectures=@pre_lec WHERE SA_Id=@id", con);
            com.Parameters.AddWithValue("@id", id);
            com.Parameters.AddWithValue("@fs", DrDoL_FS.SelectedValue);
            com.Parameters.AddWithValue("@mon", DrDoL_Month.SelectedValue.ToString());
            com.Parameters.AddWithValue("@ttl_lec", TxtB_Total_Lec.Text);
            com.Parameters.AddWithValue("@pre_lec", TxtB_Present_Lec.Text);

            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }
            com.ExecuteNonQuery();

            Response.Redirect("Manage_Student_Attendance.aspx");
        }

        protected void Delete_btn_Click(object sender, EventArgs e)
        {
            SqlCommand com = new SqlCommand("DELETE FROM Student_Attendance WHERE SA_Id=" + id, con);

            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }
            com.ExecuteNonQuery();

            Response.Redirect("Manage_Student_Attendance.aspx");
        }

        protected void Cancel_btn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Manage_Student_Attendance.aspx");
        }
    }
}