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
        Boolean flag;
        try
        {
            
            SqlConnection con = new SqlConnection(DatabaseConnection.connection_string());
            con.Open();
            SqlCommand cmd = new SqlCommand();
            //cmd.ExecuteNonQuery();
            
          

            cmd.Connection = con;

            cmd.CommandText = "sql_qry";
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter p=new SqlParameter();
            p.ParameterName = "@sql";
            p.Direction = ParameterDirection.Input;
            p.SqlDbType = SqlDbType.Text;
            p.Value = qry;
            cmd.Parameters.Add(p);

            cmd.ExecuteScalar();


            flag=true;
            con.Close();
        }
        catch (Exception e)
        {
            
            
            flag= false;
        }
        return flag;
    }

   

}
