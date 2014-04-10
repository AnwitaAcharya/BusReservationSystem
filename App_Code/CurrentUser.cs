using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

/// <summary>
/// Summary description for CurrentUser
/// </summary>
public class CurrentUser
{
    /*public CurrentUser()
    {
        //
        // TODO: Add constructor logic here
        //
    }*/
    public static System.Data.DataTable record(string username)
    {
        System.Data.DataTable users_data = SpecificSelectionFromTable.return_table("select * from users where email='" + username + "'");
        return users_data;
    }
}
