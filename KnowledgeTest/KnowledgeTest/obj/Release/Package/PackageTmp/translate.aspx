<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="translate.aspx.cs" Inherits="KnowledgeTest.translate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main-content-wrap sidenav-open d-flex flex-column">
        <div class="breadcrumb">
            <h1>Translate</h1>
        </div>

        <div class="separator-breadcrumb border-top"></div>

        <div class="row">
            <div class="col-md-12">
                <div class="card mb-4">
                    <div class="card-body">
                        <div class="col-lg-12 col-md-12">
                            <div class="row">
                                <div class="col-lg-12 col-md-12">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <div class="row">
                                                <div class="col-sm-5">
                                                    <label class="float-right">Default Language</label>
                                                </div>
                                                <div class="col-sm-4 ">
                                                    <asp:DropDownList ID="ddlBaseLanguage" CssClass="form-control" runat="server">
                                                    </asp:DropDownList>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-sm-6">
                                            <div class="row">
                                                <div class="col-sm-5">
                                                    <label class="float-right">Translated To</label>
                                                </div>
                                                <div class="col-sm-4 ">
                                                    <asp:DropDownList ID="ddlTranslateTo" CssClass="form-control" AutoPostBack="true" OnTextChanged="ddlTranslateTo_TextChanged" runat="server">
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator InitialValue="0" Display="Dynamic" ErrorMessage="Please select the language" CssClass="text-danger font-weight-bold" ControlToValidate="ddlTranslateTo" runat="server" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-12">
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <label for="question">Question</label>
                                                <asp:TextBox ID="txtQuestion" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="col-sm-6 ">
                                                <label for="question">Translate the Question</label>
                                                <asp:TextBox ID="txtTQusestion" CssClass="form-control" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator Display="Dynamic" ErrorMessage="Please Translate the Question" CssClass="text-danger font-weight-bold" ControlToValidate="txtTQusestion" runat="server" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-12">
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <label for="question">AnswerA</label>
                                                <asp:TextBox ID="txtAnswerA" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="col-sm-6 ">
                                                <label for="question">Translate Answer A</label>
                                                <asp:TextBox ID="txtTAnswerA" CssClass="form-control" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator Display="Dynamic" ErrorMessage="Please Translate the Question" CssClass="text-danger font-weight-bold" ControlToValidate="txtTQusestion" runat="server" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-sm-12">
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <label for="question">Answer B</label>
                                                <asp:TextBox ID="txtAnswerB" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="col-sm-6 ">
                                                <label for="question">Translate Answer A</label>
                                                <asp:TextBox ID="txtTAnswerB" CssClass="form-control" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator Display="Dynamic" ErrorMessage="Please Translate the Question" CssClass="text-danger font-weight-bold" ControlToValidate="txtTAnswerB" runat="server" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-sm-12">
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <label for="question">Answer C</label>
                                                <asp:TextBox ID="txtAnswerC" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="col-sm-6 ">
                                                <label for="question">Translate Answer C</label>
                                                <asp:TextBox ID="txtTAnswerC" CssClass="form-control" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator Display="Dynamic" ErrorMessage="Please Translate the Question" CssClass="text-danger font-weight-bold" ControlToValidate="txtTAnswerC" runat="server" />
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-sm-12">
                                        <div class="row">
                                            <div class="col-sm-6">
                                                <label for="question">Answer D</label>
                                                <asp:TextBox ID="txtAnswerD" CssClass="form-control" runat="server"></asp:TextBox>
                                            </div>
                                            <div class="col-sm-6 ">
                                                <label for="question">Translate Answer D</label>
                                                <asp:TextBox ID="txtTAnswerD" CssClass="form-control" runat="server"></asp:TextBox>
                                                <asp:RequiredFieldValidator Display="Dynamic" ErrorMessage="Please Translate the Question" CssClass="text-danger font-weight-bold" ControlToValidate="txtTAnswerD" runat="server" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <asp:LinkButton ID="lnkSubmit" CssClass="btn btn-primary ripple m-1 float-right" runat="server" OnClick="lnkSubmit_Click">Submit</asp:LinkButton>
                            <asp:LinkButton CssClass="btn btn-dark  m-1 float-right " runat="server" CausesValidation="false" PostBackUrl="~/testmasterlist.aspx">Cancel</asp:LinkButton>
                            <asp:Label Text="" CssClass="alert-success" runat="server" ID="lblresult" />
                            <asp:Label Text="" CssClass="alert-danger" runat="server" ID="lblError" />
                        </div>
                    </div>
                </div>
            </div>


        </div>
    </div>
</asp:Content>
