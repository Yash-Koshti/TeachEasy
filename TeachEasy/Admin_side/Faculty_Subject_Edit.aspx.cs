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
    public partial class Faculty_SubjectEdit : System.Web.UI.Page
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

                    SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM Faculty_Subject WHERE FS_Id=@id", con);
                    adp.SelectCommand.Parameters.AddWithValue("@id", id);
                    DataTable dt = new DataTable();
                    adp.Fill(dt);

                    DrDoL_Faculty.SelectedValue = dt.Rows[0][1].ToString();
                    DrDoL_Subject.SelectedValue = dt.Rows[0][2].ToString();
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

            SqlCommand com = new SqlCommand("UPDATE Faculty_Subject SET Fac_Id=@fac, Subject_Id=@sub WHERE FS_Id=@id", con);
            com.Parameters.AddWithValue("@id", id);
            com.Parameters.AddWithValue("@fac", DrDoL_Faculty.SelectedValue);
            com.Parameters.AddWithValue("@sub", DrDoL_Subject.SelectedValue);
            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }
            com.ExecuteNonQuery();

            Response.Redirect("Manage_Faculty_Subject.aspx");
        }

        protected void Delete_btn_Click(object sender, EventArgs e)
        {
            SqlCommand com = new SqlCommand("DELETE FROM Faculty_Subject WHERE FS_Id=" + id, con);

            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }
            com.ExecuteNonQuery();

            Response.Redirect("Manage_Faculty_Subject.aspx");
        }
    }
}