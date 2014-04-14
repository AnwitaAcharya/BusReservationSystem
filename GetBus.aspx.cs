﻿using System;
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

public partial class GetBus : System.Web.UI.Page
{
    public DataTable dt;
    protected void Page_Load(object sender, EventArgs e)
    {
        dt = SpecificSelectionFromTable.return_table("Select id,route_name from route where is_deleted=0");

        DropDownList1.Items.Clear();
        DropDownList2.Items.Clear();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            DropDownList1.Items.Add(dt.Rows[i][1].ToString());
            DropDownList2.Items.Add(dt.Rows[i][1].ToString());
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        int sourceIndex = DropDownList1.SelectedIndex;
        int destinationIndex = DropDownList2.SelectedIndex;

        if (sourceIndex >= 0 && destinationIndex >= 0)
        {

            String source = dt.Rows[sourceIndex][0].ToString();
            String destination = dt.Rows[destinationIndex][0].ToString();
            String date = TextBox1.Text;



            String day = date.Substring(0, 2);
            String month = date.Substring(3, 2);
            String year = date.Substring(6, 4);

            DateTime travelTime = DateTime.ParseExact(date, "dd/mm/yyyy", null);
            int d = (int)travelTime.DayOfWeek;
            if (d == 0)
                d = 7;

            DataTable buses = SpecificSelectionFromTable.return_table("Select z.id,z.bus_no,x.arrival_time from bus_details x,bus_details y,buses z where x.route_id='" + source + "' and y.route_id='" + destination + "' and x.bus_id=y.bus_id and x.week_day like '%" + d + "%' and x.sl_no<y.sl_no and x.bus_id=z.id");
            GridView1.DataSource = buses;
            GridView1.DataBind();
        }
    }
}
