<html lang="en">


    <!-- blog23:34-->
    <head>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/logo-dark.png">
        <title>MPMR - Manage Personal Medical Record</title>
        <link href='http://fonts.googleapis.com/css?family=Roboto+Slab&subset=latin,greek' rel='stylesheet' type='text/css'>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
        <link rel="stylesheet" type="text/css" href="assets/css/customStyle.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
        <style>
            body{
                font-size: 14px;
            }
            .sidebar-menu li a {
                color: black;
                font-weight: 500;
            }

            .sidebar-menu li#aTestRequest a {
                color: #009efb;
                /*background-color: #2a9c31;*/
                background-color: #e3e7e8;
            }
            i.fa.fa-bars{
                padding-top: 14px;
            }

            span.status.online{
                left: 14px;
                top: 16px;
            }
            div.profile-widget{
                height: 110%;
                left: 45%;
                top: 35%;

            }
            .doctor-img {
                cursor: pointer;
                height: 180px;
                margin: 0 auto 15px;
                position: relative;
                width: 180px;
            }
            .doctor-img .avatar {
                font-size: 24px;
                height: 100%;
                line-height: 80px;
                margin: 0;
                width: 100%;
            }

            a.serviceName{
                
                font-size: 25px;
                font-weight: 600;
                font-family: cursive;
                color: salmon;
            }
            .avatar > img {
                width: 70%;
                display: block;
                margin-top: 35px;
                margin-left: 32;
            }
            a.avatar{
                background-color: linen;
            }
            </style>
        </head>
        <%@include file="components/recepHeader.html" %>
        <%@include file="components/recepSidebar.html" %>
        <div class="page-wrapper">
            <div class="content">
                <div class="row">
                    <div class="col-sm-4 col-3">
                        <h4 class="page-title">Select Type Of Test</h4>
                    </div>


                </div>

                <div class="row">

                    <div class="col-md-5 col-sm-5 col-lg-4">
                        <div class="profile-widget">
                            <div class="doctor-img">
                                <a class="avatar" href="selectTestPackage.jsp"><img alt="" src="assets/img/package.png"></a>
                            </div>

                            <div class="doctor-name text-ellipsis"><a class="serviceName" href="selectTestPackage.jsp">Select Test Package</a></div>


                        </div>
                    </div> 

                    <div class="col-md-5 col-sm-5 col-lg-4">
                        <div class="profile-widget">
                            <div class="doctor-img">
                                <a class="avatar" href="selectTestManual.jsp"><img alt="" src="assets/img/insurance.png"></a>
                            </div>

                            <div class="doctor-name text-ellipsis"><a class="serviceName" href="profileDoctor.jsp">Select Test Manually</a></div>


                        </div>
                    </div> 


                </div>

                <%@include file="components/recepFooter.html" %>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

                <script type="text/javascript" src="assets/js/jQuery.paginate.js"></script>
                <script src="assets/js/popper.min.js"></script>
                <script src="assets/js/bootstrap.min.js"></script>
                <script src="assets/js/jquery.slimscroll.js"></script>
                <script src="assets/js/select2.min.js"></script>
                <script src="assets/js/moment.min.js"></script>

                <script src="assets/js/app.js"></script>
                <script type="text/javascript">

                    window.onload = function () {
                        var token = localStorage.getItem("key");


                    }

                </script>


                </body>


                <!-- doctors23:17-->
                </html>