using System;
using System.Web.UI;
using System.Configuration;
using System.Data;
using Microsoft.ApplicationBlocks.Data;

namespace KnowledgeTest
{
    public partial class changepassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblError.Text = string.Empty;
            lblSuccess.Text = string.Empty;
            Page.Form.DefaultButton = lnkSubmit.UniqueID;
        }

        protected void lnkSubmit_Click(object sender, EventArgs e)
        {
            string strConnection = ConfigurationManager.AppSettings["sqlConnection"];
            string strQuerry = $"Select ID From Users Where Password = '{txtCurrentPassword.Text.Trim()}' And ID = {Session["UserID"]}";
            DataSet ds = SqlHelper.ExecuteDataset(strConnection, CommandType.Text, strQuerry);
            if (ds.Tables[0].Rows.Count == 0)
            {
                lblError.Text = "Your Current Password is incorrect";
            }else if(txtNewPassword.Text.Trim() != txtConfirmPassword.Text.Trim())
            {
                lblError.Text = "New Password and Confirm Password should be the same";
            }
            else
            {
                strQuerry = $"Update Users Set Password ='{txtNewPassword.Text}' Where ID = {Session["UserID"]}";
                int result = SqlHelper.ExecuteNonQuery(strConnection, CommandType.Text, strQuerry);
                if (result > -1)
                {
                    lblSuccess.Text = "Password has successfully changed.";
                }
                else
                {
                    lblError.Text = "Please try later";
                }
            }
        }
    }
}