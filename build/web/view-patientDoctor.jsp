<!DOCTYPE html>
<html lang="en">


    <!-- blog23:34-->
    <head>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <meta charset="UTF-8" />
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/logo-dark.png">
        <title>MPMR - Manage Personal Medical Record</title>
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/select2.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap-datetimepicker.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
        <link rel="stylesheet" type="text/css" href="assets/css/customStyle.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>


        <style>
            .sidebar-menu li a {
                color: black;
                font-weight: 500;
            }

            .sidebar-menu li#aPatient a {
                color: #009efb;
                /*background-color: #2a9c31;*/
                background-color: #e3e7e8;
            }
        </style>
    </head>

    <%@include file="components/doctorHeader.html" %>
    <%@include file="components/doctorSidebar.html" %>

    <!-- ============================================== Add Patient Form ================================================ -->

    <div class="page-wrapper">
        <div class="content">
            <div class="row">
                <div class="col-lg-8 offset-lg-2">
                    <h4 class="page-title">Patient's Detail</h4>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-8 offset-lg-2">
                    <form id="myForm" >
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>First Name <span class="text-danger">*</span></label>
                                    <input class="form-control" id='firstName' name="firstName" type="text" readonly>
                                    <span id='valiFirst'></span>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Last Name</label>
                                    <input class="form-control" id='lastName' name="lastName" type="text" readonly >
                                    <span id='valiLast'></span>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Username <span class="text-danger">*</span></label>
                                    <input class="form-control" id="username" name="username" type="text" required readonly>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Email <span class="text-danger">*</span></label>
                                    <input id="email" class="form-control" name="email" type="email" required readonly>
                                </div>
                            </div>

                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Date of Birth</label>
                                    <div class="cal-icon">
                                        <input id="datepicker" type="text" name="dob" class="form-control datetimepicker" readonly>


                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group gender-select">
                                    <label class="gen-label">Gender:</label>
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                            <input id="male" type="radio" name="gender" class="form-check-input" readonly>Male
                                        </label>
                                    </div>
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                            <input id="female" type="radio" name="gender" class="form-check-input" readonly>Female
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <label>Address</label>
                                            <input type="text" id="address" name="address" class="form-control " readonly>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Phone </label>
                                    <input class="form-control" id ="phone" name="phone" type="text" readonly>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Avatar</label>
                                    <div class="profile-upload">
                                        <div class="upload-img">
                                            <img id="img" alt="" src="assets/img/user.jpg">
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="display-block">Status</label>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="status" id="patient_active" value="on" readonly>
                                <label class="form-check-label" for="patient_active">
                                    Active
                                </label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="status" id="patient_inactive" value="off" readonly>
                                <label class="form-check-label" for="patient_inactive">
                                    Inactive
                                </label>
                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </div>



        <!-- ==================================Chat Box And Notification ======================================= -->


        <%@include file="components/doctorFooter.html" %>
        <script src="assets/js/jquery-3.2.1.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.slimscroll.js"></script>
        <script src="assets/js/select2.min.js"></script>
        <script src="assets/js/moment.min.js"></script>
        <script src="assets/js/bootstrap-datetimepicker.min.js"></script>
        <script src="assets/js/app.js"></script>
        <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
        <script type="text/javascript">


//                =====================================Update===============================================

            var data = JSON.parse(localStorage.getItem("dataPat"));
            window.onload = function () {
                var fullName = data.fullname;
                var firstName = fullName.split(" ");
                var lastName = fullName.replace(firstName[firstName.length - 1], "");
                $("#firstName").val(firstName[firstName.length - 1]);
                $("#lastName").val(lastName); //đổi thứ tự last name vs firstname
                var username = data.username;
                $("#username").val(username);
                var mail = data.mail;
                $("#email").val(mail);
                var password = data.password;
                $("#password").val(password);
                var confirmPass = data.password;
                $("#confirmPass").val(confirmPass);
                var dob = data.dob;
                $("#datepicker").val(dob);
                var gender = data.gender;
                console.log(gender);
                if (gender === 0) {
                    $("#male").prop("checked", true);
                } else {
                    $("#female").prop("checked", true);
                }
                var address = data.address;
                $("#address").val(address);
                var phone = data.phone;
                $("#phone").val(phone);
                var image = data.image;
                $('#img').attr('src', image);
                var status = data.status;
                if (status === "Active") {
                    $("#patient_active").prop("checked", true);
                } else {
                    $("#patient_inactive").prop("checked", true);
                }


            };



//
//                                        $(document).ready(function () {
//                                            $("#createPatient").click(function (event) {
//                                                event.preventDefault();
//                                                var idUpdate = data.id;
//                                                var firstName = $("input[id='firstName']").val(); //lấy giá trị trong input user
//                                                var lastName = $("input[id='lastName']").val();
//                                                var username = $("input[id='username']").val();
//                                                var email = $("input[id='email']").val();
//                                                var password = $("input[id='password']").val();
//                                                var dob = $("input[id='datepicker']").val();
//                                                var gender = $("input[name='gender']").val();
//
//                                                var address = $("input[id='address']").val();
//                                                var phone = $("input[id='phone']").val();
//                                                var avatar = $("input[id='avatar']").val();
//                                                var status = $("input[name='status']").val();
//                                                var token = localStorage.getItem("key");
//                                                var selectGen = $('input[id="male"]:checked').val();
//                                                if (selectGen === "on") {
//                                                    gender = 0;
//                                                } else {
//                                                    gender = 1;
//                                                }
//
//                                                var selectSta = $('input[id="patient_active"]:checked').val();
//                                                if (selectSta === "on") {
//                                                    status = "Active";
//                                                } else {
//                                                    status = "Inactive";
//                                                }
//                                                
//                                                $.ajax({
//                                                    type: "PUT",
//                                                    dataType: "json",
//                                                    contentType: "application/json; charset=UTF-8",
//                                                    headers: {
//                                                        Authorization: 'Bearer ' + token},
//                                                        data: JSON.stringify({
//                                                        "address": address,
//                                                        "gender": gender,
//                                                        "dob": dob,
//                                                        "fullname": lastName + " " + firstName,
//                                                        "id": idUpdate,
//                                                        "mail": email,
//                                                        "image": "",
//                                                        "password": password,
//                                                        "phone": phone,
//                                                        "roleId": {
//                                                            "id": 3,
//                                                            "name": "user"
//                                                        },
//                                                        "status": status,
//                                                        "token": "",
//                                                        "username": username
//                                                    }),
//                                                    url: "https://bt-application.herokuapp.com/api/userinfor/edit",
//                                                    complete: function (jqXHR) {
//                                                        console.log(jqXHR.status);
//                                                        if (jqXHR.status === 200) {
//                                                            window.location.href = "receptionistPatients.jsp";
//                                                        }
//                                                    }
//                                                });
//                                            })
//                                        });
//              ==================================Check Password==========================================
            var check = function () {
                if (document.getElementById('password').value ==
                        document.getElementById('confirmPass').value) {
                    document.getElementById('message').style.color = 'green';
                    document.getElementById('message').innerHTML = 'OK ✔';
                    $("#createPatient").removeAttr("disabled");
                } else {
                    document.getElementById('message').style.color = 'red';
                    document.getElementById('message').innerHTML = 'not matching ✘';
                    $("#createPatient").attr("disabled", "disabled");
                }
            };
        </script>
    </body>


    <!-- add-patient24:07-->
</html>
