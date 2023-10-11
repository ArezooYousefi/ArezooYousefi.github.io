using System;
using System.Web.UI.HtmlControls;
using System.Data;
using Microsoft.ApplicationBlocks.Data;
using System.Configuration;

namespace KnowledgeTest
{
    public partial class addUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //these two line is used to control the class active in the tags.
            var userlist = (HtmlGenericControl)Master.FindControl("liUserlist");
            userlist.Attributes["class"] = "nav-item active";
            //end of the active class control
            lblError.Text = string.Empty;
            lblresult.Text = string.Empty;
        }

        protected void liSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string strQuerry = string.Empty;
                string strFileName = string.Empty;
                string strConnection = ConfigurationManager.AppSettings["sqlConnection"];
                strQuerry = $"Select ID from Users Where EmailAddress = '{txtEmail.Text.Trim()}'";
                int intExists = Convert.ToInt32(SqlHelper.ExecuteScalar(strConnection,CommandType.Text,strQuerry));
                if (intExists > 0)
                {
                    lblError.Text = "This Email already exists.";
                }
                else{
                    if (fuUserPicture.HasFile)
                    {
                        string[] strArray = fuUserPicture.FileName.Split('.');
                        string strExtension = strArray[strArray.Length - 1];
                        strFileName = Guid.NewGuid().ToString() + "." + strExtension;
                        string strPath = Server.MapPath("~/Files/UserPicture/") + strFileName;
                        fuUserPicture.SaveAs(strPath);
                    }

                    strQuerry = $"INSERT INTO[dbo].[Users]([FirstName],[LastName],[EmailAddress],[Password],[Phone],[UserType],[UserPicture])VALUES('{txtFirstName.Text}','{txtLastName.Text}','{txtEmail.Text}','{txtpassword.Text}','{txtPhone.Text}','{ddlUserType.SelectedValue}','{strFileName}')";
                    int result = SqlHelper.ExecuteNonQuery(strConnection, CommandType.Text, strQuerry);
                    if (result > -1)
                    {
                        lblresult.Text = "The User has been successfully added.";
                        txtFirstName.Text = string.Empty;
                        txtLastName.Text = string.Empty;
                        txtpassword.Text = string.Empty;
                        txtEmail.Text = string.Empty;
                        txtPhone.Text = string.Empty;
                        ddlUserType.SelectedIndex = 0;
                        

                    }
                }
            }
                
            catch(Exception ee)
            {
                lblresult.Text = ee.Message;
            }
           
        }
    }
}