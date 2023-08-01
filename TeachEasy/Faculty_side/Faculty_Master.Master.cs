using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TeachEasy.Faculty_side
{
    public partial class Faculty_Master : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Profile_Image"] != null)
            {
                Img_Profile_Image.ImageUrl = Session["Profile_Image"].ToString();
            }
            else
            {
                Img_Profile_Image.ImageUrl = "~/TE_CssClass_Files/assets/img/avatar/avatar-3.png";
            }
        }
    }
}