using System;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using Microsoft.ApplicationBlocks.Data;
using System.Web.UI;

namespace KnowledgeTest
{
    public partial class testmasterlist : System.Web.UI.Page
    {
        string strConnection = ConfigurationManager.AppSettings["sqlConnection"];
        protected void Page_Load(object sender, EventArgs e)
        {
            //these two line is used to control the class active in the tags.
            var testmaster = (HtmlGenericControl)Master.FindControl("liTestMaster");
            testmaster.Attributes["class"] = "nav-item active";
            //end of the active class control
            if (!IsPostBack)
            {
                FillData();
            }
        }
        private void FillData()
        {
            string strSearchText = txtSearch.Text.Trim();
            string strQuerry = string.Empty;
            string x = string.Empty;
            if (ddlStatus.SelectedValue != "0")
            {
                x = $"(Status = '{ddlStatus.SelectedValue}') And ";
            }

            strQuerry = $"SELECT tm.ID, tt.[TestType] , " +
                $"[Question],[QuestionImage],[AnswerA],[AnswerB],[AnswerC],[AnswerD],[CorrectAnswer]," +
            $"Case When tm.Status = 1 Then 'Active' Else 'Deactivated' End Status," +
            $"Format(tm.CreatedOn, 'MMM dd yyyy') CreatedOn " +
            $"FROM [TestMaster] tm " +
            $"inner join TestTypes tt On tt.ID = tm.TestTypeID " +
            $"inner join TranslatedQuestions tq on tq.TestMasterID = tm.ID And tq.LanguageID = (SELECT ID From Languages where IsBasedLanguage = 1) " +
            $"Where {x} ([TestType] like '%{strSearchText}%' or [Question] like " +
            $"'%{strSearchText}%' or [AnswerA] Like '%{strSearchText}%' or [AnswerB] like '%{strSearchText}%' or [AnswerC] Like '%{strSearchText}%'" +
            $" or [AnswerD] like '%{strSearchText}%')";
            //$"inner join Language l on l.ID = tm.Lan" +
             DataSet ds = SqlHelper.ExecuteDataset(strConnection, CommandType.Text, strQuerry);
            gvData.DataSource = ds;

            gvData.DataBind();
        }

        protected void Edit_Click(object sender, EventArgs e)
        {
            LinkButton objLinkButton = (LinkButton)sender;
            string strID = objLinkButton.CommandArgument;
            Session["editTestMasterID"] = strID;
            Response.Redirect("edittestmaster.aspx");

        }

        protected void Delete_Click(object sender, EventArgs e)
        {
            LinkButton objLinkaButton = (LinkButton)sender;
            string strID = objLinkaButton.CommandArgument;
            string strQuerry = $"Update [TestMaster] set status = Case When Status = 0 Then 1 Else 0 End Where ID = { strID}";
            int result = SqlHelper.ExecuteNonQuery(strConnection, CommandType.Text, strQuerry);
            if (result > -1)
            {
                lblresult.Text = "Status has been changed successfully";
                FillData();
            }
        }

        protected void likButton_Click(object sender, EventArgs e)
        {
            FillData();
        }

        protected void lnkTranslate_Click(object sender, EventArgs e)
        {
            LinkButton objLinkButton = (LinkButton)sender;
            string strID = objLinkButton.CommandArgument;
            Session["TranslateID"] = strID;
            Response.Redirect("translate.aspx");
        }

        protected void gvData_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if(e.Row.RowType == DataControlRowType.DataRow)
            {
               
                //CheckBoxList checkBoxList = (CheckBoxList)e.Row.FindControl("CheckBoxList1");
                int ID = (int)DataBinder.Eval(e.Row.DataItem, "ID");
                string strQuerry = $"Select LanguageName From TranslatedQuestions tq " +
                    $"inner join Languages l On l.ID = tq.LanguageID " +
                    $"Where tq.TestMasterID = {ID} And l.isBasedLanguage <> 1";
                DataSet ds = SqlHelper.ExecuteDataset(strConnection, CommandType.Text, strQuerry);
                //checkBoxList.DataSource = ds;
                //checkBoxList.DataTextField = "LanguageName";
                //checkBoxList.DataBind();
                foreach(DataRow r in ds.Tables[0].Rows)
                {
                    //l = new Label();
                    //l.Text =(string)r["LanguageName"];
                    CheckBox input1 = new CheckBox();
                    //input1.Attributes.Add("class", "form-check-input");
                    input1.Text = (string)r["LanguageName"];
                    input1.ForeColor = System.Drawing.Color.MediumPurple;
                    input1.Checked = true;
                    input1.Enabled = false;
                    
                    //l.Controls.Add(input1);
                    e.Row.Cells[9].Controls.Add(input1);
                }
            }
        }
    }
}