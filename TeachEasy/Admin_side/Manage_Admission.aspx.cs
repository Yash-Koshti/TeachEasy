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
    public partial class ManageAdmission : System.Web.UI.Page
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

                //SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM Admission", con);
                //DataSet ds = new DataSet();
                //adp.Fill(ds, "Admission");

                //GridView1.DataSource = ds.Tables["Admission"];
                //GridView1.DataBind();
            }
            else
            {
                Response.Redirect("~/Log_In.aspx");
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect("Admission_Edit.aspx?id=" + GridView1.SelectedRow.Cells[1].Text);
        }

        protected void Add_btn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admission_Add.aspx");
        }
    }
}