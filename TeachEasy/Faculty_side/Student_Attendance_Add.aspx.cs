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
    public partial class Student_AttendanceAdd : System.Web.UI.Page
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
            for (int i = 0; i < GrV_Attendance_Table.Rows.Count; i++)
            {
                TextBox TxtB_Present_Lec = (TextBox)GrV_Attendance_Table.Rows[i].FindControl("TxtB_Present_Lec");

                SqlCommand com = new SqlCommand("SELECT MAX(SA_Id) FROM Student_Attendance", con);
                string max_id_str = com.ExecuteScalar().ToString();
                int max_id = Convert.ToInt32(max_id_str);

                com = new SqlCommand("INSERT INTO Student_Attendance VALUES(@id, @fs_id, @admis_id, @mon, @ttl_lec, @pre_lec)", con);
                com.Parameters.AddWithValue("@id", (max_id + 1).ToString());
                com.Parameters.AddWithValue("@fs_id", DrDoL_FS.SelectedValue.ToString());
                com.Parameters.AddWithValue("@admis_id", GrV_Attendance_Table.Rows[i].Cells[1].Text);
                com.Parameters.AddWithValue("@mon", DrDoL_Month.SelectedValue.ToString());
                com.Parameters.AddWithValue("@ttl_lec", TxtB_Total_Lec.Text);
                com.Parameters.AddWithValue("@pre_lec", TxtB_Present_Lec.Text);

                if (con.State != ConnectionState.Open)
                {
                    con.Open();
                }
                com.ExecuteNonQuery();
            }

            Response.Redirect("Manage_Student_Attendance.aspx");
        }

        protected void DrDoL_Semester_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlDataAdapter adp = new SqlDataAdapter("SELECT Admission_Id, S_name FROM Admission_View WHERE Sem_Id=" + DrDoL_Semester.SelectedValue.ToString(), con);
            DataSet ds = new DataSet();
            adp.Fill(ds, "Attendance");

            GrV_Attendance_Table.DataSource = ds.Tables["Attendance"];
            GrV_Attendance_Table.DataBind();
        }
    }
}