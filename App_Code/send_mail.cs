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
using System.Net.Mail;
using System.Net;
using System.Text;

/// <summary>
/// Summary description for send_mail
/// </summary>
public class send_mail
{
	/*public send_mail()
	{
		//
		// TODO: Add constructor logic here
		//
	}*/
    public static int mail(string nameOfSender, string emailOfReciever, string subjectOfMail, string bodyOfMail)
    {
        int successStatus = 0;

        MailMessage mailMsg = new MailMessage();
        mailMsg.From = new MailAddress("noreply@babujeebus.com", nameOfSender);
        mailMsg.To.Add(new MailAddress(emailOfReciever));
        mailMsg.Subject = subjectOfMail;
        mailMsg.Body = bodyOfMail;
        mailMsg.IsBodyHtml = true;

        mailMsg.BodyEncoding = Encoding.UTF8;

        SmtpClient smtp = new SmtpClient();
        smtp.Host = "smtp.gmail.com";
        smtp.EnableSsl = true;
        NetworkCredential NetworkCred = new NetworkCredential("surajit16@gmail.com", "xxxxxxxxxx");
        smtp.UseDefaultCredentials = true;
        smtp.Credentials = NetworkCred;
        smtp.Port = 587;
   
        try
        {
            smtp.Send(mailMsg);
            successStatus = 1;
        }
        catch (Exception ex)
        {
            successStatus = 0;
        }

        return successStatus;
    }

}
