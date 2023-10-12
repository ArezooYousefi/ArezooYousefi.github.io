<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="edittestmaster.aspx.cs" Inherits="KnowledgeTest.edittestmaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main-content-wrap sidenav-open d-flex flex-column">
        <div class="breadcrumb">
            <h1>Edit Test Master</h1>
        </div>

        <div class="separator-breadcrumb border-top"></div>

        <div class="row">
            <div class="col-md-12">
                <div class="card mb-4">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6 form-group mb-3">
                                <label for="picker1">Test Type</label>
                                <asp:DropDownList runat="server" ID="ddlTestType" CssClass="form-control" AutoPostBack="true" OnTextChanged="ddlTestType_TextChanged">
                                    
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator InitialValue="0" Display="Dynamic" ErrorMessage="Please select the type of test" CssClass="text-danger font-weight-bold" ControlToValidate="ddlTestType" runat="server" />
                            </div>
                            <div class="col-md-6 form-group mb-3">
                                <label for="picker1">Language</label>
                                <asp:DropDownList runat="server" ID="ddlLanguage" CssClass="form-control">
                                    
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator InitialValue="0" Display="Dynamic" ErrorMessage="Please select the language" CssClass="text-danger font-weight-bold" ControlToValidate="ddlLanguage" runat="server" />

                            </div>
                            <div class="col-md-6 form-group mb-3">
                                <label for="lastName1">Question</label>
                                <asp:TextBox ID="txtQuestion" CssClass="form-control" placeholder="Enter your Question" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator Display="Dynamic" ErrorMessage="Please enter a question" CssClass="text-danger font-weight-bold" ControlToValidate="txtQuestion" runat="server" />
                            </div>
                            <div class="col-md-6 form-group mb-3">
                                <label for="picker1">Question Image</label>
                                <asp:FileUpload runat="server" ID="fuQuestionImage" CssClass="form-control" />
                                <%--<asp:RequiredFieldValidator InitialValue="0" Display="Dynamic" ErrorMessage="Please upload picture" CssClass="text-danger font-weight-bold" ControlToValidate="fuQuestionImage" runat="server" />--%>

                            </div>
                            <div class="col-md-6 form-group mb-3">
                                <label for="AnswerA">Answer (A)</label>
                                <asp:TextBox ID="txtAnswerA" CssClass="form-control" placeholder="Enter Answer (A)" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator Display="Dynamic" ErrorMessage="Enter Answer (A)" CssClass="text-danger font-weight-bold" ControlToValidate="txtAnswerA" runat="server" />
                            </div>
                            <div class="col-md-6 form-group mb-3">
                                <label for="lastName1">Answer (B)</label>
                                <asp:TextBox ID="txtAnswerB" CssClass="form-control" placeholder="Enter Answer (B)" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator Display="Dynamic" ErrorMessage="Enter Answer (B)" CssClass="text-danger font-weight-bold" ControlToValidate="txtAnswerB" runat="server" />
                            </div>
                            <div class="col-md-6 form-group mb-3">
                                <label for="lastName1">Answer (C)</label>
                                <asp:TextBox ID="txtAnswerC" CssClass="form-control" placeholder="Enter Answer (C)" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator Display="Dynamic" ErrorMessage="Enter Answer (C)" CssClass="text-danger font-weight-bold" ControlToValidate="txtAnswerC" runat="server" />
                            </div>
                            <div class="col-md-6 form-group mb-3">
                                <label for="lastName1">Answer (D)</label>
                                <asp:TextBox ID="txtAnswerD" CssClass="form-control" placeholder="Enter Answer (D)" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator Display="Dynamic" ErrorMessage="Enter Answer (D)" CssClass="text-danger font-weight-bold" ControlToValidate="txtAnswerD" runat="server" />
                            </div>


                            <div class="col-md-6 form-group mb-3">
                                <label for="picker1">Correct Answer</label>
                                <asp:DropDownList runat="server" ID="ddlCorrectAnswer" CssClass="form-control">
                                    <asp:ListItem Text="Select" Value="0" />
                                    <asp:ListItem Text="A" Value="A" />
                                    <asp:ListItem Text="B" Value="B" />
                                    <asp:ListItem Text="C" Value="C" />
                                    <asp:ListItem Text="D" Value="D" />
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator InitialValue="0" Display="Dynamic" ErrorMessage="Please select the answer" CssClass="text-danger font-weight-bold" ControlToValidate="ddlCorrectAnswer" runat="server" />
                            </div>
                            <div class="col-md-6 form-group mb-3">
                                <label for="picker1">Question Image</label>
                                <asp:Image width="100px" alt="Question Image" id="imgQuestion" runat="server" />
                                <br />
                                

                            </div>
                           <div class="col-md-12">

                                <%--<button class="btn btn-primary">Submit</button>--%>
                                <asp:LinkButton ID="lnkSubmit" CssClass="btn btn-primary ripple m-1 float-right" OnClick="lnkSubmit_Click" runat="server">Submit</asp:LinkButton>
                                <asp:LinkButton ID="lnkCancel" CssClass="btn btn-dark  m-1 float-right " runat="server" CausesValidation="false" PostBackUrl="~/testmasterlist.aspx" >Cancel</asp:LinkButton>
                                <asp:Label Text="" CssClass="alert-success" runat="server" ID="lblresult"/>
                                <asp:Label Text="" CssClass="alert-danger" runat="server" ID="lblError"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
