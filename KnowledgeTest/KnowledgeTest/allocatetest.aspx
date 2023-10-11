<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="allocatetest.aspx.cs" Inherits="KnowledgeTest.allocatetest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 170px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main-content-wrap sidenav-open d-flex flex-column">
        <div class="breadcrumb">
            <h1>Allocate Test Type</h1>
        </div>
        <div class="separator-breadcrumb border-top"></div>

        <div class="row">
            <div class="col-md-12">
                <div class="card mb-4">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-4 form-group mb-3">
                                <label for="picker1">User</label>
                                <asp:DropDownList runat="server" ID="ddlUser" CssClass="form-control" >
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator InitialValue="0" Display="Dynamic" ErrorMessage="Please select the User" CssClass="text-danger font-weight-bold" ControlToValidate="ddlUser" runat="server" />
                            </div>
                            <div class="col-md-4 form-group mb-3">
                                <label for="picker1">Test Type</label>
                                <asp:DropDownList runat="server" ID="ddlTestType" CssClass="form-control">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator InitialValue="0" Display="Dynamic" ErrorMessage="Please select the type of the test" CssClass="text-danger font-weight-bold" ControlToValidate="ddlTestType" runat="server" />
                            </div>
                            <div class="col-md-4 form-group mb-3">
                                <label for="picker1">Language</label>
                                <asp:DropDownList runat="server" ID="ddlLanguage" CssClass="form-control" >
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator InitialValue="0" Display="Dynamic" ErrorMessage="Please select the language" CssClass="text-danger font-weight-bold" ControlToValidate="ddlLanguage" runat="server" />
                            </div>
                            <div class="col-md-12">
                                <asp:Label Text="text" ID="lblError" CssClass="alert-danger" runat="server" />
                                <asp:Label Text="text" ID="lblSuccess" CssClass="alert-success" runat="server" />
                                <asp:LinkButton  ID="lnkSubmit" CssClass="btn btn-primary ripple m-1 float-right" OnClick="lnkSubmit_Click" runat="server" Text="Submit"/>
                                <asp:LinkButton  ID="lnkUpdate" Visible ="false" CssClass="btn btn-primary ripple m-1 float-right" OnClick="lnkUpdate_Click" runat="server" Text="Update"/>
                                <asp:LinkButton  ID="lnkCancel" CssClass="btn btn-dark ripple m-1 float-right" OnClick="lnkCancel_Click" CausesValidation="false" runat="server" Text="Cancel"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="card mb-4">
                    <div class="card-body">
                        <div class="row">
                            <div class="table-responsive">
                                <asp:Label Text="" CssClass="alert-success" runat="server" ID="lblresult" />
                                <asp:GridView AutoGenerateColumns="false" runat="server" ID="gvData" CssClass="table table-striped table-bordered">
                                    <Columns>
                                        <asp:BoundField HeaderText="ID" DataField="ID" />
                                        <asp:BoundField HeaderText="Name" DataField="Name" />
                                        <asp:BoundField HeaderText="Test Type" DataField="TestType" />
                                        <asp:BoundField HeaderText="Language" DataField="LanguageName" />
                                        <asp:BoundField HeaderText="Created On" DataField="CreatedOn" />
                                        <asp:BoundField HeaderText="Start Time" DataField="StartTime" />
                                        <asp:BoundField HeaderText="Status" DataField="Status" />
                                        <%--<asp:TemplateField HeaderText="Status">
                                            <ItemTemplate>
                                                <asp:LinkButton CausesValidation="false" CommandArgument='<%#Eval("ID")%>' Text='<%#Eval("Status")%>' CssClass="text-danger mr-2" runat="server" OnClick="likDelete_Click" ID="likDelete">
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>--%>
                                        <asp:TemplateField HeaderText="Action">
                                            <ItemTemplate>
                                                <asp:LinkButton Text="Action" CausesValidation="false" CommandArgument='<%#Eval("ID")%>' CssClass="text-success mr-2" runat="server" OnClick="likEdit_Click" ID="likEdit" Enabled ='<%#(string)Eval("Status") == "Not Started"%>'>
                                                    <i class="nav-icon i-Pen-2 font-weight-bold"></i>
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
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
