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

public partial class Routes : System.Web.UI.Page
{
    public System.Data.DataTable users_data;
    public System.Data.DataTable routes;
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
            all_routes();
            //page code
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string route_name = TextBox1.Text.ToString().Trim();
        if (route_name.Length == 0) { err = true; err_text.Add("Route Nmae can't be blank."); }
        if (SpecificSelectionFromTable.return_table("select count(*) from routes where route_name='" + route_name + "'").Rows[0][0].ToString().Trim() != "0") { err = true; err_text.Add("Place already exist."); }
        if (err == false)
        {
            if (Execute_Query.exec_qry("insert into routes (id, route_name) values ('" + IdGenerator.create() + "','" + route_name + "')"))
            {
                all_routes();
                UpdatePanel2.Update();
                TextBox1.Text = "";
                UpdatePanel1.Update();
            }
        }
    }

    private void all_routes()
    {
        routes = SpecificSelectionFromTable.return_table("select * from routes order by is_deleted, route_name");
    }
}
