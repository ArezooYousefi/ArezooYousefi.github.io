<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="userlist.aspx.cs" Inherits="KnowledgeTest.userlist" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main-content-wrap sidenav-open d-flex flex-column">
        <div class="breadcrumb">
            <h1>User List</h1>

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
                                        <asp:ListItem selected="True" Text="All" Value="2" />
                                        <asp:ListItem Text="Active" Value="1"/>
                                        <asp:ListItem Text="Deleted" value="0"/>
                                    </asp:DropDownList>
                                </div>
                                <div class="col-sm-2">
                                    <asp:LinkButton ID="likButton" CssClass="btn btn-primary" runat="server" OnClick="likButton_Click">Search</asp:LinkButton>
                                </div>
                                <div class="col-sm-6">
                                    <asp:LinkButton ID="likAddUser" CssClass="btn btn-success float-right m-1" runat="server" PostBackUrl="~/addUser.aspx">Add user</asp:LinkButton>
                                </div>
                            </div>
                            <div class="table-responsive">
                                <asp:Label Text="" CssClass="alert-success" runat="server" ID="lblresult" />
                                <asp:GridView AutoGenerateColumns="false" runat="server" ID="gvData" CssClass="table table-striped table-bordered">
                                    <Columns>
                                        <asp:BoundField HeaderText="ID" DataField="ID" />
                                        <asp:TemplateField HeaderText="User Picture">
                                            <ItemTemplate>
                                                <asp:Image Width="50px" ImageUrl='<%# String.Format("~/Files/UserPicture/{0:C}", Eval("UserPicture") ) %>' runat="server" ID="imgUserPicture" />
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:BoundField HeaderText="First Name" DataField="FirstName" />
                                        <asp:BoundField HeaderText="Last Name" DataField="LastName" />
                                        <asp:BoundField HeaderText="Email Address" DataField="EmailAddress" />
                                        <asp:BoundField HeaderText="Phone Number" DataField="Phone" />
                                        <asp:BoundField HeaderText="User Type" DataField="UserType" />
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
        <!-- end of col-->
        <!-- end of row-->
        <%--<script>
            function confirmDelete() {
                return confirm("You are going to delete a user!!");
            }
        </script>--%>
    </div>


</asp:Content>
