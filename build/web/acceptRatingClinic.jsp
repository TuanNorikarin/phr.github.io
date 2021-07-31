<!DOCTYPE html>
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



            div.pagination__controls {
                padding-left: 46%;
            }
            .btn-primary{
                padding-top: 8px;
                padding-left: 7px;
                width: 150px;
                height: 37px;
                font-size: 14px;
            }
            .custom-btn{
                width: 20px;
                height: 37px;
                font-size: 14px;
            }
            a:hover{
                cursor: pointer;
            }

            .btn-success{
                border: 1px solid #1a7edb;
                background: #009efb;
                border-radius: 6px;
                font-size: 16px;
                margin-left: 5px;
                width: 100px;
            }

            .fa.fa-star.checked {
                color: yellow;
            }
            .fa.fa-star{
                color:gray;
            }
            .checked1 {

                background: linear-gradient(to left, gray 50%, yellow 50%);
                background-clip: text;
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;


            }
        </style>

    </head>
    <%@include file="components/header.html" %>
    <%@include file="components/sidebar.html" %>
    <div class="page-wrapper">
        <div class="content">
            <div class="row">
                <div id="title" class="col-sm-4 col-3">
                    <h4 class="page-title">Waiting Reviews</h4>
                </div>


            </div>

            <div class="widget blog-comments clearfix">

                <ul class="comments-list">
                    <li>
                        <div class="comment">
                            <div class="comment-author">
                                <img id='img' class="avatar" alt="" src="assets/img/user.jpg">
                            </div>
                            <div class="comment-block">
                                <span class="comment-by">
                                    <span class="blog-author-name"><span id='name'>Diana Bailey</span> <span>reviewed</span> <span id='nameClinic'>Name</span></span>

                                </span>
                                <div id='rating'>

                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star checked"></span>
                                    <span class="fa fa-star"></span>
                                    <span class="fa fa-star"></span>
                                </div>
                                <p id='comment'>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae, gravida pellentesque urna varius vitae. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae. Sed dui lorem, adipiscing in adipiscing et, interdum nec metus. Mauris ultricies, justo eu convallis placerat, felis enim ornare nisi, vitae mattis nulla ante id dui.</p>
                                <span id='time' class="blog-date">December 6, 2017</span>
                            </div>

                        </div>
                        <div class="bottom">
                            <button class="btn-success" name="btnAccept" id="btnAccept">Accept</button>
                            <button class="btn-success" name="btnRefuse" id="btnRefuse">Refuse</button>
                        </div>
                        </div>
                        <%@include file="components/footer.html" %>
                        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

                        <script type="text/javascript" src="assets/js/jQuery.paginate.js"></script>
                        <script src="assets/js/popper.min.js"></script>
                        <script src="assets/js/bootstrap.min.js"></script>
                        <script src="assets/js/jquery.slimscroll.js"></script>
                        <script src="assets/js/select2.min.js"></script>
                        <script src="assets/js/moment.min.js"></script>

                        <script src="assets/js/app.js"></script>
                        <script type="text/javascript">
                            var x = "";

                            var token = sessionStorage.getItem("key");
                            var request = JSON.parse(localStorage.getItem("request"));
                            $(document).ready(function () {
                                var count = 0;
                                console.log(request);
                                document.getElementById("name").innerHTML = request.userId.fullname;
                                document.getElementById("nameClinic").innerHTML = request.examinationId.clinicId.name;
                                document.getElementById("comment").innerHTML = request.comment;
                                var time = request.time.split("Z");
                                time = time[0].split("T");
                                document.getElementById("time").innerHTML = time[1] + " " + time[0];
                                $("#img").attr("src", request.userId.image);
                                count = request.rate;
                                if (count > 0.5 && count <= 1) {
                                    x = '<span class="fa fa-star checked1"></span><span class="fa fa-star"></span><span class="fa fa-star"></span><span class="fa fa-star"></span><span class="fa fa-star"></span>';
                                } else if (count > 1 && count <= 1.5) {
                                    x = '<span class="fa fa-star checked"></span><span class="fa fa-star"></span><span class="fa fa-star"></span><span class="fa fa-star"></span><span class="fa fa-star"></span>';
                                } else if (count > 1.5 && count <= 2) {
                                    x = '<span class="fa fa-star checked"></span><span class="fa fa-star checked1"></span><span class="fa fa-star"></span><span class="fa fa-star"></span><span class="fa fa-star"></span>';
                                } else if (count > 2 && count <= 2.5) {
                                    x = '<span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star"></span><span class="fa fa-star"></span><span class="fa fa-star"></span>';
                                } else if (count > 2.5 && count <= 3) {
                                    x = '<span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star checked1"></span><span class="fa fa-star"></span><span class="fa fa-star"></span>';
                                } else if (count > 3 && count <= 3.5) {
                                    x = '<span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star"></span><span class="fa fa-star"></span>';
                                } else if (count > 3.5 && count <= 4) {
                                    x = '<span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star checked1"></span><span class="fa fa-star"></span>';
                                } else if (count > 4 && count <= 4.5) {
                                    x = '<span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star"></span>';
                                } else if (count > 4.5 && count < 5) {
                                    x = '<span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star checked1"></span>';
                                } else {
                                    x = '<span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span>';
                                }
                                $("#rating").html(x);
                            });
                            $(document).on('click', '[id^="btnAccept"]', function () {

                                $.ajax({
                                    type: "PUT",
                                    dataType: "json",
                                    contentType: "application/json; charset=utf-8",
                                    headers: {
                                        Authorization: 'Bearer ' + token},
                                    data: JSON.stringify({
                                        "id": request.id,
                                        "comment": request.comment,
                                        "rate": request.rate,
                                        "time": request.time,
                                        "timeExpire": request.timeExpire,
                                        "status": "rated",
                                        "userId": {
                                            "id": request.userId.id
                                        },
                                        "examinationId": {
                                            "id": request.examinationId.id
                                        }
                                    }),
                                    url: "https://bt-application.herokuapp.com/api/rating/edit",
                                    complete: function (jqXHR, textStatus) {
                                        window.location.href = "adminIndex.jsp";
                                    }});
                            });
                            $(document).on('click', '[id^="btnRefuse"]', function () {

                                $.ajax({
                                    type: "PUT",
                                    dataType: "json",
                                    contentType: "application/json; charset=utf-8",
                                    headers: {
                                        Authorization: 'Bearer ' + token},
                                    data: JSON.stringify({
                                        "id": request.id,
                                        "comment": request.comment,
                                        "rate": request.rate,
                                        "time": request.time,
                                        "timeExpire": request.timeExpire,
                                        "status": "refuse",
                                        "userId": {
                                            "id": request.userId.id
                                        },
                                        "examinationId": {
                                            "id": request.examinationId.id
                                        }
                                    }),
                                    url: "https://bt-application.herokuapp.com/api/rating/edit",
                                    complete: function (jqXHR, textStatus) {
                                        window.location.href = "adminIndex.jsp";
                                    }});
                            });
                        </script>
                        </body>
                        </html>