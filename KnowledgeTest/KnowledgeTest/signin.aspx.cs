using System;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using Microsoft.ApplicationBlocks.Data;

namespace KnowledgeTest
{
    public partial class signin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Form.DefaultButton = lnkLogin.UniqueID;
        }

        protected void lnkLogin_Click(object sender, EventArgs e)
        {
            try
            {
                string strPath = "~/Files/UserPicture/";
                string strConnection = ConfigurationManager.AppSettings["sqlConnection"];
                string strQuerry = $"Select ID , (FirstName +' '+ LastName) as Name, ('{strPath}'+ UserPicture) as UserPicture from Users Where EmailAddress = '{txtEmail.Text.Trim()}' and Password = '{txtpassword.Text.Trim()}' and Status = 1";
                DataSet ds = SqlHelper.ExecuteDataset(strConnection, CommandType.Text, strQuerry);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    Session["UserID"] = Convert.ToInt32(ds.Tables[0].Rows[0]["ID"]);
                    Session["Name"] = Convert.ToString(ds.Tables[0].Rows[0]["Name"]);
                    Session["UserPicture"] = Convert.ToString(ds.Tables[0].Rows[0]["UserPicture"]);
                    Response.Redirect("~/dashboard.aspx");
                }
                else
                {
                    lblError.Text = "The Email or Password is incorrct";
                }
            }
            catch (Exception ee)
            {
                lblError.Text = ee.Message;
            }

        }
    }
}