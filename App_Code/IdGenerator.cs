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
/// Summary description for IdGenerator
/// </summary>
public class IdGenerator
{
	/*public IdGenerator()
	{
		//
		// TODO: Add constructor logic here
		//
	}*/
    public static string create()
    {
        Random rnd = new Random();
        string str = DateTime.Now.Day + DateTime.Now.Month.ToString() + DateTime.Now.Year.ToString() + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString() + DateTime.Now.Millisecond.ToString() + DateTime.Now.Ticks.ToString() + rnd.Next(1000, 9999);
        //string str = DateTime.Now.Hour.ToString() + rnd.Next(1000, 9999);
        return str;
    }
}
