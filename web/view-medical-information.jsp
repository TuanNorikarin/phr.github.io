<html lang="en">


    <!-- blog23:34-->
    <head>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

        <link rel="shortcut icon" type="image/x-icon" href="assets/img/logo-dark.png">
        <title>MPMR - Manage Personal Medical Record</title>
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
        <link rel="stylesheet" type="text/css" href="assets/css/customStyle.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
        <style>
            i.fa.fa-bars{
                padding-top: 14px;
            }
            span.status.online{
                left: 14px;
                top: 16px;
            }
            div.tab-content {
                background-color: white;
                padding: 3%;
            }
            i.fa.fa-tint {
                color: red;
                font-size: 24px;
                margin-right: 8px;
            }
            i.fa.fa-balance-scale {
                color: #007bff;
                font-size: 24px;
                margin-right: 8px;
            }
            i.fa.fa-sort-amount-desc {
                color: #34ce57;
                font-size: 24px;
                margin-right: 8px;
            }
            i.fa.fa-sticky-note {
                color: #e9ab2e;
                font-size: 24px;
                margin-right: 8px;
            }

        </style>
    </head>
    <%@include file="components/userHeader.html" %>
    <%@include file="components/userSidebar.html" %>
    <div class="page-wrapper">
        <div class="content">
            <div class="card-box profile-header">
                <div class="row">
                    <div class="col-md-12">
                        <div class="profile-view">
                            <div class="profile-img-wrap">
                                <div class="profile-img">
                                    <a href="#"><img id="avatar" class="avatar" src="" alt=""></a>
                                </div>
                            </div>
                            <div class="profile-basic">
                                <div class="row">
                                    <div class="col-md-5">
                                        <div class="profile-info-left">
                                            <h3 id="fullname" class="user-name m-t-0 mb-0"></h3>
                                            <!--                                            <small class="text-muted">Gynecologist</small>-->
                                            <div class="staff-id">Username: <span id="usernameDisplay"></span></div>
                                            <!--<div class="staff-msg"><a href="chat.html" class="btn btn-primary">Send Message</a></div>-->
                                        </div>
                                    </div>
                                    <div class="col-md-7">
                                        <ul class="personal-info">
                                            <li>
                                                <span class="title"><i class="fa fa-phone-square"></i>&nbsp; Phone:</span>
                                                <span id="phoneNum" class="text"><a href="#"></a></span>
                                            </li>
                                            <li>
                                                <span class="title"><i class="fa fa-envelope"></i>&nbsp; Email:</span>
                                                <span id="emailDisplay" class="text"><a href="#"></a></span>
                                            </li>
                                            <li>
                                                <span class="title"><i class="fa fa-birthday-cake"></i>&nbsp; Birthday:</span>
                                                <span id="dob" class="text"></span>
                                            </li>
                                            <li>
                                                <span class="title"><i class="fa fa-map-marker"></i>&nbsp;&nbsp; Address:</span>
                                                <span id="address" class="text"></span>
                                            </li>
                                            <li>
                                                <span class="title"><i class="fa fa-venus-mars"></i>&nbsp; Gender:</span>
                                                <span id="gender" class="text"></span>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>                        
                    </div>
                </div>
            </div>
            <div class="profile-tabs">
                <ul class="nav nav-tabs nav-tabs-bottom">
                    <li class="nav-item"><a class="nav-link active" href="#about-cont" data-toggle="tab">Medical Information</a></li>
                    <li class="nav-item"><a class="nav-link" href="#bottom-tab2" data-toggle="tab">Medical Note</a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane show active" id="about-cont">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="body-view-medical-information">

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane" id="bottom-tab2">
                        Tab content 2
                    </div>
                </div>
            </div>
        </div>
        <%@include file="components/userFooter.html" %>
        <script src="assets/js/jquery-3.2.1.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.slimscroll.js"></script>
        <script src="assets/js/select2.min.js"></script>
        <script src="assets/js/jquery.dataTables.min.js"></script>
        <script src="assets/js/dataTables.bootstrap4.min.js"></script>
        <script src="assets/js/moment.min.js"></script>
        <script src="assets/js/bootstrap-datetimepicker.min.js"></script>
        <script src="assets/js/app.js"></script>
        <script type="text/javascript">
            window.onload = function () {

                var x = "";
                var y = "";
                var z = "";
                var token = localStorage.getItem("key");
                var user = JSON.parse(localStorage.getItem("dataUser"));
                $.ajax({
                    type: "GET",
                    dataType: "json",
                    contentType: "application/json; charset=UTF-8",
                    headers: {
                        Authorization: 'Bearer ' + token},
                    url: "https://bt-application.herokuapp.com/api/healthrecord/findbyuserid/" + user.id,
                    success: function (data) {
//                        var userInf = JSON.parse(localStorage.getItem("userInformation"));
//                        console.log(userInf);
                        $('#avatar').attr('src', user.image);
                        document.getElementById("fullname").innerHTML = user.fullname;
                        document.getElementById("usernameDisplay").innerHTML = user.username;
                        document.getElementById("phoneNum").innerHTML = user.phone;
                        document.getElementById("emailDisplay").innerHTML = user.mail;
                        document.getElementById("dob").innerHTML = user.dob;
                        document.getElementById("address").innerHTML = user.address;
                        document.getElementById("gender").innerHTML = user.gender;
                        if (user.gender === 1) {
                            document.getElementById("gender").innerHTML = "Female";
                        } else if (user.gender === 0) {
                            document.getElementById("gender").innerHTML = "Male";
                        }
                        console.log(data);
                        if (data.bloodType || data.height || data.weight || data.medicalNote) {
                            y = '<table><tr><p><i id ="bloodType" class="fa fa-tint"></i>Blood type: ' + data.bloodType + ' type</p></tr>'
                                    + '<tr><p><i id="height" class="fa fa-balance-scale"></i>Height: ' + data.height + ' m</p></tr>'
                                    + '<tr><p><i id="weight" class="fa fa-sort-amount-desc"></i>Weight: ' + data.weight + ' kg</p></tr></table>';
                            z = '<p><i id="medicalNote" class="fa fa-sticky-note"></i>Medical note: ' + data.medicalNote + '.</p>';
                        } else {
                            y = '<table><tr><p><i id ="bloodType" class="fa fa-tint"></i>Blood type: ...type</p></tr>'
                                    + '<tr><p><i id="height" class="fa fa-balance-scale"></i>Height: ... m</p></tr>'
                                    + '<tr><p><i id="weight" class="fa fa-sort-amount-desc"></i>Weight: ... kg</p></tr></table>';
                            z = '<p><i id="medicalNote" class="fa fa-sticky-note"></i>Medical note: ...</p>';
                        }
                        $(document).ajaxComplete(function (event, request, settings) {
//                            $("div.card-box.profile-header").html(x);
                            $("div.body-view-medical-information").html(y);
                            $("div#bottom-tab2").html(z);

                        });
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log(' Error in processing! ' + textStatus);
                    }

                });
            };

        </script>
    </body>
    <!-- doctors23:17-->
</html>