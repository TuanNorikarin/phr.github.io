<html lang="en">


    <!-- blog23:34-->
    <head>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/logo-dark.png">
        <title>PHR - Manage Personal Health Record</title>
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

            .sidebar-menu li#aDoctor a {
                color: #009efb;
                /*background-color: #2a9c31;*/
                background-color: #e3e7e8;
            }
            i.fa.fa-bars{
                padding-top: 14px;
            }

            .custom-seach{
                border-radius: 15px;
                width: 35% !important;
                height: 35px;
                font-size: 16px;

            }
            .btn-primary{
                width: 105px;
                height: 30px;
                font-size: 14px;
            }
            .custom-btn{
                width: 80px;
                height: 35px;
                font-size: 14px;
            }
            span.status.online{
                left: 14px;
                top: 16px;
            }
            .doctorID{
                display: none;
            }


            .overlay{
                display: none;
                position: fixed;
                width: 100%;
                height: 100%;
                top: 0;
                left: 6%;
                z-index: 999;
                background:rgba(255,255,255,0.5)
                    url("assets/img/loadingscreen2.gif") center no-repeat;
            }
            /* Turn off scrollbar when body element has the loading class */
            div.loading{
                overflow: hidden;   
            }
            /* Make spinner image visible when body element has the loading class */
            div.loading.overlay{
                display: block;

            }
            #colorIcon{
                color: #009efb;
            }

            div.doc-prof1{
                font-size: 14px;
                font-weight: bold;
            }
        </style>
    </head>
    <%@include file="components/header.html" %>
    <%@include file="components/sidebar.html" %>
    <div class="page-wrapper">
        <div id="contentLoad" class="content">
            <div class="row">
                <div class="col-sm-4 col-3">
                    <h4 class="page-title">Doctors</h4>
                </div>
                <div class="col-sm-8 col-9 text-right m-b-20">
                    <a href="add-doctor.jsp" class="btn btn-primary btn-rounded float-right"><i class="fa fa-plus"></i> Add Doctor</a>
                </div>

            </div>
            <form role="form" id="form-buscar">
                <div class="form-group">
                    <div class="input-group ">
                        <input onkeyup="myFunction()" id="searchDoctor" class="custom-seach " type="text" name="search" placeholder=" Search..." required/>
                        
                    </div>
                </div>
            </form>
            <div id="pagination-1" class="row doctor-grid">

                <!--                <div class="col-md-4 col-sm-4 col-lg-3 pagination__item">
                                    <div class="profile-widget">
                                        <div class="doctor-img">
                                            <a class="avatar" href="profileDoctor.jsp"><img alt="" src="assets/img/doctor-thumb-03.jpg"></a>
                                        </div>
                                        <div class="dropdown profile-action">
                                            <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v"></i></a>
                                            <div class="dropdown-menu dropdown-menu-right">
                                                <a class="dropdown-item" href="edit-doctor.html"><i class="fa fa-pencil m-r-5"></i> Edit</a>
                                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#delete_doctor"><i class="fa fa-trash-o m-r-5"></i> Delete</a>
                                            </div>
                                        </div>
                                        <h4 class="doctor-name text-ellipsis"><a href="profileDoctor.jsp">Tuấn Norikarin</a></h4>
                                        <div class="doc-prof">Gynecologist</div>
                                        <div class="user-country">
                                            <i class="fa fa-map-marker"></i> Tân An, Long An
                                        </div>
                                    </div>
                                </div> 
                -->

            </div>

        </div>
        <div class="overlay"></div>
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
                            var inActive = "";
                            function myFunction() {
                                var input = document.getElementById("searchDoctor");
                                var filter = input.value.toLowerCase();
                                var nodes = document.getElementsByClassName('col-md-4 col-sm-4 col-lg-3 pagination__item');
                                for (i = 0; i < nodes.length; i++) {
                                    if (nodes[i].innerText.toLowerCase().includes(filter)) {
                                        nodes[i].style.display = "inline-block";
                                        $(".pagination__controls").remove();
                                    } else {
                                        nodes[i].style.display = "none";
                                        $(".pagination__controls").remove();
                                    }
                                }
                                if (filter === "") {
                                    $('#pagination-1').paginate({
                                        items_per_page: 19
                                    });
                                }
                            }
                            $(document).ajaxStart(function () {
                                $("div").addClass("loading");
                            });
                            $(document).ajaxStop(function () {
                                $("div").removeClass("loading");
                                for (var i = 0; i < inActive.length; i++) {
                                    if (inActive[i].status === "Inactive") {
                                        $("." + i).css("color", "gray");
                                        $("." + i).css("font-size", "14");
                                        $("." + i).css("font-weight", "bold");
                                    } else {
                                        $("." + i).css("color", "green");
                                        $("." + i).css("font-size", "14");
                                        $("." + i).css("font-weight", "bold");
                                    }

                                }

                            });
                            
                            window.onload = function () {
                                var token = sessionStorage.getItem("key");
                                $.ajax({
                                    type: "GET",
                                    dataType: "json",
                                    contentType: "application/json",
                                    url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/doctors/doctors",
                                    success: function (data) {
                                        localStorage.setItem("alluser", JSON.stringify(data));
                                    }});

                                $.ajax({
                                    type: "GET",
                                    dataType: "json",
                                    contentType: "application/json; charset=utf-8",
                                    headers: {
                                        Authorization: 'Bearer ' + token},
                                    url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/doctors/doctors",
                                    success: function (data) {
//                                        localStorage.setItem("dataDoctor", JSON.stringify(data));
                                        var x = "";
                                        $.each(data, function (index, item) {
                                            localStorage.setItem("infoDoctor", JSON.stringify(item));

                                            $(document).on('click', '[id^="delete"]', function () {
                                                var values = $(this).context.getAttribute("value");
                                                if (item.id === values) {
                                                    $.ajax({
                                                        type: "PUT",
                                                        dataType: "json",
                                                        contentType: "application/json; charset=UTF-8",
                                                        headers: {
                                                            Authorization: 'Bearer ' + token},
                                                        data: JSON.stringify({
//                                                            "address": item.address,
                                                            "gender": item.gender,
                                                            "dob": item.dob,
                                                            "name": item.name,
                                                            "id": item.id,
                                                            "password": item.password,
                                                            "status": "disable",
                                                            "image": item.image,
                                                            "token": item.token,
                                                            
                                                            
                                                        }),
                                                        url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/doctors/doctor",
                                                        complete: function (jqXHR) {
                                                            if (jqXHR.status === 200 || jqXHR.status === 201) {
                                                                window.location.href = "doctors.jsp";
                                                            }
                                                        }
                                                    });
                                                }
                                            });
                                            x = x + '<div id="testClick" class="col-md-4 col-sm-4 col-lg-3 pagination__item"><div class="profile-widget"><div class="doctor-img"><a id="avaDoctor" class="avatar" onclick="getDoctor('+data[index].id+')" href="profileDoctorForAdmin.jsp"><img alt="" src="'
                                                    + data[index].image + '"></a></div><div class="dropdown profile-action"><a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v"></i></a><div class="dropdown-menu dropdown-menu-right"><a class="dropdown-item" onclick="getDoctor('+data[index].id+')" href="edit-doctor.jsp"><i class="fa fa-pencil m-r-5"></i> Edit</a><a id="delete" value="' + data[index].id + '" class="dropdown-item" href="#" data-toggle="modal" data-target="#delete_doctor"><i class="fa fa-trash-o m-r-5"></i> Delete</a></div></div><h4 class="doctor-name text-ellipsis"><a class="fullName" href="">'
                                                    + data[index].name + '</a></h4><div class="' + index + '">'
                                                    + data[index].status + '</div><div class="user-country"><i id="colorIcon" class="fa fa-hospital-o"></i>  '
                                                    + data[index].clinicName + '</div><div class="doctorId">' + ' ' + data[index].id + '</div></div></div>'
                                            inActive = data;
                                            console.log( data);
                                        }
                                        )
                                        $("div.row.doctor-grid").html(x);
                                        $('#pagination-1').paginate({
                                            items_per_page: 19
                                        });
                                    },
                                    error: function (jqXHR, textStatus, errorThrown) {


                                    }
                                });

                            }


                            function getDoctor(data, item){
                                alert(data);
//                                localStorage.setItem("infoDoctor", JSON.stringify(item));
                                localStorage.setItem("dataDoctor", JSON.stringify(data));
                            }
                           

        </script>

    </body>


    <!-- doctors23:17-->
</html>