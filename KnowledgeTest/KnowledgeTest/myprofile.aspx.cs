using Microsoft.ApplicationBlocks.Data;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KnowledgeTest
{
    public partial class myprofile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            string strPath = "~/Files/UserPicture/";
            string strConnection = ConfigurationManager.AppSettings["sqlConnection"];
            string strQuerry = $"SELECT [ID],[FirstName],[LastName],[EmailAddress],[Phone],[UserType], '{strPath}'+[UserPicture] UserPicture FROM [Users] Where ID = {Session["UserID"]}";
            DataSet ds = SqlHelper.ExecuteDataset(strConnection, CommandType.Text, strQuerry);
            if (ds.Tables[0].Rows.Count> 0)
            {
                imgUserPicture.ImageUrl = Convert.ToString(ds.Tables[0].Rows[0]["UserPicture"]);
                lblUserName.Text = Convert.ToString(Session["Name"]);
                lblFirstName.Text = Convert.ToString(ds.Tables[0].Rows[0]["FirstName"]);
                lblLastName.Text = Convert.ToString(ds.Tables[0].Rows[0]["LastName"]);
                lblEmailAddress.Text = Convert.ToString(ds.Tables[0].Rows[0]["EmailAddress"]);
                lblPhone.Text = Convert.ToString(ds.Tables[0].Rows[0]["Phone"]);
                lblUserType.Text = Convert.ToString(ds.Tables[0].Rows[0]["UserType"]);
            }
        }
    }
}