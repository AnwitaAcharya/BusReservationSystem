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
/// Summary description for BusFare
/// </summary>
public class BusFare
{
/*	public BusFare()
	{
		//
		// TODO: Add constructor logic here
		//
	}*/
    public static string get_fare(string bus_id, string source_id, string destination_id)
    {
        string bus_fare = "0";
        System.Data.DataTable fare = SpecificSelectionFromTable.return_table("select * from fares where category_id in (select category_id from buses where id='" + bus_id + "') and ((source_id='" + source_id + "' and destination_id='" + destination_id + "') or (source_id='" + destination_id + "' and destination_id='" + source_id + "'))");
        if (fare.Rows.Count > 0)
        {
            bus_fare = fare.Rows[0][5].ToString().Trim();
        }
        return bus_fare;
    }
}
