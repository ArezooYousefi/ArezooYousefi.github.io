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
    public partial class translate : System.Web.UI.Page
    {
        string strConnection = ConfigurationManager.AppSettings["sqlConnection"];
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["TranslateID"] != null)
            {
                ViewState["TranslateID"] = Session["TranslateID"];
                //Session.Remove("TranslateID");
                FillData();
            }
            if (!IsPostBack)
            {
                FillData();
                FillDropDownField();

            }
        }

        private void FillData()
        {

            string strQuerry = string.Empty;

            strQuerry = $"Select * From TranslatedQuestions where TestMasterID = {ViewState["TranslateID"]} " +
                $"And LanguageID = (Select ID from Languages where isBasedLanguage = 1)";
            DataSet ds = SqlHelper.ExecuteDataset(strConnection, CommandType.Text, strQuerry);
            txtQuestion.Text = Convert.ToString(ds.Tables[0].Rows[0]["Question"]);
            txtQuestion.Enabled = false;
            txtAnswerA.Text = Convert.ToString(ds.Tables[0].Rows[0]["AnswerA"]);
            txtAnswerA.Enabled = false;
            txtAnswerB.Text = Convert.ToString(ds.Tables[0].Rows[0]["AnswerB"]);
            txtAnswerB.Enabled = false;
            txtAnswerC.Text = Convert.ToString(ds.Tables[0].Rows[0]["AnswerC"]);
            txtAnswerC.Enabled = false;
            txtAnswerD.Text = Convert.ToString(ds.Tables[0].Rows[0]["AnswerD"]);
            txtAnswerD.Enabled = false;

        }

        protected void lnkSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string strQuerry = string.Empty;
                strQuerry = $"Select * from TranslatedQuestions where TestMasterID = {ViewState["TranslateID"]} And LanguageID = {ddlTranslateTo.SelectedValue}";
                DataSet ds = SqlHelper.ExecuteDataset(strConnection, CommandType.Text, strQuerry);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    strQuerry = $"Update TranslatedQuestions set " +
                        $"Question = N'{txtTQusestion.Text}', AnswerA = N'{txtTAnswerA.Text}',AnswerB=N'{txtTAnswerB.Text}',AnswerC = N'{txtTAnswerC.Text}',AnswerD=N'{txtTAnswerD.Text}' " +
                        $"Where TestMasterID = {ViewState["TranslateID"]} And LanguageID = {ddlTranslateTo.SelectedValue}";
                    int result2 = SqlHelper.ExecuteNonQuery(strConnection, CommandType.Text, strQuerry);
                    if (result2 > 0)
                    {
                        lblresult.Text = "translation is updated successfully";
                    }
                }
                else
                {
                    strQuerry = $"INSERT INTO [TranslatedQuestions]([TestMasterID],[LanguageID],[Question],[AnswerA],[AnswerB],[AnswerC],[AnswerD]) " +
                        $"VALUES " +
                        $"({ViewState["TranslateID"]}, {ddlTranslateTo.SelectedValue}, N'{txtTQusestion.Text}', N'{txtTAnswerA.Text}', N'{txtTAnswerB.Text}', N'{txtTAnswerC.Text}', N'{txtTAnswerD.Text}' )";

                    int result = SqlHelper.ExecuteNonQuery(strConnection, CommandType.Text, strQuerry);
                    if (result > -1)
                    {
                        lblresult.Text = "The User has been successfully added.";
                        txtTQusestion.Text = string.Empty;
                        txtTAnswerA.Text = string.Empty;
                        txtTAnswerB.Text = string.Empty;
                        txtTAnswerC.Text = string.Empty;
                        txtTAnswerD.Text = string.Empty;
                        ddlTranslateTo.SelectedValue = "0";
                        lblresult.Text = "The question translated successfully.";
                    }
                    else
                    {
                        lblError.Text = "There is an error here,";
                    }
                }
            }
            catch (Exception ee)
            {
                lblError.Text = ee.Message;
            }
        }

        private void FillDropDownField()
        {

            string strQuerry = string.Empty;

            strQuerry = $"Select * From Languages ";
            DataSet ds = SqlHelper.ExecuteDataset(strConnection, CommandType.Text, strQuerry);
            ddlBaseLanguage.DataSource = ds.Tables[0];
            ddlBaseLanguage.DataTextField = "LanguageName";
            ddlBaseLanguage.DataValueField = "ID";
            ddlBaseLanguage.DataBind();
            ddlBaseLanguage.SelectedValue = Convert.ToString(ds.Tables[0].Select("IsBasedLanguage = 1")[0]["ID"]);
            ddlBaseLanguage.Enabled = false;




            strQuerry += $"Where IsBasedLanguage <> 1";
            DataSet ds2 = SqlHelper.ExecuteDataset(strConnection, CommandType.Text, strQuerry);
            ddlTranslateTo.DataSource = ds2.Tables[0];
            ddlTranslateTo.DataTextField = "LanguageName";
            ddlTranslateTo.DataValueField = "ID";
            ddlTranslateTo.DataBind();
            ddlTranslateTo.Items.Insert(0, new ListItem("Select", "0"));
            ddlTranslateTo.SelectedValue = "0";

        }

        protected void ddlTranslateTo_TextChanged(object sender, EventArgs e)
        {
            try
            {
                string strQuerry = string.Empty;
                txtTQusestion.Text = string.Empty;
                txtTAnswerA.Text = string.Empty;
                txtTAnswerB.Text = string.Empty;
                txtTAnswerC.Text = string.Empty;
                txtTAnswerD.Text = string.Empty;
                strQuerry = $"Select * from TranslatedQuestions where TestMasterID = {ViewState["TranslateID"]} And LanguageID = {ddlTranslateTo.SelectedValue} ";
                DataSet ds = SqlHelper.ExecuteDataset(strConnection, CommandType.Text, strQuerry);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    txtTQusestion.Text = Convert.ToString(ds.Tables[0].Rows[0]["Question"]);
                    txtTAnswerA.Text = Convert.ToString(ds.Tables[0].Rows[0]["AnswerA"]);
                    txtTAnswerB.Text = Convert.ToString(ds.Tables[0].Rows[0]["AnswerB"]);
                    txtTAnswerC.Text = Convert.ToString(ds.Tables[0].Rows[0]["AnswerC"]);
                    txtTAnswerD.Text = Convert.ToString(ds.Tables[0].Rows[0]["AnswerD"]);
                }
            }
            catch (Exception ee)
            {
                lblError.Text = ee.Message;
            }
        }
    }
}