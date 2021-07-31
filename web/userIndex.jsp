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

            .sidebar-menu li#aHomeUser a {
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
            .blog-image img{
                display: block;
                position: relative;
                width: 100%;
                height: 230px;
            }
            .grid-blog .blog-content p {
                position: relative;
                height: 60px;
            }
            .clinicId{
                display: none;
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

    <%@include file="components/userHeader.html" %>
    <%@include file="components/userSidebar.html" %>
    <div class="page-wrapper">
        <div id="contentLoad" class="content">
            <div class="row">
                <div class="col-sm-8 col-4">
                    <h4 class="page-title">Popular Clinics</h4>
                </div>
                <!--                <div class="col-sm-4 col-8 text-right m-b-30">
                                    <a class="btn btn-primary btn-rounded float-right" href="add-clinic.jsp"><i class="fa fa-plus"></i> Add Clinic</a>
                                </div>-->
            </div>
            <form role="form" id="form-buscar">
                <!--                <div class="form-group">
                                    <div class="input-group ">
                                        <input onkeyup="myFunction()" id="searchClinic" class="custom-seach " type="text" name="search" placeholder="Search..." required/>
                                    </div>
                                </div>-->
            </form>
            <div id="pagination-1" class="row grid-blog">
                <!--                <div class="col-sm-6 col-md-6 col-lg-4 pagination__item">
                                    <div class="blog grid-blog">
                                        <div class="blog-image">
                                            <a href="clinic-details.jsp"><img class="img-fluid" src="assets/img/clinic/clinic-01.jpg" alt=""></a>
                                        </div>
                                        <div class="blog-content">
                                            <h3 class="blog-title"><a href="clinic-details.jsp">PHÒNG KHÁM ĐA KHOA THÀNH CÔNG</a></h3>
                                            <p>Địa chỉ: 36 Tây Thạnh ( đường CN4 KCN Tân Bình), P. Tây Thạnh, Q. Tân Phú, TP. HCM</p>
                                            <a href="clinic-details.jsp" class="read-more"><i class="fa fa-long-arrow-right"></i> Read More</a>
                                            <div class="blog-info clearfix">
                                                <div class="post-left">
                                                    <ul>
                                                        <li><a href="#."><i class="fa fa-calendar"></i> <span>December 6, 2019</span></a></li>
                                                    </ul>
                                                </div>
                                                <div class="post-right"><a href="#."><i class="fa fa-heart-o"></i>21</a> <a href="#."><i class="fa fa-eye"></i>8</a> <a href="#."><i class="fa fa-comment-o"></i>17</a></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>-->

            </div>
        </div>
        <div class="overlay"></div>
        <%@include file="components/userFooter.html" %>
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
            var x = "";
            function myFunction() {
                var input = document.getElementById("searchClinic");
                var filter = input.value.toLowerCase();
                var nodes = document.getElementsByClassName('col-sm-6 col-md-6 col-lg-4 pagination__item');
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
                        items_per_page: 6
                    });
                }
            }
            $(document).ajaxStop(function () {
                if (x !== "") {
                    $("div.row.grid-blog").html(x);
                    $('#pagination-1').paginate({
                        items_per_page: 6
                    });
                }

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
                $("div").removeClass("loading");
            });
            window.onload = function () {
                var token = localStorage.getItem("key");

                $.ajax({
                    type: "GET",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    headers: {
                        Authorization: 'Bearer ' + token},
                    url: "https://bt-application.herokuapp.com/api/clinic/getall",
                    success: function (data) {
                        $.each(data, function (index, item) {
                            $.ajax({
                                type: "GET",
                                dataType: "json",
                                contentType: "application/json; charset=utf-8",
                                headers: {
                                    Authorization: 'Bearer ' + token},
                                url: "https://bt-application.herokuapp.com/api/rating/findbyclinicid/" + item.id,
                                success: function (value) {
                                    if (value.length !== 0) {
                                        var count = 0;
                                        for (var i = 0; i < value.length; i++) {
                                            count += value[i].rate;
                                        }

                                        count = count / value.length;

                                        if (count > 3 && count < 3.5) {
                                            x = x + '<div id="clinicClick" class="col-sm-6 col-md-6 col-lg-4 pagination__item"><div class="blog grid-blog"><div class="blog-image"><a href="clinic-detailsUser.jsp"><img class="img-fluid" src=" '
                                                    + data[index].image + '" alt=""></a></div><div class="blog-content"><h3 class="blog-title"><a href="clinic-detailsUser.jsp">\n\ '
                                                    + data[index].name + '</a></h3><p>\n\ '
                                                    + data[index].address + ', ' + 'Quận ' + data[index].district + '</p><a href="clinic-detailsUser.jsp" class="read-more"><i class="fa fa-long-arrow-right"></i> Read More</a><div class="blog-info clearfix"><div class="post-left"><ul><li><i class="fa fa-check-circle"></i> <span class=' + index + '>'
                                                    + data[index].status + '</span><span class="clinicId">' + ' ' + data[index].id + '</span></li></ul></div><div class="post-right"><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star"></span><span class="fa fa-star"></span></div></div></div></div></div>';
                                        } else if (count > 3.5 && count < 4) {
                                            x = x + '<div id="clinicClick" class="col-sm-6 col-md-6 col-lg-4 pagination__item"><div class="blog grid-blog"><div class="blog-image"><a href="clinic-detailsUser.jsp"><img class="img-fluid" src=" '
                                                    + data[index].image + '" alt=""></a></div><div class="blog-content"><h3 class="blog-title"><a href="clinic-detailsUser.jsp">\n\ '
                                                    + data[index].name + '</a></h3><p>\n\ '
                                                    + data[index].address + ', ' + 'Quận ' + data[index].district + '</p><a href="clinic-detailsUser.jsp" class="read-more"><i class="fa fa-long-arrow-right"></i> Read More</a><div class="blog-info clearfix"><div class="post-left"><ul><li><i class="fa fa-check-circle"></i> <span class=' + index + '>'
                                                    + data[index].status + '</span><span class="clinicId">' + ' ' + data[index].id + '</span></li></ul></div><div class="post-right"><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star checked1"></span><span class="fa fa-star"></span></div></div></div></div></div>';
                                        } else if (count > 4 && count < 4.5) {
                                            x = x + '<div id="clinicClick" class="col-sm-6 col-md-6 col-lg-4 pagination__item"><div class="blog grid-blog"><div class="blog-image"><a href="clinic-detailsUser.jsp"><img class="img-fluid" src=" '
                                                    + data[index].image + '" alt=""></a></div><div class="blog-content"><h3 class="blog-title"><a href="clinic-detailsUser.jsp">\n\ '
                                                    + data[index].name + '</a></h3><p>\n\ '
                                                    + data[index].address + ', ' + 'Quận ' + data[index].district + '</p><a href="clinic-detailsUser.jsp" class="read-more"><i class="fa fa-long-arrow-right"></i> Read More</a><div class="blog-info clearfix"><div class="post-left"><ul><li><i class="fa fa-check-circle"></i> <span class=' + index + '>'
                                                    + data[index].status + '</span><span class="clinicId">' + ' ' + data[index].id + '</span></li></ul></div><div class="post-right"><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star"></span></div></div></div></div></div>';
                                        } else if (count > 4.5 && count < 5) {
                                            x = x + '<div id="clinicClick" class="col-sm-6 col-md-6 col-lg-4 pagination__item"><div class="blog grid-blog"><div class="blog-image"><a href="clinic-detailsUser.jsp"><img class="img-fluid" src=" '
                                                    + data[index].image + '" alt=""></a></div><div class="blog-content"><h3 class="blog-title"><a href="clinic-detailsUser.jsp">\n\ '
                                                    + data[index].name + '</a></h3><p>\n\ '
                                                    + data[index].address + ', ' + 'Quận ' + data[index].district + '</p><a href="clinic-detailsUser.jsp" class="read-more"><i class="fa fa-long-arrow-right"></i> Read More</a><div class="blog-info clearfix"><div class="post-left"><ul><li><i class="fa fa-check-circle"></i> <span class=' + index + '>'
                                                    + data[index].status + '</span><span class="clinicId">' + ' ' + data[index].id + '</span></li></ul></div><div class="post-right"><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star checked1"></span></div></div></div></div></div>';
                                        } else {
                                            x = x + '<div id="clinicClick" class="col-sm-6 col-md-6 col-lg-4 pagination__item"><div class="blog grid-blog"><div class="blog-image"><a href="clinic-detailsUser.jsp"><img class="img-fluid" src=" '
                                                    + data[index].image + '" alt=""></a></div><div class="blog-content"><h3 class="blog-title"><a href="clinic-detailsUser.jsp">\n\ '
                                                    + data[index].name + '</a></h3><p>\n\ '
                                                    + data[index].address + ', ' + 'Quận ' + data[index].district + '</p><a href="clinic-detailsUser.jsp" class="read-more"><i class="fa fa-long-arrow-right"></i> Read More</a><div class="blog-info clearfix"><div class="post-left"><ul><li><i class="fa fa-check-circle"></i> <span class=' + index + '>'
                                                    + data[index].status + '</span><span class="clinicId">' + ' ' + data[index].id + '</span></li></ul></div><div class="post-right"><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span></div></div></div></div></div>';
                                        }
                                    }
                                    $(document).on('click', '[id^="clinicClick"]', function () {

                                        var values = $(this).context.textContent.split(" ");

                                        var id = values[values.length - 1];
                                        if (item.id === id) {
                                            localStorage.setItem("clinicInf", JSON.stringify(item));
                                            localStorage.setItem("rating", JSON.stringify(value));
                                        }
                                    });
                                }})


                            inActive = data;
                        }
                        )



                    },
                    error: function (jqXHR, textStatus, errorThrown) {


                    }
                });
            }

//  ===============================================Loading Screen==================================================                          


            $(document).ajaxStart(function () {
                $("div").addClass("loading");
            });




        </script>
    </body>


    <!-- blog23:51-->
</html>