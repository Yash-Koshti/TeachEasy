using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace TeachEasy
{
    public partial class Manage_Admin : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS01;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }

            SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM Admin", con);
            DataSet ds = new DataSet();
            adp.Fill(ds, "Admin");

            GridView1.DataSource = ds.Tables["Admin"];
            GridView1.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            TextBox1.Text = GridView1.SelectedRow.Cells[1].Text;
            TextBox2.Text = GridView1.SelectedRow.Cells[2].Text;
            TextBox3.Text = GridView1.SelectedRow.Cells[3].Text;
        }

        protected void Add_btn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin_side/Admin_Add.aspx");
        }

        protected void Update_btn_Click(object sender, EventArgs e)
        {
            SqlCommand com = new SqlCommand("UPDATE Admin SET Admin_name=@name, Password=@pwd WHERE Admin_Id=@id", con);
            com.Parameters.AddWithValue("@id", TextBox1.Text);
            com.Parameters.AddWithValue("@name", TextBox2.Text);
            com.Parameters.AddWithValue("@pwd", TextBox3.Text);

            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }
            com.ExecuteNonQuery();

            SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM Admin", con);
            DataSet ds = new DataSet();
            adp.Fill(ds, "Admin");

            GridView1.DataSource = ds.Tables["Admin"];
            GridView1.DataBind();
        }

        protected void Delete_btn_Click(object sender, EventArgs e)
        {
            SqlCommand com = new SqlCommand("DELETE FROM Admin WHERE Admin_Id=" + TextBox1.Text, con);

            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }
            com.ExecuteNonQuery();

            SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM Admin", con);
            DataSet ds = new DataSet();
            adp.Fill(ds, "Admin");

            GridView1.DataSource = ds.Tables["Admin"];
            GridView1.DataBind();
        }
    }
}
