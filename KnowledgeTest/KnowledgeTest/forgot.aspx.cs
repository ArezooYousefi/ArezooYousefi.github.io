using Microsoft.ApplicationBlocks.Data;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.Mail;

namespace KnowledgeTest
{
    public partial class forgot : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblError.Text = string.Empty;
            lblSuccess.Text = string.Empty;
        }

        protected void lnksubmit_Click(object sender, EventArgs e)
        {
            try
            {
                Crypto objCrypto = new Crypto();
                string strQuerry = string.Empty;
                string strFileName = string.Empty;
                string strConnection = ConfigurationManager.AppSettings["sqlConnection"];
                strQuerry = $"Select ID from Users Where EmailAddress = '{txtEmail.Text.Trim()}'";
                int intID = Convert.ToInt32(SqlHelper.ExecuteScalar(strConnection, CommandType.Text, strQuerry));
                if (intID > 0)
                {

                    MyEmail email = new MyEmail();
                    string strId = objCrypto.EnCrypt(Convert.ToString(intID));
                    string strBody = $"<p>Click on the link below to reset your Password<br/><span>https://localhost:44308/reset.aspx?src={strId}</span></P>";
                    email.SendMail( "Forgot Password", txtEmail.Text.Trim(), strBody, true);
                    lblSuccess.Text = "AN Email was sent to you, please check your inbox to reset your Password";
                    txtEmail.Text = string.Empty;
                }
                else
                {
                    
                    lblError.Text = "This Email does not exist";
                }
            }

            catch (Exception ee)
            {
                lblError.Text = ee.Message;
            }

        }
    }

}