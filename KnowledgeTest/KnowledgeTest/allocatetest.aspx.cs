using Microsoft.ApplicationBlocks.Data;
using System;
using System.Configuration;
using System.Data;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace KnowledgeTest
{
    public partial class allocatetest : System.Web.UI.Page
    {
        string strConnection = ConfigurationManager.AppSettings["sqlConnection"];
        protected void Page_Load(object sender, EventArgs e)
        {
            var allocatetest = (HtmlGenericControl)Master.FindControl("liAllocateTest");
            allocatetest.Attributes["class"] = "nav-item active";

            lblSuccess.Text = string.Empty;
            lblError.Text = string.Empty;
            
            if (!IsPostBack)
            {
                FillDropDownField();
                FillData();
            }
        }

        private void FillData()
        {
            try
            {
                string strQuerry = string.Empty;
                string strFileName = string.Empty;
                strQuerry = $"Select at.ID, u.FirstName + ' ' +u.LastName Name, tt.TestType, l.LanguageName," +
                    $" Case When at.Status = 0 Then 'Not Started' When at.Status = 1 Then 'In Progress' When at.Status = 2 Then 'Passed' When at.Status = 3 Then 'Failed' Else 'Deactivated' End Status," +
                    $"Format(at.CreatedOn, 'MMM dd yyyy') CreatedOn, Format(at.StartTime, 'MMM dd yyyy hh:mm') StartTime" +
                    $" " +
                    $" FROM [AllocatedTests] at" +
                    $" inner join Users u on u.ID = at.UserID" +
                    $" inner join TestTypes tt on tt.ID = at.TestTypeID " +
                    $"inner join Languages l On L.ID = at.LanguageID Order By at.ID Desc";
                DataSet ds = SqlHelper.ExecuteDataset(strConnection, CommandType.Text, strQuerry);
                gvData.DataSource = ds.Tables[0];
                gvData.DataBind();
            }
            catch (Exception ee)
            {
                lblError.Text = ee.Message;
            }
        }
        private void FillDropDownField()
        {
            try
            {
                string strQuerry = string.Empty;
                string strFileName = string.Empty;
                strQuerry = $"Select ID, FirstName+' '+LastName as Name from Users where Status = 1 Order By FirstName;" +
                    $" Select ID, TestType From TestTypes Order by TestType;" +
                    $" Select ID, LanguageName from Languages order by LanguageName ";
                DataSet ds = SqlHelper.ExecuteDataset(strConnection, CommandType.Text, strQuerry);
                ddlUser.DataTextField = "Name";
                ddlUser.DataValueField = "ID";
                ddlUser.DataSource = ds.Tables[0];
                ddlUser.DataBind();
                ddlUser.Items.Insert(0, new ListItem("Select", "0"));

                ddlTestType.DataTextField = "TestType";
                ddlTestType.DataValueField = "ID";
                ddlTestType.DataSource = ds.Tables[1];
                ddlTestType.DataBind();
                ddlTestType.Items.Insert(0, new ListItem("Select", "0"));

                ddlLanguage.DataTextField = "LanguageName";
                ddlLanguage.DataValueField = "ID";
                ddlLanguage.DataSource = ds.Tables[2];
                ddlLanguage.DataBind();
                ddlLanguage.Items.Insert(0, new ListItem("Select", "0"));
            }
            catch (Exception ee)
            {
 
            }
        }


        protected void lnkSubmit_Click(object sender, EventArgs e)
        {
            string strQuerry = string.Empty;
            string strFileName = string.Empty;
            //string strConnection = ConfigurationManager.AppSettings["sqlConnection"];
            strQuerry = $"Select ID from AllocatedTests " +
                $"Where (UserID = {ddlUser.SelectedValue} And TestTypeId = {ddlTestType.SelectedValue} And (Status = 0 OR Status = 1))";
            DataSet ds = SqlHelper.ExecuteDataset(strConnection, CommandType.Text, strQuerry);
            if (ds.Tables[0].Rows.Count > 0)
            {
                lblError.Text = "Test Type already allocated to this User";
            }
            else
            {
                strQuerry = $"SELECT NumberOfQuestions " +
                    $"From TestTypes " +
                    $"Where ID = {ddlTestType.SelectedValue}";
                int numberOfQuestions = (int)SqlHelper.ExecuteScalar(strConnection, CommandType.Text, strQuerry);
                strQuerry = $"Insert into AllocatedTests (UserID, TestTypeID, LanguageID, Status) values ({ddlUser.SelectedValue}, {ddlTestType.SelectedValue}, {ddlLanguage.SelectedValue}, 0);";
                strQuerry += $"INSERT INTO AllocatedTestQuestions (AllocatedTestID, TestMasterID) " +
                    $"Select Top {numberOfQuestions} Scope_Identity(), tm.ID " +
                    $"From TestMaster tm " +
                    $"Inner Join TranslatedQuestions tq On tq.TestMasterID = tm.ID And tq.LanguageID = {ddlLanguage.SelectedValue} " +
                    $"Where tm.TestTypeID = {ddlTestType.SelectedValue} " +
                    $"Order By NewID()";
                int result = SqlHelper.ExecuteNonQuery(strConnection, CommandType.Text, strQuerry);
                if (result > -1)
                {
                    lblSuccess.Text = "Data has been saved successfully";
                    FillData();
                    ddlTestType.SelectedValue = "0";
                    ddlLanguage.SelectedValue = "0";
                    ddlUser.SelectedValue = "0";
                }
                else
                {
                    lblError.Text = "Please try later";
                }
            }
        }
       
        protected void likEdit_Click(object sender, EventArgs e)
        {
            lblError.Text = string.Empty;
            lblresult.Text = string.Empty;
            LinkButton objLinkButton = (LinkButton)sender;
            string strID = objLinkButton.CommandArgument;
            string strQuerry = $"Select at.ID, at.UserID, at.TestTypeID, at.LanguageID, at.Status " +
                $"from AllocatedTests at " +
                $"Where at.ID = {strID}";
            DataSet ds = SqlHelper.ExecuteDataset(strConnection, CommandType.Text, strQuerry);
            ddlUser.SelectedValue = Convert.ToString(ds.Tables[0].Rows[0]["UserID"]);
            ddlTestType.SelectedValue = Convert.ToString(ds.Tables[0].Rows[0]["TestTypeID"]);
            ddlLanguage.SelectedValue = Convert.ToString(ds.Tables[0].Rows[0]["LanguageID"]);
            lnkSubmit.Visible = false;
            lnkUpdate.Visible = true;
            ViewState[ID] = strID;

        }

        protected void lnkUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                lblError.Text = string.Empty;
                lblresult.Text = string.Empty;
                string strQuerry = string.Empty;
                string strFileName = string.Empty;
                strQuerry = $"Select ID from AllocatedTests Where (UserID = {ddlUser.SelectedValue} And TestTypeID = {ddlTestType.SelectedValue} And ID <> {Convert.ToInt32(ViewState[ID])})";

                //strQuerry = $"Select at.ID, at.UserID, at.TestTypeID, tt.TestType " +
                //$"from AllocateTest at " +
                //$"inner join TestType tt on tt.ID=at.TestTypeID " +
                //$"Where at.ID <> {Convert.ToInt32(ViewState[ID])} And UserID={ddlUser.SelectedValue} AND tt.TestType='{ddlTestType.SelectedValue}'  And tt.Language = '{ddlLanguage.Text}'";
                DataSet ds = SqlHelper.ExecuteDataset(strConnection, CommandType.Text, strQuerry);
                if (ds.Tables[0].Rows.Count > 0)
                {
                    lblError.Text = "Test Type has been already allocated";

                }
                else
                {
                    strQuerry = $"Update AllocatedTests Set UserID = {ddlUser.SelectedValue}, TestTypeID = {ddlTestType.SelectedValue}, LanguageID = {ddlLanguage.SelectedValue}" +
                        $" Where ID = {Convert.ToInt32(ViewState[ID])}";
                    int result = SqlHelper.ExecuteNonQuery(strConnection, CommandType.Text, strQuerry);
                    if (result> -1)
                    {
                        lblSuccess.Text = "Data has updated successfully";
                        lnkSubmit.Visible = true;
                        lnkUpdate.Visible = false;
                        FillData();
                        ddlTestType.SelectedIndex = 0;
                        ddlUser.SelectedIndex = 0;
                        ddlLanguage.SelectedIndex = 0;
                    }
                }
            }
            catch (Exception ee)
            {
                lblError.Text = ee.Message;
            }

        }

        protected void lnkCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/allocatetest.aspx");
        }
    }
}