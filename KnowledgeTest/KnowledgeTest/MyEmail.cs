using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mail;

namespace KnowledgeTest
{
    public class MyEmail
    {
        public int SendMail(string strSubject, string strTo, string strBody, bool bIsHTML)
        {
            try
            {

                //fill email fields
                var msgMail = new MailMessage();
                msgMail.To = strTo;
                msgMail.Cc = "";
                msgMail.Bcc = "";
                msgMail.From = "areyousefi@gmail.com";
                msgMail.Subject = strSubject;
                //check is body is in html format or not
                if (bIsHTML)
                {
                    msgMail.BodyFormat = MailFormat.Html;
                }
                msgMail.Body = strBody;

                int iAuthenticated = 1;
                SmtpMail.SmtpServer = "in-v3.mailjet.com";
                string sUserName = "4b1de4fb0cddf42ef6eded7fdbd1bc77";
                string sPassword = "cce113ff087886e579a7eb35b339655b";
                string sPortNo = "587";


                msgMail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpserverport", sPortNo);
                msgMail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendusername", sUserName);
                msgMail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendpassword", sPassword);
                if (iAuthenticated == 1)
                {
                    msgMail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate", 1);
                }
                else
                {
                    msgMail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate", 0);
                }
                //send mail
                SmtpMail.Send(msgMail);
                return 1;

            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }
    }
}