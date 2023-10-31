using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineTutoEmployeeCRUD
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"] != null)
            {
                if (!Session["role"].ToString().Equals("STAFF"))
                {
                    Response.Redirect("Login.aspx");
                }
            } else
            {
                Response.Redirect("Login.aspx");
            }
        }
    }
}