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

public partial class LinkTest : System.Web.UI.Page
{
    public System.Data.DataTable agents;
    private void CreateControl()
    {
 
            Int32 i; //create a integer variable
            for(i = 0; i < 5; i++) // will generate 10 LinkButton
            {
 
             //create instance of LinkButton
                LinkButton lb = new LinkButton();
                lb = new LinkButton();
                lb.Text = Convert.ToString(i) + " "; //LinkButton Text
                lb.ID = Convert.ToString(i); // LinkButton ID’s
                lb.CommandArgument = Convert.ToString(i); //LinkButton CommandArgument
                lb.CommandName = Convert.ToString(i); //LinkButton CommanName
                lb.Command += new CommandEventHandler(lb_Command);//Create Handler for it.
                //type
                //lb.Command += and; //press double time Tab Key it will generat the lb_Command() code
                PlaceHolder1.Controls.Add(lb); // Adding the LinkButton in PlaceHolder
            }
 
    }

   protected void lb_Command(object sender, CommandEventArgs e)
    {
        LinkButton lnk = sender as LinkButton;
        Label1.Text = e.CommandName; // will display the which Linkbutton clicked

        if (lnk.Font.Bold == true)
        {
            lnk.Font.Bold = false;
            lnk.ForeColor = System.Drawing.Color.Blue;
        }
        else
        {
            lnk.Font.Bold = true;
            lnk.ForeColor = System.Drawing.Color.Green;
        }

    }
    protected void Page_Load(object sender, EventArgs e)
    {
        agents = SpecificSelectionFromTable.return_table("select * from users where user_type='agent' order by is_deleted");

       CreateControl();
    }
    protected void MyOnClickMethod(object sender, EventArgs e)
    {
        // do something
    }
}
