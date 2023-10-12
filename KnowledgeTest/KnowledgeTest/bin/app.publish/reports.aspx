<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="reports.aspx.cs" Inherits="KnowledgeTest.reports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main-content-wrap sidenav-open d-flex flex-column">
        <div class="breadcrumb">
            <h1>Reports</h1>
        </div>

        <div class="separator-breadcrumb border-top"></div>

       <div class="row mb-4">
            <div class="col-md-12 mb-3">
                <div class="card text-left">

                    <div class="card-body">

                        <div>
                            <div class="row">
                                <div class="col-sm-2">
                                    <asp:TextBox ID="txtSearch" CssClass="form-control" Placeholder="Search" runat="server"></asp:TextBox>
                                </div>
                                <div class="col-sm-2">
                                    <asp:DropDownList ID="ddlStatus" CssClass="form-control" runat="server">
                                        <asp:ListItem selected="True" Text="All" Value="0" />
                                        <asp:ListItem Text="Failed" Value="3"/>
                                        <asp:ListItem Text="Passed" value="2"/>
                                    </asp:DropDownList>
                                </div>
                                <div class="col-sm-2">
                                    <asp:LinkButton ID="likButton" CssClass="btn btn-primary" runat="server" OnClick="likButton_Click">Search</asp:LinkButton>
                                </div>
                            </div>
                            <br/><br/>
                            <div class="table-responsive">
                                <asp:Label Text="" CssClass="alert-success" runat="server" ID="lblresult" />
                                <asp:GridView AutoGenerateColumns="false" runat="server" ID="gvData" CssClass="table table-striped table-bordered">
                                    <Columns>
                                        <asp:BoundField HeaderText="Name" DataField="Name" />
                                        <asp:BoundField HeaderText="Test Type" DataField="TestType" />
                                        <asp:BoundField HeaderText="Language" DataField="LanguageName" />
                                        <asp:BoundField HeaderText="Total Questions" DataField="NumberOfQuestions" />
                                        <asp:BoundField HeaderText="Correct Answer" DataField="NumberOfCorrectAnswer" />
                                        <asp:BoundField HeaderText="Status" DataField="Status" />
                                        <asp:BoundField HeaderText="Test Time" DataField="StartTime" />
                                        
                                    </Columns>
                                </asp:GridView>

                            </div>
                            
                        </div>
                    </div>


                </div> 
            </div>
        </div>
    </div>
</asp:Content>
