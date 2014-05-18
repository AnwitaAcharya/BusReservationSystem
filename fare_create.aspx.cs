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

public partial class fare_create : System.Web.UI.Page
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
            string category = Request.QueryString["category"];

            if (category != null)
            {
                string[] keys = Request.Form.AllKeys;
                for (int i = 0; i < keys.Length; i++)
                {
                    string val = Request.Form[keys[i]];
                    if (val == null) { val = "0"; }
                    val = val.ToString().Trim();
                    if (val.Length == 0) { val = "0"; }
                    try
                    {
                        Convert.ToDecimal(val);
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
                    for (int i = 0; i < keys.Length; i++)
                    {
                        string key = keys[i].ToString().Trim();
                        string val = Request.Form[keys[i]];
                        if (val == null) { val = "0"; }
                        val = val.ToString().Trim();
                        if (val.Length == 0) { val = "0"; }

                        if (key.Split('_').Length == 2)
                        {
                            string source_id = key.Split('_')[0];
                            string destination_id = key.Split('_')[1];
                            System.Data.DataTable fare = SpecificSelectionFromTable.return_table("select * from fares where category_id ='" + category + "' and ((source_id='" + source_id + "' and destination_id='" + destination_id + "') or (source_id='" + destination_id + "' and destination_id='" + source_id + "'))");
                            if (fare.Rows.Count > 0)
                            {
                                Execute_Query.exec_qry("update fares set fare='" + val + "' where id='" + fare.Rows[0][0].ToString().Trim() + "'");
                            }
                            else
                            {
                                Execute_Query.exec_qry("insert into fares (id, category_id, source_id, destination_id, fare) values ('" + IdGenerator.create()+ i.ToString() + "', '" + category + "', '" + source_id + "', '" + destination_id + "', '" + val + "')");
                            }
                        }
                    }
                    Response.Write("<table class='success'><tr><td>Saved successfully!</td></tr></table>");
                }
            }
        }

    }
}
