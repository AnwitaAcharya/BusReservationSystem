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
/// Summary description for SpecificSelectionFromTable
/// </summary>
public class SpecificSelectionFromTable
{
	/*public SpecificSelectionFromTable()
	{
		//
		// TODO: Add constructor logic here
		//
	}*/
    public static System.Data.DataTable return_table(string query)
    {
        System.Data.DataSet ds = new System.Data.DataSet();

        try
        {
            SqlConnection con = new SqlConnection(DatabaseConnection.connection_string());
            string qry = query;
            System.Data.SqlClient.SqlDataAdapter ad = new System.Data.SqlClient.SqlDataAdapter(qry, con);
            ad.Fill(ds);
           
        }
        catch (Exception ex)
        {
            //MsgBox("Network ERROR.", MsgBoxStyle.OkOnly, "Error")
            //MsgBox(ex.Message)
            System.Data.DataTable dt = new System.Data.DataTable();
            return dt;
        }
        return ds.Tables[0];
    }
}
