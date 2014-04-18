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

public partial class admin_accounts : System.Web.UI.Page
{
    public System.Data.DataTable users_data;
    public Boolean err = false;
    public ArrayList err_text = new ArrayList();
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
            if (!IsPostBack)
            {
                TextBox4.Text = users_data.Rows[0][3].ToString().Trim();
            }
                //page code
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string username = Session["admin_username"].ToString();
        string current_password = TextBox1.Text.ToString().Trim();
        string new_password = TextBox2.Text.ToString().Trim();
        string retype_password = TextBox3.Text.ToString().Trim();
        if (current_password.Length == 0) { err = true; err_text.Add("Current password can't be blank."); }
        if (new_password.Length == 0) { err = true; err_text.Add("New password can't be blank."); }
        if (retype_password.Length == 0) { err = true; err_text.Add("Retype password can't be blank."); }
        if (new_password.Length < 4) { err = true; err_text.Add("New password atleast 4 charcter long."); }
        if (retype_password != new_password) { err = true; err_text.Add("New password and Retype password are not matching"); }
        if (users_data.Rows[0][5].ToString().Trim() != MD5Hash.encrypt(current_password)) { err = true; err_text.Add("Current password is not matching"); }
        
        if (err == false)
        {
            new_password = MD5Hash.encrypt(new_password);
            if (Execute_Query.exec_qry("update users set password='" + new_password + "' where email='" + username + "'"))
            {
                Response.Redirect("/admin_accounts.aspx");
            }
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        string username = Session["admin_username"].ToString();
        string email = TextBox4.Text.ToString().Trim();
        if (email.Length == 0) { err = true; err_text.Add("Email can't be blank."); }
        if (SpecificSelectionFromTable.return_table("select count(*) from users where email='" + email + "' and id not in ('" + username + "')").Rows[0][0].ToString().Trim() != "0") { err = true; err_text.Add("Email already exist."); }
        
        if (err == false)
        {
            if (Execute_Query.exec_qry("update users set email='" + email + "' where email='" + username + "'"))
            {
                Session["admin_username"] = email;
                Response.Redirect("/admin_accounts.aspx");
            }
        }
    }
}
