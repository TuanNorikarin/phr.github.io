<!DOCTYPE html>
<html lang="en">


    <!-- blog23:34-->
    <head>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
        <title>PHR - Manage Personal Health Record</title>
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

            .sidebar-menu li#aClinic a {
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
            div.blog-content{
                font-size: 16px;
            }
            #clinicDescription{
                margin-left: 25px;
            }
            .blog-view{
                width: 150%;
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
                <div class="col-sm-12">
                    <h4 class="page-title">Clinic's Information</h4>
                </div>
            </div>
            <div class="row">
                <div class="col-md-8">
                    <div class="blog-view">
                        <article class="blog blog-single-post">
                            <h3 id="clinicTitle" class="blog-title"></h3>
                            <div class="blog-info clearfix">
                                <div class="post-left">
                                    <ul>
                                        <li><a href="#."><i class="fa fa-user-o"></i> By <span id="userAdd"></span></a></li>
                                    </ul>
                                </div>
                                <div class="post-right"><a href="#."><i  class="fa fa-comment-o"></i><span id="icomments"></span></a></div>
                            </div>
                            <div class="blog-image">
                                <a href="#."><img id="clinicImg" alt="" src="" class="img-fluid"></a>
                            </div>
                            <div class="blog-content">

                                <div>
                                    Địa chỉ: <span id="clinicAddress"></span>
                                </div>
                                <div>
                                    Quận: <span id="clinicDistrict"></span>
                                </div>
                                <div>
                                    Điện thoại: <span id="clinicPhone"></span>
                                </div>
                                <div>
                                    Thời gian làm việc: <br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;+Thứ hai đến thứ bảy: 7:30 – 19:30.
                                    <br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;+Chủ nhật: 7:30 – 11:30.
                                    <br/>
                                    <br/>
                                </div>

                                <div>
                                    Giới thiệu: <br/> <span id="clinicDescription"></span>
                                </div>

                            </div>
                        </article>
                        <div id='rating' class="widget blog-share clearfix">
                            <h3>Rating</h3>
                            <span class="fa fa-star"></span>
                            <span class="fa fa-star"></span>
                            <span class="fa fa-star"></span>
                            <span class="fa fa-star"></span>
                            <span class="fa fa-star"></span>
                        </div>

                        <div class="widget blog-comments clearfix">
                            <h3>Comments (<span id="comments">0</span>) </h3> 
                            <ul id='listComment' class="comments-list">
                                <li>
                                    <div class="comment">
                                        <div class="comment-author">
                                            <img class="avatar" alt="" src="assets/img/user.jpg">
                                        </div>
                                        <div class="comment-block">
                                            <span class="comment-by">
                                                <span class="blog-author-name">Diana Bailey</span>
                                            </span>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae, gravida pellentesque urna varius vitae. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae. Sed dui lorem, adipiscing in adipiscing et, interdum nec metus. Mauris ultricies, justo eu convallis placerat, felis enim ornare nisi, vitae mattis nulla ante id dui.</p>
                                            <span class="blog-date">December 6, 2017</span>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>

                    </div>
                </div>

            </div>
        </div>
        <%@include file="components/footer.html" %>
        <script src="assets/js/jquery-3.2.1.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.slimscroll.js"></script>
        <script src="assets/js/app.js"></script>
        <script  type="text/javascript">

            window.onload = function () {
                var userInf = JSON.parse(localStorage.getItem("userInformation"));
                var clinicInf = JSON.parse(localStorage.getItem("clinicInf"));
                var dataClinic = JSON.parse(localStorage.getItem("dataClinic"));
                console.log(clinicInf +" dsds");
                console.log(dataClinic +" id");
                var rating = JSON.parse(localStorage.getItem("rating"));
                console.log(rating);
                var x = "";
                var y = "";
                var count = 0
                for (var i = 0; i < rating.length; i++) {
                    count += rating[i].rate;
                }
                count = count / rating.length;
                console.log(count);
                if (Number.isNaN(count)) {
                    console.log(Number.isNaN(count));
                    count = 0;
                }
                if (count < 0.5) {
                    x = '<h3>Rating</h3><span class="fa fa-star"></span><span class="fa fa-star"></span><span class="fa fa-star"></span><span class="fa fa-star"></span><span class="fa fa-star"></span>';
                } else if (count > 0.5 && count < 1) {
                    x = '<h3>Rating</h3><span class="fa fa-star checked1"></span><span class="fa fa-star"></span><span class="fa fa-star"></span><span class="fa fa-star"></span><span class="fa fa-star"></span>';
                } else if (count > 1 && count < 1.5) {
                    x = '<h3>Rating</h3><span class="fa fa-star checked"></span><span class="fa fa-star"></span><span class="fa fa-star"></span><span class="fa fa-star"></span><span class="fa fa-star"></span>';
                } else if (count > 1.5 && count < 2) {
                    x = '<h3>Rating</h3><span class="fa fa-star checked"></span><span class="fa fa-star checked1"></span><span class="fa fa-star"></span><span class="fa fa-star"></span><span class="fa fa-star"></span>';
                } else if (count > 2 && count < 2.5) {
                    x = '<h3>Rating</h3><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star"></span><span class="fa fa-star"></span><span class="fa fa-star"></span>';
                } else if (count > 2.5 && count < 3) {
                    x = '<h3>Rating</h3><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star checked1"></span><span class="fa fa-star"></span><span class="fa fa-star"></span>';
                } else if (count > 3 && count < 3.5) {
                    x = '<h3>Rating</h3><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star"></span><span class="fa fa-star"></span>';
                } else if (count > 3.5 && count < 4) {
                    x = '<h3>Rating</h3><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star checked1"></span><span class="fa fa-star"></span>';
                } else if (count > 4 && count < 4.5) {
                    x = '<h3>Rating</h3><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star"></span>';
                } else if (count > 4.5 && count < 5) {
                    x = '<h3>Rating</h3><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star checked1"></span>';
                } else {
                    x = '<h3>Rating</h3><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span>';
                }
                for (var j = 0; j < rating.length; j++) {
                    var time = rating[j].time.split("T");
                    y += '<li><div class="comment"><div class="comment-author">'
                            + '<img class="avatar" alt="" src=' + rating[j].userId.image + '></div>'
                            + '<div class="comment-block"><span class="comment-by">'
                            + '<span class="blog-author-name">' + rating[j].userId.fullname + '</span></span>'
                            + '<p>' + rating[j].comment + '</p>'
                            + '<span class="blog-date">' + time[0] + '</span></div></div></li>';
                }
                $("#rating").html(x);
                $("#comments").html(rating.length);
                $("#icomments").html(rating.length);
                $("#listComment").html(y);
                $('#clinicImg').attr('src', clinicInf.image);
//                document.getElementById("userAdd").innerHTML = userInf.username;
                document.getElementById("clinicTitle").innerHTML = clinicInf.name;
                document.getElementById("clinicAddress").innerHTML = clinicInf.address;
                document.getElementById("clinicDistrict").innerHTML = clinicInf.district;
                document.getElementById("clinicPhone").innerHTML = clinicInf.phone;
                if (!clinicInf.description) {
                    document.getElementById("clinicDescription").innerHTML = "..."

                } else {
                    document.getElementById("clinicDescription").innerHTML = clinicInf.description;
                }
            }
        </script>

    </body>


    <!-- blog-details23:56-->
</html>