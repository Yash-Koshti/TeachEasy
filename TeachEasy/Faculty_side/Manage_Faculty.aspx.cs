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
    public partial class ManageFaculty : System.Web.UI.Page
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

                //Total Students.
                SqlDataAdapter adp = new SqlDataAdapter("SELECT Sem_Id FROM Subject WHERE Subject_ID IN(" + Session["Subject_Id"].ToString() + ")", con);
                DataTable dt = new DataTable();
                adp.Fill(dt);
                string sem = "";
                if(dt.Rows.Count > 1)
                {
                    for(int i = 0; i < dt.Rows.Count; i++)
                    {
                        sem = sem + dt.Rows[i]["Sem_Id"].ToString() + ",";
                    }
                    sem = sem.Substring(0, sem.Length - 1);
                }
                else
                {
                    sem = dt.Rows[0]["Sem_Id"].ToString();
                }
                SqlCommand com = new SqlCommand("SELECT COUNT(S_Id) FROM Admission WHERE Sem_Id IN(" + sem + ")", con);
                Lbl_Total_Students.Text = com.ExecuteScalar().ToString();

                //Total Videos.
                com = new SqlCommand("SELECT COUNT(*) FROM Material WHERE M_Type='Video' AND Subject_Id IN(" + Session["Subject_Id"].ToString() + ")", con);
                Lbl_Total_Videos.Text = com.ExecuteScalar().ToString();

                //Total PDFs.
                com = new SqlCommand("SELECT COUNT(*) FROM Material WHERE M_Type='PDF' AND Subject_Id IN(" + Session["Subject_Id"].ToString() + ")", con);
                Lbl_Total_Documents.Text = com.ExecuteScalar().ToString();

                //For Latest Exam
                com = new SqlCommand("SELECT MAX(Exam_Id) FROM Exam WHERE Exam_Type='Standard' AND Subject_Id IN(" + Session["Subject_Id"].ToString() + ")", con);
                string max_id_str = com.ExecuteScalar().ToString();

                adp = new SqlDataAdapter("SELECT Exam_Name, Total_Marks FROM Exam WHERE Exam_Id=" + max_id_str, con);
                dt = new DataTable();
                adp.Fill(dt);

                Lbl_Exam_Name.Text = dt.Rows[0]["Exam_Name"].ToString();
                Lbl_Total_Marks.Text = dt.Rows[0]["Total_Marks"].ToString();

                adp = new SqlDataAdapter("SELECT Admission_Id, S_name, Obtained_marks FROM Exam_Chart1_View WHERE Exam_Id=" + max_id_str, con);
                DataSet ds = new DataSet();
                adp.Fill(ds, "Last_Exam");

                GrV_Last_Exam.DataSource = ds.Tables["Last_Exam"];
                GrV_Last_Exam.DataBind();
            }
            else
            {
                Response.Redirect("~/Log_In.aspx");
            }
        }

        protected void Btn_Update_Click(object sender, EventArgs e)
        {
            Response.Redirect("Faculty_Edit.aspx?id=" + Session["Fac_Id"]);
        }
    }
}