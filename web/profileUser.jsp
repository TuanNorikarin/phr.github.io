<!DOCTYPE html>
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
            #share-medical-infomation {
                margin-left: 3%;
                margin-bottom: 3%;
            }
            #share-medical-infomation input{
                margin-left: 3%;
            }
            .btn-success{
                border: 1px solid #1a7edb;
                background: #009ce7;
                border-radius: 8px;
                font-size: 16px;
                margin-left: 10px;
                width: 70px;
            }
            div .tab-content {
                background-color: white;
            }

            #btnUpdate {
                margin-left: 50%;
                border: none;
                border-radius: 20px;
                background-color: #009ce7;
                color: white;
                width: 50%;
                height: 30px;
            }
            @media screen and (max-width:1250px) {
                #btnUpdate {
                    margin-left: 30%;
                    width:70%; /* The width is 100%, when the viewport is 800px or smaller */
                }
            }
            @media screen and (max-width:800px) {
                #btnUpdate {
                    margin-left: 5%;
                    width:95%; /* The width is 100%, when the viewport is 800px or smaller */
                }
            }
            #btnUpdate:hover {
                color: white;
                cursor: pointer;
                background-color: #869791;
            }
            input[type=text] {
                width: 50px;
                padding: 5px;
                margin: 5px;
                border: none;
            }
            textArea.medicalNote{
                width: 100%;
            }
        </style>
    </head>

    <%@include file="components/userHeader.html" %>
    <%@include file="components/userSidebar.html" %>
    <div class="page-wrapper">
        <div class="content">
            <div class="row">
                <div class="col-sm-7 col-6">
                    <!--                    <h4 class="page-title">My Profile</h4>-->
                </div>

                <div class="col-sm-5 col-6 text-right m-b-30">
                    <a href="changePasswordUser.jsp" class="btn btn-primary btn-rounded"><i class="fa fa-key"></i> Change Password</a>
                    <a href="edit-profileSelfUser.jsp" class="btn btn-primary btn-rounded"><i class="fa fa-edit"></i> Edit Profile</a>
                </div>

            </div>
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
                                            <div class="staff-id">Username: <span id="usernameDisplay"></span></div>
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
                </ul>
                <div class="tab-content">
                    <div class="tab-pane show active" id="about-cont">
                        <div id="share-medical-infomation">
                            <input type="radio" id="public" name="radio-share" value="public"> Public
                            <input type="radio" id="private" name="radio-share" value="private"> Private
                            <input type="radio" id="group" name="radio-share" value="group"> Group
                            <button class="btn-success btn-primary" name="btnShare" value="Share" id="btnShare">Share</button>
                        </div>
                    </div>
                    <table id="groupMemberTable" class="table table-border table-striped custom-table mb-0">
                        <thead>
                            <tr>
                                <th style="width: 15%">Blood Type</th>
                                <th style="width: 15%">Height</th>
                                <th style="width: 15%">Weight</th>
                                <th style="width: 40%">Medical Note</th>
                                <th style="width: 15%" class="text-right">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td id="td-blood-type"></td>
                                <td id="td-height"></td>
                                <td id="td-weight"></td>
                                <td id="td-medical-note"></td>
                                <td id="btn-action">
                                    <button name="btnUpdate" value="Update" id="btnUpdate">Update</button>
                                </td>
                            </tr>
                        </tbody>

                    </table>

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
    <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.1/css/toastr.css" rel="stylesheet"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.1/js/toastr.js"></script>
    <script  type="text/javascript">
        $(document).ready(function () {
            var updateData = "";
            var shareInformationTypeId = "";
            var healRecordId = "";
            var token = localStorage.getItem("key");
            var userId = localStorage.getItem("userId");
            var userInf = JSON.parse(localStorage.getItem("userInformation"));
            $("button[name='btnShare']").click(function () {
                var radioValueShare = $("input[name='radio-share']:checked").val();
                if (radioValueShare === "public") {
                    shareInformationTypeId = 1;
                } else if (radioValueShare === "private") {
                    shareInformationTypeId = 2;
                } else if (radioValueShare === "group") {
                    shareInformationTypeId = 3;
                }
                toastr["success"]("Share Successfully!", "Success", {"progressBar": true, "closeButton": true, "positionClass": "toast-top-full-width"});
                $.ajax({
                    type: "PUT",
                    dataType: "json",
                    contentType: "application/json; charset=UTF-8",
                    headers: {
                        Authorization: 'Bearer ' + token},
                    data: JSON.stringify({
                        "id": updateData.id,
                        "sharedInformationContext": "Share",
                        "sharedInformationTypeId": {
                            "id": shareInformationTypeId //2:private
                        },
                        "healthRecordId": {
                            "id": updateData.healthRecordId.id
                        }
                    }),
                    url: "https://bt-application.herokuapp.com/api/sharedinformation/edit/",
                    complete: function (jqXHR, textStatus) {
                        window.location.href = "profileUser.jsp";
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log(' Error in processing! ' + textStatus);
                    }
                });
            }
            );
            $("button[name='btnUpdate']").click(function () {
                toastr["success"]("Update Successfully!", "Success", {"progressBar": true, "closeButton": true, "positionClass": "toast-top-full-width"});
                var inputBloodType = $("input[name='blood-type']").val();
                var inputHeight = $("input[name='height']").val();
                var inputWeight = $("input[name='weight']").val();
                var inputMedicalNote = $("textarea[name='medical-note']").val();
                $.ajax({
                    type: "PUT",
                    dataType: "json",
                    contentType: "application/json; charset=UTF-8",
                    headers: {
                        Authorization: 'Bearer ' + token},
                    data: JSON.stringify({
                        "id": healRecordId,
                        "bloodType": inputBloodType,
                        "height": inputHeight,
                        "weight": inputWeight,
                        "medicalNote": inputMedicalNote,
                        "userId": {
                            "id": userId
                        }

                    }),
                    url: "https://bt-application.herokuapp.com/api/healthrecord/edit/",
                    complete: function (jqXHR, textStatus) {
                        window.location.href = "profileUser.jsp";
                    }});
            });
            $('#avatar').attr('src', userInf.image);
            document.getElementById("fullname").innerHTML = userInf.fullname;
            document.getElementById("usernameDisplay").innerHTML = userInf.username;
            document.getElementById("phoneNum").innerHTML = userInf.phone;
            document.getElementById("emailDisplay").innerHTML = userInf.mail;
            document.getElementById("dob").innerHTML = userInf.dob;
            document.getElementById("address").innerHTML = userInf.address;
            document.getElementById("gender").innerHTML = userInf.gender;
            if (userInf.gender === 1) {
                document.getElementById("gender").innerHTML = "Female";
            } else if (userInf.gender === 0) {
                document.getElementById("gender").innerHTML = "Male";
            }
            //function2
            console.log(userId);
            $.ajax({
                type: "GET",
                dataType: "json",
                contentType: "application/json; charset=UTF-8",
                headers: {
                    Authorization: 'Bearer ' + token},
                url: "https://bt-application.herokuapp.com/api/healthrecord/findbyuserid/" + userId,
                success: function (data) {
                    healRecordId = data.id;
                    if (!data.bloodType) {
                        data.bloodType = "";
                        data.height = "";
                        data.weight = "";
                        data.medicalNote = "";
                    }
                    document.getElementById("td-blood-type").innerHTML = '<input type="text" name="blood-type" value="' + data.bloodType + '"> type';
                    document.getElementById("td-height").innerHTML = '<input type="text" name="height" value="' + data.height + '"> m';
                    document.getElementById("td-weight").innerHTML = '<input type="text" name="weight" value="' + data.weight + '"> kg';
                    document.getElementById("td-medical-note").innerHTML = '<textarea class="medicalNote" name="medical-note">' + data.medicalNote + '</textarea>';
                    $.ajax({
                        type: "GET",
                        dataType: "json",
                        contentType: "application/json; charset=UTF-8",
                        headers: {
                            Authorization: 'Bearer ' + token},
                        url: "https://bt-application.herokuapp.com/api/sharedinformation/findbyhealthid/" + data.id,
                        success: function (data) {
                            updateData = data;
                            console.log(data);
                            if (data.sharedInformationTypeId.id === 1) {
                                $("#public").prop('checked', true);
                            }
                            if (data.sharedInformationTypeId.id === 2) {
                                $("#private").prop('checked', true);
                            }
                            if (data.sharedInformationTypeId.id === 3) {
                                $("#group").prop('checked', true);
                            }
                        }});
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log(' Error in processing! ' + textStatus);
                }
            });
        });

    </script>
</body>


<!-- profile23:03-->
</html>