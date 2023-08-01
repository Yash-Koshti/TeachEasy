using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace TeachEasy
{
    public partial class Add_New_Data : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True;Connect Timeout=30");
        protected void Page_Load(object sender, EventArgs e)
        {
            Panel1.Visible = true;
            SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM Student", con);
            DataSet ds = new DataSet();
            adp.Fill(ds, "Student");

            GridView1.DataSource = ds.Tables["Student"];
            GridView1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlCommand com = new SqlCommand("SELECT MAX(S_Id) FROM Student", con);
            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }
            string upd_id = com.ExecuteScalar().ToString();
            int last_id = Convert.ToInt32(upd_id);

            string img_path = "NO FILE SELECTED";
            if (FileUpload1.PostedFile != null)
            {
                img_path = FileUpload1.PostedFile.FileName;
                FileUpload1.SaveAs(Server.MapPath("~/StudentProfileImages/") + img_path);
                Response.Write("<script>alert('File Uploaded Succesfully!');</script>");
            }

            com = new SqlCommand("INSERT INTO Student VALUES(@id, @name, @pi, @em, @ph, @gen, @dob, @pwd)", con);
            com.Parameters.AddWithValue("@id", (last_id + 1).ToString());
            com.Parameters.AddWithValue("@name", TextBox1.Text);
            com.Parameters.AddWithValue("@pi", "~/Student Profile Images/" + img_path);
            com.Parameters.AddWithValue("@em", TextBox3.Text);
            com.Parameters.AddWithValue("@ph", TextBox4.Text);
            com.Parameters.AddWithValue("@gen", RadioButtonList1.SelectedValue.ToString());
            com.Parameters.AddWithValue("@dob", Calendar1.SelectedDate);
            com.Parameters.AddWithValue("@pwd", "teacheasy");
            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }
            com.ExecuteNonQuery();

            Panel1.Visible = true;
            SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM Student", con);
            DataSet ds = new DataSet();
            adp.Fill(ds, "Student");

            GridView1.DataSource = ds.Tables["Student"];
            GridView1.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string id = GridView1.SelectedRow.Cells[1].Text;

            int int_id = Convert.ToInt32(id);
            SqlCommand com = new SqlCommand("DELETE FROM Student WHERE S_Id=" + id, con);
            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }
            com.ExecuteNonQuery();
        }
    }
}