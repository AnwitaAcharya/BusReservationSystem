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
            all_agents();
            //page code
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string first_name = TextBox1.Text.ToString().Trim();
        string last_name = TextBox2.Text.ToString().Trim();
        string email = TextBox3.Text.ToString().Trim();
        string password = MD5Hash.encrypt(TextBox4.Text.ToString().Trim());
        string mobile = TextBox5.Text.ToString().Trim();
        string dob = TextBox6.Text.ToString().Trim();
        if (first_name.Length == 0) { err = true; err_text.Add("First Nmae can't be blank."); }
        if (password.Length < 4) { err = true; err_text.Add("Password atleast 4 charcter long."); }
        if (email.Length == 0) { err = true; err_text.Add("Email can't be blank."); }
        if (dob.Length == 0) { err = true; err_text.Add("Date of birth can't be blank."); }
        if (SpecificSelectionFromTable.return_table("select count(*) from users where email='" + email + "'").Rows[0][0].ToString().Trim() != "0") { err = true; err_text.Add("Email already exist."); }
        if (err == false)
        {
            if (Execute_Query.exec_qry("insert into users (id, first_name, last_name, email, email_verified, password, mobile, mobile_verified, dob, user_type) values ('" + IdGenerator.create() + "','" + first_name + "', '" + last_name + "', '" + email + "', 1, '" + password + "', '" + mobile + "', 1, '" + dob + "', 'agent')"))
            {
                all_agents();
                UpdatePanel2.Update();
                TextBox1.Text = "";
                TextBox2.Text = "";
                TextBox3.Text = "";
                TextBox4.Text = "";
                TextBox5.Text = "";
                TextBox6.Text = "";
                UpdatePanel1.Update();
            }
        }
    }
    private void all_agents()
    {
        agents = SpecificSelectionFromTable.return_table("select * from users where user_type='agent' order by is_deleted, first_name");
    }
}
