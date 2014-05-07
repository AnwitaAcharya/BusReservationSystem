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

public partial class bus_operation : System.Web.UI.Page
{
    public System.Data.DataTable users_data;
    public System.Data.DataTable agent;
    public string req_type;
    public string req_id;
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
            req_type = Request.QueryString["req_type"];
            req_id = Request.QueryString["req_id"];
            if (req_type.ToLower().Trim() == "inactive")
            {
                Execute_Query.exec_qry("update buses set is_deleted=1 where id='" + req_id + "'");
                Response.Redirect("/buses.aspx");
            }
            else if (req_type.ToLower().Trim() == "active")
            {
                Execute_Query.exec_qry("update buses set is_deleted=0 where id='" + req_id + "'");
                Response.Redirect("/buses.aspx");
            }
            else if (req_type.ToLower().Trim() == "edit")
            {
                agent = SpecificSelectionFromTable.return_table("select * from buses where id='" + req_id + "'");
                if (agent.Rows.Count != 1)
                {
                    Response.Redirect("/buses.aspx");
                }
                else
                {
                    if (!IsPostBack)
                    {
                        TextBox1.Text = agent.Rows[0][1].ToString().Trim();
                        TextBox2.Text = agent.Rows[0][2].ToString().Trim();
                        TextBox3.Text = agent.Rows[0][3].ToString().Trim();
                        //TextBox4.Text=agent.Rows[0][5].ToString().Trim();
                        TextBox5.Text = agent.Rows[0][6].ToString().Trim();
                        TextBox6.Text = agent.Rows[0][8].ToString().Trim().Split(' ')[0];
                    }
                }
            }
            else
            {
                Response.Redirect("/buses.aspx");
            }

            //page code
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string first_name = TextBox1.Text.ToString().Trim();
        string last_name = TextBox2.Text.ToString().Trim();
        string email = TextBox3.Text.ToString().Trim();
        string mobile = TextBox5.Text.ToString().Trim();
        string dob = TextBox6.Text.ToString().Trim();
        if (first_name.Length == 0) { err = true; err_text.Add("First Nmae can't be blank."); }
        if (email.Length == 0) { err = true; err_text.Add("Email can't be blank."); }
        if (dob.Length == 0) { err = true; err_text.Add("Date of birth can't be blank."); }
        if (SpecificSelectionFromTable.return_table("select count(*) from users where email='" + email + "' and id not in ('" + req_id + "')").Rows[0][0].ToString().Trim() != "0") { err = true; err_text.Add("Email already exist."); }
        if (err == false)
        {
            if (TextBox4.Text.Trim().Length > 0)
            {
                string password = MD5Hash.encrypt(TextBox4.Text.ToString().Trim());
                if (Execute_Query.exec_qry("update users set first_name ='" + first_name + "', last_name='" + last_name + "', email='" + email + "', password='" + password + "', mobile='" + mobile + "', dob='" + dob + "' where id='" + req_id + "'"))
                {
                    Response.Redirect("/buses.aspx");
                }
            }
            else
            {
                if (Execute_Query.exec_qry("update users set first_name ='" + first_name + "', last_name='" + last_name + "', email='" + email + "', mobile='" + mobile + "', dob='" + dob + "' where id='" + req_id + "'"))
                {
                    Response.Redirect("/buses.aspx");
                }
            }
        }

    }
}
