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
    public partial class ExamAdd : System.Web.UI.Page
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
            SqlCommand com = new SqlCommand("SELECT MAX(Exam_Id) FROM Exam", con);
            string max_id_str = com.ExecuteScalar().ToString();
            int max_id = Convert.ToInt32(max_id_str);

            com = new SqlCommand("INSERT INTO Exam VALUES(@id, @name, @type, @marks, @sem, @sub, @unit, @ch, @topic)", con);
            com.Parameters.AddWithValue("@id", (max_id + 1).ToString());
            com.Parameters.AddWithValue("@name", TxtB_Name.Text);
            com.Parameters.AddWithValue("@type", TxtB_Type.Text);
            com.Parameters.AddWithValue("@marks", TxtB_Total_Marks.Text);
            com.Parameters.AddWithValue("@sem", DrDoL_Semester.SelectedValue);
            com.Parameters.AddWithValue("@sub", DrDoL_Subject.SelectedValue);
            com.Parameters.AddWithValue("@unit", DrDoL_Unit.SelectedValue);
            com.Parameters.AddWithValue("@ch", DrDoL_Chapter.SelectedValue);
            com.Parameters.AddWithValue("@topic", DrDoL_Topic.SelectedValue);

            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }
            com.ExecuteNonQuery();

            Response.Redirect("Manage_Exam.aspx");
        }

        protected void Cancel_btn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Manage_Exam.aspx");
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