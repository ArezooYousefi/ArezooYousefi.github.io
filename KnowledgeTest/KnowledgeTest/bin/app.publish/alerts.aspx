<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="alerts.aspx.cs" Inherits="KnowledgeTeat.alerts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="main-content-wrap sidenav-open d-flex flex-column">
            <div class="breadcrumb">
                <h1>Alerts</h1>
                <ul>
                    <li><a href="">UI Kits</a></li>
                    <li>Alerts</li>
                </ul>
            </div>

            <div class="separator-breadcrumb border-top"></div>

            <div class="row">
                <div class="col-md-12">
                    <div class="alert alert-card alert-warning text-center" role="alert">
                        Gull makes developent life easier! <button class="btn btn-rounded btn-warning ml-3">Buy Now</button>
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="alert alert-card alert-success" role="alert">
                        <strong class="text-capitalize">Success!</strong> Lorem ipsum dolor sit amet.
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="alert alert-card alert-danger" role="alert">
                        <strong class="text-capitalize">Danger!</strong> Lorem ipsum dolor sit amet.
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="alert alert-card alert-info" role="alert">
                        <strong class="text-capitalize">Success!</strong> Lorem ipsum dolor sit amet.
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="card mb-4">
                        <div class="card-body">
                            <div class="card-title">Bootstrap Alerts</div>
                            <div class="alert alert-primary" role="alert">
                                <strong class="text-capitalize">Primary!</strong> Lorem ipsum dolor sit amet.
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="alert alert-success" role="alert">
                                <strong class="text-capitalize">Success!</strong> Lorem ipsum dolor sit amet.
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="alert alert-info" role="alert">
                                <strong class="text-capitalize">Info!</strong> Lorem ipsum dolor sit amet.
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>

                            <div class="alert alert-warning" role="alert">
                                <strong class="text-capitalize">Warning!</strong> Lorem ipsum dolor sit amet.
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>

                            <div class="alert alert-danger" role="alert">
                                <strong class="text-capitalize">Danger!</strong> Lorem ipsum dolor sit amet.
                                <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <!-- end content row -->
            <!-- Footer Start -->
            <div class="flex-grow-1 "></div>
            <div class="app-footer ">
                <div class="row">
                    <div class="col-md-9 ">
                        <p><strong>Gull - Laravel + Bootstrap 4 admin template</strong></p>
                        <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Libero quis beatae officia saepe perferendis voluptatum minima eveniet voluptates dolorum, temporibus nisi maxime nesciunt totam repudiandae commodi sequi dolor quibusdam
                            sunt.
                        </p>
                    </div>
                </div>
                <div class="footer-bottom border-top pt-3 d-flex flex-column flex-sm-row align-items-center ">
                    <a class="btn btn-primary text-white btn-rounded " href="https://themeforest.net/user/mh_rafi " target="_blank">Buy
            Gull HTML</a>
                    <span class="flex-grow-1 "></span>
                    <div class="d-flex align-items-center ">
                        <img class="logo " src="./assets/images/logo.png " alt=" ">
                        <div>
                            <p class="m-0 ">&copy; 2018 Gull HTML</p>
                            <p class="m-0 ">All rights reserved</p>
                        </div>
                    </div>
                </div>
            </div>
            <!-- fotter end -->

        </div>
</asp:Content>
