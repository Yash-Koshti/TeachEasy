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
    public partial class ManageStudent : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["S_Id"] != null)
            {
                if (con.State != ConnectionState.Open)
                {
                    con.Open();
                }

                SqlCommand com = new SqlCommand("SELECT SUM(Total_lectures) FROM Student_Attendance WHERE Admission_Id=" + Session["Admission_Id"].ToString(), con);
                Lbl_Total_Lectures.Text = com.ExecuteScalar().ToString();

                com = new SqlCommand("SELECT SUM(Present_lectures) FROM Student_Attendance WHERE Admission_Id=" + Session["Admission_Id"].ToString(), con);
                Lbl_Attended_Lectures.Text = com.ExecuteScalar().ToString();

                com = new SqlCommand("SELECT COUNT(*) FROM Student_Exam WHERE Admission_Id=" + Session["Admission_Id"].ToString(), con);
                Lbl_Exams_Attended.Text = com.ExecuteScalar().ToString();

                //Code for All_Exams.
                DataSet ds = new DataSet();
                SqlDataAdapter adp = new SqlDataAdapter("SELECT Exam_Name, Total_Marks, Obtained_marks FROM Exam_Chart1_View WHERE Admission_Id=@aid", con);
                adp.SelectCommand.Parameters.AddWithValue("@aid", Session["Admission_Id"].ToString());
                adp.Fill(ds, "All_Exams");

                Chart_All_Exams.DataSource = ds.Tables["All_Exams"];
                Chart_All_Exams.Series[0].XValueMember = "Exam_Name";
                Chart_All_Exams.Series[0].YValueMembers= "Total_Marks";
                Chart_All_Exams.Series[1].XValueMember = "Exam_Name";
                Chart_All_Exams.Series[1].YValueMembers = "Obtained_Marks";


                //Code for Unit wise.
                adp = new SqlDataAdapter("SELECT SUM(Total_Marks) AS Total, Unit_Id, SUM(Obtained_marks) AS Obtained FROM Exam_Chart1_View WHERE Admission_Id=@aid AND Unit_Id='1' OR Unit_Id = '2' OR Unit_Id='3' OR Unit_Id='4' GROUP BY Unit_Id", con);
                adp.SelectCommand.Parameters.AddWithValue("@aid", Session["Admission_Id"].ToString());
                ds = new DataSet();
                adp.Fill(ds, "EC1");

                DataTable dt = new DataTable();
                dt.Columns.Add("Total");
                dt.Columns.Add("Unit_Id");
                dt.Columns.Add("Obtained");

                if (ds.Tables["EC1"].Rows.Count >= 0)
                {
                    for (int i = 0; i < ds.Tables["EC1"].Rows.Count; i++)
                    {
                        dt.Rows.Add(ds.Tables["EC1"].Rows[i]["Total"].ToString(), ds.Tables["EC1"].Rows[i]["Unit_Id"].ToString(), ds.Tables["EC1"].Rows[i]["Obtained"].ToString());
                    }
                }
                else
                    Response.Write("<script>alert('Error in exam data, please select another exam.');</script>");

                Chart_Unit_Wise.DataSource = dt;
                Chart_Unit_Wise.Series[0].XValueMember = "Unit_Id";
                Chart_Unit_Wise.Series[0].YValueMembers = "Total";
                Chart_Unit_Wise.Series[1].XValueMember = "Unit_Id";
                Chart_Unit_Wise.Series[1].YValueMembers = "Obtained";


                //Code for Last Exam.
                com = new SqlCommand("SELECT MAX(SE_Id) FROM Student_Exam WHERE Admission_Id=" + Session["Admission_Id"].ToString(), con);
                string max_se_id = com.ExecuteScalar().ToString();
                adp = new SqlDataAdapter("SELECT Exam_Name, Total_Marks, Obtained_marks FROM Exam_Chart1_View WHERE SE_Id=" + max_se_id, con);
                adp.Fill(ds, "Last_Exam");

                Chart_Last_Exam.DataSource = ds.Tables["Last_Exam"];
                Chart_Last_Exam.Series[0].XValueMember = "Exam_Name";
                Chart_Last_Exam.Series[0].YValueMembers = "Total_Marks";
                Chart_Last_Exam.Series[1].XValueMember = "Exam_Name";
                Chart_Last_Exam.Series[1].YValueMembers = "Obtained_marks";
            }
            else
            {
                Response.Redirect("~/Log_In.aspx");
            }
        }
    }
}