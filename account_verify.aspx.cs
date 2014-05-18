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

public partial class account_verify : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string email = Request.QueryString["email"];
        string id = Request.QueryString["id"];

        if (email != null & id != null)
        {
            DataTable dt = SpecificSelectionFromTable.return_table("select id from users where email = '" + email + "'");
            if (dt.Rows.Count > 0)
            {
                string db_id = MD5Hash.encrypt(dt.Rows[0][0].ToString());
                if (db_id == id)
                {
                    Execute_Query.exec_qry("update users set email_verified = 1 where id = '" + dt.Rows[0][0] + "'");
                }
            }
        }
        Response.Redirect("/loginpage.aspx");
    }
}
