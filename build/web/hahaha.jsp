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
                                   
                                    <div class="main-wrapper account-wrapper">
                                        <form id="form" action="parse">
                                            <textarea id="jwtEn" name="jwt"></textarea>
                                            <textarea id="jwtDe" name="out"></textarea>
                                        <input type="submit" value="parse" />
                                    </form>

                                    </div>
                                    <script src="assets/js/jquery-3.2.1.min.js"></script>
                                    <script src="assets/js/popper.min.js"></script>
                                    <script src="assets/js/bootstrap.min.js"></script>
                                    <script src="assets/js/app.js"></script>
                                    <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>
                                    <script type="text/javascript">
                                        $(document).ready(function () {
                                            var key = "eyJhbGciOiJIUzI1NiJ9.eyJleHAiOjE2Mjc3NjA2ODgsInVzZXIiOnsicGFzc3dvcmQiOm51bGwsImF1dGhvcml0aWVzIjpbIkFETUlOIl0sInVzZXJuYW1lIjoiMDExMTQ1Njc4OSJ9fQ.fKqZFgGqUSKDwO1__-UGTrFGQTeWP90uJboEYUv7p7g";                                               
                                            var jsonPayload = str => decodeURIComponent(Array.prototype.map.call(atob(str), c =>
                                                        '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2)
                                                        ).join(''));

                                            var parseJwt = token => JSON.parse(
                                                      jsonPayload(token.split('.')[1].replace('-', '+').replace('_', '/'))
                                                    );
                                            var form = document.getElementById("form");
                                                  form.addEventListener("submit", (e) => {
                                                      
                                                     form.out.value = JSON.stringify(
                                                        parseJwt(key)
                                                     )
                                                     e.preventDefault();
                                                  })
                                        });
                                    </script>

                                </body>

                                <!-- login23:12-->
                                </html>