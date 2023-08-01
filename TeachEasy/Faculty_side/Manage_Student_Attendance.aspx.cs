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
    public partial class Manage_StudentAttendance : System.Web.UI.Page
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

                SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM Student_Attendance WHERE FS_Id IN(" + Session["FS_Id"].ToString() + ")", con);
                DataTable dt = new DataTable();
                adp.Fill(dt);

                GrV_Student_Attendance.DataSource = dt;
                GrV_Student_Attendance.DataBind();
            }
            else
            {
                Response.Redirect("~/Log_In.aspx");
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect("Student_Attendance_Edit.aspx?id=" + GrV_Student_Attendance.SelectedRow.Cells[1].Text);
        }

        protected void Add_btn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Student_Attendance_Add.aspx");
        }
    }
}