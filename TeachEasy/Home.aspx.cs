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
    public partial class WebForm1 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS01;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }

            /*String table_name;
            table_name = TextBox1.Text;*/

            /*SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM Student", con);
            DataSet ds = new DataSet();
            adp.Fill(ds, "Student");

            GridView1.DataSource = ds.Tables["Student"];
            GridView1.DataBind();*/
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlCommand com = new SqlCommand("SELECT Password FROM Admin WHERE Admin_name=@uname", con);
            com.Parameters.AddWithValue("@uname", TextBox1.Text);

            string pwd = com.ExecuteScalar().ToString();

            if (TextBox2.Text == pwd)
            {
                Response.Redirect("~/Manage Admin.aspx");
            }
            else
            {
                Response.Write("<script>alert('Incorrect Password!');</script>");
            }
        }
    }
}