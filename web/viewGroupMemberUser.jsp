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

            .sidebar-menu li#aViewGroupUser a {
                color: #009efb;
                background-color: #e3e7e8;
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

            #btnSearch {
                font: normal normal normal 14px/1 FontAwesome;
                height: 37px;
                width: 80px;
                border: none;
                border-radius: 25px;
                background-color: #009efb;
                color: white;
                margin-left: 10px;
            }

            #txtSearch {
                height: 38px;
                width: 140px;
                border: 0.1px black solid;
                border-radius: 25px;
            }

            .divTable
            {
                border-radius: 10px;
                border: 1px solid lightgrey;
                margin-left: 10%;
                margin-bottom: 20px;
                width: 80%;
                height: 100px;
                background-color: white;
            }
            .left {
                width: 14%;
                height: 100%;
                /*background-color: red;*/
                float: left;
            }
            .right {
                width: 86%;
                height: 100%;
                /*background-color: yellow;*/
                float: left;
            }
            .top {
                padding-top: 2%;
                width: 100%;
                height: 50%;
                /*background-color: blue;*/
            }
            .bottom {
                width: 100%;
                height: 50%;
                /*background-color: pink;*/
            }
            a.action-icon.dropdown-toggle.top-right {
                float: left;
                width: 10%;
            }
            h2.group-name {
                float: left;
                width: 96%;
            }
            img.avatar {
                /*width: 130px;*/
                min-width: 100px;
                width: 65%;
                height: 100%;
                border-radius:10px;
            }
            @media screen and (max-width:800px) {
                .left {
                    width:40%; 
                }
                .right {
                    width:60%; 
                }
            }
            @media screen and (max-width:1250px) {
                .left {
                    width:20%; 
                }
                .right {
                    width:75%; 
                }
            }
            @media screen and (max-width:690px) {
                .left {
                    width:30%; 
                }
                .right {
                    width:70%; 
                }
            }
            .overlay{
                display: none;
                position: fixed;
                width: 100%;
                height: 100%;
                top: 0;
                left: 6%;
                z-index: 999;
                background:rgba(255,255,255,1)
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
        </style>

    </head>
    <%@include file="components/userHeader.html" %>
    <%@include file="components/userSidebar.html" %>
    <div class="page-wrapper">
        <div class="content">
            <div class="row">
                <div id="title" class="col-sm-4 col-3">
                    <h4 class="page-title">Group List</h4>
                </div>
                <div class="col-sm-8 col-9 text-right m-b-20">
                    <!--                        <input type="text" id="txtSearch" name="txtSearchMedicalInformation" value="" placeholder="&nbsp; Infomation ..."/>
                                            <button name="btnSearchMedicalInfo" id="btnSearch">Search</button>-->
                    <a href="createNewGroup.jsp" class="btn btn-primary btn-rounded float-right"><i class="fa fa-plus"> Create new group</i></a>
                </div>

            </div>
            <div id="pagination-1" class="row doctor-grid">

            </div>
        </div>
        <div class="overlay"></div>
    </div>

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

        window.onload = function () {
            var token = localStorage.getItem("key");
            var id = localStorage.getItem("userId");
            var x = "";
            var y = "";
            $.ajax({
                type: "GET",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                headers: {
                    Authorization: 'Bearer ' + token},
                url: "https://bt-application.herokuapp.com/api/userfamilygroup/findByUserId/" + id,
                success: function (data) {
                    $.each(data, function (index, item) {
                        $.ajax({
                            type: "GET",
                            dataType: "json",
                            contentType: "application/json; charset=utf-8",
                            headers: {
                                Authorization: 'Bearer ' + token},
                            url: "https://bt-application.herokuapp.com/api/userfamilygroup/count/" + item.familyGroupId.id,
                            success: function (values) {
                                var groupRole = data[index].groupRole;
                                if (groupRole === "Leader") {
                                    y = '<a class="dropdown-item" href="#" data-toggle="modal" data-target="#delete_doctor"><i class="fa fa-trash-o m-r-5"></i> Delete </a></div>';
                                } else if (groupRole === "Member") {
                                    y = '<a class="dropdown-item" href="#" data-toggle="modal" data-target="#view_doctor"><i class="fa fa-eye m-r-5"></i> View </a></div>';
                                }
                                x = x + '<div id="clickToDetail" class="divTable">'

                                        + '<div class="left"><a href="#">'
                                        + '<img class="avatar" src="' + item.familyGroupId.avatar + '"></a>'
                                        + '</div>'

                                        + '<div class="right">'
                                        + '<div class="top"><h2 class="group-name"><a ">' + item.familyGroupId.name + " " + '</a></h2>'
                                        + '<a data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v"></i></a>'
                                        + '<div class="dropdown-menu dropdown-menu-right">'
                                        + y
                                        + '</div>'

                                        + '<div class="bottom"><i class="fa fa-users"></i> Có ' + values + ' thành viên trong nhóm </div>'
                                        + '</div>'

                                        + '</div>';
                            }, error: function (jqXHR, textStatus, errorThrown) {
                            }});
                        $.ajax({
                            type: "GET",
                            dataType: "json",
                            contentType: "application/json; charset=utf-8",
                            headers: {
                                Authorization: 'Bearer ' + token},
                            url: "https://bt-application.herokuapp.com/api/userfamilygroup/findByGroupId/" + item.familyGroupId.id,
                            success: function (value) {
                                for (var i = 0; i < value.length; i++) {
                                    var check = value[i];
                                    if ((value[i].groupRole === "Leader") && (id === value[i].userId.id)) {
                                        $(document).on('click', '[id^="clickToDetail"]', function () {
                                            var values = $(this).context.textContent.replace("Delete", "").replace("Edit", "").split("   ");
                                            if (check.familyGroupId.name.trim() === values[0].trim()) {
                                                localStorage.setItem("familyGroupId", check.familyGroupId.id);
                                                window.location.href = "groupDetail.jsp";
                                            }
                                        });//end onClick funnction
                                    } else if (value[i].groupRole === "Member" && (id === value[i].userId.id)) {
                                        $(document).on('click', '[id^="clickToDetail"]', function () {
                                            var values = $(this).context.textContent.replace("View", "").replace("Edit", "").split("  ");
                                            if (check.familyGroupId.name.trim() === values[0].trim()) {
                                                localStorage.setItem("familyGroupId", check.familyGroupId.id);
                                                window.location.href = "groupUserDetail.jsp";
                                            }
                                        });//end onClick funnction
                                    } //end else if


                                }//end for
                            },
                            complete: function (jqXHR, textStatus) {

                            },
                            error: function (jqXHR, textStatus, errorThrown) {

                            }
                        });
                        $(document).ajaxComplete(function (event, request, settings) {
                            $("div.row.doctor-grid").html(x);
                            $('#pagination-1').paginate({
                                items_per_page: 4
                            });

                        });

                    });
                },
                error: function (jqXHR, textStatus, errorThrown) {

                }
            });
        };
        $(document).ajaxStart(function () {
            $("div").addClass("loading");
        });
        $(document).ajaxStop(function () {
            $("div").removeClass("loading");
        });
    </script>
</body>
</html>