using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineTutoEmployeeCRUD
{
    public partial class EmployeeMgt : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Add Your connection string");

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["role"] != null)
            {
                if (!Session["role"].ToString().Equals("ADMIN"))
                {
                    Response.Redirect("Login.aspx");
                }
            }
            else
            {
                Response.Redirect("Login.aspx");
            }

            // call the display method
            if (!IsPostBack)
            {
                displayEmployees();
            }
        }

        // display employees method
        public void displayEmployees()
        {
            try
            {
                String sqlQuery = "SELECT emp_id, fullname, email, phone, date_of_birth, level_of_education, salary FROM Employee";
                SqlCommand cmd = new SqlCommand(sqlQuery, con);

                if (con.State == System.Data.ConnectionState.Closed)
                    con.Open();

                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();

                sda.Fill(dt);
                GridViewList.DataSource = dt;
                GridViewList.DataBind();

                // close connection
                con.Close();

            } catch(SqlException ex)
            {
                MessageLbl.Text = "Theres a problem displaying employees: " + ex.Message.ToString();
            }
        }

        // 
        protected void GridViewList_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "ViewDetails")
            {
                String emp_id = e.CommandArgument.ToString(); // ID of employee from selected row.
                // display it in inputs.
                populateInputs(emp_id);
            }
        }

        // populate the inputs method
        public void populateInputs(String emp_id)
        {
            try
            {
                String sqlQuery = "SELECT emp_id, fullname, email, phone, date_of_birth, level_of_education, salary FROM Employee WHERE emp_id=@emp_id";
                SqlCommand cmd = new SqlCommand(sqlQuery, con);
                cmd.Parameters.AddWithValue("@emp_id", emp_id);

                if (con.State == System.Data.ConnectionState.Closed)
                    con.Open();

                // read from selected values
                SqlDataReader rdr = cmd.ExecuteReader();

                while (rdr.Read())
                {
                    empIdBox.Text = rdr.GetValue(0).ToString();
                    fullnameBox.Text = rdr.GetValue(1).ToString();
                    emailBox.Text = rdr.GetValue(2).ToString();
                    phoneBox.Text = rdr.GetValue(3).ToString();
                    dateOfBirthBox.Text = Convert.ToDateTime(rdr.GetValue(4)).ToString("yyyy-MM-dd");
                    levelOfEducationList.SelectedValue = rdr.GetValue(5).ToString();
                    salaryBox.Text = rdr.GetValue(6).ToString();
                }

                // close connection
                con.Close();
            }
            catch (SqlException ex)
            {
                MessageLbl.Text = "There's a problem: " + ex.Message.ToString();
            }
        }

        protected void UpdateBtn_Click(object sender, EventArgs e)
        {
            if (empIdBox.Text.Trim().Length >= 1)
            {
                try
                {
                    String sqlQuery = "EXEC UpdateEmployee @emp_id, @fullname, @email, @phone, @dob, @loe, @salary";
                    SqlCommand cmd = new SqlCommand(sqlQuery, con);

                    cmd.Parameters.AddWithValue("@emp_id", empIdBox.Text);
                    cmd.Parameters.AddWithValue("@fullname", fullnameBox.Text);
                    cmd.Parameters.AddWithValue("@email", emailBox.Text);
                    cmd.Parameters.AddWithValue("@phone", phoneBox.Text);
                    cmd.Parameters.AddWithValue("@dob", dateOfBirthBox.Text);
                    cmd.Parameters.AddWithValue("@loe", levelOfEducationList.SelectedValue.ToString());
                    cmd.Parameters.AddWithValue("@salary", salaryBox.Text);

                    if (con.State == System.Data.ConnectionState.Closed)
                        con.Open();

                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected >= 1)
                    {
                        MessageLbl.Text = "Employee updated successfully.";

                        displayEmployees(); // call display to refresh
                    }
                    else
                    {
                        MessageLbl.Text = "Employee not updated";
                    }

                    // close connection
                    con.Close();

                }
                catch (SqlException ex)
                {
                    MessageLbl.Text = "There's a problem: " + ex.Message.ToString();
                }
            } else
            {
                MessageLbl.Text = "Please select an employee to update";
            }
        }

        // delete
        protected void DeleteBtn_Click(object sender, EventArgs e)
        {
            if (empIdBox.Text.Trim().Length >= 1)
            {
                try
                {
                    String sqlQuery = "EXEC DeleteEmployee @emp_id";
                    SqlCommand cmd = new SqlCommand(sqlQuery, con);

                    cmd.Parameters.AddWithValue("@emp_id", empIdBox.Text);

                    if (con.State == System.Data.ConnectionState.Closed)
                        con.Open();

                    int rowsAffected = cmd.ExecuteNonQuery();

                    if (rowsAffected >= 1)
                    {
                        MessageLbl.Text = "Employee deleted successfully.";

                        displayEmployees(); // call display to refresh
                    }
                    else
                    {
                        MessageLbl.Text = "Employee not delete";
                    }

                    // close connection
                    con.Close();

                }
                catch (SqlException ex)
                {
                    MessageLbl.Text = "There's a problem: " + ex.Message.ToString();
                }
            }
            else
            {
                MessageLbl.Text = "Please select an employee to delete";
            }
        }
    }
}