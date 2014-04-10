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
using System.Data.SqlClient;
/// <summary>
/// Summary description for Execute_Query
/// </summary>
public class Execute_Query
{
    /*public Execute_Query()
    {
        //
        // TODO: Add constructor logic here
        //
    }*/
    public static Boolean exec_qry(string qry)
    {
        try
        {
            /*SqlConnection myConn = new SqlConnection(DatabaseConnection.connection_string());
            myConn.Open();
            string strqry = qry;
            SqlCommand myCom = new SqlCommand(strqry, myConn);
            int numrow = myCom.ExecuteNonQuery();
            myConn.Close();*/
            /*SqlConnection con = new SqlConnection("Server=SURAJIT1-85CFDA;Database=ticket_booking;Trusted_Connectopn=True");*/
            SqlConnection con = new SqlConnection(DatabaseConnection.connection_string());
            con.Open();
            SqlCommand cmd = new SqlCommand(qry, con);
            cmd.ExecuteNonQuery();
            /*DataSet ds = new DataSet(cmd, con);
            SqlDataAdapter da = new SqlDataAdapter();
            da.Fill(ds);*/
            con.Close();
            return true;
        }
        catch (Exception e)
        {
            return false;
        }

    }

}
