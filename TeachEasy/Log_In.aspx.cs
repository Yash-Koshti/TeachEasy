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
    public partial class Log_in : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }

            //For Log-out
            if (Session["Admin_id"] != null)
            {
                Session.Remove("Admin_id");
                Session.Remove("Admin_name");
                Session.Remove("Password");
            }
            else if(Session["Fac_Id"] != null)
            {
                Session.Remove("Fac_Id");
                Session.Remove("Fac_Name");
                Session.Remove("Profile_Image");
                Session.Remove("E_mail");
                Session.Remove("Ph_number");
                Session.Remove("Qualification");
                Session.Remove("Gender");
                Session.Remove("DOB");
                Session.Remove("Password");
                Session.Remove("FS_Id");
                Session.Remove("Subject_Id");
            }
            else if (Session["S_Id"] != null)
            {
                Session.Remove("S_Id");
                Session.Remove("S_name");
                Session.Remove("Profile_image");
                Session.Remove("E_mail");
                Session.Remove("Ph_number");
                Session.Remove("Gender");
                Session.Remove("DOB");
                Session.Remove("Password");
                Session.Remove("Admission_Id");
                Session.Remove("Admission_Date");
                Session.Remove("Sem_Id");
            }
        }

        protected void Btn_Sign_in_Click(object sender, EventArgs e)
        {
            if(DrDoL_User_Type.SelectedValue == "NULL")
            {
                SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM Admin WHERE Admin_name=@uname AND Password=@pass", con);
                adp.SelectCommand.Parameters.AddWithValue("@uname", TxtB_Uname.Text);
                adp.SelectCommand.Parameters.AddWithValue("@pass", TxtB_Pwd.Text);
                DataTable dt = new DataTable();
                adp.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    Session["Admin_id"] = dt.Rows[0]["Admin_id"];
                    Session["Admin_name"] = dt.Rows[0]["Admin_name"];
                    Session["Password"] = dt.Rows[0]["Password"];

                    Response.Redirect("~/Admin_side/Manage_Admin.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Invalid Credentials! OR Try changing your Role.');</script>");
                }
            }
            else if(DrDoL_User_Type.SelectedValue == "Faculty")
            {
                SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM Faculty WHERE Fac_Name=@uname AND Password=@pass", con);
                adp.SelectCommand.Parameters.AddWithValue("@uname", TxtB_Uname.Text);
                adp.SelectCommand.Parameters.AddWithValue("@pass", TxtB_Pwd.Text);
                DataTable dt = new DataTable();
                adp.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    Session["Fac_Id"] = dt.Rows[0]["Fac_Id"];
                    Session["Fac_Name"] = dt.Rows[0]["Fac_Name"];
                    Session["Profile_Image"] = dt.Rows[0]["Profile_Image"];
                    Session["E_mail"] = dt.Rows[0]["E_mail"];
                    Session["Ph_number"] = dt.Rows[0]["Ph_number"];
                    Session["Qualification"] = dt.Rows[0]["Qualification"];
                    Session["Gender"] = dt.Rows[0]["Gender"];
                    Session["DOB"] = dt.Rows[0]["DOB"];
                    Session["Password"] = dt.Rows[0]["Password"];

                    adp = new SqlDataAdapter("SELECT * FROM Faculty_Subject WHERE Fac_Id=" + Session["Fac_Id"].ToString(), con);
                    DataTable dt2 = new DataTable();
                    adp.Fill(dt2);

                    string fs = "", sub = "";
                    if (dt2.Rows.Count > 1)
                    {
                        for (int i = 0; i < dt2.Rows.Count; i++)
                        {
                            fs = fs + dt2.Rows[i]["FS_Id"].ToString() + ",";
                            sub = sub + dt2.Rows[i]["Subject_Id"].ToString() + ",";
                        }
                        Session["FS_Id"] = fs.Substring(0, fs.Length - 1);
                        Session["Subject_Id"] = sub.Substring(0, sub.Length - 1);
                    }
                    else
                    {
                        Session["FS_Id"] = dt2.Rows[0]["FS_Id"].ToString();
                        Session["Subject_Id"] = dt2.Rows[0]["Subject_Id"].ToString();
                    }

                    Response.Redirect("~/Faculty_side/Manage_Faculty.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Invalid Credentials!');</script>");
                }
            }
            else if(DrDoL_User_Type.SelectedValue == "Student")
            {
                SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM Student WHERE S_name=@uname AND Password=@pass", con);
                adp.SelectCommand.Parameters.AddWithValue("@uname", TxtB_Uname.Text);
                adp.SelectCommand.Parameters.AddWithValue("@pass", TxtB_Pwd.Text);
                DataTable dt = new DataTable();
                adp.Fill(dt);

                if (dt.Rows.Count > 0)
                {
                    Session["S_Id"] = dt.Rows[0]["S_Id"];
                    Session["S_name"] = dt.Rows[0]["S_name"];
                    Session["Profile_image"] = dt.Rows[0]["Profile_image"];
                    Session["E_mail"] = dt.Rows[0]["E_mail"];
                    Session["Ph_number"] = dt.Rows[0]["Ph_number"];
                    Session["Gender"] = dt.Rows[0]["Gender"];
                    Session["DOB"] = dt.Rows[0]["DOB"];
                    Session["Password"] = dt.Rows[0]["Password"];

                    adp = new SqlDataAdapter("SELECT * FROM Admission WHERE S_Id=" + Session["S_Id"], con);
                    DataTable dt2 = new DataTable();
                    adp.Fill(dt2);

                    Session["Admission_Id"] = dt2.Rows[0]["Admission_Id"];
                    Session["Admission_Date"] = dt2.Rows[0]["Admission_Date"];
                    Session["Sem_Id"] = dt2.Rows[0]["Sem_Id"];

                    Response.Redirect("~/Student_side/Manage_Student.aspx");
                }
                else
                {
                    Response.Write("<script>alert('Invalid Credentials!');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Please Select Your Role!');</script>");
            }
        }

        protected void DrDoL_User_Type_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DrDoL_User_Type.SelectedValue == "Faculty")
            {
                DrDoL_User_Type.Items.Clear();
                DrDoL_User_Type.Items.Add(new ListItem("Faculty", "Faculty"));
                DrDoL_User_Type.Items.Add(new ListItem("Student", "Student"));
                DrDoL_User_Type.DataBind();
            }
            else
            {
                DrDoL_User_Type.Items.Clear();
                DrDoL_User_Type.Items.Add(new ListItem("Student", "Student"));
                DrDoL_User_Type.Items.Add(new ListItem("Faculty", "Faculty"));
                DrDoL_User_Type.DataBind();
            }
        }
    }
}