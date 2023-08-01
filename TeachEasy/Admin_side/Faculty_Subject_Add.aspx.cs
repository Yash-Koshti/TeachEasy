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
    public partial class Faculty_SubjectAdd : System.Web.UI.Page
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
            SqlCommand com = new SqlCommand("SELECT MAX(FS_Id) FROM Faculty_Subject", con);
            string max_id_str = com.ExecuteScalar().ToString();
            int max_id = Convert.ToInt32(max_id_str);

            com = new SqlCommand("INSERT INTO Faculty_Subject VALUES(@id, @fac, @sub)", con);
            com.Parameters.AddWithValue("@id", (max_id + 1).ToString());
            com.Parameters.AddWithValue("@fac", DrDoL_Faculty.SelectedValue);
            com.Parameters.AddWithValue("@sub", DrDoL_Subject.SelectedValue);

            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }
            com.ExecuteNonQuery();

            Response.Redirect("Manage_Faculty_Subject.aspx");
        }
    }
}