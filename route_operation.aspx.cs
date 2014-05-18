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

public partial class route_operation : System.Web.UI.Page
{
    public System.Data.DataTable users_data;
    public System.Data.DataTable route;
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
                Execute_Query.exec_qry("update routes set is_deleted=1 where id='" + req_id + "'");
                Response.Redirect("/routes.aspx");
            }
            else if (req_type.ToLower().Trim() == "active")
            {
                Execute_Query.exec_qry("update routes set is_deleted=0 where id='" + req_id + "'");
                Response.Redirect("/routes.aspx");
            }
            else if (req_type.ToLower().Trim() == "edit")
            {
                route = SpecificSelectionFromTable.return_table("select * from routes where id='" + req_id + "' and is_deleted=0");
                if (route.Rows.Count != 1)
                {
                    Response.Redirect("/routes.aspx");
                }
                else
                {
                    if (!IsPostBack)
                    {
                        TextBox1.Text = route.Rows[0][1].ToString().Trim();
                    }
                }
            }
            else
            {
                Response.Redirect("/routes.aspx");
            }

            //page code
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string route_name = TextBox1.Text.ToString().Trim();
        if (route_name.Length == 0) { err = true; err_text.Add("Route Nmae can't be blank."); }
        if (SpecificSelectionFromTable.return_table("select count(*) from routes where route_name='" + route_name + "' and id not in ('" + req_id + "')").Rows[0][0].ToString().Trim() != "0") { err = true; err_text.Add("Place already exist."); }

        if (err == false)
        {
            if (Execute_Query.exec_qry("update routes set route_name='" + route_name + "' where id='" + req_id + "'"))
            {
                Response.Redirect("/routes.aspx");
            }
        }
    }
}
