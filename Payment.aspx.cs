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

public partial class Payment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        String seatQuantity = Request.QueryString["st"];
        String source = Request.QueryString["src"];
        String destination = Request.QueryString["dst"];

        DataTable fareCollection = SpecificSelectionFromTable.return_table("Select * from fares where source_id='" + source + "' and destination_id='" + destination + "'");
        String fare = fareCollection.Rows[0][5].ToString();
        int fareValue = Convert.ToInt32(fare);

        DataTable location_dtl = SpecificSelectionFromTable.return_table("Select id,route_name from routes where id in ('" + source + "','" + destination + "')");

        if (location_dtl.Rows[0][0].ToString().Equals(source))
        {
            Label3.Text = location_dtl.Rows[0][1].ToString();
            Label5.Text = location_dtl.Rows[1][1].ToString();
        }
        else
        {
            Label3.Text = location_dtl.Rows[1][1].ToString();
            Label5.Text = location_dtl.Rows[0][1].ToString();
        }

        Label7.Text = seatQuantity;
        Label9.Text = fare;
        Label11.Text = (fareValue * Convert.ToInt32(seatQuantity)).ToString();
    }
}
