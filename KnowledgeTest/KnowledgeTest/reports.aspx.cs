using Microsoft.ApplicationBlocks.Data;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace KnowledgeTest
{
    public partial class reports : System.Web.UI.Page
    {
        string strConnection = ConfigurationManager.AppSettings["sqlConnection"];
        protected void Page_Load(object sender, EventArgs e)
        {
            var reports = (HtmlGenericControl)Master.FindControl("liReports");
            reports.Attributes["class"] = "nav-item active";
            if (!IsPostBack)
            {
                FillData();
            }
        }

        protected void likButton_Click(object sender, EventArgs e)
        {
            FillData();
        }
        private void FillData()
        {
            try
            {
                string strSearchText = txtSearch.Text.Trim();
                string strQuerry = string.Empty;
                string x = string.Empty;
                if (ddlStatus.SelectedValue != "0")
                {
                    x = $"(alt.Status = {ddlStatus.SelectedValue}) And ";
                }
                strQuerry = $"SELECT (Select Count(*) from AllocatedTestQuestions where AllocatedTestID = alt.ID And isCorrect=1) NumberOfCorrectAnswer, " +
                    $"Case When alt.Status = 2 Then 'Passed' When alt.Status = 3 Then 'Failed' Else 'inprogress' End Status, Format(alt.StartTime, 'MMM dd yyyy') StartTime, (us.FirstName+ ' '+ us.LastName) Name, tt.TestType, tt.NumberOfQuestions, l.LanguageName " +
                    $"from AllocatedTests alt " +
                    $"inner join Users us on us.ID = alt.UserID " +
                    $"inner join TestTypes tt on tt.ID = alt.TestTypeID " +
                    $"inner join Languages l on l.ID = alt.LanguageID " +
                    $"Where alt.Status in(2 , 3) And "+
                    $"{x} (us.FirstName like '%{strSearchText}%' or us.LastName like '%{strSearchText}%' or [TestType] like '%{strSearchText}%'or [LanguageName] Like '%{strSearchText}%')";
                
                DataSet ds = SqlHelper.ExecuteDataset(strConnection, CommandType.Text, strQuerry);
                gvData.DataSource = ds;

                gvData.DataBind();
            }
            catch(Exception ee) { 
            
            }
        }

    }
}