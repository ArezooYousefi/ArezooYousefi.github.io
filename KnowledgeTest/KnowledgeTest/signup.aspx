<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="KnowledgeTest.signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width,initial-scale=1"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>Knowledge Test-Sign in</title>
    <link href="https://fonts.googleapis.com/css?family=Nunito:300,400,400i,600,700,800,900" rel="stylesheet"/>
    <link rel="stylesheet" href="assets/styles/css/themes/lite-purple.min.css"/>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auth-layout-wrap" style="background-image: url(assets/images/drivers-license-7385051_1280.jpg)">
            <div class="auth-content">
                <div class="card o-hidden">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="p-4">

                                <h1 class="mb-3 text-18">Sign Up</h1>

                                <div class="form-group">
                                    <label for="email">First Name</label>
                                    <asp:TextBox ID="txtFirstName" placeholder="Please enter your First name" CssClass="form-control form-control-rounded" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator Display="Dynamic" ErrorMessage="Please enter your First name" CssClass="text-danger font-weight-bold" ControlToValidate="txtFirstName" runat="server" />
                                </div>
                                <div class="form-group">
                                    <label for="email">Last Name</label>
                                    <asp:TextBox ID="txtLastName" placeholder="Please enter your Last name" CssClass="form-control form-control-rounded" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator Display="Dynamic" ErrorMessage="Please enter your last name" CssClass="text-danger font-weight-bold" ControlToValidate="TxtLastName" runat="server" />
                                </div>
                                <div class="form-group">
                                    <label for="email">Phone Number</label>
                                    <asp:TextBox ID="txtPhoneNumber" placeholder="Please enter your phone number" CssClass="form-control form-control-rounded" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator Display="Dynamic" ErrorMessage="Please enter your Phone nymber" CssClass="text-danger font-weight-bold" ControlToValidate="txtPhoneNumber" runat="server" />
                                </div>
                                <div class="form-group">
                                    <label for="email">Email Address</label>
                                    <asp:TextBox ID="txtEmaiAddress" placeholder="Please enter your Email Address" CssClass="form-control form-control-rounded" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator Display="Dynamic" ErrorMessage="Please enter your email address" CssClass="text-danger font-weight-bold" ControlToValidate="txtEmaiAddress" runat="server" />
                                </div>
                                <div class="form-group">
                                    <label for="email">Password</label>
                                    <asp:TextBox ID="txtPassword" placeholder="Please enter your Password" textmode="Password" CssClass="form-control form-control-rounded" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator Display="Dynamic" ErrorMessage="Please enter your password" CssClass="text-danger font-weight-bold" ControlToValidate="TxtPassword" runat="server" />
                                </div>
                                <div class="form-group">
                                    <label for="email">Confirm Password</label>
                                    <asp:TextBox ID="txtConfirmPassword" placeholder="Please confirm your Password" CssClass="form-control form-control-rounded" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator Display="Dynamic" ErrorMessage="Please confirm your password" CssClass="text-danger font-weight-bold" ControlToValidate="txtConfirmPassword" runat="server" />
                                </div>
                                <div class="col-md-6 form-group mb-3">
                                <label for="picker1">Profile Picture</label>
                                <asp:FileUpload runat="server" ID="fuUserPicture" CssClass="form-control" />
                                <asp:RequiredFieldValidator InitialValue="0" Display="Dynamic" ErrorMessage="Please upload picture" CssClass="text-danger font-weight-bold" ControlToValidate="fuUserPicture" runat="server" />
                                <asp:RequiredFieldValidator InitialValue="0" Display="Dynamic" ErrorMessage="Please upload picture" CssClass="text-danger font-weight-bold" ControlToValidate="fuUserPicture" runat="server" />

                            </div>
                                <asp:LinkButton ID="lnkSubmit" cssclass="btn btn-rounded btn-primary btn-block mt-2" OnClick="lnkSubmit_Click" runat="server">Sign Up</asp:LinkButton>
                                <%--<button class="btn btn-rounded btn-primary btn-block mt-2">Sign Up</button>--%>
                                <asp:Label Text="" ID="lblSuccess" runat="server" />
                                <asp:Label Text="" ID="lblError" runat="server" />


                                <div class="mt-3 text-center">
                                    <a href="signin.aspx" class="text-muted"><u>Sign In</u></a>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>

        <script src="assets/js/vendor/jquery-3.3.1.min.js"></script>
        <script src="assets/js/vendor/bootstrap.bundle.min.js"></script>
        <script src="assets/js/es5/script.min.js"></script>
    </form>
</body>
</html>
