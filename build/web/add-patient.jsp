<!DOCTYPE html>
<html lang="en">


    <!-- blog23:34-->
    <head>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/logo-dark.png">
        <title>PHR - Manage Personal Health Record</title>
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
            .error {
                border-color: #FF0000 !important;
            }
            #avatar{
                overflow: hidden
            }
        </style>
    </head>

    <%@include file="components/header.html" %>
    <%@include file="components/sidebar.html" %>

    <!-- ============================================== Add Patient Form ================================================ -->

    <div class="page-wrapper">
        <div class="content">
            <div class="row">
                <div class="col-lg-8 offset-lg-2">
                    <h4 class="page-title">Add Patient</h4>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-8 offset-lg-2">
                    <form id="myForm" >
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>First Name <span class="text-danger">*</span></label>
                                    <input class="form-control" id='inputFirstname' name="firstName" type="text" >
                                    <span id='messageFirstname'></span>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Last Name <span class="text-danger">*</span></label>
                                    <input class="form-control" id='inputLastname' name="lastName" type="text" >
                                    <span id='messageLastname'></span>
                                </div>
                            </div>
                            
<!--                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Username <span class="text-danger">*</span></label>
                                    <input id='inputUsername' class="form-control" name="username" type="text" required>
                                    <span id='messageUsername'></span>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Email</label>
                                    <input id='inputEmail' class="form-control" name="email" type="email" required>
                                    <span id='messageEmail'></span>
                                </div>
                            </div>-->
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Password <span class="text-danger">*</span></label>
                                    <input class="form-control" id='inputPassword' name="password" type="password" onkeyup='check()'>
                                    <span id='messagePassword'/></span>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Confirm Password <span class="text-danger">*</span></label>
                                    <input class="form-control" id="confirmPass" name="confirmPass" type="password" onkeyup='check()'>
                                    <span id='message'></span>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Date of Birth</label>
                                    <div class="cal-icon">
                                        <input id="datepicker" type="text" name="dob" class="form-control datetimepicker" data-date-format="YYYY/MM/DD">


                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group gender-select">
                                    <label class="gen-label">Gender:</label>
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                            <input id="male" type="radio" name="gender" class="form-check-input" value="on" checked>Male
                                        </label>
                                    </div>
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                            <input id="female" type="radio" name="gender" class="form-check-input"  value="off">Female
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-12">
                                <div class="row">
                                    <div class="col-sm-12">
                                        <div class="form-group">
                                            <label>Address </label>
                                            <input type="text" name="address" class="form-control ">
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Phone <span class="text-danger">*</span></label>
                                    <input id='inputPhone' class="form-control" name="phone" type="number">
                                    <span id='messagePhone'/></span>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Avatar</label>
                                    <div class="profile-upload">
                                        <div class="upload-img">
                                            <img id="img" alt="" src="assets/img/user.jpg">
                                        </div>
                                        <div class="upload-input">
                                            <input id="avatar" type="file" name="avatar" class="form-control" accept="image/x-png,image/gif,image/jpeg" onchange="validateFileType()">
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
                            <button id="createPatient" class="btn btn-primary submit-btn">Create Patient</button>

                        </div>
                    </form>
                </div>
            </div>
        </div>



        <!-- ==================================Chat Box And Notification ======================================= -->


        <%@include file="components/footer.html" %>
        <script src="assets/js/jquery-3.2.1.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.slimscroll.js"></script>
        <script src="assets/js/select2.min.js"></script>
        <script src="assets/js/moment.min.js"></script>
        <script src="assets/js/bootstrap-datetimepicker.min.js"></script>
        <script src="assets/js/app.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.1/css/toastr.css" rel="stylesheet"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.1/js/toastr.js"></script>
        <script src="https://www.gstatic.com/firebasejs/7.7.0/firebase-app.js"></script>
        <script src="https://www.gstatic.com/firebasejs/7.7.0/firebase-storage.js"></script>
        <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
        <script type="text/javascript">

                                                function validateFileType() {
                                                    var fileName = document.getElementById("avatar").value;
                                                    var idxDot = fileName.lastIndexOf(".") + 1;
                                                    var extFile = fileName.substr(idxDot, fileName.length).toLowerCase();
                                                    if (extFile === "jpg" || extFile === "jpeg" || extFile === "png") {
                                                        function readURL(input) {
                                                            if (input.files && input.files[0]) {
                                                                var reader = new FileReader();
                                                                reader.onload = function (e) {
                                                                    $('#img').attr('src', e.target.result);

                                                                }

                                                                reader.readAsDataURL(input.files[0]); // convert to base64 string
                                                            }
                                                        }

                                                        readURL(document.getElementById("avatar"));

                                                    } else {
                                                        toastr["error"]("Only jpg/jpeg and png files are allowed!", "Error", {"progressBar": true, "closeButton": true, "positionClass": "toast-top-full-width"});
                                                        $("input[id='avatar']").val("");
                                                        $('#img').attr('src', "assets/img/user.jpg");
                                                    }
                                                }
//                =====================================Insert===============================================

                                                $(document).ready(function () {


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

                                                    // Initialize Firebase
                                                    firebase.initializeApp(firebaseConfig);
                                                    function validateEmail(email)
                                                    {
                                                        var re = /\S{3,}@\S+\.\S+/;
                                                        return re.test(email);
                                                    }
                                                    function removeAscent(str) {
                                                        if (str === null || str === undefined) {
                                                            return str;
                                                        }
                                                        str = str.toLowerCase();
                                                        str = str.replace(/à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ/g, "a");
                                                        str = str.replace(/è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ/g, "e");
                                                        str = str.replace(/ì|í|ị|ỉ|ĩ/g, "i");
                                                        str = str.replace(/ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ/g, "o");
                                                        str = str.replace(/ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ/g, "u");
                                                        str = str.replace(/ỳ|ý|ỵ|ỷ|ỹ/g, "y");
                                                        str = str.replace(/đ/g, "d");
                                                        return str;
                                                    }
                                                    function validateName(name)
                                                    {
                                                        var re = /^[a-zA-Z ]+$/;
                                                        return re.test(name);
                                                    }
                                                    function validatePhone(phone)
                                                    {
                                                        var re = /((09|03|07|08|05)+([0-9]{8})\b)/g;
                                                        return re.test(phone);
                                                    }
                                                    $("#inputFirstname").click(function () {
                                                        $('#inputFirstname').removeClass('error');
                                                        document.getElementById('messageFirstname').innerHTML = '';
                                                    });
                                                    $("#inputLastname").click(function () {
                                                        $('#inputLastname').removeClass('error');
                                                        document.getElementById('messageLastname').innerHTML = '';
                                                    });

                                                    $("#inputPassword").click(function () {
                                                        $('#inputPassword').removeClass('error');
                                                        document.getElementById('messagePassword').innerHTML = '';
                                                    });
                                                    $("#inputPhone").click(function () {
                                                        $('#inputPhone').removeClass('error');
                                                        document.getElementById('messagePhone').innerHTML = '';
                                                    });

                                                    
                                                    $("#createPatient").click(function (event) {
                                                        event.preventDefault();
                                                        $('#inputFirstname').removeClass('error');
                                                        document.getElementById('messageFirstname').innerHTML = '';
                                                        $('#inputLastname').removeClass('error');
                                                        document.getElementById('messageLastname').innerHTML = '';
//                                                        $('#inputUsername').removeClass('error');
//                                                        document.getElementById('messageUsername').innerHTML = '';
                                                        $('#inputPassword').removeClass('error');
                                                        document.getElementById('messagePassword').innerHTML = '';
                                                        $('#inputPassword').removeClass('error');
                                                        document.getElementById('messagePassword').innerHTML = '';
                                                        $('#inputPhone').removeClass('error');
                                                        document.getElementById('messagePhone').innerHTML = '';
//                                                        $('#inputEmail').removeClass('error');
//                                                        document.getElementById('messageEmail').innerHTML = '';
                                                        var count = 0;
                                                        var alluser = JSON.parse(localStorage.getItem("alluser"));
                                                        for (var i = 0; i < alluser.length; i++) {

                                                            if (alluser[i].phone === document.getElementById('inputPhone').value) {
                                                                $('#inputPhone').addClass('error');
                                                                document.getElementById('messagePhone').style.color = 'red';
                                                                document.getElementById('messagePhone').innerHTML = 'Phone already exists ✘';
                                                                count = 1;
                                                            }
                                                            console.log();

                                                        }
                                                        var firstName = $("input[name='firstName']").val(); //lấy giá trị trong input user
                                                        var lastName = $("input[name='lastName']").val();
//                                                        var username = $("input[name='username']").val();
                                                        var password = $("input[name='password']").val();
                                                        var dob = $("input[name='dob']").val();
                                                        var gender = $("input[name='gender']").val();
//                                                        var mail = $("input[name='email']").val();
                                                        var address = $("input[name='address']").val();
                                                        var phone = $("input[name='phone']").val();
                                                        var status = $("input[name='status']").val();
                                                        var token = sessionStorage.getItem("key");
                                                        var selectGen = $('input[id="male"]:checked').val();
                                                        
                                                        if (selectGen === "on") {
                                                            gender = "Male";
                                                        } else {
                                                            gender = "Female";
                                                        }

                                                        var selectSta = $('input[id="patient_active"]:checked').val();
                                                        if (selectSta === "on") {
                                                            status = "Active";
                                                        } else {
                                                            status = "Inactive";
                                                        }
                                                        
                                                        console.log(firstName + " firtname");
                                                        console.log(dob + " dob");
                                                        
                                                        if (firstName.length === 0 || !validateName(removeAscent(firstName)) || firstName.length > 14) {
                                                            $('#inputFirstname').addClass('error');
                                                            document.getElementById('messageFirstname').style.color = 'red';
                                                            document.getElementById('messageFirstname').innerHTML = 'First Name invalid ✘';
                                                            if (lastName.length === 0 || !validateName(removeAscent(lastName)) || lastName.length > 35) {
                                                                $('#inputLastname').addClass('error');
                                                                document.getElementById('messageLastname').style.color = 'red';
                                                                document.getElementById('messageLastname').innerHTML = 'Last Name invalid ✘';
                                                            }

                                                            if (password.length > 30 || password.length < 6) {
                                                                $('#inputPassword').addClass('error');
                                                                document.getElementById('messagePassword').style.color = 'red';
                                                                document.getElementById('messagePassword').innerHTML = 'Password must be between 6-30 charcters';
                                                            }
                                                            if (phone.length !== 10 || !validatePhone(phone)) {
                                                                $('#inputPhone').addClass('error');
                                                                document.getElementById('messagePhone').style.color = 'red';
                                                                document.getElementById('messagePhone').innerHTML = 'Incorrect phone number format ✘';
                                                            }

                                                        } else if (lastName.length === 0 || !validateName(removeAscent(lastName)) || lastName.length > 35) {
                                                            $('#inputLastname').addClass('error');
                                                            document.getElementById('messageLastname').style.color = 'red';
                                                            document.getElementById('messageLastname').innerHTML = 'Last Name invalid ✘';

                                                            if (password.length > 30 || password.length < 6) {
                                                                $('#inputPassword').addClass('error');
                                                                document.getElementById('messagePassword').style.color = 'red';
                                                                document.getElementById('messagePassword').innerHTML = 'Password must be between 6-30 charcters';
                                                            }
                                                            if (phone.length !== 10 || !validatePhone(phone)) {
                                                                $('#inputPhone').addClass('error');
                                                                document.getElementById('messagePhone').style.color = 'red';
                                                                document.getElementById('messagePhone').innerHTML = 'Incorrect phone number format ✘';
                                                            }
                                                        } 

                                                        else if (password.length > 30 || password.length < 6) {
                                                            $('#inputPassword').addClass('error');
                                                            document.getElementById('messagePassword').style.color = 'red';
                                                            document.getElementById('messagePassword').innerHTML = 'Password must be between 6-30 charcters';
                                                            if (phone.length !== 10 || !validatePhone(phone)) {
                                                                $('#inputPhone').addClass('error');
                                                                document.getElementById('messagePhone').style.color = 'red';
                                                                document.getElementById('messagePhone').innerHTML = 'Incorrect phone number format ✘';
                                                            }
                                                        } else if (phone.length !== 10 || !validatePhone(phone)) {
                                                            $('#inputPhone').addClass('error');
                                                            document.getElementById('messagePhone').style.color = 'red';
                                                            document.getElementById('messagePhone').innerHTML = 'Incorrect phone number format ✘';
                                                        } else if (count === 1) {

                                                        } else {
                                                            toastr["success"]("Create Successfully!", "Success", {"progressBar": true, "closeButton": true, "positionClass": "toast-top-full-width"});
                                                            function uploadImage() {
                                                                const ref = firebase.storage().ref();
                                                                const file = document.querySelector("#avatar").files[0];
                                                                if (file) {
                                                                    const name = +new Date() + "-" + file.name;
                                                                    const metadata = {
                                                                        contentType: file.type
                                                                    };
                                                                    const task = ref.child(name).put(file, metadata);
                                                                    task.then(snapshot => snapshot.ref.getDownloadURL()).then(url => {
                                                                        ajax(url);
                                                                    });
                                                                } else {
                                                                    ajax("assets/img/user.jpg");
                                                                }
                                                            }
                                                            function ajax(url) {
                                                                return   $.ajax({
                                                                    type: "POST",
                                                                    dataType: "json",
                                                                    contentType: "application/json; charset=utf-8",
                                                                    headers: {
                                                                        Authorization: 'Bearer ' + token},
                                                                    data: JSON.stringify({
                                                                        "address": address,
                                                                        "gender": gender,
                                                                        "dob": dob,
                                                                        "name": lastName + " " + firstName,
                                                                        "image": url,
                                                                        "password": password,
                                                                        "phone": phone,
                                                                        "token": ""


                                                                    }),
                                                                    url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/patients/patient",
                                                                    complete: function (jqXHR) {
                                                                        if (jqXHR.status === 201) {
                                                                            window.location.href = "patients.jsp";
                                                                        }
                                                                    }
                                                                });
                                                            }
                                                            uploadImage();
                                                        }
                                                    });
                                                });
//       ================================================Check Confirm Password========================================

                                                var check = function () {
                                                    if (document.getElementById('inputPassword').value ===
                                                            document.getElementById('confirmPass').value && document.getElementById('inputPassword').value !== "") {
                                                        document.getElementById('message').style.color = 'green';
                                                        document.getElementById('message').innerHTML = 'OK ✔';
                                                        $("#createPatient").removeAttr("disabled");
                                                    } else {
                                                        if (document.getElementById('inputPassword').value !== "") {
                                                            document.getElementById('message').style.color = 'red';
                                                            document.getElementById('message').innerHTML = 'not matching ✘';
                                                            $("#createPatient").attr("disabled", "disabled");
                                                        } else {
                                                            document.getElementById('message').innerHTML = '';
                                                        }

                                                    }
                                                };
        </script>
    </body>


    <!-- add-patient24:07-->
</html>
