<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="testmasterlist.aspx.cs" Inherits="KnowledgeTest.testmasterlist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main-content-wrap sidenav-open d-flex flex-column">
        <div class="breadcrumb">
            <h1>Test Master List</h1>

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
                                        <asp:ListItem Text="Select" Value="0" />
                                        <asp:ListItem Text="Active" Value="1" />
                                        <asp:ListItem Text="Deactivated" Value="2" />
                                        <%--<asp:ListItem selected="True" Text="All" Value="5" />
                                        <asp:ListItem Text="Not Started" Value="0"/>
                                        <asp:ListItem Text="In Progress" value="1"/>
                                        <asp:ListItem Text="Passed" value="2"/>
                                        <asp:ListItem Text="Failed" value="3"/>
                                        <asp:ListItem Text="Deactivated" value="4"/>--%>
                                    </asp:DropDownList>
                                </div>
                                <div class="col-sm-2">
                                    <asp:LinkButton ID="likButton" CssClass="btn btn-primary" runat="server" OnClick="likButton_Click">Search</asp:LinkButton>
                                </div>
                                <div class="col-sm-6">
                                    <asp:LinkButton ID="likAddUser" CssClass="btn btn-success float-right m-1" runat="server" PostBackUrl="~/addtestmaster.aspx">Add Test Master</asp:LinkButton>
                                </div>
                            </div>
                            <div class="table-responsive">
                                <asp:Label Text="" CssClass="alert-success" runat="server" ID="lblresult" />
                                <asp:GridView AutoGenerateColumns="false" runat="server" ID="gvData" OnRowDataBound="gvData_RowDataBound" CssClass="table table-striped table-bordered">
                                    <Columns>
                                        <asp:BoundField HeaderText="ID" DataField="ID" />
                                        <asp:BoundField HeaderText="Test Type" DataField="TestType" />
                                        <asp:BoundField HeaderText="Question" DataField="Question" />
                                        <asp:TemplateField HeaderText="Question Image">
                                            <ItemTemplate>
                                                <asp:Image Width="50px" ImageUrl='<%# String.Format("~/Files/QuestionImage/{0:C}", Eval("QuestionImage") ) %>' runat="server" ID="imgUserPicture" />
                                            </ItemTemplate>
                                        </asp:TemplateField>


                                        <asp:BoundField HeaderText="Answer (A)" DataField="AnswerA" />
                                        <asp:BoundField HeaderText="Answer (B)" DataField="AnswerB" />
                                        <asp:BoundField HeaderText="Answer (C)" DataField="AnswerC" />
                                        <asp:BoundField HeaderText="Answer (D)" DataField="AnswerD" />
                                        <asp:BoundField HeaderText="Correct Answer" DataField="CorrectAnswer" />

                                        <asp:TemplateField HeaderText="Translated To">
                                            <ItemTemplate>
                                                <%--<asp:Label ID="" class="switch pr-5 switch-primary mr-3" runat="server">
                                                    <span id="CheckBoxList1"></span>
                                                    <input type="checkbox">
                                                    <span class="slider"></span>
                                                </asp:Label>--%>
                                                <%--<asp:CheckBoxList ID="CheckBoxList1" cssClass="slider" RepeatDirection="Horizontal" runat="server"></asp:CheckBoxList>   --%>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:BoundField HeaderText="Created On" DataField="CreatedOn" />
                                        <asp:TemplateField HeaderText="Status">
                                            <ItemTemplate>
                                                <asp:LinkButton CommandArgument='<%#Eval("ID")%>' Text='<%#Eval("Status")%>' CssClass="text-danger mr-2" runat="server" OnClick="Delete_Click" ID="likDelete">
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Action">
                                            <ItemTemplate>
                                                <asp:LinkButton Text="Action" CommandArgument='<%#Eval("ID")%>' CssClass="text-success mr-2" runat="server" OnClick="Edit_Click" ID="likEdit">
                                                    <i class="nav-icon i-Pen-2 font-weight-bold"></i>
                                                </asp:LinkButton>

                                                <asp:LinkButton Text="Action" CommandArgument='<%#Eval("ID")%>' CssClass="text-success mr-2" runat="server" OnClick="lnkTranslate_Click" ID="lnkTranslate">
                                                    <%--<i class="nav-icon  font-weight-bold"></i>--%>
                                                    <img class="nav-icon  font-weight-bold" width="20px" src="assets/images/translate.png" />
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

        <script>
            function confirmDelete() {
                confirm("You are going to delete a test Master!!")
            }
        </script>
</asp:Content>
