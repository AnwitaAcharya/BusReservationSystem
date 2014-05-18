using System;
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

public partial class Admin : System.Web.UI.Page 
{
    public System.Data.DataTable users_data;
    public System.Data.DataTable stats;
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

            stats = SpecificSelectionFromTable.return_table("(select count(*) from users where is_deleted=0 and user_type='agent') UNION ALL (select count(*) from buses where is_deleted=0) UNION ALL (select count(*) from routes where is_deleted=0)");
            //page code
        }
        //Execute_Query.exec_qry("insert into test values ('sura')")
        //Execute_Query.exec_qry("create table test(name varchar(4000))");
      //  Response.Write();
    }
}
