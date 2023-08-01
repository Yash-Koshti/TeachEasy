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
    public partial class UnitEdit : System.Web.UI.Page
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

                    SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM Unit where Unit_Id=@id", con);
                    adp.SelectCommand.Parameters.AddWithValue("@id", id);
                    DataTable dt = new DataTable();
                    adp.Fill(dt);

                    TextBox1.Text = dt.Rows[0][1].ToString();
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

            SqlCommand com = new SqlCommand("UPDATE Unit SET Unit_Name=@name, Weightage=@wei WHERE Unit_Id=@id", con);
            com.Parameters.AddWithValue("@id", id);
            com.Parameters.AddWithValue("@name", TextBox1.Text);
            com.Parameters.AddWithValue("@wei", TextBox2.Text);
            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }
            com.ExecuteNonQuery();
        }

        protected void Delete_btn_Click(object sender, EventArgs e)
        {
            SqlCommand com = new SqlCommand("DELETE FROM Unit WHERE Unit_Id=" + id, con);

            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }
            com.ExecuteNonQuery();

            Response.Redirect("Manage_Unit.aspx");
        }
    }
}