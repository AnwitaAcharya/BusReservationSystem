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
    public System.Data.DataTable routes;
    public System.Data.DataTable bus_categories;
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
            all_categories();
            all_buses();
            //page code
        }
    }

    private void all_buses()
    {
        buses = SpecificSelectionFromTable.return_table("select * from buses order by is_deleted,bus_no");
    }
    
    protected void Button2_Click(object sender, EventArgs e)
    {
        string category_name = TextBox2.Text.ToString().Trim();
        if (category_name.Length == 0) { err = true; err_text.Add("Category Name can't be blank."); }
        if (SpecificSelectionFromTable.return_table("select count(*) from bus_categories where category_name='" + category_name + "'").Rows[0][0].ToString().Trim() != "0") { err = true; err_text.Add("Category Name already exist."); }
        if (err == false)
        {
            if (Execute_Query.exec_qry("insert into bus_categories (id,category_name) values ('" + IdGenerator.create() + "','" + category_name + "')"))
            {
                all_categories();
                UpdatePanel1.Update();
                TextBox2.Text = "";
                UpdatePanel3.Update();
            }
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
        routes = SpecificSelectionFromTable.return_table("select * from routes where is_deleted=0 order by route_name");    
    }
}
