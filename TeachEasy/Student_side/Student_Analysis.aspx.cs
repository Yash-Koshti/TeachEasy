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
    public partial class Student_Analysis : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["S_Id"] != null)
            {
                if (!IsPostBack)
                {
                    if (con.State != ConnectionState.Open)
                    {
                        con.Open();
                    }                    
                }
            }
            else
            {
                Response.Redirect("~/Log_In.aspx");
            }
        }

        protected void DrDoL_Exam_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            SqlDataAdapter adp = new SqlDataAdapter("SELECT COUNT(*) AS count,Difficulty_level FROM SEQ_View WHERE Exam_Id=@eid AND Admission_Id=@aid group by Difficulty_level", con);
            adp.SelectCommand.Parameters.AddWithValue("@eid", DrDoL_Exam.SelectedValue.ToString());
            adp.SelectCommand.Parameters.AddWithValue("@aid", Session["Admission_Id"].ToString());
            adp.Fill(ds, "SEQ_Total_Q");

            adp = new SqlDataAdapter("SELECT COUNT(*) AS Result, Difficulty_level FROM SEQ_View WHERE Exam_Id = @eid AND Admission_Id = @aid AND Result = 'Correct' GROUP BY Difficulty_level", con);
            adp.SelectCommand.Parameters.AddWithValue("@eid", DrDoL_Exam.SelectedValue.ToString());
            adp.SelectCommand.Parameters.AddWithValue("@aid", Session["Admission_Id"].ToString());
            adp.Fill(ds, "SEQ_Correct_Q");

            DataTable dt = new DataTable();
            dt.Columns.Add("Difficulty_level");
            dt.Columns.Add("Count");
            dt.Columns.Add("Result");

            if ((ds.Tables["SEQ_Total_Q"].Rows.Count == 3 && ds.Tables["SEQ_Correct_Q"].Rows.Count == 3) || (ds.Tables["SEQ_Total_Q"].Rows.Count == 1 && ds.Tables["SEQ_Correct_Q"].Rows.Count == 1))
            {
                for (int i = 0; i < ds.Tables["SEQ_Total_Q"].Rows.Count; i++)
                {
                    dt.Rows.Add(ds.Tables["SEQ_Total_Q"].Rows[i]["Difficulty_level"].ToString(), ds.Tables["SEQ_Total_Q"].Rows[i]["Count"].ToString(), ds.Tables["SEQ_Correct_Q"].Rows[i]["Result"].ToString());
                }
            }
            else
                Response.Write("<script>alert('Error in exam data, please select another exam.');</script>");

            Chart_Exam_wise.DataSource = dt;
            Chart_Exam_wise.Series[0].XValueMember = "Difficulty_level";
            Chart_Exam_wise.Series[0].YValueMembers = "Count";
            Chart_Exam_wise.Series[1].XValueMember = "Difficulty_level";
            Chart_Exam_wise.Series[1].YValueMembers = "Result";
        }

        public DataSet Exam_Chart()
        {
            DataSet ds = new DataSet();
            SqlDataAdapter adp = new SqlDataAdapter("SELECT COUNT(*) AS Count,Difficulty_level FROM SEQ_View WHERE Exam_Id=@eid AND Admission_Id=@aid group by Difficulty_level", con);
            adp.SelectCommand.Parameters.AddWithValue("@eid", DrDoL_Exam.SelectedValue.ToString());
            adp.SelectCommand.Parameters.AddWithValue("@aid", Session["Admission_Id"].ToString());
            adp.Fill(ds, "SEQ_Total_Q");

            adp = new SqlDataAdapter("SELECT COUNT(*) AS Result, Difficulty_level FROM SEQ_View WHERE Exam_Id = @eid AND Admission_Id = @aid AND Result = 'Correct' GROUP BY Difficulty_level", con);
            adp.SelectCommand.Parameters.AddWithValue("@eid", DrDoL_Exam.SelectedValue.ToString());
            adp.SelectCommand.Parameters.AddWithValue("@aid", Session["Admission_Id"].ToString());
            adp.Fill(ds, "SEQ_Correct_Q");

            return ds;
        }

        protected void DrDoL_Subject_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            SqlDataAdapter adp = new SqlDataAdapter("SELECT Exam_Name, Total_Marks, Obtained_marks FROM Exam_Chart1_View WHERE Subject_Id=@sub AND Admission_Id=@aid", con);
            adp.SelectCommand.Parameters.AddWithValue("@sub", DrDoL_Subject.SelectedValue.ToString());
            adp.SelectCommand.Parameters.AddWithValue("@aid", Session["Admission_Id"].ToString());
            adp.Fill(ds, "EC1");

            DataTable dt = new DataTable();
            dt.Columns.Add("Exam_Name");
            dt.Columns.Add("Total_Marks");
            dt.Columns.Add("Obtained_marks");

            if (ds.Tables["EC1"].Rows.Count >= 0)
            {
                for (int i = 0; i < ds.Tables["EC1"].Rows.Count; i++)
                {
                    dt.Rows.Add(ds.Tables["EC1"].Rows[i]["Exam_Name"].ToString(), ds.Tables["EC1"].Rows[i]["Total_Marks"].ToString(), ds.Tables["EC1"].Rows[i]["Obtained_marks"].ToString());
                }
            }
            else
                Response.Write("<script>alert('Error in exam data, please select another exam.');</script>");

            Chart_Subject_Wise.DataSource = dt;
            Chart_Subject_Wise.Series[0].XValueMember = "Exam_Name";
            Chart_Subject_Wise.Series[0].YValueMembers = "Total_Marks";
            Chart_Subject_Wise.Series[1].XValueMember = "Exam_Name";
            Chart_Subject_Wise.Series[1].YValueMembers = "Obtained_marks";
        }

        protected void DrDoL_Unit_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            SqlDataAdapter adp = new SqlDataAdapter("SELECT Exam_Name, Total_Marks, Obtained_marks FROM Exam_Chart1_View WHERE Unit_Id=@uid  AND Admission_Id=@aid", con);
            adp.SelectCommand.Parameters.AddWithValue("@uid", DrDoL_Unit.SelectedValue.ToString());
            adp.SelectCommand.Parameters.AddWithValue("@aid", Session["Admission_Id"].ToString());
            adp.Fill(ds, "EC1");

            DataTable dt = new DataTable();
            dt.Columns.Add("Exam_Name");
            dt.Columns.Add("Total_Marks");
            dt.Columns.Add("Obtained_marks");

            if (ds.Tables["EC1"].Rows.Count >= 0)
            {
                for (int i = 0; i < ds.Tables["EC1"].Rows.Count; i++)
                {
                    dt.Rows.Add(ds.Tables["EC1"].Rows[i]["Exam_Name"].ToString(), ds.Tables["EC1"].Rows[i]["Total_Marks"].ToString(), ds.Tables["EC1"].Rows[i]["Obtained_marks"].ToString());
                }
            }
            else
                Response.Write("<script>alert('Error in exam data, please select another exam.');</script>");

            Chart_Unit_Wise.DataSource = dt;
            Chart_Unit_Wise.Series[0].XValueMember = "Exam_Name";
            Chart_Unit_Wise.Series[0].YValueMembers = "Total_Marks";
            Chart_Unit_Wise.Series[1].XValueMember = "Exam_Name";
            Chart_Unit_Wise.Series[1].YValueMembers = "Obtained_marks";
        }

        protected void DrDoL_Chapter_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            SqlDataAdapter adp = new SqlDataAdapter("SELECT Exam_Name, Total_Marks, Obtained_marks FROM Exam_Chart1_View WHERE Ch_Id=@ch  AND Admission_Id=@aid", con);
            adp.SelectCommand.Parameters.AddWithValue("@ch", DrDoL_Chapter.SelectedValue.ToString());
            adp.SelectCommand.Parameters.AddWithValue("@aid", Session["Admission_Id"].ToString());
            adp.Fill(ds, "EC1");

            DataTable dt = new DataTable();
            dt.Columns.Add("Exam_Name");
            dt.Columns.Add("Total_Marks");
            dt.Columns.Add("Obtained_marks");

            if (ds.Tables["EC1"].Rows.Count >= 0)
            {
                for (int i = 0; i < ds.Tables["EC1"].Rows.Count; i++)
                {
                    dt.Rows.Add(ds.Tables["EC1"].Rows[i]["Exam_Name"].ToString(), ds.Tables["EC1"].Rows[i]["Total_Marks"].ToString(), ds.Tables["EC1"].Rows[i]["Obtained_marks"].ToString());
                }
            }
            else
                Response.Write("<script>alert('Error in exam data, please select another exam.');</script>");

            Chart_Chapter_Wise.DataSource = dt;
            Chart_Chapter_Wise.Series[0].XValueMember = "Exam_Name";
            Chart_Chapter_Wise.Series[0].YValueMembers = "Total_Marks";
            Chart_Chapter_Wise.Series[1].XValueMember = "Exam_Name";
            Chart_Chapter_Wise.Series[1].YValueMembers = "Obtained_marks";
        }

        protected void DrDoL_Topic_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            SqlDataAdapter adp = new SqlDataAdapter("SELECT Exam_Name, Total_Marks, Obtained_marks FROM Exam_Chart1_View WHERE Topic_Id=@tid  AND Admission_Id=@aid", con);
            adp.SelectCommand.Parameters.AddWithValue("@tid", DrDoL_Topic.SelectedValue.ToString());
            adp.SelectCommand.Parameters.AddWithValue("@aid", Session["Admission_Id"].ToString());
            adp.Fill(ds, "EC1");

            DataTable dt = new DataTable();
            dt.Columns.Add("Exam_Name");
            dt.Columns.Add("Total_Marks");
            dt.Columns.Add("Obtained_marks");

            if (ds.Tables["EC1"].Rows.Count >= 0)
            {
                for (int i = 0; i < ds.Tables["EC1"].Rows.Count; i++)
                {
                    dt.Rows.Add(ds.Tables["EC1"].Rows[i]["Exam_Name"].ToString(), ds.Tables["EC1"].Rows[i]["Total_Marks"].ToString(), ds.Tables["EC1"].Rows[i]["Obtained_marks"].ToString());
                }
            }
            else
                Response.Write("<script>alert('Error in exam data, please select another exam.');</script>");

            Chart_Topic_Wise.DataSource = dt;
            Chart_Topic_Wise.Series[0].XValueMember = "Exam_Name";
            Chart_Topic_Wise.Series[0].YValueMembers = "Total_Marks";
            Chart_Topic_Wise.Series[1].XValueMember = "Exam_Name";
            Chart_Topic_Wise.Series[1].YValueMembers = "Obtained_marks";
        }
    }
}