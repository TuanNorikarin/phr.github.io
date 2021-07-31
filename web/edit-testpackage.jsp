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

            .sidebar-menu li#aTest a {
                color: #009efb;
                /*background-color: #2a9c31;*/
                background-color: #e3e7e8;
            }
            .error {
                border-color: #FF0000 !important;
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
                    <h4 class="page-title">Add Test Package</h4>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-8 offset-lg-2">
                    <form id="myForm" >
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Name <span class="text-danger">*</span></label>
                                    <input class="form-control" id='inputName' name="name" type="text" >
                                    <span id='messageName'></span>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Description</label>
                                   <textarea style="resize:none" class="form-control" id='description' name="description"> </textarea>
                                    <span id='messageDes'></span>
                                </div>
                            </div>



                        </div>

                        <div class="m-t-20 text-center">
                            <button id="createTestIndex" class="btn btn-primary submit-btn">Update Text Package</button>

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
        <script src="assets/js/app.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.1/css/toastr.css" rel="stylesheet"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.1/js/toastr.js"></script>
        <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
        <script type="text/javascript">


// ======================================================Insert===============================================

            $(document).ready(function () {
                function uuidv4() {
                    return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
                        var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8);
                        return v.toString(16);
                    });
                }
                var token = localStorage.getItem("key");
                var testName = localStorage.getItem("testName");
                var allDataPackage = JSON.parse(localStorage.getItem("allDataPackage"));
                var dataPackage = JSON.parse(localStorage.getItem("dataPackage"));
                console.log(dataPackage);
                testName = "";
                localStorage.setItem("testName", testName);
                $("#inputName").click(function () {
                    $('#inputName').removeClass('error');
                    document.getElementById('messageName').innerHTML = '';
                });
                $("#description").click(function () {
                    $('#description').removeClass('error');
                    document.getElementById('messageDes').innerHTML = '';
                });
                $("#inputName").val(dataPackage.name);
                $("#description").val(dataPackage.description);
                $("#createTestIndex").click(function (event) {
                    event.preventDefault();
                    $('#inputName').removeClass('error');
                    document.getElementById('messageName').innerHTML = '';
                    $('#description').removeClass('error');
                    document.getElementById('messageDes').innerHTML = '';
                    var count = 0;
                    var name = $("input[name='name']").val(); //lấy giá trị trong input user
                    var description = $("textarea[name='description']").val();
                    for (var i = 0; i < allDataPackage.length; i++) {
                        if (allDataPackage[i].name === name && name !== dataPackage.name) {
                            count = 1;
                        }
                    }
                    if (name.length === 0) {
                        $('#inputName').addClass('error');
                        document.getElementById('messageName').style.color = 'red';
                        document.getElementById('messageName').innerHTML = 'Name is empty ✘';
                        if (description.length > 255) {
                            $('#description').addClass('error');
                            document.getElementById('messageDes').style.color = 'red';
                            document.getElementById('messageDes').innerHTML = 'Description must be less than 255 letters ✘';
                        }
                    } else if (name.length > 50) {
                        $('#inputName').addClass('error');
                        document.getElementById('messageName').style.color = 'red';
                        document.getElementById('messageName').innerHTML = 'Name must be less than 50 letters ✘';
                        if (description.length > 255) {
                            $('#description').addClass('error');
                            document.getElementById('messageDes').style.color = 'red';
                            document.getElementById('messageDes').innerHTML = 'Description must be less than 255 letters ✘';
                        }
                    } else if (count === 1) {
                        $('#inputName').addClass('error');
                        document.getElementById('messageName').style.color = 'red';
                        document.getElementById('messageName').innerHTML = 'Name already exists ✘';
                        if (description.length > 255) {
                            $('#description').addClass('error');
                            document.getElementById('messageDes').style.color = 'red';
                            document.getElementById('messageDes').innerHTML = 'Description must be less than 255 letters ✘';
                        }
                    } else if (description.length > 255) {
                        $('#description').addClass('error');
                        document.getElementById('messageDes').style.color = 'red';
                        document.getElementById('messageDes').innerHTML = 'Description must be less than 255 letters ✘';
                    } else {
                        toastr["success"]("Create Successfully!", "Success", {"progressBar": true, "closeButton": true, "positionClass": "toast-top-full-width"});
                        console.log(dataPackage.id);
                        $.ajax({
                            type: "PUT",
                            dataType: "json",
                            contentType: "application/json; charset=utf-8",
                            headers: {
                                Authorization: 'Bearer ' + token},
                            data: JSON.stringify({
                                "id": dataPackage.id,
                                "name": name,
                                "description": description,
                                "status": "active"
                            }),
                            url: "https://bt-application.herokuapp.com/api/package",
                            complete: function (jqXHR) {
                                console.log(jqXHR.status);
                                if (jqXHR.status === 200) {
                                    window.location.href = "test.jsp";
                                }
                            }
                        });
                    }
                });
            });

        </script>
    </body>


    <!-- add-patient24:07-->
</html>
