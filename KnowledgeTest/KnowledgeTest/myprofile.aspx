<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="myprofile.aspx.cs" Inherits="KnowledgeTest.myprofile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main-content-wrap sidenav-open d-flex flex-column">
        <div class="breadcrumb">
            <h1>My Profile</h1>

        </div>

        <div class="separator-breadcrumb border-top"></div>

        <div class="card user-profile o-hidden mb-4">
            <div class="header-cover" style="background-image: url('assets/images/drivers-licensesmall-7385051_1280.jpg')"></div>

            <div class="user-info">
                <asp:Image cssClass="profile-picture avatar-lg mb-2" ID="imgUserPicture" runat="server" />
                
                <p class="m-0 text-24"><asp:Label ID="lblUserName" runat="server" /></p>

            </div>
            <div class="card-body">


                <div class="tab-content" id="profileTabContent">

                    <div id="about" role="tabpanel" aria-labelledby="about-tab">
                        <h4>Personal Information</h4>

                        <hr>
                        <div class="row">
                            <div class="col-md-4 col-6">
                                <div class="mb-4">
                                    <p class="text-primary mb-1"><i class="i-MaleFemale text-16 mr-1"></i>First Name</p>
                                    <span><asp:Label ID="lblFirstName" runat="server" /></span>
                                </div>
                                <div class="mb-4">
                                    <p class="text-primary mb-1"><i class="i-MaleFemale text-16 mr-1"></i>Last Name</p>
                                    <span><asp:Label ID="lblLastName" runat="server" /></span>
                                </div>
                                <div class="mb-4">
                                    <p class="text-primary mb-1"><i class="i-Email text-16 mr-1"></i>Email Address</p>
                                    <span><asp:Label ID="lblEmailAddress" runat="server" /></span>
                                </div>
                            </div>
                            <div class="col-md-4 col-6">
                                <div class="mb-4">
                                    <p class="text-primary mb-1"><i class="i-Bell text-16 mr-1"></i>Phone Number</p>
                                    <span><asp:Label ID="lblPhone" runat="server" /></span>
                                </div>
                                <div class="mb-4">
                                    <p class="text-primary mb-1"><i class="i-Professor text-16 mr-1"></i>User Type</p>
                                    <span><asp:Label ID="lblUserType" runat="server" /></span>
                                </div>
                            </div>
                            <%--<div class="mb-4">
                                        <p class="text-primary mb-1"><i class="i-Cloud-Weather text-16 mr-1"></i> Website</p>
                                        <span>www.ui-lib.com</span>
                                    </div>--%>
                        </div>


                        <!-- Footer Start -->
                        <%--<div class="flex-grow-1"></div>
            <div class="app-footer">
                <div class="row">
                    <div class="col-md-9">
                        <p><strong>Gull - Laravel + Bootstrap 4 admin template</strong></p>
                        <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Libero quis beatae officia saepe perferendis voluptatum minima eveniet voluptates dolorum, temporibus nisi maxime nesciunt totam repudiandae commodi sequi dolor quibusdam
                            sunt.
                        </p>
                    </div>
                </div>
                <div class="footer-bottom border-top pt-3 d-flex flex-column flex-sm-row align-items-center">
                    <a class="btn btn-primary text-white btn-rounded" href="https://themeforest.net/user/mh_rafi" target="_blank">Buy
            Gull HTML</a>
                    <span class="flex-grow-1"></span>
                    <div class="d-flex align-items-center">
                        <img class="logo" src="assets/images/logo.png" alt="">
                        <div>
                            <p class="m-0">&copy; 2018 Gull HTML</p>
                            <p class="m-0">All rights reserved</p>
                        </div>
                    </div>
                </div>
            </div>
            <!-- fotter end -->--%>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
