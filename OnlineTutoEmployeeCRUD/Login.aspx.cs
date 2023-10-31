using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineTutoEmployeeCRUD
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Add Your connection string");

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LoginBtn_Click(object sender, EventArgs e)
        {
            try
            {
                String sqlQuery = "SELECT username, password, role FROM [UserEmployee] WHERE username=@username";
                SqlCommand cmd = new SqlCommand(sqlQuery, con);
                cmd.Parameters.AddWithValue("@username", usernameBox.Text);

                if (con.State == System.Data.ConnectionState.Closed)
                    con.Open();

                // read from selected values
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    String passwordFromDb = rdr.GetValue(1).ToString(); // at 1 position is password
                    String role = rdr.GetValue(2).ToString(); // at 2 position is role

                    // check if password is correct
                    if (passwordBox.Text.Equals(passwordFromDb))
                    {
                        // redirect to different page based on role
                        if (role.Equals("ADMIN"))
                        {
                            Session["role"] = role;
                            Response.Redirect("EmployeeMgt.aspx");
                        } else
                        {
                            Session["role"] = role;
                            Response.Redirect("Default.aspx");
                        }
                    } else
                    {
                        MessageLbl.Text = "Invalid username or password, please try again.";
                    }
                }

                // close connection
                con.Close();
            } catch (SqlException ex)
            {
                MessageLbl.Text = "There's a problem: " + ex.Message.ToString();
            }
        }
    }
}