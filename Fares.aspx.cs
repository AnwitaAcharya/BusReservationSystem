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

public partial class Fares : System.Web.UI.Page
{
    public System.Data.DataTable users_data;
    public System.Data.DataTable routes;
    public System.Data.DataTable fares;
    public System.Data.DataTable bus_categories;
    public Boolean err = false;
    public ArrayList err_text = new ArrayList();
    public string selected;
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
            fares = SpecificSelectionFromTable.return_table("select * from fares where category_id='" + selected + "'");
            //page code
        }
    }

    private void all_routes()
    {
        routes = SpecificSelectionFromTable.return_table("select * from routes where is_deleted=0 order by route_name");    
    }
    private void all_categories()
    {
        selected=DropDownList1.Text;
        bus_categories = SpecificSelectionFromTable.return_table("select * from bus_categories where is_deleted=0 order by category_name");
        DropDownList1.Items.Clear();
        DropDownList1.Items.Add(new ListItem("Select category", ""));
        for (int i = 0; i <= bus_categories.Rows.Count - 1; i++)
        {
            ListItem item = new ListItem(bus_categories.Rows[i][1].ToString().Trim(), bus_categories.Rows[i][0].ToString().Trim());
            DropDownList1.Items.Add(item);
        }
        //Response.Write(selected);
        DropDownList1.SelectedValue = selected;
        if (selected == null) { selected = ""; }
    }
}
