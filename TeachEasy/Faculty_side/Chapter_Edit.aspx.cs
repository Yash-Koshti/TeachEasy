using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace TeachEasy.Faculty_side
{
    public partial class ChapterEdit : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");
        static String id;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Fac_Id"] != null)
            {
                if (!IsPostBack)
                {
                    id = Request.QueryString["id"];

                    if (con.State != ConnectionState.Open)
                    {
                        con.Open();
                    }

                    SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM Chapter WHERE Ch_Id=@id", con);
                    adp.SelectCommand.Parameters.AddWithValue("@id", id);
                    DataTable dt = new DataTable();
                    adp.Fill(dt);

                    TxtB_Title.Text = dt.Rows[0][1].ToString();
                    DrDoL_Subject.SelectedValue = dt.Rows[0][2].ToString();
                    DrDoL_Unit.SelectedValue = dt.Rows[0][3].ToString();
                    TxtB_Desc.Text = dt.Rows[0][4].ToString();
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
            SqlCommand com = new SqlCommand("UPDATE Chapter SET Ch_title=@title, Subject_Id=@sub, Unit_Id=@unit, Description=@desc WHERE Ch_Id=@id", con);
            com.Parameters.AddWithValue("@id", id);
            com.Parameters.AddWithValue("@title", TxtB_Title.Text);
            com.Parameters.AddWithValue("@sub", DrDoL_Subject.SelectedValue);
            com.Parameters.AddWithValue("@unit", DrDoL_Unit.SelectedValue);
            com.Parameters.AddWithValue("@desc", TxtB_Desc.Text);

            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }
            com.ExecuteNonQuery();
        }

        protected void Delete_btn_Click(object sender, EventArgs e)
        {
            SqlCommand com = new SqlCommand("DELETE FROM Chapter WHERE Ch_Id=" + id, con);

            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }
            com.ExecuteNonQuery();

            Response.Redirect("Manage_Chapter.aspx");
        }

        protected void Go_back_btn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Manage_Chapter.aspx");
        }
    }
}