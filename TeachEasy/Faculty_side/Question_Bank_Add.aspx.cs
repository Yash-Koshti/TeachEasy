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
    public partial class Question_Bank_Add : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Fac_Id"] != null)
            {
                if (!IsPostBack)
                {
                    if (con.State != ConnectionState.Open)
                    {
                        con.Open();
                    }

                    SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM Faculty_Subject WHERE Fac_Id=" + Session["Fac_Id"], con);
                    DataTable dt = new DataTable();
                    adp.Fill(dt);

                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        SDS_Subject.SelectCommand = "SELECT * FROM Subject WHERE Subject_ID=" + dt.Rows[i][2].ToString();
                        SDS_Subject.DataBind();
                        DrDoL_Subject.DataBind();
                    }
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

            DrDoL_Chapter.Items.Clear();
            DrDoL_Chapter.Items.Add(new ListItem("--Select--", "NULL"));
            DrDoL_Chapter.DataBind();
        }

        protected void DrDoL_Unit_SelectedIndexChanged(object sender, EventArgs e)
        {
            SDS_Chapter.SelectCommand = "SELECT * FROM Chapter WHERE Subject_Id=" + DrDoL_Subject.SelectedValue + "AND Unit_Id=" + DrDoL_Unit.SelectedValue;
            SDS_Chapter.DataBind();

            DrDoL_Chapter.Items.Clear();
            DrDoL_Chapter.Items.Add(new ListItem("--Select--", "NULL"));
            DrDoL_Chapter.DataBind();
        }

        protected void DrDoL_Chapter_SelectedIndexChanged(object sender, EventArgs e)
        {
            SDS_Topic.SelectCommand = "SELECT * FROM Topic WHERE Ch_Id=" + DrDoL_Chapter.SelectedValue;
            SDS_Topic.DataBind();

            DrDoL_Topic.Items.Clear();
            DrDoL_Topic.Items.Add(new ListItem("--Select--", "NULL"));
            DrDoL_Topic.DataBind();
        }

        protected void Add_btn_Click(object sender, EventArgs e)
        {
            SqlCommand com = new SqlCommand("SELECT MAX(Q_id) FROM Questions", con);
            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }
            string max_id_str = com.ExecuteScalar().ToString();
            int max_id = Convert.ToInt32(max_id_str);
            com = new SqlCommand("INSERT INTO Questions VALUES(@id, @Tid, @Q, @Q_im, @O_A, @O_A_im, @O_B, @O_B_im, @O_C, @O_C_im, @O_D, @O_D_im, @df_lvl, @C_O)", con);

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
            com.Parameters.AddWithValue("@id", max_id + 1);
            com.Parameters.AddWithValue("@Tid", DrDoL_Topic.SelectedValue);
            com.Parameters.AddWithValue("@Q", TxtB_Question.Text);
            com.Parameters.AddWithValue("@O_A", TxtB_Op_A.Text);
            com.Parameters.AddWithValue("@O_B", TxtB_Op_B.Text);
            com.Parameters.AddWithValue("@O_C", TxtB_Op_C.Text);
            com.Parameters.AddWithValue("@O_D", TxtB_Op_D.Text);
            com.Parameters.AddWithValue("@df_lvl", RaBuL_Dif_Lvl.SelectedValue);
            com.Parameters.AddWithValue("@C_O", RaBuL_Co_Op.SelectedValue);

            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }
            com.ExecuteNonQuery();

            Response.Redirect("Question_Bank_Add.aspx");
        }

        protected void Cancel_btn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Manage_Question_Bank.aspx");
        }
    }
}