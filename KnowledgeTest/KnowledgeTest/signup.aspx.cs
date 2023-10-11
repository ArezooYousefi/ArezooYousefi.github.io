using System;
using System.Web.UI.HtmlControls;
using System.Data;
using Microsoft.ApplicationBlocks.Data;
using System.Configuration;
namespace KnowledgeTest
{
    public partial class signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblError.Text = string.Empty;
            lblSuccess.Text = string.Empty;
            Page.Form.DefaultButton = lnkSubmit.UniqueID;
        }

        protected void lnkSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string strQuerry = string.Empty;
                string strFileName = string.Empty;
                string strConnection = ConfigurationManager.AppSettings["sqlConnection"];
                strQuerry = $"Select ID from Users Where EmailAddress = '{txtEmaiAddress.Text.Trim()}'";
                int intExists = Convert.ToInt32(SqlHelper.ExecuteScalar(strConnection, CommandType.Text, strQuerry));
                if (intExists > 0)
                {
                    lblError.Text = "This Email already exists.";
                }
                else
                {
                    string strUserType = "Normal User";
                    if (fuUserPicture.HasFile)
                    {
                        string[] strArray = fuUserPicture.FileName.Split('.');
                        string strExtension = strArray[strArray.Length - 1];
                        strFileName = Guid.NewGuid().ToString() + "." + strExtension;
                        string strPath = Server.MapPath("~/Files/UserPicture/") + strFileName;
                        fuUserPicture.SaveAs(strPath);
                    }

                    strQuerry = $"INSERT INTO[dbo].[Users]([FirstName],[LastName],[EmailAddress],[Password],[Phone],[UserType],[UserPicture])" +
                        $"VALUES('{txtFirstName.Text}','{txtLastName.Text}','{txtEmaiAddress.Text}','{txtPassword.Text}','{txtPhoneNumber.Text}','{strUserType}','{strFileName}')";
                    int result = SqlHelper.ExecuteNonQuery(strConnection, CommandType.Text, strQuerry);
                    if (result > -1)
                    {
                        lblSuccess.Text = "The User has been successfully added.";
                        txtFirstName.Text = string.Empty;
                        txtLastName.Text = string.Empty;
                        txtPassword.Text = string.Empty;
                        txtEmaiAddress.Text = string.Empty;
                        txtPhoneNumber.Text = string.Empty;
                    }
                }
            }
            catch (Exception ee)
            {
                lblError.Text = ee.Message;
            }

        }
    }
}