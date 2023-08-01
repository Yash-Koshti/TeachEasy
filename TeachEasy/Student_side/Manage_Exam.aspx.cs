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
    public partial class Manage_Exam : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True;Connect Timeout=30;User Instance=True");
        int sr_num = 0;
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

                    Pnl_Standard.Visible = true;
                    Pnl_Custom.Visible = false;
                    Pnl_ShowAddChapters.Visible = false;
                    Pnl_ShowAddTopics.Visible = false;

                    SDS_Subject.SelectCommand = "SELECT * FROM Subject WHERE Sem_Id=" + Session["Sem_Id"];
                    SDS_Subject.DataBind();
                    DrDoL_Subject.DataBind();

                    SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM Chapter", con);
                    DataSet ds = new DataSet();
                    adp.Fill(ds,"Chapter");

                    LstB_Chapter.DataSource = ds.Tables["Chapter"];
                    LstB_Chapter.DataTextField = "ch_title";
                    LstB_Chapter.DataValueField = "ch_id";
                    LstB_Chapter.DataBind();
                }
            }
            else
            {
                Response.Redirect("~/Log_In.aspx");
            }
        }

        protected void DrDoL_Select_Exam_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(DrDoL_Select_Exam.SelectedValue == "Standard")
            {
                Pnl_Standard.Visible = true;
                Pnl_Custom.Visible = false;
                Pnl_AskAddChapters.Visible = false;
                Pnl_ShowAddChapters.Visible = false;
                Pnl_AskAddTopics.Visible = false;
                Pnl_ShowAddTopics.Visible = false;
            }
            else
            {
                Pnl_Standard.Visible = false;
                Pnl_Custom.Visible = true;
            }
        }

        protected void DrDoL_Subject_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DrDoL_Subject.SelectedValue.ToString() != "NULL")
            {
                SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM Chapter WHERE Subject_Id=" + DrDoL_Subject.SelectedValue.ToString(), con);
                DataSet ds = new DataSet();
                adp.Fill(ds, "Chapter");

                LstB_Chapter.Items.Clear();
                LstB_Selected_Chapters.Items.Clear();
                LstB_Topic.Items.Clear();
                LstB_Selected_Topics.Items.Clear();
                DrDoL_Unit.SelectedIndex = 0;

                LstB_Chapter.DataSource = ds.Tables["Chapter"];
                LstB_Chapter.DataTextField = "ch_title";
                LstB_Chapter.DataValueField = "ch_id";
                LstB_Chapter.DataBind();
                
                Pnl_ShowAddChapters.Visible = false;
                Pnl_ShowAddTopics.Visible = false;
                Pnl_AskAddChapters.Visible = true;
                Pnl_Unit_Exam.Visible = false;
            }
        }

        protected void Btn_Chapter_Move_All_Click(object sender, EventArgs e)
        {
            if (!Pnl_ShowAddTopics.Visible)
            {
                Pnl_AskAddTopics.Visible = true;
            }

            for (int i = LstB_Chapter.Items.Count - 1; i >= 0; i--)
            {
                LstB_Selected_Chapters.Items.Add(LstB_Chapter.Items[i]);
                LstB_Chapter.Items.Remove(LstB_Chapter.Items[i]);
            }

            LstB_Topic.Items.Clear();
            for (int j = 0; j < LstB_Selected_Chapters.Items.Count; j++)
            {
                SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM Topic WHERE Ch_Id=" + LstB_Selected_Chapters.Items[j].Value.ToString(), con);
                DataSet ds = new DataSet();
                adp.Fill(ds, "Topic");

                LstB_Topic.DataSource = ds.Tables["Topic"];
                LstB_Topic.DataTextField = "Topic_name";
                LstB_Topic.DataValueField = "Topic_Id";
                LstB_Topic.DataBind();
            }

            for (int m = 0; m < LstB_Selected_Topics.Items.Count; m++)
            {
                for (int n = 0; n < LstB_Topic.Items.Count; n++)
                {
                    if (LstB_Selected_Topics.Items[m] == LstB_Topic.Items[n])
                    {
                        LstB_Topic.Items.Remove(LstB_Topic.Items[n]);
                    }
                }
            }
        }
        
        protected void Btn_Chapter_Move_Right_Click(object sender, EventArgs e)
        {
            if (!Pnl_ShowAddTopics.Visible)
            {
                Pnl_AskAddTopics.Visible = true;
            }

            for (int i = 0; i < LstB_Chapter.Items.Count; i++)
            {
                if (LstB_Chapter.Items[i].Selected)
                {
                    LstB_Selected_Chapters.Items.Add(LstB_Chapter.Items[i]);                    
                }
            }

            for (int j = 0; j < LstB_Chapter.Items.Count; j++)
            {
                if (LstB_Chapter.Items[j].Selected)
                {
                    LstB_Chapter.Items.Remove(LstB_Chapter.Items[j]);
                }
            }

            LstB_Topic.Items.Clear();
            for (int j = 0; j < LstB_Selected_Chapters.Items.Count; j++)
            {
                SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM Topic WHERE Ch_Id=" + LstB_Selected_Chapters.Items[j].Value.ToString(), con);
                DataSet ds = new DataSet();
                adp.Fill(ds, "Topic");

                LstB_Topic.DataSource = ds.Tables["Topic"];
                LstB_Topic.DataTextField = "Topic_name";
                LstB_Topic.DataValueField = "Topic_Id";
                LstB_Topic.DataBind();
            }

            for(int m = 0; m < LstB_Selected_Topics.Items.Count; m++)
            {
                for(int n = 0; n < LstB_Topic.Items.Count; n++)
                {
                    if(LstB_Selected_Topics.Items[m] == LstB_Topic.Items[n])
                    {
                        LstB_Topic.Items.Remove(LstB_Topic.Items[n]);
                    }
                }
            }
        }

        protected void Btn_Chapter_Move_Left_Click(object sender, EventArgs e)
        {
            for (int k = 0; k < LstB_Selected_Chapters.Items.Count; k++)
            {
                if (LstB_Selected_Chapters.Items[k].Selected)
                {
                    LstB_Chapter.Items.Add(LstB_Selected_Chapters.Items[k]);
                }
            }

            for (int j = 0; j < LstB_Selected_Chapters.Items.Count; j++)
            {
                if (LstB_Selected_Chapters.Items[j].Selected)
                {
                    LstB_Selected_Chapters.Items.Remove(LstB_Selected_Chapters.Items[j]);
                }
            }

            //Update topics in LstB_Topic after removing chapters.
            LstB_Topic.Items.Clear();
            for (int j = 0; j < LstB_Selected_Chapters.Items.Count; j++)
            {
                SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM Topic WHERE Ch_Id=" + LstB_Selected_Chapters.Items[j].Value.ToString(), con);
                DataSet ds = new DataSet();
                adp.Fill(ds, "Topic");

                LstB_Topic.DataSource = ds.Tables["Topic"];
                LstB_Topic.DataTextField = "Topic_name";
                LstB_Topic.DataValueField = "Topic_Id";
                LstB_Topic.DataBind();
            }

            //After appending all the topics, if any topic is already selected, then remove it from the LstB_Topic.
            for (int p = 0; p < LstB_Selected_Topics.Items.Count; p++)
            {
                for(int q = 0; q < LstB_Topic.Items.Count; q++)
                {
                    if(LstB_Selected_Topics.Items[p] == LstB_Topic.Items[q])
                    {
                        LstB_Topic.Items.Remove(LstB_Topic.Items[q]);
                    }
                }
            }

            //If the chapter for the topic is not selected then remove that topic.
            for (int i = 0; i < LstB_Selected_Topics.Items.Count; i++)
            {
                SqlCommand com = new SqlCommand("SELECT Ch_Id FROM Topic WHERE Topic_Id=" + LstB_Selected_Topics.Items[i].Value.ToString(), con);
                if (con.State != ConnectionState.Open)
                {
                    con.Open();
                }
                string ch_id = com.ExecuteScalar().ToString();
                bool is_exist = false;

                for(int j = 0; j < LstB_Selected_Chapters.Items.Count; j++)
                {
                    if(LstB_Selected_Chapters.Items[j].Value == ch_id)
                    {
                        is_exist = true;
                    }
                }

                if(!is_exist)
                {
                    LstB_Selected_Topics.Items.Remove(LstB_Selected_Topics.Items[i]);
                }
            }
            ////LstB_Topic.Items.Clear();
            //string str = "";
            //for (int j = 0; j < LstB_Selected_Chapters.Items.Count; j++)
            //{
            //    str = str + LstB_Selected_Chapters.Items[j].Value.ToString() + ",";
            //}
            //if(str.Length>0)
            //{
            //    str = str.Substring(0, str.Length - 1);
            //}
            //Response.Write("<script>alert('" + str + "')</script>");
            //SDS_Topic.SelectCommand = "SELECT * FROM Topic WHERE Ch_Id in(" + str + ")";
            //SDS_Topic.DataBind();
            //LstB_Topic.DataBind();
        }

        protected void Btn_Chapter_Remove_All_Click(object sender, EventArgs e)
        {
            for (int i = LstB_Selected_Chapters.Items.Count - 1; i >= 0; i--)
            {
                LstB_Chapter.Items.Add(LstB_Selected_Chapters.Items[i]);
                LstB_Selected_Chapters.Items.Remove(LstB_Selected_Chapters.Items[i]);
            }

            //Update topics in LstB_Topic after removing chapters.
            LstB_Topic.Items.Clear();
            for (int j = 0; j < LstB_Selected_Chapters.Items.Count; j++)
            {
                SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM Topic WHERE Ch_Id=" + LstB_Selected_Chapters.Items[j].Value.ToString(), con);
                DataSet ds = new DataSet();
                adp.Fill(ds, "Topic");

                LstB_Topic.DataSource = ds.Tables["Topic"];
                LstB_Topic.DataTextField = "Topic_name";
                LstB_Topic.DataValueField = "Topic_Id";
                LstB_Topic.DataBind();
            }

            //After appending all the topics, if any topic is already selected, then remove it from the LstB_Topic.
            for (int p = 0; p < LstB_Selected_Topics.Items.Count; p++)
            {
                for (int q = 0; q < LstB_Topic.Items.Count; q++)
                {
                    if (LstB_Selected_Topics.Items[p] == LstB_Topic.Items[q])
                    {
                        LstB_Topic.Items.Remove(LstB_Topic.Items[q]);
                    }
                }
            }

            //If the chapter for the topic is not selected then remove that topic.
            for (int i = 0; i < LstB_Selected_Topics.Items.Count; i++)
            {
                SqlCommand com = new SqlCommand("SELECT Ch_Id FROM Topic WHERE Topic_Id=" + LstB_Selected_Topics.Items[i].Value.ToString(), con);
                if (con.State != ConnectionState.Open)
                {
                    con.Open();
                }
                string ch_id = com.ExecuteScalar().ToString();
                bool is_exist = false;

                for (int j = 0; j < LstB_Selected_Chapters.Items.Count; j++)
                {
                    if (LstB_Selected_Chapters.Items[j].Value == ch_id)
                    {
                        is_exist = true;
                    }
                }

                if (!is_exist)
                {
                    LstB_Selected_Topics.Items.Remove(LstB_Selected_Topics.Items[i]);
                }
            }
        }

        protected void Btn_Topic_Move_All_Click(object sender, EventArgs e)
        {
            for(int i = LstB_Topic.Items.Count - 1; i >= 0; i--)
            {
                LstB_Selected_Topics.Items.Add(LstB_Topic.Items[i]);
                LstB_Topic.Items.Remove(LstB_Topic.Items[i]);
            }
        }

        protected void Btn_Topic_Move_Right_Click(object sender, EventArgs e)
        {
            for (int i = 0; i < LstB_Topic.Items.Count; i++)
            {
                if (LstB_Topic.Items[i].Selected)
                {
                    LstB_Selected_Topics.Items.Add(LstB_Topic.Items[i]);
                }
            }

            for(int i = 0; i < LstB_Topic.Items.Count; i++)
            {
                if(LstB_Topic.Items[i].Selected)
                {
                    LstB_Topic.Items.Remove(LstB_Topic.Items[i]);
                }
            }
        }

        protected void Btn_Topic_Move_Left_Click(object sender, EventArgs e)
        {
            for (int k = 0; k < LstB_Selected_Topics.Items.Count; k++)
            {
                if (LstB_Selected_Topics.Items[k].Selected)
                {
                    LstB_Topic.Items.Add(LstB_Selected_Topics.Items[k]);
                }
            }

            for(int k = 0; k < LstB_Selected_Topics.Items.Count; k++)
            {
                if(LstB_Selected_Topics.Items[k].Selected)
                {
                    LstB_Selected_Topics.Items.Remove(LstB_Selected_Topics.Items[k]);
                }
            }
        }

        protected void Btn_Topic_Remove_All_Click(object sender, EventArgs e)
        {
            for (int i = LstB_Selected_Topics.Items.Count - 1; i >= 0; i--)
            {
                LstB_Topic.Items.Add(LstB_Selected_Topics.Items[i]);
                LstB_Selected_Topics.Items.Remove(LstB_Selected_Topics.Items[i]);
            }
        }

        protected void Btn_AskAddChapters_YES_Click(object sender, EventArgs e)
        {
            Pnl_ShowAddChapters.Visible = true;
            Pnl_AskAddChapters.Visible = false;
        }

        protected void Btn_AskAddChapters_NO_Click(object sender, EventArgs e)
        {
            Pnl_AskAddChapters_Part1.Visible = false;
            Pnl_AskAddChapters_Part2.Visible = true;
        }

        protected void Btn_Start_Exam_By_Subject_Click(object sender, EventArgs e)
        {
            if (DrDoL_Subject.SelectedValue != "NULL")
            {
                Pnl_Prepare_Exam.Visible = false;
                Pnl_AskAddChapters.Visible = false;
                Pnl_Main.Visible = false;
                Pnl_Start_Exam.Visible = true;

                float total_marks = float.Parse(TxtB_Total_Marks.Text);

                DataSet ds = new DataSet();
                if (DrDoL_Difficulty_Level.SelectedValue == "NULL")
                {
                    float quarter_value = total_marks / 4;

                    string qv_easy_num = ((50 * quarter_value) / 100).ToString();
                    string qv_medium_num = ((30 * quarter_value) / 100).ToString();
                    string qv_hard_num = ((20 * quarter_value) / 100).ToString();

                    //If count of easy, medium and hard questions are 0 or less than 0, then increment them to atleat 1
                    //  or else increase number of easy questions if the number of questions are not enough.
                    while (((int)Convert.ToSingle(qv_easy_num) + (int)Convert.ToSingle(qv_medium_num) + (int)Convert.ToSingle(qv_hard_num)) < quarter_value)
                    {
                        if ((int)Convert.ToSingle(qv_easy_num) <= 0)
                        {
                            qv_easy_num = ((int)Convert.ToSingle(qv_easy_num) + 1).ToString();
                        }
                        else if ((int)Convert.ToSingle(qv_medium_num) <= 0)
                        {
                            qv_medium_num = ((int)Convert.ToSingle(qv_medium_num) + 1).ToString();
                        }
                        else if ((int)Convert.ToSingle(qv_hard_num) <= 0)
                        {
                            qv_hard_num = ((int)Convert.ToSingle(qv_hard_num) + 1).ToString();
                        }
                        else
                        {
                            qv_medium_num = ((int)Convert.ToSingle(qv_medium_num) + 1).ToString();
                        }
                    }

                    //Set of questions will be fetched from each unit
                    for (int i = 1; i <= 4; i++)
                    {
                        //Selecting 50% Easy questions from each unit
                        SqlDataAdapter adp = new SqlDataAdapter("SELECT TOP(@top) * FROM Student_Exam_View WHERE Subject_Id=@sub AND Unit_Id=@unit AND Difficulty_level=@dif ORDER BY NEWID()", con);
                        adp.SelectCommand.Parameters.AddWithValue("@top", (int)Convert.ToSingle(qv_easy_num));
                        adp.SelectCommand.Parameters.AddWithValue("@sub", DrDoL_Subject.SelectedValue.ToString());
                        adp.SelectCommand.Parameters.AddWithValue("@unit", i.ToString());
                        adp.SelectCommand.Parameters.AddWithValue("@dif", "Easy");

                        adp.Fill(ds, "Questions");

                        //Selecting 30% Medium questions from each unit
                        adp = new SqlDataAdapter("SELECT TOP(@top) * FROM Student_Exam_View WHERE Subject_Id=@sub AND Unit_Id=@unit AND Difficulty_level=@dif ORDER BY NEWID()", con);
                        adp.SelectCommand.Parameters.AddWithValue("@top", (int)Convert.ToSingle(qv_medium_num));
                        adp.SelectCommand.Parameters.AddWithValue("@sub", DrDoL_Subject.SelectedValue.ToString());
                        adp.SelectCommand.Parameters.AddWithValue("@unit", i.ToString());
                        adp.SelectCommand.Parameters.AddWithValue("@dif", "Medium");

                        adp.Fill(ds, "Questions");

                        //Selecting 20% Hard questions from each unit
                        adp = new SqlDataAdapter("SELECT TOP(@top) * FROM Student_Exam_View WHERE Subject_Id=@sub AND Unit_Id=@unit AND Difficulty_level=@dif ORDER BY NEWID()", con);
                        adp.SelectCommand.Parameters.AddWithValue("@top", (int)Convert.ToSingle(qv_hard_num));
                        adp.SelectCommand.Parameters.AddWithValue("@sub", DrDoL_Subject.SelectedValue.ToString());
                        adp.SelectCommand.Parameters.AddWithValue("@unit", i.ToString());
                        adp.SelectCommand.Parameters.AddWithValue("@dif", "Hard");

                        adp.Fill(ds, "Questions");
                    }

                    //Deleting extra questions from the dataset
                    int fetched_rows = ((int)Convert.ToSingle(qv_easy_num) + (int)Convert.ToSingle(qv_medium_num) + (int)Convert.ToSingle(qv_hard_num)) * 4;
                    if (fetched_rows > total_marks)
                    {
                        int extra_rows = fetched_rows - (int)total_marks;
                        for (int d = 1; d <= extra_rows; d++)
                        {
                            int last_row = ds.Tables["Questions"].Rows.Count - 1;
                            ds.Tables["Questions"].Rows[last_row].Delete();
                            ds.AcceptChanges();
                        }
                    }
                }
                else
                {
                    SqlDataAdapter adp = new SqlDataAdapter("SELECT TOP(@top) * FROM Student_Exam_View WHERE Subject_Id=@sub AND Difficulty_level=@dif ORDER BY NEWID()", con);
                    adp.SelectCommand.Parameters.AddWithValue("@top", (int)Convert.ToSingle(total_marks));
                    adp.SelectCommand.Parameters.AddWithValue("@sub", DrDoL_Subject.SelectedValue.ToString());
                    adp.SelectCommand.Parameters.AddWithValue("@dif", DrDoL_Difficulty_Level.SelectedValue.ToString());
                    adp.Fill(ds, "Questions");
                }

                SqlCommand com = new SqlCommand("SELECT MAX(Exam_Id) FROM Exam", con);
                if (con.State != ConnectionState.Open)
                {
                    con.Open();
                }
                string max_id_str = com.ExecuteScalar().ToString();
                int max_id = Convert.ToInt32(max_id_str);
                
                //Storing new Exam_Id into session
                Session["Exam_Id"] = max_id + 1;
                Session["Total_Marks"] = TxtB_Total_Marks.Text;

                string exam_name;
                if (String.IsNullOrEmpty(TxtB_Exam_Name.Text))
                    exam_name = "Test_" + Session["Exam_Id"].ToString();
                else
                    exam_name = TxtB_Exam_Name.Text;

                //Inserting exam data into Exam table
                com = new SqlCommand("INSERT INTO Exam VALUES(@id, @name, @type, @marks, @sem, @sub, @unit, @ch, @topic)", con);
                com.Parameters.AddWithValue("@id", Session["Exam_Id"]);
                com.Parameters.AddWithValue("@name", exam_name);
                com.Parameters.AddWithValue("@type", DrDoL_Select_Exam.SelectedValue.ToString());
                com.Parameters.AddWithValue("@marks", TxtB_Total_Marks.Text);
                com.Parameters.AddWithValue("@sem", Session["Sem_Id"]);
                com.Parameters.AddWithValue("@sub", DrDoL_Subject.SelectedValue);
                com.Parameters.AddWithValue("@unit", DBNull.Value);
                com.Parameters.AddWithValue("@ch", DBNull.Value);
                com.Parameters.AddWithValue("@topic", DBNull.Value);

                if (con.State != ConnectionState.Open)
                {
                    con.Open();
                }
                com.ExecuteNonQuery();

                DL_Questions.DataSource = ds.Tables["Questions"];
                DL_Questions.DataBind();
            }
            else
            {
                Response.Write("<script>alert('Please Select Subject.')</script>");
            }
        }

        protected void Btn_AskAddTopics_YES_Click(object sender, EventArgs e)
        {
            Pnl_ShowAddTopics.Visible = true;
            Pnl_AskAddTopics.Visible = false;
        }

        protected void Btn_AskAddTopics_NO_Click(object sender, EventArgs e)
        {
            Pnl_AskAddTopics_Part1.Visible = false;
            Pnl_AskAddTopics_Part2.Visible = true;
        }

        protected void DrDoL_Unit_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!Pnl_ShowAddChapters.Visible)
            {
                if (DrDoL_Unit.SelectedValue == "NULL")
                {
                    Pnl_Unit_Exam.Visible = false;
                    Pnl_AskAddChapters.Visible = true;
                }
                else
                {
                    Pnl_Unit_Exam.Visible = true;
                    Pnl_AskAddChapters.Visible = false;
                }
            }
            else
            {
                if (DrDoL_Unit.SelectedValue != "NULL")
                {
                    SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM Chapter WHERE Subject_Id=@sub AND Unit_Id=@unit", con);
                    adp.SelectCommand.Parameters.AddWithValue("@sub", DrDoL_Subject.SelectedValue.ToString());
                    adp.SelectCommand.Parameters.AddWithValue("@unit", DrDoL_Unit.SelectedValue.ToString());
                    DataSet ds = new DataSet();
                    adp.Fill(ds, "Chapter");

                    LstB_Chapter.Items.Clear();
                    LstB_Selected_Chapters.Items.Clear();
                    LstB_Topic.Items.Clear();
                    LstB_Selected_Topics.Items.Clear();

                    LstB_Chapter.DataSource = ds.Tables["Chapter"];
                    LstB_Chapter.DataTextField = "ch_title";
                    LstB_Chapter.DataValueField = "ch_id";
                    LstB_Chapter.DataBind();
                }
                else
                {
                    SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM Chapter WHERE Subject_Id=" + DrDoL_Subject.SelectedValue.ToString(), con);
                    DataSet ds = new DataSet();
                    adp.Fill(ds, "Chapter");

                    LstB_Chapter.Items.Clear();
                    LstB_Selected_Chapters.Items.Clear();
                    LstB_Topic.Items.Clear();
                    LstB_Selected_Topics.Items.Clear();

                    LstB_Chapter.DataSource = ds.Tables["Chapter"];
                    LstB_Chapter.DataTextField = "ch_title";
                    LstB_Chapter.DataValueField = "ch_id";
                    LstB_Chapter.DataBind();
                }
            }
        }

        protected void Btn_Start_Exam_By_Unit_Click(object sender, EventArgs e)
        {
            if (DrDoL_Subject.SelectedValue != "NULL")
            {
                if (DrDoL_Unit.SelectedValue != "NULL")
                {
                    Pnl_Prepare_Exam.Visible = false;
                    Pnl_AskAddChapters.Visible = false;
                    Pnl_Main.Visible = false;
                    Pnl_Start_Exam.Visible = true;

                    float total_marks = float.Parse(TxtB_Total_Marks.Text);

                    DataSet ds = new DataSet();
                    if (DrDoL_Difficulty_Level.SelectedValue == "NULL")
                    {
                        string qv_easy_num = ((50 * total_marks) / 100).ToString();
                        string qv_medium_num = ((30 * total_marks) / 100).ToString();
                        string qv_hard_num = ((20 * total_marks) / 100).ToString();

                        //If count of easy, medium and hard questions are 0 or less than 0, then increment them to atleat 1
                        //  or else increase number of easy questions if the number of questions are not enough.
                        while (((int)Convert.ToSingle(qv_easy_num) + (int)Convert.ToSingle(qv_medium_num) + (int)Convert.ToSingle(qv_hard_num)) < total_marks)
                        {
                            if ((int)Convert.ToSingle(qv_easy_num) <= 0)
                            {
                                qv_easy_num = ((int)Convert.ToSingle(qv_easy_num) + 1).ToString();
                            }
                            else if ((int)Convert.ToSingle(qv_medium_num) <= 0)
                            {
                                qv_medium_num = ((int)Convert.ToSingle(qv_medium_num) + 1).ToString();
                            }
                            else if ((int)Convert.ToSingle(qv_hard_num) <= 0)
                            {
                                qv_hard_num = ((int)Convert.ToSingle(qv_hard_num) + 1).ToString();
                            }
                            else
                            {
                                qv_medium_num = ((int)Convert.ToSingle(qv_medium_num) + 1).ToString();
                            }
                        }

                        //Selecting 50% Easy questions from selected unit
                        SqlDataAdapter adp = new SqlDataAdapter("SELECT TOP(@top) * FROM Student_Exam_View WHERE Subject_Id=@sub AND Unit_Id=@unit AND Difficulty_level=@dif ORDER BY NEWID()", con);
                        adp.SelectCommand.Parameters.AddWithValue("@top", (int)Convert.ToSingle(qv_easy_num));
                        adp.SelectCommand.Parameters.AddWithValue("@sub", DrDoL_Subject.SelectedValue.ToString());
                        adp.SelectCommand.Parameters.AddWithValue("@unit", DrDoL_Unit.SelectedValue.ToString());
                        adp.SelectCommand.Parameters.AddWithValue("@dif", "Easy");

                        adp.Fill(ds, "Questions");

                        //Selecting 30% Medium questions from selected unit
                        adp = new SqlDataAdapter("SELECT TOP(@top) * FROM Student_Exam_View WHERE Subject_Id=@sub AND Unit_Id=@unit AND Difficulty_level=@dif ORDER BY NEWID()", con);
                        adp.SelectCommand.Parameters.AddWithValue("@top", (int)Convert.ToSingle(qv_medium_num));
                        adp.SelectCommand.Parameters.AddWithValue("@sub", DrDoL_Subject.SelectedValue.ToString());
                        adp.SelectCommand.Parameters.AddWithValue("@unit", DrDoL_Unit.SelectedValue.ToString());
                        adp.SelectCommand.Parameters.AddWithValue("@dif", "Medium");

                        adp.Fill(ds, "Questions");

                        //Selecting 20% Hard questions from selected unit
                        adp = new SqlDataAdapter("SELECT TOP(@top) * FROM Student_Exam_View WHERE Subject_Id=@sub AND Unit_Id=@unit AND Difficulty_level=@dif ORDER BY NEWID()", con);
                        adp.SelectCommand.Parameters.AddWithValue("@top", (int)Convert.ToSingle(qv_hard_num));
                        adp.SelectCommand.Parameters.AddWithValue("@sub", DrDoL_Subject.SelectedValue.ToString());
                        adp.SelectCommand.Parameters.AddWithValue("@unit", DrDoL_Unit.SelectedValue.ToString());
                        adp.SelectCommand.Parameters.AddWithValue("@dif", "Hard");

                        adp.Fill(ds, "Questions");

                        //Deleting extra questions from the dataset
                        int fetched_rows = (int)Convert.ToSingle(qv_easy_num) + (int)Convert.ToSingle(qv_medium_num) + (int)Convert.ToSingle(qv_hard_num);
                        if (fetched_rows > total_marks)
                        {
                            int extra_rows = fetched_rows - (int)total_marks;
                            for (int d = 1; d <= extra_rows; d++)
                            {
                                int last_row = ds.Tables["Questions"].Rows.Count - 1;
                                ds.Tables["Questions"].Rows[last_row].Delete();
                                ds.AcceptChanges();
                            }
                        }
                    }
                    else
                    {
                        SqlDataAdapter adp = new SqlDataAdapter("SELECT TOP(@top) * FROM Student_Exam_View WHERE Subject_Id=@sub AND Unit_Id=@unit AND Difficulty_level=@dif ORDER BY NEWID()", con);
                        adp.SelectCommand.Parameters.AddWithValue("@top", (int)Convert.ToSingle(total_marks));
                        adp.SelectCommand.Parameters.AddWithValue("@sub", DrDoL_Subject.SelectedValue.ToString());
                        adp.SelectCommand.Parameters.AddWithValue("@unit", DrDoL_Unit.SelectedValue.ToString());
                        adp.SelectCommand.Parameters.AddWithValue("@dif", DrDoL_Difficulty_Level.SelectedValue.ToString());
                        adp.Fill(ds, "Questions");
                    }

                    SqlCommand com = new SqlCommand("SELECT MAX(Exam_Id) FROM Exam", con);
                    if (con.State != ConnectionState.Open)
                    {
                        con.Open();
                    }
                    string max_id_str = com.ExecuteScalar().ToString();
                    int max_id = Convert.ToInt32(max_id_str);
                    
                    //Storing new Exam_Id into session
                    Session["Exam_Id"] = max_id + 1;
                    Session["Total_Marks"] = TxtB_Total_Marks.Text;

                    string exam_name;
                    if (String.IsNullOrEmpty(TxtB_Exam_Name.Text))
                        exam_name = "Test_" + Session["Exam_Id"].ToString();
                    else
                        exam_name = TxtB_Exam_Name.Text;

                    //Inserting exam data into Exam table
                    com = new SqlCommand("INSERT INTO Exam VALUES(@id, @name, @type, @marks, @sem, @sub, @unit, @ch, @topic)", con);
                    com.Parameters.AddWithValue("@id", Session["Exam_Id"]);
                    com.Parameters.AddWithValue("@name", exam_name);
                    com.Parameters.AddWithValue("@type", DrDoL_Select_Exam.SelectedValue.ToString());
                    com.Parameters.AddWithValue("@marks", TxtB_Total_Marks.Text);
                    com.Parameters.AddWithValue("@sem", Session["Sem_Id"]);
                    com.Parameters.AddWithValue("@sub", DrDoL_Subject.SelectedValue);
                    com.Parameters.AddWithValue("@unit", DrDoL_Unit.SelectedValue.ToString());
                    com.Parameters.AddWithValue("@ch", DBNull.Value);
                    com.Parameters.AddWithValue("@topic", DBNull.Value);

                    if (con.State != ConnectionState.Open)
                    {
                        con.Open();
                    }
                    com.ExecuteNonQuery();

                    DL_Questions.DataSource = ds.Tables["Questions"];
                    DL_Questions.DataBind();
                }
                else
                {
                    Response.Write("<script>alert('Please Select Unit.')</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Please Select Subject.')</script>");
            }
        }

        protected void Btn_Start_Exam_By_Chapter_Click(object sender, EventArgs e)
        {
            if (LstB_Selected_Chapters.Items.Count > 0)
            {
                Pnl_Prepare_Exam.Visible = false;
                Pnl_AskAddChapters.Visible = false;
                Pnl_Main.Visible = false;
                Pnl_ShowAddChapters.Visible = false;
                Pnl_AskAddTopics.Visible = false;
                Pnl_Start_Exam.Visible = true;

                float total_marks = float.Parse(TxtB_Total_Marks.Text);

                //Creating string of chapters.
                string chapters = "";
                for (int i = 0; i < LstB_Selected_Chapters.Items.Count; i++)
                {
                    chapters = chapters + LstB_Selected_Chapters.Items[i].Value.ToString() + ",";
                }
                if (chapters.Length > 0)
                {
                    chapters = chapters.Substring(0, chapters.Length - 1);
                }

                DataSet ds = new DataSet();
                if (DrDoL_Difficulty_Level.SelectedValue == "NULL")
                {
                    string qv_easy_num = ((50 * total_marks) / 100).ToString();
                    string qv_medium_num = ((30 * total_marks) / 100).ToString();
                    string qv_hard_num = ((20 * total_marks) / 100).ToString();

                    //If count of easy, medium and hard questions are 0 or less than 0, then increment them to atleat 1
                    //  or else increase number of easy questions if the number of questions are not enough.
                    while (((int)Convert.ToSingle(qv_easy_num) + (int)Convert.ToSingle(qv_medium_num) + (int)Convert.ToSingle(qv_hard_num)) < total_marks)
                    {
                        if ((int)Convert.ToSingle(qv_easy_num) <= 0)
                        {
                            qv_easy_num = ((int)Convert.ToSingle(qv_easy_num) + 1).ToString();
                        }
                        else if ((int)Convert.ToSingle(qv_medium_num) <= 0)
                        {
                            qv_medium_num = ((int)Convert.ToSingle(qv_medium_num) + 1).ToString();
                        }
                        else if ((int)Convert.ToSingle(qv_hard_num) <= 0)
                        {
                            qv_hard_num = ((int)Convert.ToSingle(qv_hard_num) + 1).ToString();
                        }
                        else
                        {
                            qv_medium_num = ((int)Convert.ToSingle(qv_medium_num) + 1).ToString();
                        }
                    }

                    //Selecting 50% Easy questions from each unit
                    SqlDataAdapter adp = new SqlDataAdapter("SELECT TOP(@top) * FROM Student_Exam_View WHERE Ch_Id IN(" + chapters + ") AND Difficulty_level=@dif ORDER BY NEWID()", con);
                    adp.SelectCommand.Parameters.AddWithValue("@top", (int)Convert.ToSingle(qv_easy_num));
                    adp.SelectCommand.Parameters.AddWithValue("@dif", "Easy");

                    adp.Fill(ds, "Questions");

                    //Selecting 30% Medium questions from each unit
                    adp = new SqlDataAdapter("SELECT TOP(@top) * FROM Student_Exam_View WHERE Ch_Id IN(" + chapters + ") AND Difficulty_level=@dif ORDER BY NEWID()", con);
                    adp.SelectCommand.Parameters.AddWithValue("@top", (int)Convert.ToSingle(qv_medium_num));
                    adp.SelectCommand.Parameters.AddWithValue("@dif", "Medium");

                    adp.Fill(ds, "Questions");

                    //Selecting 20% Hard questions from each unit
                    adp = new SqlDataAdapter("SELECT TOP(@top) * FROM Student_Exam_View WHERE Ch_Id IN(" + chapters + ") AND Difficulty_level=@dif ORDER BY NEWID()", con);
                    adp.SelectCommand.Parameters.AddWithValue("@top", (int)Convert.ToSingle(qv_hard_num));
                    adp.SelectCommand.Parameters.AddWithValue("@dif", "Hard");

                    adp.Fill(ds, "Questions");

                    //Deleting extra questions from the dataset
                    int fetched_rows = (int)Convert.ToSingle(qv_easy_num) + (int)Convert.ToSingle(qv_medium_num) + (int)Convert.ToSingle(qv_hard_num);
                    if (fetched_rows > total_marks)
                    {
                        int extra_rows = fetched_rows - (int)total_marks;
                        for (int d = 1; d <= extra_rows; d++)
                        {
                            int last_row = ds.Tables["Questions"].Rows.Count - 1;
                            ds.Tables["Questions"].Rows[last_row].Delete();
                            ds.AcceptChanges();
                        }
                    }
                }
                else
                {
                    SqlDataAdapter adp = new SqlDataAdapter("SELECT TOP(@top) * FROM Student_Exam_View WHERE Ch_Id IN(" + chapters + ") AND Difficulty_level=@dif ORDER BY NEWID()", con);
                    adp.SelectCommand.Parameters.AddWithValue("@top", (int)Convert.ToSingle(total_marks));
                    adp.SelectCommand.Parameters.AddWithValue("@dif", DrDoL_Difficulty_Level.SelectedValue.ToString());
                    adp.Fill(ds, "Questions");
                }

                SqlCommand com = new SqlCommand("SELECT MAX(Exam_Id) FROM Exam", con);
                if (con.State != ConnectionState.Open)
                {
                    con.Open();
                }
                string max_id_str = com.ExecuteScalar().ToString();
                int max_id = Convert.ToInt32(max_id_str);

                //Storing new Exam_Id into session
                Session["Exam_Id"] = max_id + 1;
                Session["Total_Marks"] = TxtB_Total_Marks.Text;

                string exam_name;
                if (String.IsNullOrEmpty(TxtB_Exam_Name.Text))
                    exam_name = "Test_" + Session["Exam_Id"].ToString();
                else
                    exam_name = TxtB_Exam_Name.Text;

                //Inserting exam data into Exam table
                com = new SqlCommand("INSERT INTO Exam VALUES(@id, @name, @type, @marks, @sem, @sub, @unit, @ch, @topic)", con);
                com.Parameters.AddWithValue("@id", Session["Exam_Id"]);
                com.Parameters.AddWithValue("@name", exam_name);
                com.Parameters.AddWithValue("@type", DrDoL_Select_Exam.SelectedValue.ToString());
                com.Parameters.AddWithValue("@marks", TxtB_Total_Marks.Text);
                com.Parameters.AddWithValue("@sem", Session["Sem_Id"]);
                com.Parameters.AddWithValue("@sub", DrDoL_Subject.SelectedValue);
                if(DrDoL_Unit.SelectedValue != "NULL")
                {
                    com.Parameters.AddWithValue("@unit", DrDoL_Unit.SelectedValue);
                }
                else
                {
                    com.Parameters.AddWithValue("@unit", DBNull.Value);
                }
                int ch = 0;
                for (int i = 0; i < LstB_Selected_Chapters.Items.Count; i++)
                {
                    ch = Convert.ToInt32(LstB_Selected_Chapters.Items[i].Value);
                }
                com.Parameters.AddWithValue("@ch", ch.ToString());
                com.Parameters.AddWithValue("@topic", DBNull.Value);

                if (con.State != ConnectionState.Open)
                {
                    con.Open();
                }
                com.ExecuteNonQuery();

                DL_Questions.DataSource = ds.Tables["Questions"];
                DL_Questions.DataBind();
            }
            else
            {
                Response.Write("<script>alert('Please Select Chapters.')</script>");
            }
        }

        protected void Btn_Start_Exam_By_Topic_Click(object sender, EventArgs e)
        {
            if (LstB_Selected_Topics.Items.Count > 0)
            {
                Pnl_Prepare_Exam.Visible = false;
                Pnl_Main.Visible = false;
                Pnl_Start_Exam.Visible = true;
                Pnl_ShowAddChapters.Visible = false;
                Pnl_ShowAddTopics.Visible = false;

                float total_marks = float.Parse(TxtB_Total_Marks.Text);

                string topics = "";
                for (int j = 0; j < LstB_Selected_Topics.Items.Count; j++)
                {
                    topics = topics + LstB_Selected_Topics.Items[j].Value.ToString() + ",";
                }
                if (topics.Length > 0)
                {
                    topics = topics.Substring(0, topics.Length - 1);
                }

                DataSet ds = new DataSet();
                if (DrDoL_Difficulty_Level.SelectedValue == "NULL")
                {
                    string qv_easy_num = ((50 * total_marks) / 100).ToString();
                    string qv_medium_num = ((30 * total_marks) / 100).ToString();
                    string qv_hard_num = ((20 * total_marks) / 100).ToString();

                    //If count of easy, medium and hard questions are 0 or less than 0, then increment them to atleat 1
                    //  or else increase number of easy questions if the number of questions are not enough.
                    while (((int)Convert.ToSingle(qv_easy_num) + (int)Convert.ToSingle(qv_medium_num) + (int)Convert.ToSingle(qv_hard_num)) < total_marks)
                    {
                        if ((int)Convert.ToSingle(qv_easy_num) <= 0)
                        {
                            qv_easy_num = ((int)Convert.ToSingle(qv_easy_num) + 1).ToString();
                        }
                        else if ((int)Convert.ToSingle(qv_medium_num) <= 0)
                        {
                            qv_medium_num = ((int)Convert.ToSingle(qv_medium_num) + 1).ToString();
                        }
                        else if ((int)Convert.ToSingle(qv_hard_num) <= 0)
                        {
                            qv_hard_num = ((int)Convert.ToSingle(qv_hard_num) + 1).ToString();
                        }
                        else
                        {
                            qv_medium_num = ((int)Convert.ToSingle(qv_medium_num) + 1).ToString();
                        }
                    }

                    //Selecting 50% Easy questions from each unit
                    SqlDataAdapter adp = new SqlDataAdapter("SELECT TOP(@top) * FROM Student_Exam_View WHERE Topic_Id IN(" + topics + ") AND Difficulty_level=@dif ORDER BY NEWID()", con);
                    adp.SelectCommand.Parameters.AddWithValue("@top", (int)Convert.ToSingle(qv_easy_num));
                    adp.SelectCommand.Parameters.AddWithValue("@dif", "Easy");

                    adp.Fill(ds, "Questions");

                    //Selecting 30% Medium questions from each unit
                    adp = new SqlDataAdapter("SELECT TOP(@top) * FROM Student_Exam_View WHERE Topic_Id IN(" + topics + ") AND Difficulty_level=@dif ORDER BY NEWID()", con);
                    adp.SelectCommand.Parameters.AddWithValue("@top", (int)Convert.ToSingle(qv_medium_num));
                    adp.SelectCommand.Parameters.AddWithValue("@dif", "Medium");

                    adp.Fill(ds, "Questions");

                    //Selecting 20% Hard questions from each unit
                    adp = new SqlDataAdapter("SELECT TOP(@top) * FROM Student_Exam_View WHERE Topic_Id IN(" + topics + ") AND Difficulty_level=@dif ORDER BY NEWID()", con);
                    adp.SelectCommand.Parameters.AddWithValue("@top", (int)Convert.ToSingle(qv_hard_num));
                    adp.SelectCommand.Parameters.AddWithValue("@dif", "Hard");

                    adp.Fill(ds, "Questions");

                    //Deleting extra questions from the dataset
                    int fetched_rows = (int)Convert.ToSingle(qv_easy_num) + (int)Convert.ToSingle(qv_medium_num) + (int)Convert.ToSingle(qv_hard_num);
                    if (fetched_rows > total_marks)
                    {
                        int extra_rows = fetched_rows - (int)total_marks;
                        for (int d = 1; d <= extra_rows; d++)
                        {
                            int last_row = ds.Tables["Questions"].Rows.Count - 1;
                            ds.Tables["Questions"].Rows[last_row].Delete();
                            ds.AcceptChanges();
                        }
                    }
                }
                else
                {
                    SqlDataAdapter adp = new SqlDataAdapter("SELECT TOP(@top) * FROM Student_Exam_View WHERE Topic_Id IN(" + topics + ") AND Difficulty_level=@dif ORDER BY NEWID()", con);
                    adp.SelectCommand.Parameters.AddWithValue("@top", (int)Convert.ToSingle(total_marks));
                    adp.SelectCommand.Parameters.AddWithValue("@dif", DrDoL_Difficulty_Level.SelectedValue.ToString());
                    adp.Fill(ds, "Questions");
                }

                SqlCommand com = new SqlCommand("SELECT MAX(Exam_Id) FROM Exam", con);
                if (con.State != ConnectionState.Open)
                {
                    con.Open();
                }
                string max_id_str = com.ExecuteScalar().ToString();
                int max_id = Convert.ToInt32(max_id_str);

                //Storing new Exam_Id into session
                Session["Exam_Id"] = max_id + 1;
                Session["Total_Marks"] = TxtB_Total_Marks.Text;

                string exam_name;
                if (String.IsNullOrEmpty(TxtB_Exam_Name.Text))
                    exam_name = "Test_" + Session["Exam_Id"].ToString();
                else
                    exam_name = TxtB_Exam_Name.Text;

                //Inserting exam data into Exam table
                com = new SqlCommand("INSERT INTO Exam VALUES(@id, @name, @type, @marks, @sem, @sub, @unit, @ch, @topic)", con);
                com.Parameters.AddWithValue("@id", Session["Exam_Id"]);
                com.Parameters.AddWithValue("@name", exam_name);
                com.Parameters.AddWithValue("@type", DrDoL_Select_Exam.SelectedValue.ToString());
                com.Parameters.AddWithValue("@marks", TxtB_Total_Marks.Text);
                com.Parameters.AddWithValue("@sem", Session["Sem_Id"]);
                com.Parameters.AddWithValue("@sub", DrDoL_Subject.SelectedValue);
                if (DrDoL_Unit.SelectedValue != "NULL")
                {
                    com.Parameters.AddWithValue("@unit", DrDoL_Unit.SelectedValue);
                }
                else
                {
                    com.Parameters.AddWithValue("@unit", DBNull.Value);
                }
                int ch = 0;
                for (int i = 0; i < LstB_Selected_Chapters.Items.Count; i++)
                {
                    ch = Convert.ToInt32(LstB_Selected_Chapters.Items[i].Value);
                }
                com.Parameters.AddWithValue("@ch", ch);

                int to = 0;
                for (int j = 0; j < LstB_Selected_Topics.Items.Count; j++)
                {
                    to = Convert.ToInt32(LstB_Selected_Topics.Items[j].Value);
                }
                com.Parameters.AddWithValue("@topic", to.ToString());

                if (con.State != ConnectionState.Open)
                {
                    con.Open();
                }
                com.ExecuteNonQuery();

                DL_Questions.DataSource = ds.Tables["Questions"];
                DL_Questions.DataBind();
            }
            else
            {
                Response.Write("<script>alert('Please Select Topics.')</script>");
            }
        }

        public int SerialNumber()
        {
            return ++sr_num;            
        }

        protected void Btn_Submit_Exam_Click(object sender, EventArgs e)
        {
            int obtained_marks = 0;

            SqlCommand com = new SqlCommand("SELECT MAX(SE_Id) FROM Student_Exam", con);
            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }
            string max_SE_id_str = com.ExecuteScalar().ToString();
            int new_SE_id = Convert.ToInt32(max_SE_id_str) + 1;

            //Inserting custom exam data into Student_Exam table.
            com = new SqlCommand("INSERT INTO Student_Exam VALUES(@id, @adm, @exam, @marks)", con);
            com.Parameters.AddWithValue("@id", new_SE_id.ToString());
            com.Parameters.AddWithValue("@adm", Session["Admission_Id"]);
            com.Parameters.AddWithValue("@exam", Session["Exam_Id"]);
            com.Parameters.AddWithValue("@marks", DBNull.Value);

            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }
            com.ExecuteNonQuery();

            for (int i = 0; i < DL_Questions.Items.Count; i++)
            {
                //Creating HiddenField object to get current question id.
                HiddenField HdnF_Q_id = (HiddenField)DL_Questions.Items[i].FindControl("HdnF_Q_id");

                //Fetching correct answer of current question.
                com = new SqlCommand("SELECT Correct_option FROM Student_Exam_View WHERE Q_id=@qid", con);
                com.Parameters.AddWithValue("@qid", HdnF_Q_id.Value.ToString());
                if (con.State != ConnectionState.Open)
                {
                    con.Open();
                }
                string C_O = com.ExecuteScalar().ToString();

                //Creating RadioButton objects of current DataList item.
                RadioButton rbtn_A, rbtn_B, rbtn_C, rbtn_D;
                rbtn_A = (RadioButton)DL_Questions.Items[i].FindControl("RaBut_Opt_A");
                rbtn_B = (RadioButton)DL_Questions.Items[i].FindControl("RaBut_Opt_B");
                rbtn_C = (RadioButton)DL_Questions.Items[i].FindControl("RaBut_Opt_C");
                rbtn_D = (RadioButton)DL_Questions.Items[i].FindControl("RaBut_Opt_D");

                string given_ans_is;

                //Checking whether the radiobutton is checked or not.
                if (rbtn_A.Checked)
                {
                    //Checking the correct option with the selected option.
                    if (C_O == "A")
                    {
                        ++obtained_marks;
                        given_ans_is = "Correct";
                    }
                    else
                        given_ans_is = "Wrong";
                }
                else if (rbtn_B.Checked)
                {
                    if (C_O == "B")
                    {
                        ++obtained_marks;
                        given_ans_is = "Correct";
                    }
                    else
                        given_ans_is = "Wrong";
                }
                else if (rbtn_C.Checked)
                {
                    if (C_O == "C")
                    {
                        ++obtained_marks;
                        given_ans_is = "Correct";
                    }
                    else
                        given_ans_is = "Wrong";
                }
                else if (rbtn_D.Checked)
                {
                    if (C_O == "D")
                    {
                        ++obtained_marks;
                        given_ans_is = "Correct";
                    }
                    else
                        given_ans_is = "Wrong";
                }
                else
                {
                    //If none of the radiobutton is selected.
                    given_ans_is = "Wrong";
                }

                com = new SqlCommand("SELECT MAX(SEQ_Id) FROM Student_Exam_Questions", con);
                if (con.State != ConnectionState.Open)
                {
                    con.Open();
                }
                string max_SEQ_id_str = com.ExecuteScalar().ToString();
                int new_SEQ_id = Convert.ToInt32(max_SEQ_id_str) + 1;

                //Inserting current question details into Student_Exam_Questions table.
                com = new SqlCommand("INSERT INTO Student_Exam_Questions VALUES(@id, @SE, @Q, @res)", con);
                com.Parameters.AddWithValue("@id", new_SEQ_id.ToString());
                com.Parameters.AddWithValue("@SE", new_SE_id.ToString());
                com.Parameters.AddWithValue("@Q", HdnF_Q_id.Value.ToString());
                com.Parameters.AddWithValue("@res", given_ans_is);

                if (con.State != ConnectionState.Open)
                {
                    con.Open();
                }
                com.ExecuteNonQuery();
            }

            //Updating obtained marks into Student_Exam table.
            com = new SqlCommand("UPDATE Student_Exam SET Obtained_marks=@marks WHERE SE_Id=@id", con);
            com.Parameters.AddWithValue("@marks", obtained_marks.ToString());
            com.Parameters.AddWithValue("@id", new_SE_id.ToString());

            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }
            com.ExecuteNonQuery();
            
            Pnl_Start_Exam.Visible = false;
            Pnl_Exam_Finished.Visible = true;

            int total_marks = Convert.ToInt32(Session["Total_Marks"].ToString());

            int marks_percentage = (obtained_marks * 100) / total_marks;

            if (marks_percentage > 90)
                Lbl_Wishing_Word.Text = "Excellent!";
            else if (marks_percentage <= 90 && marks_percentage > 70)
                Lbl_Wishing_Word.Text = "Great!";
            else if (marks_percentage <= 70 && marks_percentage > 50)
                Lbl_Wishing_Word.Text = "You can do way better.";
            else if (marks_percentage <= 50 && marks_percentage > 33)
                Lbl_Wishing_Word.Text = "Need to work Harder!";
            else
                Lbl_Wishing_Word.Text = "Fail!";

            Session.Remove("Exam_Id");
            Session.Remove("Total_Marks");

            Lbl_Obtained_Marks.Text = obtained_marks.ToString();
        }

        protected void Btn_Start_Standard_Exam_Click(object sender, EventArgs e)
        {
            if (con.State != ConnectionState.Open)
            {
                con.Open();
            }

            Session["Exam_Id"] = LstB_Standard_Exam.SelectedValue.ToString();

            SqlDataAdapter adp = new SqlDataAdapter("SELECT * FROM Exam WHERE Exam_Id="+ Session["Exam_Id"], con);
            DataTable dt = new DataTable();
            adp.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                Session["Total_Marks"] = dt.Rows[0]["Total_Marks"].ToString();
                if (dt.Rows[0]["Subject_Id"] != null)
                {
                    Pnl_Main.Visible = false;
                    Pnl_Start_Exam.Visible = true;

                    float total_marks = float.Parse(dt.Rows[0]["Total_Marks"].ToString());
                    DataSet ds = new DataSet();

                    float quarter_value = total_marks / 4;

                    string qv_easy_num = ((50 * quarter_value) / 100).ToString();
                    string qv_medium_num = ((30 * quarter_value) / 100).ToString();
                    string qv_hard_num = ((20 * quarter_value) / 100).ToString();

                    //If count of easy, medium and hard questions are 0 or less than 0, then increment them to atleat 1
                    //  or else increase number of easy questions if the number of questions are not enough.
                    while (((int)Convert.ToSingle(qv_easy_num) + (int)Convert.ToSingle(qv_medium_num) + (int)Convert.ToSingle(qv_hard_num)) < quarter_value)
                    {
                        if ((int)Convert.ToSingle(qv_easy_num) <= 0)
                        {
                            qv_easy_num = ((int)Convert.ToSingle(qv_easy_num) + 1).ToString();
                        }
                        else if ((int)Convert.ToSingle(qv_medium_num) <= 0)
                        {
                            qv_medium_num = ((int)Convert.ToSingle(qv_medium_num) + 1).ToString();
                        }
                        else if ((int)Convert.ToSingle(qv_hard_num) <= 0)
                        {
                            qv_hard_num = ((int)Convert.ToSingle(qv_hard_num) + 1).ToString();
                        }
                        else
                        {
                            qv_medium_num = ((int)Convert.ToSingle(qv_medium_num) + 1).ToString();
                        }
                    }

                    //Set of questions will be fetched from each unit
                    for (int i = 1; i <= 4; i++)
                    {
                        //Selecting 50% Easy questions from each unit
                        adp = new SqlDataAdapter("SELECT TOP(@top) * FROM Student_Exam_View WHERE Subject_Id=@sub AND Unit_Id=@unit AND Difficulty_level=@dif ORDER BY NEWID()", con);
                        adp.SelectCommand.Parameters.AddWithValue("@top", (int)Convert.ToSingle(qv_easy_num));
                        adp.SelectCommand.Parameters.AddWithValue("@sub", dt.Rows[0]["Subject_Id"].ToString());
                        adp.SelectCommand.Parameters.AddWithValue("@unit", i.ToString());
                        adp.SelectCommand.Parameters.AddWithValue("@dif", "Easy");

                        adp.Fill(ds, "Questions");

                        //Selecting 30% Medium questions from each unit
                        adp = new SqlDataAdapter("SELECT TOP(@top) * FROM Student_Exam_View WHERE Subject_Id=@sub AND Unit_Id=@unit AND Difficulty_level=@dif ORDER BY NEWID()", con);
                        adp.SelectCommand.Parameters.AddWithValue("@top", (int)Convert.ToSingle(qv_medium_num));
                        adp.SelectCommand.Parameters.AddWithValue("@sub", dt.Rows[0]["Subject_Id"].ToString());
                        adp.SelectCommand.Parameters.AddWithValue("@unit", i.ToString());
                        adp.SelectCommand.Parameters.AddWithValue("@dif", "Medium");

                        adp.Fill(ds, "Questions");

                        //Selecting 20% Hard questions from each unit
                        adp = new SqlDataAdapter("SELECT TOP(@top) * FROM Student_Exam_View WHERE Subject_Id=@sub AND Unit_Id=@unit AND Difficulty_level=@dif ORDER BY NEWID()", con);
                        adp.SelectCommand.Parameters.AddWithValue("@top", (int)Convert.ToSingle(qv_hard_num));
                        adp.SelectCommand.Parameters.AddWithValue("@sub", dt.Rows[0]["Subject_Id"].ToString());
                        adp.SelectCommand.Parameters.AddWithValue("@unit", i.ToString());
                        adp.SelectCommand.Parameters.AddWithValue("@dif", "Hard");

                        adp.Fill(ds, "Questions");
                    }

                    //Deleting extra questions from the dataset
                    int fetched_rows = ((int)Convert.ToSingle(qv_easy_num) + (int)Convert.ToSingle(qv_medium_num) + (int)Convert.ToSingle(qv_hard_num)) * 4;
                    if (fetched_rows > total_marks)
                    {
                        int extra_rows = fetched_rows - (int)total_marks;
                        for (int d = 1; d <= extra_rows; d++)
                        {
                            int last_row = ds.Tables["Questions"].Rows.Count - 1;
                            ds.Tables["Questions"].Rows[last_row].Delete();
                            ds.AcceptChanges();
                        }
                    }

                    DL_Questions.DataSource = ds.Tables["Questions"];
                    DL_Questions.DataBind();
                }
                else
                {
                    if (dt.Rows[0]["Unit_Id"] != null)
                    {
                        Pnl_Main.Visible = false;
                        Pnl_Start_Exam.Visible = true;

                        float total_marks = float.Parse(dt.Rows[0]["Total_Marks"].ToString());

                        DataSet ds = new DataSet();
                        string qv_easy_num = ((50 * total_marks) / 100).ToString();
                        string qv_medium_num = ((30 * total_marks) / 100).ToString();
                        string qv_hard_num = ((20 * total_marks) / 100).ToString();

                        //If count of easy, medium and hard questions are 0 or less than 0, then increment them to atleat 1
                        //  or else increase number of easy questions if the number of questions are not enough.
                        while (((int)Convert.ToSingle(qv_easy_num) + (int)Convert.ToSingle(qv_medium_num) + (int)Convert.ToSingle(qv_hard_num)) < total_marks)
                        {
                            if ((int)Convert.ToSingle(qv_easy_num) <= 0)
                            {
                                qv_easy_num = ((int)Convert.ToSingle(qv_easy_num) + 1).ToString();
                            }
                            else if ((int)Convert.ToSingle(qv_medium_num) <= 0)
                            {
                                qv_medium_num = ((int)Convert.ToSingle(qv_medium_num) + 1).ToString();
                            }
                            else if ((int)Convert.ToSingle(qv_hard_num) <= 0)
                            {
                                qv_hard_num = ((int)Convert.ToSingle(qv_hard_num) + 1).ToString();
                            }
                            else
                            {
                                qv_medium_num = ((int)Convert.ToSingle(qv_medium_num) + 1).ToString();
                            }
                        }

                        //Selecting 50% Easy questions from selected unit
                        adp = new SqlDataAdapter("SELECT TOP(@top) * FROM Student_Exam_View WHERE Subject_Id=@sub AND Unit_Id=@unit AND Difficulty_level=@dif ORDER BY NEWID()", con);
                        adp.SelectCommand.Parameters.AddWithValue("@top", (int)Convert.ToSingle(qv_easy_num));
                        adp.SelectCommand.Parameters.AddWithValue("@sub", dt.Rows[0]["Subject_Id"].ToString());
                        adp.SelectCommand.Parameters.AddWithValue("@unit", dt.Rows[0]["Unit_Id"].ToString());
                        adp.SelectCommand.Parameters.AddWithValue("@dif", "Easy");

                        adp.Fill(ds, "Questions");

                        //Selecting 30% Medium questions from selected unit
                        adp = new SqlDataAdapter("SELECT TOP(@top) * FROM Student_Exam_View WHERE Subject_Id=@sub AND Unit_Id=@unit AND Difficulty_level=@dif ORDER BY NEWID()", con);
                        adp.SelectCommand.Parameters.AddWithValue("@top", (int)Convert.ToSingle(qv_medium_num));
                        adp.SelectCommand.Parameters.AddWithValue("@sub", dt.Rows[0]["Subject_Id"].ToString());
                        adp.SelectCommand.Parameters.AddWithValue("@unit", dt.Rows[0]["Unit_Id"].ToString());
                        adp.SelectCommand.Parameters.AddWithValue("@dif", "Medium");

                        adp.Fill(ds, "Questions");

                        //Selecting 20% Hard questions from selected unit
                        adp = new SqlDataAdapter("SELECT TOP(@top) * FROM Student_Exam_View WHERE Subject_Id=@sub AND Unit_Id=@unit AND Difficulty_level=@dif ORDER BY NEWID()", con);
                        adp.SelectCommand.Parameters.AddWithValue("@top", (int)Convert.ToSingle(qv_hard_num));
                        adp.SelectCommand.Parameters.AddWithValue("@sub", dt.Rows[0]["Subject_Id"].ToString());
                        adp.SelectCommand.Parameters.AddWithValue("@unit", dt.Rows[0]["Unit_Id"].ToString());
                        adp.SelectCommand.Parameters.AddWithValue("@dif", "Hard");

                        adp.Fill(ds, "Questions");

                        //Deleting extra questions from the dataset
                        int fetched_rows = (int)Convert.ToSingle(qv_easy_num) + (int)Convert.ToSingle(qv_medium_num) + (int)Convert.ToSingle(qv_hard_num);
                        if (fetched_rows > total_marks)
                        {
                            int extra_rows = fetched_rows - (int)total_marks;
                            for (int d = 1; d <= extra_rows; d++)
                            {
                                int last_row = ds.Tables["Questions"].Rows.Count - 1;
                                ds.Tables["Questions"].Rows[last_row].Delete();
                                ds.AcceptChanges();
                            }
                        }

                        DL_Questions.DataSource = ds.Tables["Questions"];
                        DL_Questions.DataBind();
                    }
                    else
                    {
                        if (dt.Rows[0]["Ch_Id"] != null)
                        {
                            Pnl_Main.Visible = false;
                            Pnl_Start_Exam.Visible = true;

                            float total_marks = float.Parse(dt.Rows[0]["Total_Marks"].ToString());

                            //Creating string of chapters.
                            //string chapters = "";
                            //for (int i = 0; i < LstB_Selected_Chapters.Items.Count; i++)
                            //{
                            //    chapters = chapters + LstB_Selected_Chapters.Items[i].Value.ToString() + ",";
                            //}
                            //if (chapters.Length > 0)
                            //{
                            //    chapters = chapters.Substring(0, chapters.Length - 1);
                            //}

                            int chapters = Convert.ToInt32(dt.Rows[0]["Ch_Id"].ToString());
                            DataSet ds = new DataSet();

                            string qv_easy_num = ((50 * total_marks) / 100).ToString();
                            string qv_medium_num = ((30 * total_marks) / 100).ToString();
                            string qv_hard_num = ((20 * total_marks) / 100).ToString();

                            //If count of easy, medium and hard questions are 0 or less than 0, then increment them to atleat 1
                            //  or else increase number of easy questions if the number of questions are not enough.
                            while (((int)Convert.ToSingle(qv_easy_num) + (int)Convert.ToSingle(qv_medium_num) + (int)Convert.ToSingle(qv_hard_num)) < total_marks)
                            {
                                if ((int)Convert.ToSingle(qv_easy_num) <= 0)
                                {
                                    qv_easy_num = ((int)Convert.ToSingle(qv_easy_num) + 1).ToString();
                                }
                                else if ((int)Convert.ToSingle(qv_medium_num) <= 0)
                                {
                                    qv_medium_num = ((int)Convert.ToSingle(qv_medium_num) + 1).ToString();
                                }
                                else if ((int)Convert.ToSingle(qv_hard_num) <= 0)
                                {
                                    qv_hard_num = ((int)Convert.ToSingle(qv_hard_num) + 1).ToString();
                                }
                                else
                                {
                                    qv_medium_num = ((int)Convert.ToSingle(qv_medium_num) + 1).ToString();
                                }
                            }

                            //Selecting 50% Easy questions from each unit
                            adp = new SqlDataAdapter("SELECT TOP(@top) * FROM Student_Exam_View WHERE Ch_Id=@ch AND Difficulty_level=@dif ORDER BY NEWID()", con);
                            adp.SelectCommand.Parameters.AddWithValue("@ch", chapters.ToString());
                            adp.SelectCommand.Parameters.AddWithValue("@top", (int)Convert.ToSingle(qv_easy_num));
                            adp.SelectCommand.Parameters.AddWithValue("@dif", "Easy");

                            adp.Fill(ds, "Questions");

                            //Selecting 30% Medium questions from each unit
                            adp = new SqlDataAdapter("SELECT TOP(@top) * FROM Student_Exam_View WHERE Ch_Id=@ch AND Difficulty_level=@dif ORDER BY NEWID()", con);
                            adp.SelectCommand.Parameters.AddWithValue("@ch", chapters.ToString());
                            adp.SelectCommand.Parameters.AddWithValue("@top", (int)Convert.ToSingle(qv_medium_num));
                            adp.SelectCommand.Parameters.AddWithValue("@dif", "Medium");

                            adp.Fill(ds, "Questions");

                            //Selecting 20% Hard questions from each unit
                            adp = new SqlDataAdapter("SELECT TOP(@top) * FROM Student_Exam_View WHERE Ch_Id=@ch AND Difficulty_level=@dif ORDER BY NEWID()", con);
                            adp.SelectCommand.Parameters.AddWithValue("@ch", chapters.ToString());
                            adp.SelectCommand.Parameters.AddWithValue("@top", (int)Convert.ToSingle(qv_hard_num));
                            adp.SelectCommand.Parameters.AddWithValue("@dif", "Hard");

                            adp.Fill(ds, "Questions");

                            //Deleting extra questions from the dataset
                            int fetched_rows = (int)Convert.ToSingle(qv_easy_num) + (int)Convert.ToSingle(qv_medium_num) + (int)Convert.ToSingle(qv_hard_num);
                            if (fetched_rows > total_marks)
                            {
                                int extra_rows = fetched_rows - (int)total_marks;
                                for (int d = 1; d <= extra_rows; d++)
                                {
                                    int last_row = ds.Tables["Questions"].Rows.Count - 1;
                                    ds.Tables["Questions"].Rows[last_row].Delete();
                                    ds.AcceptChanges();
                                }
                            }

                            DL_Questions.DataSource = ds.Tables["Questions"];
                            DL_Questions.DataBind();
                        }
                        else
                        {
                            if (dt.Rows[0]["Topic_Id"] != null)
                            {
                                Pnl_Main.Visible = false;
                                Pnl_Start_Exam.Visible = true;

                                float total_marks = float.Parse(dt.Rows[0]["Total_Marks"].ToString());

                                //string topics = "";
                                //for (int j = 0; j < LstB_Selected_Topics.Items.Count; j++)
                                //{
                                //    topics = topics + LstB_Selected_Topics.Items[j].Value.ToString() + ",";
                                //}
                                //if (topics.Length > 0)
                                //{
                                //    topics = topics.Substring(0, topics.Length - 1);
                                //}

                                int topics = Convert.ToInt32(dt.Rows[0]["Topic_Id"].ToString());
                                DataSet ds = new DataSet();
                                string qv_easy_num = ((50 * total_marks) / 100).ToString();
                                string qv_medium_num = ((30 * total_marks) / 100).ToString();
                                string qv_hard_num = ((20 * total_marks) / 100).ToString();

                                //If count of easy, medium and hard questions are 0 or less than 0, then increment them to atleat 1
                                //  or else increase number of easy questions if the number of questions are not enough.
                                while (((int)Convert.ToSingle(qv_easy_num) + (int)Convert.ToSingle(qv_medium_num) + (int)Convert.ToSingle(qv_hard_num)) < total_marks)
                                {
                                    if ((int)Convert.ToSingle(qv_easy_num) <= 0)
                                    {
                                        qv_easy_num = ((int)Convert.ToSingle(qv_easy_num) + 1).ToString();
                                    }
                                    else if ((int)Convert.ToSingle(qv_medium_num) <= 0)
                                    {
                                        qv_medium_num = ((int)Convert.ToSingle(qv_medium_num) + 1).ToString();
                                    }
                                    else if ((int)Convert.ToSingle(qv_hard_num) <= 0)
                                    {
                                        qv_hard_num = ((int)Convert.ToSingle(qv_hard_num) + 1).ToString();
                                    }
                                    else
                                    {
                                        qv_medium_num = ((int)Convert.ToSingle(qv_medium_num) + 1).ToString();
                                    }
                                }

                                //Selecting 50% Easy questions from each unit
                                adp = new SqlDataAdapter("SELECT TOP(@top) * FROM Student_Exam_View WHERE Topic_Id=@tid AND Difficulty_level=@dif ORDER BY NEWID()", con);
                                adp.SelectCommand.Parameters.AddWithValue("@tid", topics.ToString());
                                adp.SelectCommand.Parameters.AddWithValue("@top", (int)Convert.ToSingle(qv_easy_num));
                                adp.SelectCommand.Parameters.AddWithValue("@dif", "Easy");

                                adp.Fill(ds, "Questions");

                                //Selecting 30% Medium questions from each unit
                                adp = new SqlDataAdapter("SELECT TOP(@top) * FROM Student_Exam_View WHERE Topic_Id=@tid AND Difficulty_level=@dif ORDER BY NEWID()", con);
                                adp.SelectCommand.Parameters.AddWithValue("@tid", topics.ToString());
                                adp.SelectCommand.Parameters.AddWithValue("@top", (int)Convert.ToSingle(qv_medium_num));
                                adp.SelectCommand.Parameters.AddWithValue("@dif", "Medium");

                                adp.Fill(ds, "Questions");

                                //Selecting 20% Hard questions from each unit
                                adp = new SqlDataAdapter("SELECT TOP(@top) * FROM Student_Exam_View WHERE Topic_Id=@tid AND Difficulty_level=@dif ORDER BY NEWID()", con);
                                adp.SelectCommand.Parameters.AddWithValue("@tid", topics.ToString());
                                adp.SelectCommand.Parameters.AddWithValue("@top", (int)Convert.ToSingle(qv_hard_num));
                                adp.SelectCommand.Parameters.AddWithValue("@dif", "Hard");

                                adp.Fill(ds, "Questions");

                                //Deleting extra questions from the dataset
                                int fetched_rows = (int)Convert.ToSingle(qv_easy_num) + (int)Convert.ToSingle(qv_medium_num) + (int)Convert.ToSingle(qv_hard_num);
                                if (fetched_rows > total_marks)
                                {
                                    int extra_rows = fetched_rows - (int)total_marks;
                                    for (int d = 1; d <= extra_rows; d++)
                                    {
                                        int last_row = ds.Tables["Questions"].Rows.Count - 1;
                                        ds.Tables["Questions"].Rows[last_row].Delete();
                                        ds.AcceptChanges();
                                    }
                                }
                            }
                            else
                            {
                                Response.Write("<script>alert('Some error occured. Please select another exam.');</script>");
                                Pnl_Main.Visible = true;
                                Pnl_Start_Exam.Visible = false;
                            }
                        }
                    }
                }
            }
            else
                Response.Write("<script>alert('Some error occured. Please select another exam.');</script>");
        }
    }
}