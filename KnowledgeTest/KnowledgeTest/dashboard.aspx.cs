using Microsoft.ApplicationBlocks.Data;
using System;
using System.Configuration;
using System.Data;
using System.Web.UI;
using System.Web.UI.HtmlControls;


namespace KnowledgeTest
{
    public partial class dashboard : System.Web.UI.Page
    {
        string strConnection = ConfigurationManager.AppSettings["sqlConnection"];
        protected void Page_Load(object sender, EventArgs e)
        {
            var dashboard = (HtmlGenericControl)Master.FindControl("liDashboard");
            dashboard.Attributes["class"] = "nav-item active";
            string strQuerry = "GetData";
            string strFileName = string.Empty;
            DataSet ds = SqlHelper.ExecuteDataset(strConnection, CommandType.StoredProcedure, strQuerry);
            lblTotalStudents.Text = Convert.ToString(ds.Tables[0].Rows[0]["NumberOfStudets"]);
            lblNewStudents.Text = Convert.ToString(ds.Tables[1].Rows[0]["NumberOfNewStudens"]);
            lblTestType.Text = Convert.ToString(ds.Tables[2].Rows[0]["NumberOfTestType"]);
            lblTotalAttempt.Text = Convert.ToString(ds.Tables[3].Rows[0]["TotalAttempt"]);
            lblPassedAttempt.Text = Convert.ToString(ds.Tables[4].Rows[0]["PassedAttempt"]);
            lblFailedAttempt.Text = Convert.ToString(ds.Tables[5].Rows[0]["FailedAttempt"]);
            string strTestTypeChartData = "";
            foreach (DataRow item in ds.Tables[6].Rows)
            {
                strTestTypeChartData += $", {{value:{item["testLanguage"]} ,name: '{item["Test Type-Language"]}'}}";
            }
            if (!string.IsNullOrEmpty(strTestTypeChartData))
            {
                strTestTypeChartData =
                    $"[{strTestTypeChartData.Remove(0, 1)}]";
            }
            Page.RegisterStartupScript("FillChart", $"<script>testTypeChartData = {strTestTypeChartData}</script>");
            int scriptNo = 1;
            foreach (DataRow item in ds.Tables[7].Rows)
            {
                if ((int)item["Status"] == 2)
                {
                    string strPassChartBar = $"<script>passChartBar[{(int)item["Month"]}-1] = {(int)item["cnt"]}</script>";
                    Page.RegisterStartupScript($"FillChart{scriptNo++}", strPassChartBar);
                }
                else
                {
                    Page.RegisterStartupScript($"FillChart{scriptNo++}", $"<script>failChartBar[{(int)item["Month"]}-1] = {(int)item["cnt"]}</script>");
                }
            }
            foreach(DataRow item in ds.Tables[8].Rows)
            {
                string strWeekdayTests = $"<script>weekdayTests[{(int)item["weekDay"]}] = {(int)item["cnt"]}</script>";
                Page.RegisterStartupScript($"FillChart{scriptNo++}", strWeekdayTests);
            }
        }

    }
}