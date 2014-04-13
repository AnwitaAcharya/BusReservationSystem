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

public partial class bus_create : System.Web.UI.Page
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
            string bus_no = Request.Params["bus_no"];
            string category = Request.Params["category"];
            string weekday = Request.Params["weekday[]"];
            string sl_nos = Request.Params["sl_nos[]"];
            string route_selects = Request.Params["route_selects[]"];
            string arrival_times = Request.Params["arrival_times[]"];
            string fares = Request.Params["fares[]"];

            if (bus_no == null) { bus_no = ""; }
            if (category == null) { category = ""; }
            if (weekday == null) { weekday = ""; }
            if (sl_nos == null) { sl_nos = ""; }
            if (route_selects == null) { route_selects = ""; }
            if (arrival_times == null) { arrival_times = ""; }
            if (fares == null) { fares = ""; }

            if (bus_no.ToString().Trim().Length == 0)
            {
                err = true;
                err_text.Add("Bus no can't be blank.");
            }
            if (sl_nos.Split(',').Length != fares.Split(',').Length)
            {
                err = true;
                err_text.Add("Please enter amount only in fare text boxes. Dont use coma(,).");
            }
            for (int i = 0; i <= fares.Split(',').Length - 1; i++)
            {
                try
                {
                    Convert.ToDecimal(fares.Split(',')[i].ToString().Trim());
                    }
                catch (Exception ex)
                {
                    err = true;
                    err_text.Add("Please enter amount only in fare text boxes.");
                    break;
                }
            }
                if (err == false)
                {
                    string bus_id = IdGenerator.create();
                    if (Execute_Query.exec_qry("insert into buses (id, bus_no, category_id) values('" + bus_id + "', '" + bus_no + "', '" + category + "')"))
                    {
                        string[] sl_no_ar = sl_nos.Split(',');
                        string[] route_select_ar = route_selects.Split(',');
                        string[] arrival_time_ar = arrival_times.Split(',');
                        string[] fare_ar = fares.Split(',');
                        for (int i = 0; i <= sl_no_ar.Length - 1; i++)
                        {
                            Execute_Query.exec_qry("insert into bus_details (id, sl_no, bus_id, route_id, arrival_time, fare, week_day) values ('" + IdGenerator.create()+i.ToString() + "', '" + sl_no_ar[i] + "', '" + bus_id + "', '" + route_select_ar[i] + "', '" + arrival_time_ar[i] + "', '" + fare_ar[i] + "', '" + weekday + "')");
                        }
                        Response.Write("1");
                    }
                }
        }
    }
}
