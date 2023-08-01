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
    public partial class AdminEdit : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin_id"] != null)
            {
                if (!IsPostBack)
                {
                    if (con.State != ConnectionState.Open)
                    {
                        con.Open();
                    }

                    TxtB_Uname.Text = Session["Admin_name"].ToString();
                    TxtB_Pwd.Text = Session["Password"].ToString();
                }
            }
            else
            {
                Response.Redirect("~/Log_In.aspx");
            }
        }

        protected void Update_btn_Click(object sender, EventArgs e)
        {
            SqlCommand com = new SqlCommand("UPDATE Admin SET Admin_name=@name, Password=@pwd WHERE Admin_Id=@id", con);
            com.Parameters.AddWithValue("@id", Session["Admin_id"]);
            com.Parameters.AddWithValue("@name", TxtB_Uname.Text);
            com.Parameters.AddWithValue("@pwd", TxtB_Pwd.Text);

            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }
            com.ExecuteNonQuery();
        }
    }
}