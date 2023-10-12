<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="usertest.aspx.cs" Inherits="KnowledgeTest.usertest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main-content-wrap sidenav-open d-flex flex-column">
        <div class="breadcrumb">
            <h1>Start Test</h1>
        </div>

        <div class="separator-breadcrumb border-top"></div>

        <div class="row offset-2" id="testTypeBox" runat="server">
            <div class="col-md-8">
                <div class="card mb-4">
                    <div class="card-body">
                        <div class="col-md-12 form-group mb-3">
                            <label for="phone">Allocated Tests</label>
                            <asp:DropDownList ID="ddlAllocated" runat="server" CssClass="form-control">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator InitialValue="0" Display="Dynamic" ErrorMessage="Please select Your Prefered test" CssClass="text-danger font-weight-bold" ControlToValidate="ddlAllocated" runat="server" />
                        </div>
                        <%--<div class="col-md-12 form-group mb-3">
                            <label for="phone">Language</label>
                            <asp:DropDownList ID="ddlLanguage" runat="server" CssClass="form-control">
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator InitialValue="0" Display="Dynamic" ErrorMessage="Please select Language" CssClass="text-danger font-weight-bold" ControlToValidate="ddlLanguage" runat="server" />
                        </div>--%>
                        <%--<button class="btn btn-primary float-right">Submit</button>--%>
                        <asp:LinkButton ID="lnkSubmitTestType" CssClass="btn btn-primary ripple m-1 float-right" runat="server" OnClick="lnkSubmitTestType_Click">Submit</asp:LinkButton>
                        <asp:LinkButton CssClass="btn btn-dark  m-1 float-right " runat="server" CausesValidation="false" PostBackUrl="~/dashboard.aspx">Cancel</asp:LinkButton>
                        <asp:Label Text="" ID="lblSuccess" CssClass="alert-success" runat="server" />
                        <asp:Label Text="" ID="lblError" CssClass="alert-danger" runat="server" />
                    </div>
                </div>
            </div>
        </div>
        <div id="questionBox1" class="row offset-2" runat="server" visible="false">
            <div class="col-md-8">
                <div class="card mb-4">
                    <div id="questionBox2" class="card-body">
                        <div class="card-title mb-3">
                            <asp:Label Text="" ID="lblQuestion" runat="server" />
                            
                        </div>
                        <div class="row">
                            <div class="col-md-4 form-group mb-3 border">
                                
                                <asp:Image ID="imgQuestion" Width="200px" runat="server" />
                            </div>
                            <div class="col-md-8 form-group mb-6">
                                <asp:LinkButton ID="lnkAnswerA" CommandName="A" CssClass="form-control col-md-12 form-group mb-3" runat="server" OnClick="lnkAnswer_Click">A</asp:LinkButton>
                                <asp:LinkButton ID="lnkAnswerB" CommandName="B" CssClass="form-control col-md-12 form-group mb-3" runat="server" OnClick="lnkAnswer_Click">B</asp:LinkButton>
                                <asp:LinkButton ID="lnkAnswerC" CommandName="C" CssClass="form-control col-md-12 form-group mb-3" runat="server" OnClick="lnkAnswer_Click">C</asp:LinkButton>
                                <asp:LinkButton ID="lnkAnswerD" CommandName="D" CssClass="form-control col-md-12 form-group mb-3" runat="server" OnClick="lnkAnswer_Click">D</asp:LinkButton>
                            </div>
                        </div>
                        <asp:LinkButton ID="lnkNext" CssClass="btn btn-outline-primary ripple m-1 float-right" runat="server" OnClick="lnkNext_Click" Visible="false">NEXT</asp:LinkButton>

                    </div>
                </div>
            </div>
        </div>
        <div id="resultBox1" class="row offset-2" runat="server" visible="false">
            <div class="col-md-8">
                <div class="card mb-4">
                    <div id="resultBox2" class="card-body">
                        <div class="card-title mb-3">
                            <asp:Label Text="Result" CssClass="" ID="lblResult" runat="server" />
                        </div>
                       <div class="card-title mb-3">
                            <asp:Label  ID="lblCorrectAnswer" runat="server" /> / <asp:Label  ID="lblQuestionNumber" runat="server" />
                        </div>
                        <asp:Label ID="lblResult1" cssClass="alert alert-card alert-success" Text="" runat="server" />
                        <asp:Label ID="lblError1" cssClass="alert alert-card alert-danger" Text="" runat="server" />
                        <asp:LinkButton ID="lblFinish" CssClass="btn btn-primary ripple m-1 float-right" runat="server" OnClick="lblFinish_Click">Finish</asp:LinkButton>

                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
