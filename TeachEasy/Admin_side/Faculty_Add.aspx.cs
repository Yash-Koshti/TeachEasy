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
    public partial class Faculty_Add : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin_id"] != null)
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
            SqlCommand com = new SqlCommand("SELECT MAX(Fac_Id) FROM Faculty", con);
            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }
            string upd_id = com.ExecuteScalar().ToString();
            int last_id = Convert.ToInt32(upd_id);

            string img_path = "NO FILE SELECTED";
            if (FileUpload1.PostedFile != null)
            {
                img_path = FileUpload1.FileName;
                FileUpload1.SaveAs(Server.MapPath("~/Faculty_side/Faculty_Profile_Images/") + img_path);
            }

            com = new SqlCommand("INSERT INTO Faculty (Fac_Id, Fac_Name, E_mail, Ph_number, Qualification, Gender, DOB, Password) VALUES(@id, @name, @em, @ph, @qua, @gen, @dob, @pwd)", con);
            com.Parameters.AddWithValue("@id", (last_id + 1).ToString());
            com.Parameters.AddWithValue("@name", TextBox1.Text);
            com.Parameters.AddWithValue("@pi", "~/Faculty_side/Faculty_Profile_Images/" + img_path);
            com.Parameters.AddWithValue("@em", TextBox2.Text);
            com.Parameters.AddWithValue("@ph", TextBox3.Text);
            com.Parameters.AddWithValue("@qua", TextBox4.Text);
            com.Parameters.AddWithValue("@gen", RadioButtonList1.SelectedValue.ToString());
            com.Parameters.AddWithValue("@dob", TextBox5.Text);
            com.Parameters.AddWithValue("@pwd", "teacheasy");
            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }
            com.ExecuteNonQuery();

            Response.Redirect("Manage_Faculty.aspx");
        }
    }
}