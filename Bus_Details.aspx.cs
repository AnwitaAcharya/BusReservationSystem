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

public partial class Bus_Details : System.Web.UI.Page
{
    String busId, source, destination;
    protected void Page_Load(object sender, EventArgs e)
    {
        busId = Request.QueryString["id"];
        source = Request.QueryString["src"];
        destination = Request.QueryString["dst"];
        
        
        DataTable bus_dtl = SpecificSelectionFromTable.return_table("Select id,bus_no from buses where id='" + busId + "'");
        Label1.Text = bus_dtl.Rows[0][1].ToString();

        DataTable location_dtl = SpecificSelectionFromTable.return_table("Select id,route_name from routes where id in ('" + source + "','" + destination + "')");

        if (location_dtl.Rows[0][0].ToString().Equals(source))
        {
            Label5.Text = location_dtl.Rows[0][1].ToString();
            Label7.Text = location_dtl.Rows[1][1].ToString();
        }
        else
        {
            Label5.Text = location_dtl.Rows[1][1].ToString();
            Label7.Text = location_dtl.Rows[0][1].ToString();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        String seatCount = DropDownList1.SelectedValue;
        Response.Redirect("Payment.aspx?st=" + seatCount + "&src=" + source + "&dst=" + destination );
    }
}
