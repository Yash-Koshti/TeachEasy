using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace TeachEasy.Admin_side
{
    public partial class Faculty_Edit : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");
        static String id;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin_id"] != null)
            {
                if (!IsPostBack)
                {
                    id = Request.QueryString["id"];

                    if (con.State != ConnectionState.Open)
                    {
                        con.Open();
                    }

                    SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM Faculty where Fac_Id=@id", con);
                    adp.SelectCommand.Parameters.AddWithValue("@id", id);
                    DataTable dt = new DataTable();
                    adp.Fill(dt);

                    TextBox1.Text = dt.Rows[0][1].ToString();
                    TextBox2.Text = dt.Rows[0][3].ToString();
                    TextBox3.Text = dt.Rows[0][4].ToString();
                    TextBox4.Text = dt.Rows[0][5].ToString();
                    TextBox5.Text = dt.Rows[0][7].ToString();
                    TextBox6.Text = dt.Rows[0][8].ToString();
                }
            }
            else
            {
                Response.Redirect("~/Log_In.aspx");
            }
        }

        protected void Update_btn_Click(object sender, EventArgs e)
        {
            id = Request.QueryString["id"];

            string img_path = "NO FILE SELECTED";
            if (FileUpload1.PostedFile != null)
            {
                img_path = FileUpload1.FileName;
                FileUpload1.SaveAs(Server.MapPath("~/Faculty_side/Faculty_Profile_Images/") + img_path);
            }

            SqlCommand com = new SqlCommand("UPDATE Faculty SET Fac_Name=@name, E_mail=@em, Ph_number=@ph, Qualification=@qua, Gender=@gen, DOB=@dob, Password=@pwd WHERE Fac_Id=@id", con);
            com.Parameters.AddWithValue("@id", id);
            com.Parameters.AddWithValue("@name", TextBox1.Text);
            com.Parameters.AddWithValue("@pi", "~/Faculty_side/Faculty_Profile_Images/" + img_path);
            com.Parameters.AddWithValue("@em", TextBox2.Text);
            com.Parameters.AddWithValue("@ph", TextBox3.Text);
            com.Parameters.AddWithValue("@qua", TextBox4.Text);
            com.Parameters.AddWithValue("@gen", RadioButtonList1.SelectedValue.ToString());
            com.Parameters.AddWithValue("@dob", TextBox5.Text);
            com.Parameters.AddWithValue("@pwd", TextBox6.Text);

            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }
            com.ExecuteNonQuery();

            Response.Redirect("Manage_Faculty.aspx");
        }

        protected void Delete_btn_Click(object sender, EventArgs e)
        {
            SqlCommand com = new SqlCommand("DELETE FROM Faculty WHERE Fac_Id=" + id, con);

            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }
            com.ExecuteNonQuery();

            Response.Redirect("Manage_Faculty.aspx");
        }

        protected void Cancel_btn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Manage_Faculty.aspx");
        }
    }
}