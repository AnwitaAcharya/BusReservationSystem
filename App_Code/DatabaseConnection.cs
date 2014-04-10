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
/// Summary description for DatabaseConnection
/// </summary>
public class DatabaseConnection
{
	/*public DatabaseConnection()
	{
		//
		// TODO: Add constructor logic here
		//
	}*/

    public static string connection_string()
    {
        string dbPath = "Data Source=SURAJIT1-85CFDA;Initial Catalog=ticket_booking;User ID=skynet;Password=love";
        return dbPath;
    }
}
