using Microsoft.ApplicationBlocks.Data;
using System;
using System.Configuration;
using System.Data;
using System.Web.UI.HtmlControls;

namespace KnowledgeTest
{
    public partial class edituser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //these two line is used to control the class active in the tags.
            var userlist = (HtmlGenericControl)Master.FindControl("liUserlist");
            userlist.Attributes["class"] = "nav-item active";
            //end of the active class control
            if (Session["editUserID"] != null)
            {
                ViewState["editUserID"] = Session["editUserID"];
                Session.Remove("editUserID");
                FillData();
            }
            if (ViewState["editUserID"]==null)
            {
                Response.Redirect("userlist.aspx");
            }

        }

        private void FillData()
        {
            try
            {
                string strPath = "~/Files/UserPicture/";
                string strConnection = ConfigurationManager.AppSettings["sqlConnection"];
                string strQuerry = $"SELECT [ID],[FirstName],[LastName],[EmailAddress],[Phone],[UserType],'{strPath}'+[UserPicture] as UserPicture " +
                    $",[Status],[CreatedOn]FROM [Users] Where ID = {Convert.ToInt32(ViewState["editUserID"])}";
                DataSet ds = SqlHelper.ExecuteDataset(strConnection, CommandType.Text, strQuerry);


                txtFirstName.Text = Convert.ToString(ds.Tables[0].Rows[0]["FirstName"]);
                txtLastName.Text = Convert.ToString(ds.Tables[0].Rows[0]["LastName"]);
                txtPhone.Text = Convert.ToString(ds.Tables[0].Rows[0]["Phone"]);
                txtEmail.Text = Convert.ToString(ds.Tables[0].Rows[0]["EmailAddress"]);
                ddlUserType.SelectedValue = Convert.ToString(ds.Tables[0].Rows[0]["UserType"]);
                imgUserPicture.ImageUrl = Convert.ToString(ds.Tables[0].Rows[0]["UserPicture"]);

            }
            catch (Exception ee)
            {

            }
        }



        protected void lnkSubmit_Click(object sender, EventArgs e)
        {
            string strConnection = ConfigurationManager.AppSettings["sqlConnection"];
            string strFileName = string.Empty;
            string strQuerry = string.Empty;
            string strImgQuery = string.Empty;
            strQuerry = $"Select ID from Users Where EmailAddress = '{txtEmail.Text.Trim()}' and ID <> {Convert.ToInt32(ViewState["editUserID"])}";
            int intExists = Convert.ToInt32(SqlHelper.ExecuteScalar(strConnection, CommandType.Text, strQuerry));
            if (intExists > 0)
            {
                lblError.Text = "This Email already exists.";
            }
            else
            {
                if (fuUserPicture.HasFile)
                {
                    string[] strArray = fuUserPicture.FileName.Split('.');
                    string strExtension = strArray[strArray.Length - 1];
                    strFileName = Guid.NewGuid().ToString() + "." + strExtension;
                    string strPath = Server.MapPath("~/Files/UserPicture/") + strFileName;
                    fuUserPicture.SaveAs(strPath);
                    strImgQuery = $",[UserPicture] = '{strFileName}'";
                }
                strQuerry = $"Update [Users] set [FirstName] = '{txtFirstName.Text}',[LastName] = '{txtLastName.Text}',[EmailAddress]='{txtEmail.Text}',[Phone]='{txtPhone.Text}'" +
                $",[UserType]='{ddlUserType.SelectedValue}'{(fuUserPicture.HasFile ? strImgQuery : "")} Where ID = {Convert.ToInt32(ViewState["editUserID"])}";

                int result = SqlHelper.ExecuteNonQuery(strConnection, CommandType.Text, strQuerry);
                if (result > -1)
                {
                    lblresult.Text = "The User has been successfully Updated.";
                }

            }

        }
    }
}