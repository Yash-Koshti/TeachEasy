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
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True;Connect Timeout=30");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (con.State != ConnectionState.Open)
            {
                con.Open();
                Response.Write("<script>alert('Connection not opened!');</script>");
            }
            else
            {
                Response.Write("<script>alert('Connection is opened.');</script>");
            }

            /*String table_name;
            table_name = TextBox1.Text;*/

            SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM Student", con);
            DataSet ds = new DataSet();
            adp.Fill(ds, "Student");

            GridView1.DataSource = ds.Tables["Student"];
            GridView1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Add New Data.aspx");
        }
    }
}