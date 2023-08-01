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
    public partial class SubjectAdd : System.Web.UI.Page
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
            SqlCommand com = new SqlCommand("SELECT MAX(Subject_Id) FROM Subject", con);
            string max_id_str = com.ExecuteScalar().ToString();
            int max_id = Convert.ToInt32(max_id_str);

            com = new SqlCommand("INSERT INTO Subject VALUES(@id, @name, @type, @cate, @sem)", con);
            com.Parameters.AddWithValue("@id", (max_id + 1).ToString());
            com.Parameters.AddWithValue("@name", TextBox1.Text);
            com.Parameters.AddWithValue("@type", TextBox2.Text);
            com.Parameters.AddWithValue("@cate", TextBox3.Text);
            com.Parameters.AddWithValue("@sem", DropDownList1.SelectedValue);

            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }
            com.ExecuteNonQuery();

            Response.Redirect("Manage_Subject.aspx");
        }

        protected void Cancel_btn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Manage_Subject.aspx");
        }
    }
}