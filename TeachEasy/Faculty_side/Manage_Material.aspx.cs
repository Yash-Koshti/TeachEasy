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
    public partial class ManageMaterial : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Fac_Id"] != null)
            {
                if (con.State != ConnectionState.Open)
                {
                    con.Open();
                }

                //SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM Material", con);
                //DataSet ds = new DataSet();
                //adp.Fill(ds, "Material");

                //GridView1.DataSource = ds.Tables["Material"];
                //GridView1.DataBind();
            }
            else
            {
                Response.Redirect("~/Log_In.aspx");
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Response.Redirect("Material_Edit.aspx?id=" + GrV_Material.SelectedRow.Cells[1].Text);
        }

        protected void Add_btn_Click(object sender, EventArgs e)
        {
            Response.Redirect("Material_Add.aspx");
        }

        protected void DrDoL_M_Type_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DrDoL_M_Type.SelectedValue != "NULL")
            {
                SDS_Mateial.SelectCommand = "SELECT * FROM Material WHERE M_Type='" + DrDoL_M_Type.SelectedValue.ToString() + "'";
                SDS_Mateial.DataBind();
                GrV_Material.DataBind();
            }
            else
            {
                SDS_Mateial.SelectCommand = "SELECT * FROM Material";
                SDS_Mateial.DataBind();
                GrV_Material.DataBind();
            }
        }
    }
}