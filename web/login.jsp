<!DOCTYPE html>
<html lang="en">


    <!-- login23:11-->
    <head>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

        <link rel="shortcut icon" type="image/x-icon" href="assets/img/logo-dark.png">
        <title>PHR - Manage Personal Health Record</title>
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
        <link rel="stylesheet" type="text/css" href="assets/css/customStyle.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>


        <style>
            .error {
                border-color: #FF0000 !important;
            }
        </style>
    </head>

    <body>
        <script type="text/javascript">
            
            $(document).ready(function () {
    
                
                                function parseJwt (token) {
                                        var token = localStorage.getItem("key");
                                        
                                        var base64Url = token.split('.')[1];
                                        var base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
                                        var jsonPayload = decodeURIComponent(atob(base64).split('').map(function(c) {
                                            return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
                                        }).join(''));

                                        var a = JSON.parse(jsonPayload);
                                        console.log(typeof(a.user.authorities));
                                        return a.user.authorities + "";
                                        
                                    };
//                var token = localStorage.getItem("key");
//                console.log(token);
//                if (token !== "") {
//                    var role = localStorage.getItem("roleIdLogin");
//                    console.log(role);
//                    if (role === "admin") {
//                        window.location.href = "adminIndex.jsp";
//                    } else if (role === "receptionist") {
//                        window.location.href = "receptionistIndex.jsp";
//                    } else if (role === "doctor") {
//                        window.location.href = "doctorIndex.jsp";
//                    } else if (role === "user") {
//                        window.location.href = "userIndex.jsp";
//                    }
//                }
//                var val = "";
                $("#login").click(function (event) {
                    event.preventDefault();
                    $('#user').removeClass('error');
                    $('#password').removeClass('error');
                    document.getElementById('messageUsername').innerHTML = "";
                    document.getElementById('messagePassword').innerHTML = "";
                    document.getElementById('message').innerHTML = "";
                    
                    var user = $("input[name='user']").val(); //lấy giá trị trong input user
                    var password = $("input[name='password']").val();
                    
                    console.log(user);
                    console.log(password);
                    
                    if (user.length === 0) {
                        $('#user').addClass('error');
                        document.getElementById('messageUsername').style.color = 'red';
                        document.getElementById('messageUsername').innerHTML = 'Phone is empty ✘';
                    } else if (password.length === 0) {
                        $('#password').addClass('error');
                        document.getElementById('messagePassword').style.color = 'red';
                        document.getElementById('messagePassword').innerHTML = 'Password is empty ✘';
                    } else {
                        $.ajax({
                            type: "POST",
                            
                            contentType: "application/json",
                            data: JSON.stringify(
                            {
                                "username": user,
                                "password": password
                            }
                            ),
                            url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/authentications/login",
                            success: function (data) {

                                    sessionStorage.setItem("key", data);                                   
                                    console.log(data);
                                    
                                    var roleID = parseJwt(data); 
                                    if(roleID === "ADMIN"){
                                        window.location.href = "adminIndex.jsp";
                                    }
                                    else if( roleID = "DOCTOR"){
                                        window.location.href = "doctorIndex.jsp";
                                    }
                                    else if( roleID = "RECEPTIONIST")
                                    {
                                        window.location.href = "receptionistIndex.jsp";
                                    }
                                    
////                                    
                                   
                                    
                                    
                                    
                                    
//                                    
//                                    
//                                    
//                                }
//                                else if (data.roleId === "receptionist") {
//                                    localStorage.setItem("key", data.token);
//                                    localStorage.setItem("image", data.image);
//                                    localStorage.setItem("clinicId", data.clinicId.id);
//                                    localStorage.setItem("userId", data.id);
//                                    window.location.href = "receptionistIndex.jsp";
//                                } else if (data.roleId.name === "doctor") {
//                                    localStorage.setItem("key", data.token);
//                                    localStorage.setItem("image", data.image);
//                                    localStorage.setItem("clinicId", data.clinicId.id);
//                                    localStorage.setItem("userId", data.id);
//                                    window.location.href = "doctorIndex.jsp";
//                                } else if (data.roleId.name === "user") {
//                                    localStorage.setItem("key", data.token);
//                                    localStorage.setItem("image", data.image);
//                                    localStorage.setItem("user", JSON.stringify(data));
//                                    localStorage.setItem("userId", data.id);
//                                    localStorage.setItem("phone", data.phone);
//                                    window.location.href = "userIndex.jsp";
//                                }
                            },
                            error: function (jqXHR, textStatus, errorThrown) {
//                                console.log(data);
                                document.getElementById('message').style.color = 'red';
                                document.getElementById('message').innerHTML = '&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp Incorrect phone or password ✘';
                            }
                        });
                    }
                });
            });
        </script>

        <div class="main-wrapper account-wrapper">
            
            <div class="account-page">
                <div class="account-center">
                    <div class="account-box">
                        
                        <form id ="form-signin" class="form-signin">
                            <div class="account-logo">
                                <a href="#"><img src="assets/img/logo-dark.png" alt=""></a>
                            </div>
                            <div class="form-group">
                                <label>Phone</label>
                                <input type="text" id="user" name="user" class="form-control"/>
                                <span id='messageUsername'></span>
                            </div>

                            <div class="form-group">
                                <label>Password</label>
                                <input class="form-control" id="password" name="password" type="password" />
                                <span id='messagePassword'></span>
                            </div>
                            <span id='message'></span>
                            <!--                            <div class="form-group text-right">
                                                            <a href="forgot-password.html">Forgot your password?</a>
                                                        </div>-->


                            <!--                            <div class="text-center register-link">
                                                            Don’t have an account? <a href="register.html">Register Now</a>
                                                        </div>-->
                        </form>
                        <div class="form-group text-center">
                            <button id="login" type="submit" class="btn btn-primary account-btn">Login</button>
                        </div>
                        <div id="data"> </div>
                    </div>
                </div>
            </div>

        </div>
        <script src="assets/js/jquery-3.2.1.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/app.js"></script>
        <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>


    </body>

    <!-- login23:12-->
</html>