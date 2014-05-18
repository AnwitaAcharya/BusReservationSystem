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

public partial class sql_query : System.Web.UI.Page
{
    public System.Data.DataTable users_data;
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
                Session["username"] = null;
                Session.Remove("username");
                Response.Redirect("/login.aspx");
            }
            //pagecode


            //page code
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string qry = TextBox1.Text;
        Execute_Query.exec_qry(qry);
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        string qry = TextBox1.Text;
        System.Data.DataTable dt = SpecificSelectionFromTable.return_table(qry);
    GridView1.DataSource = dt;
    GridView1.DataBind();
    }
}
