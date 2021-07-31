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
            .sidebar-menu li a {
                color: black;
                font-weight: 500;
            }

            .sidebar-menu li#aGroup a {
                color: #009efb;
                /*background-color: #2a9c31;*/
                background-color: #e3e7e8;
            }
            div.dropdown.dropdown-action{
                float: right;
            }
            
        </style>
    </head>

    <%@include file="components/doctorHeader.html" %>
    <%@include file="components/doctorSidebar.html" %>

    <div class="page-wrapper">
        <div class="content">
            <div class="row">
                <div class="col-sm-4 col-3">
                    <h4 id="patientName" class="page-title">Request Detail</h4>
                </div>
                <!--                <div class="col-sm-8 col-9 text-right m-b-20">
                                    <a href="add-testPackage.jsp" class="btn btn btn-primary btn-rounded float-right"><i class="fa fa-plus"></i> Add Test Package</a>
                                </div>-->
            </div>
            <!--            <form role="form" id="form-buscar">
                            <div class="form-group">
                                <div class="input-group ">
                                    <input id="1" class="custom-seach " type="text" name="search" placeholder="Search..." required/>
                                    <span class="input-group-btn">
                                        &nbsp;
                                        <button class="btn btn-success custom-btn " type="submit">
                                            <i class="fa fa-search"></i> Search
                                        </button>
                                    </span>
                                </div>
                            </div>
                        </form>-->
            <div class="row">
                <div class="col-md-12">
                    <div class="table-responsive">
                        <table id="checkRequestTable" class="table table-border table-striped custom-table datatable mb-0">
                            <thead>
                                <tr>
                                    <th style="width: 35%">Test</th>


                                    <th style="width: 30%">Time</th>
                                    <th style="width: 10%">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td id="name"></td>


                                    <td id="date"></td>

                                    <td class="text-right">

                                    </td>
                                </tr>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="overlay"></div>
        <%@include file="components/doctorFooter.html" %>
        <script src="assets/js/jquery-3.2.1.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.slimscroll.js"></script>
        <script src="assets/js/select2.min.js"></script>
        <script src="assets/js/jquery.dataTables.min.js"></script>
        <script src="assets/js/dataTables.bootstrap4.min.js"></script>
        <script src="assets/js/moment.min.js"></script>
        <script src="assets/js/bootstrap-datetimepicker.min.js"></script>
        <script src="assets/js/app.js"></script>
        <script type="text/javascript">
            //==============================Loading Page=========================================
            $(document).ajaxStart(function () {
                $("div").addClass("loading");
            });
            $(document).ajaxStop(function () {
                $("div").removeClass("loading");
            });
             
            
            window.onload = function () {
                var token = localStorage.getItem("key");
                var id = localStorage.getItem("userId");
                var name = [];
                var arrayTestRequest = [];
                var arrayTestRequestTotal = [];
                var testInPackage = [];
                var dataTestRequestId = JSON.parse(localStorage.getItem("dataTestRequestId"));
                console.log(dataTestRequestId);
                var dataTestRequest = JSON.parse(localStorage.getItem("dataTestRequestId"));
                for (var i = 0; i < dataTestRequestId.length; i++) {
                    $.ajax({
                        type: "GET",
                        dataType: "json",
                        contentType: "application/json; charset=UTF-8",
                        headers: {
                            Authorization: 'Bearer ' + token},
                        url: "https://bt-application.herokuapp.com/api/testtestrequest/testrequestid/" + dataTestRequestId[i].id,
                        success: function (data) {
                            testInPackage = data;
                        }, error: function (jqXHR, textStatus, errorThrown) {

                        }})
                    $.ajax({
                        type: "GET",
                        dataType: "json",
                        contentType: "application/json; charset=UTF-8",
                        headers: {
                            Authorization: 'Bearer ' + token},
                        url: "https://bt-application.herokuapp.com/api/testtestrequest/findcountbytestrequestid/" + dataTestRequestId[i].id,
                        success: function (data) {
                            $.ajax({
                                type: "GET",
                                dataType: "json",
                                contentType: "application/json; charset=UTF-8",
                                headers: {
                                    Authorization: 'Bearer ' + token},
                                url: "https://bt-application.herokuapp.com/api/packagetest/findByCount/" + data,
                                success: function (data) {
                                    if (data.length > 0) {
                                        $.ajax({
                                            type: "GET",
                                            dataType: "json",
                                            contentType: "application/json; charset=UTF-8",
                                            headers: {
                                                Authorization: 'Bearer ' + token},
                                            url: "https://bt-application.herokuapp.com/api/packagetest/findbypackageid/" + data[0].id,
                                            success: function (data) {
                                                var x = 0;
                                                for (var i = 0; i < data.length; i++) {
                                                    for (var j = 0; j < testInPackage.length; j++) {
                                                        if (data[i].testId.id === testInPackage[j].testId.id)
                                                            x++;
                                                    }
                                                }
                                                if (x === data.length) {
                                                    name.push(data[0].packageId.name);
                                                } else {
                                                    name.push("Gói Xét Nghiệm Tự Chọn");
                                                }
                                                var string = [];
                                                var array = "";
                                                var arrayTime = [];
                                                for (var i = 0; i < dataTestRequest.length; i++) {
                                                    dataTestRequest[i].timeStart = dataTestRequest[i].timeStart.replace("T", " ");
                                                    dataTestRequest[i].timeStart = dataTestRequest[i].timeStart.replace("Z", "");
                                                    string = dataTestRequest[i].timeStart.split("-");
                                                    arrayTime = string[2].split(" ");
                                                    array = array + arrayTime[0] + "/";
                                                    array = array + string[1] + "/";
                                                    array = array + string[0] + " ";
                                                    array = array + arrayTime[1];
                                                    arrayTestRequest.push(array);
                                                    arrayTestRequest.push(name[i]);
                                                    arrayTestRequestTotal.push(arrayTestRequest);
                                                    arrayTestRequest = [];
                                                    array = "";
                                                }

                                                $('#checkRequestTable').DataTable({
                                                    data: arrayTestRequestTotal,
                                                    columns: [
                                                        {data: '1'},
                                                        {data: '0'},
                                                        {
                                                            defaultContent: '<td><button class="inputResult"> <a> Select</a> </button></td>'

                                                        }
                                                    ],
                                                    "bDestroy": true,
                                                    "bFilter": true
                                                });
                                            }, error: function (jqXHR, textStatus, errorThrown) {

                                            }})

                                    } else {

                                        name.push("Gói Xét Nghiệm Tự Chọn");
                                        var string = [];
                                        var array = "";
                                        var arrayTime = [];
                                        for (var i = 0; i < dataTestRequest.length; i++) {
                                            dataTestRequest[i].timeStart = dataTestRequest[i].timeStart.replace("T", " ");
                                            dataTestRequest[i].timeStart = dataTestRequest[i].timeStart.replace("Z", "");
                                            string = dataTestRequest[i].timeStart.split("-");
                                            arrayTime = string[2].split(" ");
                                            array = array + arrayTime[0] + "/";
                                            array = array + string[1] + "/";
                                            array = array + string[0] + " ";
                                            array = array + arrayTime[1];
                                            arrayTestRequest.push(array);
                                            arrayTestRequest.push(name[i]);
                                            arrayTestRequestTotal.push(arrayTestRequest);
                                            arrayTestRequest = [];
                                            array = "";
                                        }
                                            $('#checkRequestTable').DataTable({
                                                data: arrayTestRequestTotal,
                                                columns: [
                                                    {data: '1'},
                                                    {data: '0'},
                                                    {
                                                        defaultContent: '<td><button class="inputResult"> <a> Select</a> </button></td>'

                                                    }
                                                ],
                                                "bDestroy": true,
                                                "bFilter": true
                                            });
                                        }

                                    }
                                    , error: function (jqXHR, textStatus, errorThrown) {

                                }})

                        }, error: function (jqXHR, textStatus, errorThrown) {

                        }})


                }



//                        var a = JSON.stringify(data);
                $('#checkRequestTable tbody').on('click', 'button', function ()
                {
                    var getStringClick = [];
                    var arrayClick = "";
                    var arrayTimeClick = [];
                    var tr = $(this).closest("tr");
                    var rowindex = tr.index();
                    table = document.getElementById("checkRequestTable");
                    tr = table.getElementsByTagName("tr");
                    td = tr[rowindex + 1].getElementsByTagName("td")[1];
                    txtValue = td.textContent;
                    getStringClick = txtValue.split("/");
                    arrayTimeClick = getStringClick[2].split(" ");

                    arrayClick += arrayTimeClick[0] + "-";

                    arrayClick += getStringClick[1] + "-";

                    arrayClick += getStringClick[0] + " ";

                    arrayClick += arrayTimeClick[1];
                    for (var i = 0; i < dataTestRequest.length; i++) {
                        if (dataTestRequest[i].timeStart === arrayClick) {
                            localStorage.setItem("idExamination", dataTestRequest[i].examinationId.id);
                            localStorage.setItem("namePackage", name[i]);

                            window.location.href = "inputResult.jsp";
                        }
                    }

                }
                );
            }
            ;


        </script>
    </body>


    <!-- patients23:19-->
</html>