<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="addUser.aspx.cs" Inherits="KnowledgeTest.addUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main-content-wrap sidenav-open d-flex flex-column">
        <div class="breadcrumb">
            <h1>Add User</h1>
        </div>

        <div class="separator-breadcrumb border-top"></div>

        <div class="row">
            <div class="col-md-12">
                <div class="card mb-4">
                    <div class="card-body">
                        

                        <div class="row">
                            <div class="col-md-6 form-group mb-3">
                                <label for="firstName1">First name</label>
                                <asp:TextBox ID="txtFirstName" CssClass="form-control" placeholder="Enter your First name" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator Display="Dynamic" ErrorMessage="Please enter your first name" CssClass="text-danger font-weight-bold" ControlToValidate="txtFirstName" runat="server" />
                            </div>

                            <div class="col-md-6 form-group mb-3">
                                <label for="lastName1">Last name</label>
                                <asp:TextBox ID="txtLastName" CssClass="form-control" placeholder="Enter your Last name" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator Display="Dynamic" ErrorMessage="Please enter your last name" CssClass="text-danger font-weight-bold" ControlToValidate="txtLastName" runat="server" />
                            </div>

                            <div class="col-md-6 form-group mb-3">
                                <label for="exampleInputEmail1">Email address</label>
                                <asp:TextBox ID="txtEmail" CssClass="form-control" placeholder="Enter your First name" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator Display="Dynamic" ErrorMessage="Please enter your Email address" CssClass="text-danger font-weight-bold" ControlToValidate="txtEmail" runat="server" />
                            </div>

                            <div class="col-md-6 form-group mb-3">
                                <label for="phone">Password</label>
                                <asp:TextBox ID="txtpassword" TextMode="Password" CssClass="form-control" placeholder="Enter your Password" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator Display="Dynamic" ErrorMessage="Please enter your password" CssClass="text-danger font-weight-bold" ControlToValidate="txtpassword" runat="server" />
                            </div>

                            <div class="col-md-6 form-group mb-3">
                                <label for="credit1">Phone Number</label>
                                <asp:TextBox ID="txtPhone" CssClass="form-control" placeholder="Enter your Phone number" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator Display="Dynamic" ErrorMessage="Please enter your phone number" CssClass="text-danger font-weight-bold" ControlToValidate="txtPhone" runat="server" />
                            </div>



                            <div class="col-md-6 form-group mb-3">
                                <label for="picker1">User Type</label>
                                <asp:DropDownList runat="server" ID="ddlUserType" CssClass="form-control">
                                    <asp:ListItem Text="Select" Value="0" />
                                    <asp:ListItem Text="Admin" Value="Admin" />
                                    <asp:ListItem Text="Normal User" Value="Normal User" />
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator InitialValue="0" Display="Dynamic" ErrorMessage="Please select the type of user" CssClass="text-danger font-weight-bold" ControlToValidate="ddlUserType" runat="server" />

                            </div>
                            <div class="col-md-6 form-group mb-3">
                                <label for="picker1">User Picture</label>
                                <asp:FileUpload runat="server" ID="fuUserPicture" CssClass="form-control" />
                                <asp:RequiredFieldValidator InitialValue="0" Display="Dynamic" ErrorMessage="Please upload picture" CssClass="text-danger font-weight-bold" ControlToValidate="fuUserPicture" runat="server" />
                                <asp:RequiredFieldValidator InitialValue="0" Display="Dynamic" ErrorMessage="Please upload picture" CssClass="text-danger font-weight-bold" ControlToValidate="fuUserPicture" runat="server" />

                            </div>
                           

                            <div class="col-md-12">
                                
                                <%--<button class="btn btn-primary">Submit</button>--%>
                            
                                
                                <%--<button class="btn btn-primary float-right">Submit</button>--%>
                                <asp:LinkButton CssClass="btn btn-primary ripple m-1 float-right" runat="server" OnClick="liSubmit_Click">Submit</asp:LinkButton>
                                <asp:LinkButton CssClass="btn btn-dark  m-1 float-right " runat="server" CausesValidation="false" PostBackUrl="~/userlist.aspx">Cancel</asp:LinkButton>
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
