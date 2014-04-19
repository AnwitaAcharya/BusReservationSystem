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
    public System.Data.DataTable bus_categories;
    public System.Data.DataTable bus;
    public System.Data.DataTable bus_details;
    public System.Data.DataTable routes;
    public string req_type;
    public string req_id;
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
                bus = SpecificSelectionFromTable.return_table("select * from buses where id='" + req_id + "'");
                if (bus.Rows.Count != 1)
                {
                    Response.Redirect("/buses.aspx");
                }
                else
                {
                    bus_details = SpecificSelectionFromTable.return_table("select * from bus_details where bus_id = '" + req_id + "' and is_deleted='0' order by sl_no");
                    if (!IsPostBack)
                    {
                        TextBox1.Text = bus.Rows[0][1].ToString().Trim();
                    }
                    all_categories();
                    all_routes();
                }
            }
            else
            {
                Response.Redirect("/buses.aspx");
            }

            //page code
        }
    }

    private void all_categories()
    {
        if (IsPostBack)
        {
            selected = DropDownList1.Text;
        }
        else
        {
            selected = bus.Rows[0][2].ToString().Trim();
        }
            bus_categories = SpecificSelectionFromTable.return_table("select * from bus_categories where is_deleted=0 order by category_name");
        DropDownList1.Items.Clear();
        for (int i = 0; i <= bus_categories.Rows.Count - 1; i++)
        {
            ListItem item = new ListItem(bus_categories.Rows[i][1].ToString().Trim(), bus_categories.Rows[i][0].ToString().Trim());
            DropDownList1.Items.Add(item);
        }
        DropDownList1.SelectedValue = selected;
    }
    private void all_routes()
    {
        routes = SpecificSelectionFromTable.return_table("select * from routes where is_deleted=0 order by route_name");
    }
}
