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
    public partial class FacultyEdit : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Fac_Id"] != null)
            {
                if (!IsPostBack)
                {
                    if (con.State != ConnectionState.Open)
                    {
                        con.Open();
                    }

                    if (Session["Profile_Image"] != null)
                    {
                        Img_Profile_Image.ImageUrl = Session["Profile_Image"].ToString();
                    }
                    else
                    {
                        Img_Profile_Image.ImageUrl = "~/TE_CssClass_Files/assets/img/avatar/avatar-1.png";
                    }
                    TxtB_Name.Text = Session["Fac_Name"].ToString();
                    TxtB_Email.Text = Session["E_mail"].ToString();
                    TxtB_Ph_num.Text = Session["Ph_number"].ToString();
                    TxtB_Qualifi.Text = Session["Qualification"].ToString();
                    RaBuL_Gender.SelectedValue = Session["Gender"].ToString();
                    TxtB_DOB.Text = DateTime.Parse(Session["DOB"].ToString()).ToShortDateString();
                    TxtB_DOB.DataBind();
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
            string img_path = "NO FILE SELECTED";
            if (FUp_Profile_Image.HasFile)
            {
                img_path = FUp_Profile_Image.FileName;
                FUp_Profile_Image.SaveAs(Server.MapPath("~/Faculty_side/Faculty_Profile_Images/") + img_path);
            }

            SqlCommand com = new SqlCommand("UPDATE Faculty SET Fac_Name=@name, E_mail=@em, Ph_number=@ph, Qualification=@qua, Gender=@gen, DOB=@dob, Password=@pwd WHERE Fac_Id=@id", con);
            com.Parameters.AddWithValue("@id", Session["Fac_Id"]);
            com.Parameters.AddWithValue("@name", TxtB_Name.Text);
            com.Parameters.AddWithValue("@pi", "~/Faculty_side/Faculty_Profile_Images/" + img_path);
            com.Parameters.AddWithValue("@em", TxtB_Email.Text);
            com.Parameters.AddWithValue("@ph", TxtB_Ph_num.Text);
            com.Parameters.AddWithValue("@qua", TxtB_Qualifi.Text);
            com.Parameters.AddWithValue("@gen", RaBuL_Gender.SelectedValue.ToString());
            com.Parameters.AddWithValue("@dob", DateTime.Parse(TxtB_DOB.Text).ToShortDateString());
            com.Parameters.AddWithValue("@pwd", TxtB_Pwd.Text);

            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }
            com.ExecuteNonQuery();

            Session["Fac_Name"] = TxtB_Name.Text;
            Session["Profile_Image"] = "~/Faculty_side/Faculty_Profile_Images/" + img_path;
            Session["E_mail"] = TxtB_Email.Text;
            Session["Ph_number"] = TxtB_Ph_num.Text;
            Session["Qualification"] = TxtB_Qualifi.Text;
            Session["Gender"] = RaBuL_Gender.SelectedValue.ToString();
            Session["DOB"] = DateTime.Parse(TxtB_DOB.Text).ToShortDateString();
            Session["Password"] = TxtB_Pwd.Text;

            Response.Redirect("Manage_Faculty.aspx");
        }
    }
}