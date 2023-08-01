using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace TeachEasy.Student_side
{
    public partial class StudentEdit : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["S_Id"] != null)
            {
                if (!IsPostBack)
                {
                    if (con.State != ConnectionState.Open)
                    {
                        con.Open();
                    }

                    if (Session["Profile_image"] != null)
                    {
                        Img_Profile_Image.ImageUrl = Session["Profile_image"].ToString();
                    }
                    else
                    {
                        Img_Profile_Image.ImageUrl = "~/TE_CssClass_Files/assets/img/avatar/avatar-1.png";
                    }
                    TxtB_Name.Text = Session["S_name"].ToString();
                    TxtB_Email.Text = Session["E_mail"].ToString();
                    TxtB_Ph_num.Text = Session["Ph_number"].ToString();
                    RaBuL_Gender.SelectedValue = Session["Gender"].ToString();
                    TxtB_DOB.Text =  DateTime.Parse(Session["DOB"].ToString()).ToShortDateString();
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
                FUp_Profile_Image.SaveAs(Server.MapPath("~/Student_side/Student_Profile_Images/") + img_path);
            }

            SqlCommand com = new SqlCommand("UPDATE Student SET S_name=@name, Profile_image=@pi, E_mail=@em, Ph_number=@ph, Gender=@gen, DOB=@dob, Password=@pwd WHERE S_Id=@id", con);
            com.Parameters.AddWithValue("@id", Session["S_Id"]);
            com.Parameters.AddWithValue("@name", TxtB_Name.Text);
            com.Parameters.AddWithValue("@pi", "~/Student_side/Student_Profile_Images/" + img_path);
            com.Parameters.AddWithValue("@em", TxtB_Email.Text);
            com.Parameters.AddWithValue("@ph", TxtB_Ph_num.Text);
            com.Parameters.AddWithValue("@gen", RaBuL_Gender.SelectedValue.ToString());
            com.Parameters.AddWithValue("@dob", DateTime.Parse(TxtB_DOB.Text).ToShortDateString());
            com.Parameters.AddWithValue("@pwd", TxtB_Pwd.Text);

            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }
            com.ExecuteNonQuery();

            Session["S_name"] = TxtB_Name.Text;
            Session["Profile_image"] = "~/Student_side/Student_Profile_Images/" + img_path;
            Session["E_mail"] = TxtB_Email.Text;
            Session["Ph_number"] = TxtB_Ph_num.Text;
            Session["Gender"] = RaBuL_Gender.SelectedValue;
            Session["DOB"] = DateTime.Parse(TxtB_DOB.Text).ToShortDateString();
            Session["Password"] = TxtB_Pwd.Text;

            Response.Redirect("Student_Edit.aspx");
        }
    }
}