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

public partial class Login : System.Web.UI.Page
{
    public Boolean err = false;
    public ArrayList err_text = new ArrayList();
    
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Redirect("/loginpage.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string username = TextBox1.Text.ToString().Trim();
        string password = MD5Hash.encrypt(TextBox2.Text.ToString().Trim());
        if (LoginCheck.validate(username, password))
        {
            System.Data.DataTable users_data;
            users_data = CurrentUser.record(username);
            if (users_data.Rows.Count == 1)
            {
                if (users_data.Rows[0][14].ToString().Trim().ToLower() == "admin")
                {
                    Session["admin_username"] = username;
                    Response.Redirect("/admin.aspx");
                }
                else if (users_data.Rows[0][14].ToString().Trim().ToLower() == "agent")
                {
                    Session["agent_username"] = username;
                    Response.Redirect("/agent.aspx");
                }
                else if (users_data.Rows[0][14].ToString().Trim().ToLower() == "normal")
                {
                    Session["username"] = username;
                    Response.Redirect("/");
                }

            }
        }
    }
}
