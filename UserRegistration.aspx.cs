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

public partial class UserRegistration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
        String firstName, lastName, dob, email, pwd, address;
        firstName = TextBox1.Text;
        lastName = TextBox3.Text;
        email = TextBox4.Text;
        pwd = TextBox2.Text;
        dob = TextBox5.Text;
        address = TextBox6.Text;

        try
        {
            if (firstName.Trim().Length==0)
                throw new Exception("Please enter First Name");

            else if (lastName.Trim().Length == 0)
                throw new Exception("Please enter Last Name");
            else if (email.Trim().Length == 0)
                throw new Exception("Please enter Email");
            else if (pwd.Trim().Length == 0)
                throw new Exception("Please enter password");
            else if (dob.Trim().Length == 0)
                throw new Exception("Please enter Date of Birth");
            else if (address.Trim().Length == 0)
                throw new Exception("Please enter address");
            else
            {
                pwd=MD5Hash.encrypt (pwd );

                System.Data.DataTable checkExistence = SpecificSelectionFromTable.return_table("Select count(*) from users where email='" + email.ToLower() + "'");
                
                if (Convert.ToInt32(checkExistence.Rows[0][0].ToString()) == 0)
                {
                    
                    System.Data.DataTable dt = SpecificSelectionFromTable.return_table("Select count(*)  from users");
                    String countOfUser = dt.Rows[0][0].ToString();

                    String userId = "user." + MD5Hash .encrypt((Convert.ToInt32(countOfUser)+1).ToString()) ;
                    String qry = "Insert into users(id,first_name, last_name, email, password, dob, address_line1) values ('" + userId + "','" + firstName + "','" + lastName + "','" + email + "','" + pwd + "','" + dob + "','" + address + "')";


                    //throw new Exception(qry);

                    Boolean b= Execute_Query .exec_qry(qry);

                    string bdy = "<html><head></head><body><p>Dear " + TextBox1.Text + ", </p><p><br> Welcome to BabujeeBus. Please <a href='" + Request.Url.Host + "/account_verify.aspx?email=" + email + "&id=" + MD5Hash.encrypt(userId) + "'>click here</a> to verify your email.</p></body></html>";
                    
                    send_mail.mail("BabujeeBus", TextBox4.Text, "BabujeeBus: Verify Mail", bdy);
                    //throw new Exception(b.ToString());
                    //Session["username"]=userId;
                    Label2.Visible = false;
                    TextBox1.Text = TextBox2.Text = TextBox3.Text = TextBox4.Text = TextBox5.Text = TextBox6.Text = "";
                }
                
            }
        }
        catch (Exception ex)
        {
            Label2.Text = ex.Message;
            Label2.Visible = true;
        }
    }

   
}
