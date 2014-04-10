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
/// Summary description for LoginCheck
/// </summary>
public class LoginCheck
{
	/*public LoginCheck()
	{
		//
		// TODO: Add constructor logic here
		//
	}*/
    public static Boolean validate(string username, string password)
    {
        Boolean rtn = false;
        System.Data.DataTable users_data = SpecificSelectionFromTable.return_table("select password from users where email='" + username + "' and is_deleted=0");
        if (users_data.Rows.Count==1)
        {
            if (users_data.Rows[0][0].ToString().Trim() == password.Trim())
            {
                rtn = true;
            }
        }
        return rtn;
    }
}
