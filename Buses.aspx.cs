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

public partial class Buses : System.Web.UI.Page
{
    public System.Data.DataTable users_data;
    public System.Data.DataTable buses;
    public System.Data.DataTable bus_categories;
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
            all_categories();
            //page code
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string route_name = TextBox1.Text.ToString().Trim();
        if (Execute_Query.exec_qry("insert into routes (route_name) values ('" + route_name + "')"))
        {
        all_routes();
        UpdatePanel2.Update();
        TextBox1.Text = "";
            UpdatePanel1.Update();
    }
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        string category_name = TextBox2.Text.ToString().Trim();
        if (Execute_Query.exec_qry("insert into bus_categories (id,category_name) values ('" + IdGenerator.create() + "','" + category_name + "')"))
        {
            all_categories();
            UpdatePanel1.Update();
            TextBox2.Text = "";
            UpdatePanel3.Update();
        }
    }

    private void all_categories()
    {
        bus_categories= SpecificSelectionFromTable.return_table("select * from bus_categories where is_deleted=0 order by category_name");
        DropDownList1.Items.Clear();
        for (int i = 0; i <= bus_categories.Rows.Count - 1; i++)
        {
            ListItem item = new ListItem(bus_categories.Rows[i][1].ToString().Trim(), bus_categories.Rows[i][0].ToString().Trim());
          DropDownList1.Items.Add(item);
        }
    }


    private void all_routes()
    {
        buses = SpecificSelectionFromTable.return_table("select * from routes order by is_deleted, route_name");    
    }
}
