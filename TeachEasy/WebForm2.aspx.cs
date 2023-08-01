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
    public partial class WebForm2 : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }

            SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM TopicView", con);
            DataSet ds = new DataSet();
            adp.Fill(ds, "TopicView");

            GridView1.DataSource = ds.Tables["TopicView"];
            GridView1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlCommand com = new SqlCommand("SELECT MAX(subject_Id) FROM subject", con);
            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }
            string max_id_str = com.ExecuteScalar().ToString();
            int max_id = Convert.ToInt32(max_id_str);

            com = new SqlCommand("INSERT INTO subject VALUES(@id,@name,@type,@cat,@sem)", con);
            com.Parameters.AddWithValue("@id", (max_id + 1).ToString());
            com.Parameters.AddWithValue("@name", TextBox1.Text);
            com.Parameters.AddWithValue("@type", TextBox2.Text);
            com.Parameters.AddWithValue("@cat", TextBox3.Text);
            com.Parameters.AddWithValue("@sem", DropDownList1.SelectedValue);

            com.ExecuteNonQuery();


        }

        protected void SqlDataSource2_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }
    }
}