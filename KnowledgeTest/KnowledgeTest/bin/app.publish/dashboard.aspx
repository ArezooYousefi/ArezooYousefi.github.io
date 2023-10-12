<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="KnowledgeTest.dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        //var testTypeChartData = [
        //    { value: 25, name: 'Class 5-French' },
        //    { value: 15, name: 'Class 5-English' },
        //    { value: 55, name: 'Class 7-English' },
        //    { value: 15, name: 'Class 7-French' }
        //];
        var testTypeChartData;
        var passChartBar = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        var failChartBar = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        var weekdayTests = [0, 0, 0, 0, 0, 0, 0];
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main-content-wrap sidenav-open d-flex flex-column">

        <div class="breadcrumb">
            <h1 class="mr-2">Dashboard</h1>

        </div>
        <div class="separator-breadcrumb border-top"></div>

        <div class="row">
            <div class="col-lg-6 col-md-12">
                <!-- CARD ICON -->
                <div class="row">
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="card card-icon mb-4">
                            <div class="card-body text-center">
                                <i class="i-Female"></i>
                                <p class="text-muted mt-2 mb-2">Total Students</p>
                                <p class="text-primary text-24 line-height-1 m-0">
                                    <asp:Label ID ="lblTotalStudents" runat="server" />
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="card card-icon mb-4">
                            <div class="card-body text-center">
                                <i class="i-Add-User"></i>
                                <p class="text-muted mt-2 mb-2">New Students</p>
                                <p class="text-primary text-24 line-height-1 m-0">
                                    <asp:Label ID="lblNewStudents" runat="server" />
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="card card-icon mb-4">
                            <div class="card-body text-center">
                                <i class="i-File-Clipboard"></i>
                                <p class="text-muted mt-2 mb-2">Test Types</p>
                                <p class="text-primary text-24 line-height-1 m-0">
                                    <asp:Label ID="lblTestType" runat="server" />
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="card card-icon mb-4">
                            <div class="card-body text-center">
                                <i class="i-Add-File"></i>
                                <p class="text-muted mt-2 mb-2">Total Attempt</p>
                                <p class="text-primary text-24 line-height-1 m-0">
                                    <asp:Label ID="lblTotalAttempt" runat="server" />
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="card card-icon mb-4">
                            <div class="card-body text-center">
                                <i class="i-Checkout-Basket"></i>
                                <p class="text-muted mt-2 mb-2">Passed Attempt</p>
                                <p class="text-primary text-24 line-height-1 m-0">
                                    <asp:Label ID="lblPassedAttempt" runat="server" />
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6">
                        <div class="card card-icon mb-4">
                            <div class="card-body text-center">
                                <i class="i-Close-Window"></i>
                                <p class="text-muted mt-2 mb-2">Failed Attempt</p>
                                <p class="text-primary text-24 line-height-1 m-0">
                                    <asp:Label ID="lblFailedAttempt" runat="server" />
                                </p>
                            </div>
                        </div>
                    </div>

                </div>
            </div>

            <div class="col-lg-6 col-md-12">
                <div class="card mb-4">
                    <div class="card-body p-0">
                        <h5 class="card-title m-0 p-3">Students Test</h5>
                        <div id="echart4" style="height: 300px"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-7 col-md-12">
                <div class="card mb-4">
                    <div class="card-body">
                        <div class="card-title">Students Report</div>
                        <div id="echartBar" style="height: 300px;"></div>
                    </div>
                </div>
            </div>
            <div class="col-lg-5 col-sm-12">
                <div class="card mb-4">
                    <div class="card-body">
                        <div class="card-title">Test Types</div>
                        <div id="echartPie" style="height: 300px;"></div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer Start -->
        <div class="flex-grow-1"></div>
        <div class="app-footer">
            <div class="row">
                <div class="col-md-9">
                    <p><strong>Arezoo Yousefi</strong></p>
                    <p>
                        I'm ready to help you in creating WEB Application using ASP.NET and Node.js
                       
                    </p>
                </div>
            </div>
            <div class="footer-bottom border-top pt-3 d-flex flex-column flex-sm-row align-items-center">
                <a class="btn btn-primary text-white btn-rounded" href="https://arezoo-yousefi.github.io" target="_blank">CONTACT ME</a>
                <span class="flex-grow-1"></span>
                <div class="d-flex align-items-center">
                    <img class="logo" src="./assets/images/screenshots/favicon.ico" alt="">
                    <div>
                        <p class="m-0">&copy; 2023 areyouwebsites</p>
                        <p class="m-0">All rights reserved</p>
                    </div>
                </div>
            </div>
        </div>
        <!-- fotter end -->
        


        
        <script src="assets/js/vendor/echarts.min.js"></script>
        <script src="assets/js/es5/echart.options.min.js"></script>
        <%--<script src="assets/js/es5/dashboard.v1.script.js"></script>--%>
        <script src="assets/js/vendor/datatables.min.js"></script>
        <%--<script src="assets/js/es5/dashboard.v2.script.js"></script>--%>
        <script>
            var _extends = Object.assign || function (target) { for (var i = 1; i < arguments.length; i++) { var source = arguments[i]; for (var key in source) { if (Object.prototype.hasOwnProperty.call(source, key)) { target[key] = source[key]; } } } return target; };

            $(document).ready(function () {

                // Chart in Dashboard version 1
                var echartElemBar = document.getElementById('echartBar');
                if (echartElemBar) {
                    var echartBar = echarts.init(echartElemBar);
                    echartBar.setOption({
                        legend: {
                            borderRadius: 0,
                            orient: 'horizontal',
                            x: 'right',
                            data: ['Pass', 'Fail']
                        },
                        grid: {
                            left: '8px',
                            right: '8px',
                            bottom: '0',
                            containLabel: true
                        },
                        tooltip: {
                            show: true,
                            backgroundColor: 'rgba(0, 0, 0, .8)'
                        },
                        xAxis: [{
                            type: 'category',
                            data: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sept', 'Oct', 'Nov', 'Dec'],
                            axisTick: {
                                alignWithLabel: true
                            },
                            splitLine: {
                                show: false
                            },
                            axisLine: {
                                show: true
                            }
                        }],
                        yAxis: [{
                            type: 'value',
                            axisLabel: {
                                formatter: '{value}'
                            },
                            min: 0,
                            max: 10,
                            interval: 1,
                            axisLine: {
                                show: false
                            },
                            splitLine: {
                                show: true,
                                interval: 'auto'
                            }
                        }],

                        series: [{
                            name: 'Pass',
                            data: passChartBar,
                            label: { show: false, color: '#0168c1' },
                            type: 'bar',
                            barGap: 0,
                            color: '#7569b3',
                            smooth: true,
                            itemStyle: {
                                emphasis: {
                                    shadowBlur: 10,
                                    shadowOffsetX: 0,
                                    shadowOffsetY: -2,
                                    shadowColor: 'rgba(0, 0, 0, 0.3)'
                                }
                            }
                        }, {
                            name: 'Fail',
                            data: failChartBar, 
                            label: { show: false, color: '#639' },
                            type: 'bar',
                            color: '#bcbbdd',
                            smooth: true,
                            itemStyle: {
                                emphasis: {
                                    shadowBlur: 10,
                                    shadowOffsetX: 0,
                                    shadowOffsetY: -2,
                                    shadowColor: 'rgba(0, 0, 0, 0.3)'
                                }
                            }
                        }]
                    });
                    $(window).on('resize', function () {
                        setTimeout(function () {
                            echartBar.resize();
                        }, 500);
                    });
                }

                // Chart in Dashboard version 1
                var echartElemPie = document.getElementById('echartPie');
                if (echartElemPie) {
                    var echartPie = echarts.init(echartElemPie);
                    echartPie.setOption({
                        color: ['#62549c', '#7566b5', '#7d6cbb', '#8877bd', '#9181bd', '#6957af'],
                        tooltip: {
                            show: true,
                            backgroundColor: 'rgba(0, 0, 0, .8)'
                        },

                        series: [{
                            name: 'Test Type-Lang',
                            type: 'pie',
                            radius: '60%',
                            center: ['50%', '50%'],
                            data: testTypeChartData,
                            itemStyle: {
                                emphasis: {
                                    shadowBlur: 10,
                                    shadowOffsetX: 0,
                                    shadowColor: 'rgba(0, 0, 0, 0.5)'
                                }
                            }
                        }]
                    });
                    $(window).on('resize', function () {
                        setTimeout(function () {
                            echartPie.resize();
                        }, 500);
                    });
                }

                $('#user_table').DataTable();
                $('#sales_table').DataTable();

                // Chart in Dashboard version 2
                var echartElem4 = document.getElementById('echart4');
                if (echartElem4) {
                    var echart4 = echarts.init(echartElem4);
                    echart4.setOption(_extends({}, echartOptions.lineNoAxis, {
                        series: [{
                            data: weekdayTests,
                            lineStyle: {
                                color: 'rgba(102, 51, 153, .86)',
                                width: 3,
                                shadowColor: 'rgba(0, 0, 0, .2)',
                                shadowOffsetX: -1,
                                shadowOffsetY: 8,
                                shadowBlur: 10
                            },
                            label: { show: true, color: '#212121' },
                            type: 'line',
                            smooth: true,
                            itemStyle: {
                                borderColor: 'rgba(69, 86, 172, 0.86)'
                            }
                        }]
                    }, {
                        xAxis: { data: ['Sat', 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri'] }
                    }));
                    $(window).on('resize', function () {
                        setTimeout(function () {
                            echart4.resize();
                        }, 500);
                    });
                }
            });

            
        </script>



    </div>
</asp:Content>
