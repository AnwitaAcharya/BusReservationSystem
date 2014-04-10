using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class Agents : System.Web.UI.Page
{
    public System.Data.DataTable users_data;
    public System.Data.DataTable agents;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["admin_username"] == null)
        {
            Response.Redirect("/login.aspx");
        }
        else
        {
            string username = Session["admin_username"].ToString();
            users_data = CurrentUser.record(username);
            if (users_data.Rows.Count != 1)
            {
                Session["admin_username"] = null;
                Session.Remove("admin_username");
                Response.Redirect("/login.aspx");
            }
            //pagecode
            agents = SpecificSelectionFromTable.return_table("select * from users where user_type='agent' order by is_deleted");

            //page code
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string first_name = TextBox1.Text.ToString().Trim();
        string last_name = TextBox2.Text.ToString().Trim();
        string email = TextBox3.Text.ToString().Trim();
        string password = TextBox4.Text.ToString().Trim();
        string mobile = TextBox5.Text.ToString().Trim();
        string dob = TextBox6.Text.ToString().Trim();
        Execute_Query.exec_qry("insert into users (first_name, last_name, email, email_verified, password, mobile, mobile_verified, dob, user_type) values ('" + first_name + "', '" + last_name + "', '" + email + "', 1, '" + password + "', '" + mobile + "', 1, '" + dob + "', 'agent')");
        agents = SpecificSelectionFromTable.return_table("select * from users where user_type='agent'");
        UpdatePanel2.Update();
    }    
}
