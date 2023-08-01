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
    public partial class Student_Exam_QuestionAdd : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS01;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["S_Id"] != null)
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
            SqlCommand com = new SqlCommand("SELECT MAX(SEQ_Id) FROM Student_Exam_Questions", con);
            string max_id_str = com.ExecuteScalar().ToString();
            int max_id = Convert.ToInt32(max_id_str);

            com = new SqlCommand("INSERT INTO Student_Exam_Questions VALUES(@id, @se_id, @q_id, @result)", con);
            com.Parameters.AddWithValue("@id", (max_id + 1).ToString());
            com.Parameters.AddWithValue("@se_id", DrDoL_Student_Exam.SelectedValue);
            com.Parameters.AddWithValue("@q_id", DrDoL_Question.SelectedValue);
            com.Parameters.AddWithValue("@result", RaBuL_Result.SelectedValue);

            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }
            com.ExecuteNonQuery();

            Response.Redirect("Manage_Student_Exam_Question.aspx");
        }

        protected void Cancel_btn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Manage_Student_Exam_Question.aspx");
        }
    }
}