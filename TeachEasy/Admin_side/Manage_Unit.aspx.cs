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
    public partial class ManageUnit : System.Web.UI.Page
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

                //SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM Unit", con);
                //DataSet ds = new DataSet();
                //adp.Fill(ds, "Unit");

                //GridView1.DataSource = ds.Tables["Unit"];
                //GridView1.DataBind();
            }
            else
            {
                Response.Redirect("~/Log_In.aspx");
            }
        }

        protected void Add_btn_Click(object sender, EventArgs e)
        {
            SqlCommand com = new SqlCommand("SELECT MAX(Unit_Id) FROM Unit", con);
            string max_id_str = com.ExecuteScalar().ToString();
            int max_id = Convert.ToInt32(max_id_str);

            com = new SqlCommand("INSERT INTO Unit VALUES(@id, @name, @wei)", con);
            com.Parameters.AddWithValue("@id", (max_id + 1).ToString());
            com.Parameters.AddWithValue("@name", TextBox1.Text);
            com.Parameters.AddWithValue("@wei", TextBox2.Text);

            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }
            com.ExecuteNonQuery();

            Response.Redirect("Manage_Unit.aspx");
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect("Unit_Edit.aspx?id=" + GridView1.SelectedRow.Cells[1].Text);
        }
    }
}