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
    public partial class Question_BankEdit : System.Web.UI.Page
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

                    SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM Student_Exam_View WHERE Q_id=@id", con);
                    adp.SelectCommand.Parameters.AddWithValue("@id", id);
                    DataTable dt = new DataTable();
                    adp.Fill(dt);

                    DrDoL_Topic.SelectedValue = dt.Rows[0]["Topic_Id"].ToString();
                    DrDoL_Chapter.SelectedValue = dt.Rows[0]["Ch_Id"].ToString();
                    DrDoL_Unit.SelectedValue = dt.Rows[0]["Unit_Id"].ToString();
                    DrDoL_Subject.SelectedValue = dt.Rows[0]["Subject_Id"].ToString();

                    TxtB_Question.Text = dt.Rows[0]["Question"].ToString();
                    Img_Question.ImageUrl = dt.Rows[0]["Question_image"].ToString();

                    TxtB_Op_A.Text = dt.Rows[0]["Option_A"].ToString();
                    Img_Op_A.ImageUrl = dt.Rows[0]["Option_A_image"].ToString();

                    TxtB_Op_B.Text = dt.Rows[0]["Option_B"].ToString();
                    Img_Op_B.ImageUrl = dt.Rows[0]["Option_B_image"].ToString();

                    TxtB_Op_C.Text = dt.Rows[0]["Option_C"].ToString();
                    Img_Op_C.ImageUrl = dt.Rows[0]["Option_C_image"].ToString();

                    TxtB_Op_D.Text = dt.Rows[0]["Option_D"].ToString();
                    Img_Op_D.ImageUrl = dt.Rows[0]["Option_D_image"].ToString();

                    RaBuL_Dif_Lvl.SelectedValue = dt.Rows[0]["Difficulty_level"].ToString();
                    RaBuL_Co_Op.SelectedValue = dt.Rows[0]["Correct_option"].ToString();
                }
            }
            else
            {
                Response.Redirect("~/Log_In.aspx");
            }
        }

        protected void DrDoL_Subject_SelectedIndexChanged(object sender, EventArgs e)
        {
            SDS_Chapter.SelectCommand = "SELECT * FROM Chapter WHERE Subject_Id=" + DrDoL_Subject.SelectedValue + "AND Unit_Id=" + DrDoL_Unit.SelectedValue;
            SDS_Chapter.DataBind();
            DrDoL_Chapter.DataBind();
        }

        protected void DrDoL_Unit_SelectedIndexChanged(object sender, EventArgs e)
        {
            SDS_Chapter.SelectCommand = "SELECT * FROM Chapter WHERE Subject_Id=" + DrDoL_Subject.SelectedValue + "AND Unit_Id=" + DrDoL_Unit.SelectedValue;
            SDS_Chapter.DataBind();
            DrDoL_Chapter.DataBind();
        }

        protected void DrDoL_Chapter_SelectedIndexChanged(object sender, EventArgs e)
        {
            SDS_Topic.SelectCommand = "SELECT * FROM Topic WHERE Chapter_Id=" + DrDoL_Chapter.SelectedValue;
            SDS_Topic.DataBind();
            DrDoL_Topic.DataBind();
        }

        protected void Update_btn_Click(object sender, EventArgs e)
        {
            id = Request.QueryString["id"];

            SqlCommand com = new SqlCommand("UPDATE Topic SET Topic_Id=@Tid, Question=@Q, Question_image=@Q_im, Option_A=@O_A, Option_A_image=@O_A_im, Option_B=@O_B, Option_B_image=@O_B_im, Option_C=@O_C, Option_C_image=@O_C_im, Option_D=@O_D, Option_D_image=@O_D_im, Difficulty_level=@df_lvl, Correct_option=@C_O WHERE Q_id=@id", con);
            com.Parameters.AddWithValue("@id", id);
            com.Parameters.AddWithValue("@Tid", DrDoL_Topic.SelectedValue);
            com.Parameters.AddWithValue("@Q", TxtB_Question.Text);

            string img_path_QI = "NO FILE SELECTED";
            if (FUp_QI.HasFile)
            {
                img_path_QI = FUp_QI.FileName;
                FUp_QI.SaveAs(Server.MapPath("~/Faculty_side/Question_Bank_Images/") + img_path_QI);
                com.Parameters.AddWithValue("@Q_im", "~/Faculty_side/Question_Bank_Images/" + img_path_QI);
            }
            else
            {
                com.Parameters.AddWithValue("@Q_im", DBNull.Value);
            }

            com.Parameters.AddWithValue("@O_A", TxtB_Op_A.Text);
            string img_path_Op_A = "NO FILE SELECTED";
            if (FUp_Op_A.HasFile)
            {
                img_path_Op_A = FUp_Op_A.FileName;
                FUp_Op_A.SaveAs(Server.MapPath("~/Faculty_side/Question_Bank_Images/") + img_path_Op_A);
                com.Parameters.AddWithValue("@O_A_im", "~/Faculty_side/Question_Bank_Images/" + img_path_Op_A);
            }
            else
            {
                com.Parameters.AddWithValue("@O_A_im", DBNull.Value);
            }

            com.Parameters.AddWithValue("@O_B", TxtB_Op_B.Text);
            string img_path_Op_B = "NO FILE SELECTED";
            if (FUp_Op_B.HasFile)
            {
                img_path_Op_B = FUp_Op_B.FileName;
                FUp_Op_B.SaveAs(Server.MapPath("~/Faculty_side/Question_Bank_Images/") + img_path_Op_B);
                com.Parameters.AddWithValue("@O_B_im", "~/Faculty_side/Question_Bank_Images/" + img_path_Op_B);
            }
            else
            {
                com.Parameters.AddWithValue("@O_B_im", DBNull.Value);
            }

            com.Parameters.AddWithValue("@O_C", TxtB_Op_C.Text);
            string img_path_Op_C = "NO FILE SELECTED";
            if (FUp_Op_C.HasFile)
            {
                img_path_Op_C = FUp_Op_C.FileName;
                FUp_Op_C.SaveAs(Server.MapPath("~/Faculty_side/Question_Bank_Images/") + img_path_Op_C);
                com.Parameters.AddWithValue("@O_C_im", "~/Faculty_side/Question_Bank_Images/" + img_path_Op_C);
            }
            else
            {
                com.Parameters.AddWithValue("@O_C_im", DBNull.Value);
            }

            com.Parameters.AddWithValue("@O_D", TxtB_Op_D.Text);
            string img_path_Op_D = "NO FILE SELECTED";
            if (FUp_Op_D.HasFile)
            {
                img_path_Op_D = FUp_Op_D.FileName;
                FUp_Op_D.SaveAs(Server.MapPath("~/Faculty_side/Question_Bank_Images/") + img_path_Op_D);
                com.Parameters.AddWithValue("@O_D_im", "~/Faculty_side/Question_Bank_Images/" + img_path_Op_D);
            }
            else
            {
                com.Parameters.AddWithValue("@O_D_im", DBNull.Value);
            }

            com.Parameters.AddWithValue("@df_lvl", RaBuL_Dif_Lvl.SelectedValue);
            com.Parameters.AddWithValue("@C_O", RaBuL_Co_Op.SelectedValue);

            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }
            com.ExecuteNonQuery();
        }

        protected void Delete_btn_Click(object sender, EventArgs e)
        {
            SqlCommand com = new SqlCommand("DELETE FROM Questions WHERE Q_id=" + id, con);

            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }
            com.ExecuteNonQuery();

            Response.Redirect("Manage_Question_Bank.aspx");
        }

        protected void Cancel_btn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Manage_Question_Bank.aspx");
        }
    }
}