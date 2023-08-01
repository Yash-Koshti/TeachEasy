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
    public partial class ManageExam : System.Web.UI.Page
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

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlCommand com = new SqlCommand("DELETE FROM Exam WHERE Exam_Id=" + GrV_Exam.SelectedRow.Cells[1].Text, con);

            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }
            com.ExecuteNonQuery();

            Response.Redirect("Manage_Exam.aspx");
        }

        protected void Add_btn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Exam_Add.aspx");
        }
    }
}