using System;
using System.Web.UI.HtmlControls;
using System.Data;
using Microsoft.ApplicationBlocks.Data;
using System.Configuration;
using System.Web.UI.WebControls;

namespace KnowledgeTest
{
    public partial class edittestmaster : System.Web.UI.Page
    {
        string strConnection = ConfigurationManager.AppSettings["sqlConnection"];
        protected void Page_Load(object sender, EventArgs e)
        {
            var testmaster = (HtmlGenericControl)Master.FindControl("liTestMaster");
            testmaster.Attributes["class"] = "nav-item active";
            lblresult.Text = string.Empty;
            lblError.Text = string.Empty;


            if (Session["editTestMasterID"] != null)
            {
                ViewState["editTestMasterID"] = Session["editTestMasterID"];
                Session.Remove("editTestMasterID");
                FillData();
            }
            if (ViewState["editTestMasterID"] == null)
            {
                Response.Redirect("testmasterlist.aspx");
            }
            if (!IsPostBack)
            {
                FillData();
                FillDropDownField();
                ddlTestType_TextChanged(null, null);
            }
        }

        private void FillDropDownField()
        {
            try
            {

                string strQuerry = string.Empty;
                string strFileName = string.Empty;
                //string strConnection = ConfigurationManager.AppSettings["sqlConnection"];
                strQuerry = $" Select Distinct TestType From TestType;";
                DataSet ds = SqlHelper.ExecuteDataset(strConnection, CommandType.Text, strQuerry);


                ddlTestType.DataTextField = "TestType";
                ddlTestType.DataValueField = "TestType";
                ddlTestType.DataSource = ds.Tables[0];
                ddlTestType.DataBind();
                ddlTestType.Items.Insert(0, new ListItem("Select", "0"));
            }
            catch (Exception ee)
            {
                lblError.Text = ee.Message;
            }
        }
        private void FillData()
        {
            try
            {

                string strQuerry = string.Empty;
                string strFileName = string.Empty;
                string strPath = "~/Files/UserPicture/";
                //string strConnection = ConfigurationManager.AppSettings["sqlConnection"];
                strQuerry = $"SELECT [ID],(select TestType from TestType where ID=TestTypeID) [TestType], [TestTypeID],[Question],[QuestionImage],[AnswerA],[AnswerB],[AnswerC],[AnswerD],[CorrectAnswer],[CreatedBy],[Status],[CreatedOn]" +
                    $" FROM [TestMaster] Where ID={Convert.ToInt32(ViewState["editTestMasterID"])}";
                DataSet ds = SqlHelper.ExecuteDataset(strConnection, CommandType.Text, strQuerry);

                txtQuestion.Text = Convert.ToString(ds.Tables[0].Rows[0]["Question"]);
                txtAnswerA.Text = Convert.ToString(ds.Tables[0].Rows[0]["AnswerA"]);
                txtAnswerB.Text = Convert.ToString(ds.Tables[0].Rows[0]["AnswerB"]);
                txtAnswerC.Text = Convert.ToString(ds.Tables[0].Rows[0]["AnswerC"]);
                txtAnswerD.Text = Convert.ToString(ds.Tables[0].Rows[0]["AnswerD"]);
                ddlCorrectAnswer.SelectedValue = Convert.ToString(ds.Tables[0].Rows[0]["CorrectAnswer"]);
                ddlTestType.SelectedValue = Convert.ToString(ds.Tables[0].Rows[0]["TestType"]);
                ddlLanguage.SelectedValue = Convert.ToString(ds.Tables[0].Rows[0]["TestTypeID"]);
                imgQuestion.ImageUrl = String.Format("~/Files/QuestionImage/{0:C}", Convert.ToString(ds.Tables[0].Rows[0]["QuestionImage"])) ;
            }
            catch (Exception ee)
            {
                lblError.Text = ee.Message;
            }
        }

        protected void ddlTestType_TextChanged(object sender, EventArgs e)
        {
            try
            {
                string strQuerry = string.Empty;
                string strFileName = string.Empty;
                //string strConnection = ConfigurationManager.AppSettings["sqlConnection"];
                strQuerry = $" Select  ID, Language From TestType where TestType = '{ddlTestType.SelectedValue}';";
                DataSet ds = SqlHelper.ExecuteDataset(strConnection, CommandType.Text, strQuerry);
                ddlLanguage.DataTextField = "Language";
                ddlLanguage.DataValueField = "ID";
                ddlLanguage.DataSource = ds.Tables[0];
                ddlLanguage.DataBind();
                ddlLanguage.Items.Insert(0, new ListItem("Select", "0"));
            }
            catch (Exception ee)
            {
                lblError.Text = ee.Message;
            }
        }
        protected void lnkSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string strQuerry = string.Empty;
                string strFileName = string.Empty;

                strQuerry = $"Select ID from TestMaster Where Question = '{txtQuestion.Text.Trim()}' And ID <> {Convert.ToInt32(ViewState["editTestMasterID"])}";
                int intExists = Convert.ToInt32(SqlHelper.ExecuteScalar(strConnection, CommandType.Text, strQuerry));
                if (intExists > 0)
                {
                    lblError.Text = "This Question already exists.";
                }
                else
                {
                    if (fuQuestionImage.HasFile)
                    {
                        string[] strArray = fuQuestionImage.FileName.Split('.');
                        string strExtension = strArray[strArray.Length - 1];
                        strFileName = Guid.NewGuid().ToString() + "." + strExtension;
                        string strPath = Server.MapPath("~/Files/QuestionImage/") + strFileName;
                        fuQuestionImage.SaveAs(strPath);
                        strQuerry = $"Update TestMaster Set TestTypeID = (Select ID from TestType Where TestType = '{ddlTestType.SelectedItem}' And Language = '{ddlLanguage.SelectedItem}') ," +
                        $" Question = '{txtQuestion.Text}' , QuestionImage = '{strFileName}'," +
                        $" AnswerA = '{txtAnswerA.Text}', AnswerB = '{txtAnswerB.Text}', AnswerC = '{txtAnswerC.Text}'" +
                        $", AnswerD = '{txtAnswerD.Text}', CorrectAnswer = '{ddlCorrectAnswer.SelectedValue}' Where ID = {Convert.ToInt32(ViewState["editTestMasterID"])}";
                    }
                    else
                    {
                        strQuerry = $"Update TestMaster Set TestTypeID = (Select ID from TestType Where TestType = '{ddlTestType.SelectedItem}' And Language = '{ddlLanguage.SelectedItem}') ," +
                            $" Question = '{txtQuestion.Text}'," +
                            $" AnswerA = '{txtAnswerA.Text}', AnswerB = '{txtAnswerB.Text}', AnswerC = '{txtAnswerC.Text}'" +
                            $", AnswerD = '{txtAnswerD.Text}', CorrectAnswer = '{ddlCorrectAnswer.SelectedValue}' Where ID = {Convert.ToInt32(ViewState["editTestMasterID"])}";
                    }
                    int result = SqlHelper.ExecuteNonQuery(strConnection, CommandType.Text, strQuerry);
                    if (result > -1)
                    {
                        lblresult.Text = "The Test Master has been successfully Updated.";
                        //txtQuestion.Text = string.Empty;
                        //txtAnswerA.Text = string.Empty;
                        //txtAnswerB.Text = string.Empty;
                        //txtAnswerC.Text = string.Empty;
                        //txtAnswerD.Text = string.Empty;
                        //ddlCorrectAnswer.SelectedIndex = 0;
                        //ddlTestType.SelectedIndex = 0;
                        //ddlLanguage.SelectedIndex = 0;
                    }
                }
            }

            catch (Exception ee)
            {
                lblresult.Text = ee.Message;
            }

        }
    }
}