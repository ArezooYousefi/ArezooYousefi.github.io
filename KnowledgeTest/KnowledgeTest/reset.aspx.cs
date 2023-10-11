using System;
using System.Web.UI;
using System.Configuration;
using System.Data;
using Microsoft.ApplicationBlocks.Data;

namespace KnowledgeTest
{
    public partial class reset : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Crypto objCrypto = new Crypto();
            lblError.Text = string.Empty;
            lblSuccess.Text = string.Empty;
            Page.Form.DefaultButton = lnkSubmit.UniqueID;
            if(Request["src"]!= null)
            {
                ViewState["userID"] = objCrypto.DeCrypt(Convert.ToString(Request["src"]));
                //ViewState["userID"] = Convert.ToString(Request["src"]);
                string strConnection = ConfigurationManager.AppSettings["sqlConnection"];
                string strPath = "~/Files/UserPicture/";
                string strQuerry = $"Select FirstName+' '+ LastName Name, ('{strPath}' + UserPicture) UserPicture From Users Where ID={ViewState["userID"]}";
                DataSet ds = SqlHelper.ExecuteDataset(strConnection, CommandType.Text, strQuerry);
                Session["userPicture"] = Convert.ToString(ds.Tables[0].Rows[0]["UserPicture"]);
                Session["name"] = Convert.ToString(ds.Tables[0].Rows[0]["Name"]);
            }
            else
            {
                lblError.Text = "Invalid Link";
            }
        }

        protected void lnkSubmit_Click(object sender, EventArgs e)
        {
            string strConnection = ConfigurationManager.AppSettings["sqlConnection"];
             if (txtNewPassword.Text.Trim() != txtConfirmPassword.Text.Trim())
            {
                lblError.Text = "New Password and Confirm Password should be the same";
            }
            else
            {
                string strQuerry = $"Update Users Set Password ='{txtNewPassword.Text}' Where ID = {ViewState["userID"]}";
                int result = SqlHelper.ExecuteNonQuery(strConnection, CommandType.Text, strQuerry);
                if (result > -1)
                {
                    lblSuccess.Text = "Password has successfully changed.";
                    Session.Abandon();
                }
                else
                {
                    lblError.Text = "Please try later";
                }
            }
        }
    }
}