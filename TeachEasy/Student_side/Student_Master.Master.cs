using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TeachEasy.Student_side
{
    public partial class Student_Master : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Profile_image"] != null)
            {
                Img_Profile_Image.ImageUrl = Session["Profile_image"].ToString();
            }
            else
            {
                Img_Profile_Image.ImageUrl = "~/TE_CssClass_Files/assets/img/avatar/avatar-3.png";
            }
        }
    }
}