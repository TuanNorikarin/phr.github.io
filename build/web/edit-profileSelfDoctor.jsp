<%-- 
    Document   : edit-profileSelfDoctor
    Created on : Dec 22, 2020, 11:43:46 AM
    Author     : Admin
--%>

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
        <script src="https://www.gstatic.com/firebasejs/7.7.0/firebase-app.js"></script>
        <script src="https://www.gstatic.com/firebasejs/7.7.0/firebase-storage.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>


        <style>
            .sidebar-menu li a {
                color: black;
                font-weight: 500;
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
                    <h4 class="page-title">Update Profile</h4>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-8 offset-lg-2">
                    <form id="myForm" >
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>First Name <span class="text-danger">*</span></label>
                                    <input class="form-control" id='firstName' name="firstName" type="text" >
                                    <span id='valiFirst'></span>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Last Name <span class="text-danger">*</span></label>
                                    <input class="form-control" id='lastName' name="lastName" type="text" >
                                    <span id='valiLast'></span>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Username <span class="text-danger">*</span></label>
                                    <input class="form-control" id="username" name="username" type="text" required>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Email <span class="text-danger">*</span></label>
                                    <input id="email" class="form-control" name="email" type="email" required>
                                </div>
                            </div>

                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Date of Birth</label>
                                    <div class="cal-icon">
                                        <input id="datepicker" type="text" name="dob" class="form-control datetimepicker">


                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group gender-select">
                                    <label class="gen-label">Gender: <span class="text-danger">*</span></label>
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                            <input id="male" type="radio" name="gender" class="form-check-input">Male
                                        </label>
                                    </div>
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                            <input id="female" type="radio" name="gender" class="form-check-input">Female
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <label>Address</label>
                                            <input type="text" id="address" name="address" class="form-control ">
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Phone <span class="text-danger">*</span></label>
                                    <input class="form-control" id ="phone" name="phone" type="text">
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Avatar</label>
                                    <div class="profile-upload">
                                        <div class="upload-img">
                                            <img id='img' alt="" src="assets/img/user.jpg">
                                        </div>
                                        <div class="upload-input">
                                            <input id='avatar' type="file" name="avatar" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="display-block">Status</label>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="status" id="patient_active" value="on" checked>
                                <label class="form-check-label" for="patient_active">
                                    Active
                                </label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="status" id="patient_inactive" value="off">
                                <label class="form-check-label" for="patient_inactive">
                                    Inactive
                                </label>
                            </div>
                        </div>
                        <div class="m-t-20 text-center">
                            <button id="createPatient" class="btn btn-primary submit-btn">Update Profile</button>

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

                                        var data = JSON.parse(localStorage.getItem("userInformation"));
                                        console.log(data);
                                        window.onload = function () {
                                        var fullName = data.fullname;
                                        var firstName = fullName.split(" ");
                                        var lastName = fullName.replace(firstName[firstName.length - 1], "");
                                        lastName = lastName.trim();
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
//                                            var avatar = $("input[name='avatar']").val();
                                        var status = data.status;
                                        if (status === "Active") {
                                        $("#patient_active").prop("checked", true);
                                        } else {
                                        $("#patient_inactive").prop("checked", true);
                                        }


                                        };
                                        $(document).ready(function () {
                                        function readURL(input) {
                                        if (input.files && input.files[0]) {
                                        var reader = new FileReader();
                                        reader.onload = function (e) {
                                        $('#img').attr('src', e.target.result);
                                        }

                                        reader.readAsDataURL(input.files[0]); // convert to base64 string
                                        }
                                        }
                                        $('#avatar').change(function () {
                                        readURL(this);
                                        });
                                        $("#createPatient").click(function (event) {
                                        event.preventDefault();
                                        var imageOld = data.image;
                                        var firebaseConfig = {
                                        apiKey: "AIzaSyBf5hSMUpJ-kpx5c87kgll3dXePgK-j9mQ",
                                                authDomain: "upload-image-45245.firebaseapp.com",
                                                databaseURL: "https://upload-image-45245.firebaseio.com",
                                                projectId: "upload-image-45245",
                                                storageBucket: "upload-image-45245.appspot.com",
                                                messagingSenderId: "758652365413",
                                                appId: "1:758652365413:web:f009f179396e4af4de748c",
                                                measurementId: "G-S5ECRSMKRB"
                                        };
                                        function uploadImage() {
                                        const ref = firebase.storage().ref();
                                        const file = document.querySelector("#avatar").files[0];
                                        if (file){
                                        const name = + new Date() + "-" + file.name;
                                        const metadata = {
                                        contentType: file.type
                                        };
                                        const task = ref.child(name).put(file, metadata);
                                        task.then(snapshot => snapshot.ref.getDownloadURL()).then(url => {
                                        ajax(url);
                                        });
                                        } else {
                                        ajax(imageOld);
                                        }
                                        }
                                        // Initialize Firebase
                                        firebase.initializeApp(firebaseConfig);
                                        var idUpdate = data.id;
                                        var firstName = $("input[id='firstName']").val(); //lấy giá trị trong input user
                                        var lastName = $("input[id='lastName']").val();
                                        var username = $("input[id='username']").val();
                                        var email = $("input[id='email']").val();
                   
                                        var dob = $("input[id='datepicker']").val();
                                        var gender = $("input[name='gender']").val();
                                        var address = $("input[id='address']").val();
                                        var phone = $("input[id='phone']").val();
                                        var avatar = $("input[id='avatar']").val();
                                        var status = $("input[name='status']").val();
                                        var token = sessionStorage.getItem("key");
                                        var selectGen = $('input[id="male"]:checked').val();
                                        if (selectGen === "on") {
                                        gender = 0;
                                        } else {
                                        gender = 1;
                                        }

                                        var selectSta = $('input[id="patient_active"]:checked').val();
                                        if (selectSta === "on") {
                                        status = "Active";
                                        } else {
                                        status = "Inactive";
                                        }
                                        function ajax(url) {
                                        return  $.ajax({
                                        type: "PUT",
                                                dataType: "json",
                                                contentType: "application/json; charset=UTF-8",
                                                headers: {
                                                Authorization: 'Bearer ' + token},
                                                data: JSON.stringify({
                                                "address": address,
                                                        "gender": gender,
                                                        "dob": dob,
                                                        "fullname": lastName + " " + firstName,
                                                        "id": idUpdate,
                                                        "mail": email,
                                                        "image": url,
                                                        "password": data.password,
                                                        "phone": phone,
                                                        "roleId": {
                                                        "id": data.roleId.id
                                                        },
                                                        "clinicId":{
                                                           "id":data.clinicId.id
                                                        },
                                                        "status": status,
                                                        "token": data.token,
                                                        "username": username
                                                }),
                                                url: "https://bt-application.herokuapp.com/api/userinfor/edit",
                                                complete: function (jqXHR) {
                                                if (jqXHR.status === 200) {
                                                $.ajax({
                                                type: "POST",
                                                        dataType: "json",
                                                        contentType: "application/json",
                                                        data: JSON.stringify({
                                                        username: username,
                                                        password: data.password
                                                        }),
                                                        url: "https://bt-application.herokuapp.com/api/userinfor/login",
                                                        success: function (data) {
                                                        localStorage.setItem("name", data.fullname);
                                                        localStorage.setItem("userInformation", JSON.stringify(data));
                                                        localStorage.setItem("password", data.password);
                                                        if (data.roleId.name === "admin") {
                                                        localStorage.setItem("key", data.token);
                                                        localStorage.setItem("image", data.image);
                                                        window.location.href = "profileAdmin.jsp";
                                                        } else if (data.roleId.name === "receptionist") {
                                                        localStorage.setItem("key", data.token);
                                                        localStorage.setItem("image", data.image);
                                                        localStorage.setItem("clinicId", data.clinicId.id);
                                                        window.location.href = "profileReceptionist.jsp";
                                                        } else if (data.roleId.name === "doctor") {
                                                        localStorage.setItem("key", data.token);
                                                        localStorage.setItem("image", data.image);
                                                        localStorage.setItem("userId", data.id);
                                                        window.location.href = "profileDoctor.jsp";
                                                        } else if (data.roleId.name === "user") {
                                                        localStorage.setItem("key", data.token);
                                                        localStorage.setItem("userId", data.id);
                                                        localStorage.setItem("image", data.image);
                                                        window.location.href = "profileUser.jsp";
                                                        }
                                                        },
                                                        error: function (jqXHR, textStatus, errorThrown) {
                                                        console.log(' Error in processing! ' + textStatus);
                                                        }
                                                });
                                                }
                                                }
                                        });
                                        }
                                        uploadImage();
                                        })
                                        });
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


</html>

