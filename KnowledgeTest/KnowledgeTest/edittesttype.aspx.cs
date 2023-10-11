using Microsoft.ApplicationBlocks.Data;
using System;
using System.Configuration;
using System.Data;
using System.Web.UI.HtmlControls;

namespace KnowledgeTest
{
    public partial class edittesttype : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //these two line is used to control the class active in the tags.
            var userlist = (HtmlGenericControl)Master.FindControl("liTestType");
            userlist.Attributes["class"] = "nav-item active";
            //end of the active class control
            lblResult.Text = string.Empty;
            lblError.Text = string.Empty;
            if (Session["editTestTypeID"] != null)
            {
                ViewState["editTestTypeID"] = Session["editTestTypeID"];
                Session.Remove("editTestTypeID");
                FillData();
            }
        }
        private void FillData()
        {
            try
            {
                string strConnection = ConfigurationManager.AppSettings["sqlConnection"];
                string strQuerry = $"SELECT [ID],[TestType], NumberOfQuestions, CorrectToPass" +
                    $",Case When Status=1 Then 'Active' Else 'Deleted' End Status, Format(CreatedOn , 'MMM Dd YYYY') CreatedOn From TestTypes " +
                    $"Where ID = {Convert.ToInt32(ViewState["editTestTypeID"])}";
                
                DataSet ds = SqlHelper.ExecuteDataset(strConnection, CommandType.Text, strQuerry);
                txtTestType.Text = Convert.ToString(ds.Tables[0].Rows[0]["TestType"]);
                txtNumberOfQuestions.Text = Convert.ToString(ds.Tables[0].Rows[0]["NumberOfQuestions"]);
                txtCorrectAnswer.Text= Convert.ToString(ds.Tables[0].Rows[0]["CorrectToPass"]);
            }
            catch (Exception ee)
            {
                lblError.Text = ee.Message;
            }
        }

        protected void lnkSubmit_Click(object sender, EventArgs e)
        {
            string strConnection = ConfigurationManager.AppSettings["sqlConnection"];
            string strFileName = string.Empty;
            string strQuerry = string.Empty;
            string strImgQuery = string.Empty;
            strQuerry = $"Select ID from TestTypes Where TestType = '{txtTestType.Text}'";
            if (ViewState["editTestTypeID"] != null)
            {
                strQuerry += $" And ID <> {Convert.ToInt32(ViewState["editTestTypeID"])}";
            }
            int intExists = Convert.ToInt32(SqlHelper.ExecuteScalar(strConnection, CommandType.Text, strQuerry));
            if (intExists > 0)
            {
                lblError.Text = "The Test Type must be unique";
            }
            else
            {
                if (ViewState["editTestTypeID"] != null)
                {
                    strQuerry = $"Update [TestTypes] set [TestType] = '{txtTestType.Text}', NumberOfQuestions={txtNumberOfQuestions.Text}, CorrectToPass = {txtCorrectAnswer.Text}" +
                $"Where ID = {Convert.ToInt32(ViewState["editTestTypeID"])}";
                }
                else
                {
                    strQuerry = $"Insert Into [TestTypes] ([TestType], [NumberOfQuestions], [CorrectToPass]) Values('{txtTestType.Text}',{txtNumberOfQuestions.Text}, {txtCorrectAnswer.Text})";
                }

                int result = SqlHelper.ExecuteNonQuery(strConnection, CommandType.Text, strQuerry);
                if (result > -1)
                {
                    if (ViewState["editTestTypeID"] != null)
                    {
                        lblResult.Text = $"Test Type has been successfully updated.";
                    }
                    else
                    {
                        lblResult.Text = $"Test Type has been successfully created.";
                    }
                }
            }

        }
    }
}