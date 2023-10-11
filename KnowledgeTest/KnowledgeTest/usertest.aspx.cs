using System;
using System.Web.UI.HtmlControls;
using System.Data;
using Microsoft.ApplicationBlocks.Data;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Drawing;

namespace KnowledgeTest
{
    public partial class usertest : System.Web.UI.Page
    {
        string strConnection = ConfigurationManager.AppSettings["sqlConnection"];
        protected void Page_Load(object sender, EventArgs e)
        {
            var userTest = (HtmlGenericControl)Master.FindControl("liUserTest");
            userTest.Attributes["class"] = "nav-item active";

            lblSuccess.Text = string.Empty;
            lblError.Text = string.Empty;
            if (!IsPostBack)
            {
                testTypeBox.Visible = true;
                questionBox1.Visible = false;
                resultBox1.Visible = false;
                FillDropDownField();
                
            }
        }

        protected void lnkAnswer_Click(object sender, EventArgs e)
        {
            bool isCorrect = true;
            lnkNext.Visible = true;
            LinkButton objButton = (LinkButton)sender;
            string strCorrectAnswer = Convert.ToString(ViewState["correctAnswer"]);
            foreach (var child in objButton.Parent.Controls)
            {
                if (child is LinkButton && ((LinkButton)child).CommandName == strCorrectAnswer)
                {
                    ((LinkButton)child).BackColor = Color.Green;
                    ((LinkButton)child).ForeColor = Color.White;
                }
            }
            if (objButton.CommandName != strCorrectAnswer)
            {
                isCorrect = false;
                objButton.BackColor = Color.Red;
                objButton.ForeColor = Color.White;

            }
            Managebuttons(false);
            string strQuerry = $"Update AllocatedTestQuestions " +
                $"Set UserAnswer = '{objButton.CommandName}', IsCorrect = {(isCorrect? '1':'0')} " +
                $"Where ID = {ViewState["atqID"]}";
            int result = SqlHelper.ExecuteNonQuery(strConnection, CommandType.Text, strQuerry);
        }

        private void Managebuttons(bool isEnable)
        {
            lnkAnswerA.Enabled = isEnable;
            lnkAnswerB.Enabled = isEnable;
            lnkAnswerC.Enabled = isEnable;
            lnkAnswerD.Enabled = isEnable;
        }


        private void FillDropDownField()
        {
            try
            {

                string strQuerry = string.Empty;
                string strFileName = string.Empty;
                //string strConnection = ConfigurationManager.AppSettings["sqlConnection"];
                strQuerry = $" Select alt.ID, tt.TestType + ' - ' + l.LanguageName TestLanguage " +
                    $"from AllocatedTests alt " +
                    $"inner join TestTypes tt on tt.ID = alt.TestTypeID " +
                    $"inner join Languages l on l.ID = alt.languageID " +
                    $"Where UserID = {Session["UserID"]} And alt.Status = 0";
                DataSet ds = SqlHelper.ExecuteDataset(strConnection, CommandType.Text, strQuerry); 
                ddlAllocated.DataTextField = "TestLanguage";
                ddlAllocated.DataValueField = "ID";
                ddlAllocated.DataSource = ds.Tables[0];
                ddlAllocated.DataBind();
                ddlAllocated.Items.Insert(0, new ListItem("Select", "0"));
            }
            catch (Exception ee)
            {
                lblError.Text = ee.Message;
            }
        }

       

        protected void lnkSubmitTestType_Click(object sender, EventArgs e)
        {
            ViewState["altID"] = ddlAllocated.SelectedValue;
            try
            {
                string strPath = "~/Files/QuestionImage/";
                string strQuerry = $"Update AllocatedTests Set Status = 1, StartTime = getDate() " +
                    $"Where ID = {ddlAllocated.SelectedValue};";

                strQuerry += $"Select atq.ID, '{strPath}' + tm.QuestionImage as QuestionImage, tm.CorrectAnswer, 0 as isDisplayed, tq.Question, tq.AnswerA, tq.AnswerB, tq.AnswerC, tq.AnswerD " +
                    $"FROM AllocatedTests alt " +
                    $"inner join AllocatedTestQuestions atq on atq.AllocatedTestID = alt.ID " +
                    $"inner join TestMaster tm on tm.ID = atq.TestMasterID " +
                    $"inner join TranslatedQuestions tq on tq.TestMasterID = tm.ID and tq.LanguageID = alt.LanguageID " +
                    $"Where alt.ID = { ViewState["altID"]}";

                DataSet ds = SqlHelper.ExecuteDataset(strConnection, CommandType.Text, strQuerry);
                if (ds.Tables[0].Rows.Count == 0)
                {
                    lblError.Text = "There is no question related to the selected test type or language";
                    testTypeBox.Visible = true;
                    questionBox1.Visible = false;
                    resultBox1.Visible = false;
                }
                else
                {
                    ViewState["Question"] = ds;
                    FillQuestion();
                }
            }
            catch (Exception ee)
            {
                lblError.Text = ee.Message;
            }
        }

        protected void lnkNext_Click(object sender, EventArgs e)
        {
            AnswerFormat();
            FillQuestion();
        }

        private void AnswerFormat()
        {
            lnkAnswerA.BackColor = Color.White;
            lnkAnswerA.ForeColor = Color.Black;

            lnkAnswerB.BackColor = Color.White;
            lnkAnswerB.ForeColor = Color.Black;

            lnkAnswerC.BackColor = Color.White;
            lnkAnswerC.ForeColor = Color.Black;

            lnkAnswerD.BackColor = Color.White;
            lnkAnswerD.ForeColor = Color.Black;
            Managebuttons(true);
        }

        protected void lblFinish_Click(object sender, EventArgs e)
        {
            Response.Redirect("allocatetest.aspx");
        }
        private void FillQuestion()
        {
            try
            {
                testTypeBox.Visible = false;
                questionBox1.Visible = true;
                resultBox1.Visible = false;
                DataSet ds = (DataSet)ViewState["Question"];
                DataRow[] dr = ds.Tables[0].Select("isDisplayed=0");
                
                if (dr.Length > 0)
                {
                    lblQuestion.Text = Convert.ToString(dr[0]["Question"]);
                    imgQuestion.ImageUrl = Convert.ToString(dr[0]["QuestionImage"]);
                    lnkAnswerA.Text = Convert.ToString(dr[0]["AnswerA"]);
                    lnkAnswerB.Text = Convert.ToString(dr[0]["AnswerB"]);
                    lnkAnswerC.Text = Convert.ToString(dr[0]["AnswerC"]);
                    lnkAnswerD.Text = Convert.ToString(dr[0]["AnswerD"]);
                    ViewState["correctAnswer"] = Convert.ToString(dr[0]["CorrectAnswer"]);
                    ViewState["atqID"] = Convert.ToInt32(dr[0]["ID"]);
                    dr[0]["isDisplayed"] = 1;
                }
                else
                {
                    testTypeBox.Visible = false;
                    questionBox1.Visible = false;
                    resultBox1.Visible = true;
                    String strQuerry = $"Select Count(*) Correct " +
                        $"from AllocatedTestQuestions " +
                        $"where IsCorrect = 1 And AllocatedTestID =  {ViewState["altID"]}";
                    int userCorrectAnswer = (int)SqlHelper.ExecuteScalar(strConnection, CommandType.Text, strQuerry);
                    strQuerry = $"Select NumberOfQuestions, CorrectToPass " +
                        $"From TestTypes " +
                        $"Where ID = (Select TestTypeID from AllocatedTests Where ID = {ViewState["altID"]}) ";
                    DataSet ds1 = SqlHelper.ExecuteDataset(strConnection, CommandType.Text, strQuerry);
                    int numberOfQuestion = (int)(ds1.Tables[0].Rows[0]["NumberOfQuestions"]);
                    int correctToPass = (int)(ds1.Tables[0].Rows[0]["CorrectToPass"]);
                    int passedOrFailed = userCorrectAnswer >= correctToPass? 2 : 3;
                    strQuerry = $"Update AllocatedTests Set Status = {passedOrFailed} Where ID = {ViewState["altID"]}";
                    SqlHelper.ExecuteNonQuery(strConnection, CommandType.Text, strQuerry);
                    lblCorrectAnswer.Text = Convert.ToString(userCorrectAnswer);
                    lblQuestionNumber.Text = Convert.ToString(numberOfQuestion);
                    if (passedOrFailed == 2)
                    {
                        lblResult1.Text = "Congratulation, You Have Passed:)))";
                        lblError1.Visible = false;
                    }
                    else if(passedOrFailed==3)
                    {
                        lblError1.Text = "You Have Failed, Try Later!!!";
                        lblResult1.Visible = false;
                    }
                    
                }
            }
            catch (Exception ee)
            {
                
            }
        }
    }
}