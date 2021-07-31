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
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
        <link rel="stylesheet" type="text/css" href="assets/css/customStyle.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
        <style>
            .sidebar-menu li a {
                color: black;
                font-weight: 500;
            }

            .sidebar-menu li#aHistory a {
                color: #009efb;
                background-color: #e3e7e8;
            }
            div.dropdown.dropdown-action{
                float: right;
            }
            .custom-seach{
                width: 20%;
            }
        </style>
    </head>

    <%@include file="components/doctorHeader.html" %>
    <%@include file="components/doctorSidebar.html" %>

    <div class="page-wrapper">
        <div class="content">
            <div class="row">
                <div class="col-sm-4 col-3">
                    <h4 class="page-title">Search Test Result</h4>
                </div>

                <!--                <div class="col-sm-8 col-9 text-right m-b-20">
                                    <a href="add-testPackage.jsp" class="btn btn btn-primary btn-rounded float-right"><i class="fa fa-plus"></i> Add Test Package</a>
                                </div>-->
            </div>
            <div class="testShow">Name:&nbsp; <span id="testSearchName"></span></div>
            <form role="form" id="form-buscar">
                <div class="form-group">
                    <div class="input-group ">
                        <input id="textInputFrom" class="custom-seach " type="text" name="search" placeholder="From..." required/>&nbsp;&nbsp;&nbsp;
                        <input id="textInputTo" class="custom-seach " type="text" name="search" placeholder="To..." required/>

                    </div>
                </div>
            </form>
            <span class="input-group-btn">
                &nbsp;
                <button id="searchValue" class="btn btn-success custom-btn " type="submit">
                    <i class="fa fa-search"></i> Search
                </button>
            </span>
            <div class="row">
                <div class="col-md-12">
                    <div class="table-responsive">
                        <table id="checkRequestTable" class="table table-border table-striped custom-table datatable mb-0">
                            <thead>
                                <tr>
                                    <th style="width: 25%">Patient</th>

                                    <th style="width: 30%">Type</th>
                                    <th style="width: 30%">Time</th>
                                    <th style="width: 10%">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td id="name"></td>

                                    <td id="description"></td>
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
            var dataTestIdJSON = JSON.parse(localStorage.getItem("dataTestIdJSON"));
            var token = sessionStorage.getItem("key");
            var id = localStorage.getItem("userId");
            document.getElementById('testSearchName').innerHTML = dataTestIdJSON[0];
            $(".table-responsive").hide();
            $("#searchValue").click(function () {
                var arrayTestRequest = [];
                var arrayTestRequestTotal = [];
                $(".table-responsive").show();
                var textInputFrom = parseFloat($("#textInputFrom").val());
                var textInputTo = parseFloat($("#textInputTo").val());
                $.ajax({
                    type: "GET",
                    dataType: "json",
                    contentType: "application/json; charset=UTF-8",
                    headers: {
                        Authorization: 'Bearer ' + token},
                    url: "https://bt-application.herokuapp.com/api/testresultdetail/findbytestvalue/" + dataTestIdJSON[1] + "/" + textInputFrom + "/" + textInputTo,
                    success: function (data) {
                        var string = [];
                        var array = "";
                        var arrayTime = [];
                        for (var i = 0; i < data.length; i++) {
                            data[i].testResultId.testRequestId.examinationId.timeStart = data[i].testResultId.testRequestId.examinationId.timeStart.replace("T", " ");
                            data[i].testResultId.testRequestId.examinationId.timeStart = data[i].testResultId.testRequestId.examinationId.timeStart.replace("Z", "");
                            string = data[i].testResultId.testRequestId.examinationId.timeStart.split("-");
                            arrayTime = string[2].split(" ");
                            array = array + arrayTime[0] + "/";
                            array = array + string[1] + "/";
                            array = array + string[0] + " ";
                            array = array + arrayTime[1];
                            arrayTestRequest.push(data[i].testResultId.testRequestId.examinationId.userId.fullname);
                            arrayTestRequest.push(data[i].testResultId.testRequestId.examinationId.type);
                            arrayTestRequest.push(array);
                            arrayTestRequestTotal.push(arrayTestRequest);
                            arrayTestRequest = [];
                            array = "";
                        }

//                        var a = JSON.stringify(data);
                        $('#checkRequestTable tbody').on('click', 'button', function ()
                        {
                            var getStringClick = [];
                            var arrayClick = "";
                            arrayTimeClick = [];
                            var tr = $(this).closest("tr");
                            var rowindex = tr.index();
                            table = document.getElementById("checkRequestTable");
                            tr = table.getElementsByTagName("tr");
                            td = tr[rowindex + 1].getElementsByTagName("td")[2];
                            txtValue = td.textContent;
                            getStringClick = txtValue.split("/");
                            arrayTimeClick = getStringClick[2].split(" ");
                            arrayClick += arrayTimeClick[0] + "-";
                            arrayClick += getStringClick[1] + "-";
                            arrayClick += getStringClick[0] + " ";
                            arrayClick += arrayTimeClick[1];
                            for (var i = 0; i < data.length; i++) {
//                                console.log(data[i].timeStart);
                                if (data[i].testResultId.testRequestId.examinationId.timeStart === arrayClick) {
                                    localStorage.setItem("idExamination", data[i].testResultId.testRequestId.examinationId.userId.id);
                                    var dataTestRequestId = [];
                                    dataTestRequestId.push(data[i].testResultId.testRequestId);
                                    localStorage.setItem("dataTestRequestId", JSON.stringify(dataTestRequestId));
//                                    console.log(data[i].testResultId.testRequestId);
                                    $.ajax({
                                        type: "GET",
                                        dataType: "json",
                                        contentType: "application/json; charset=UTF-8",
                                        headers: {
                                            Authorization: 'Bearer ' + token},
                                        url: "https://bt-application.herokuapp.com/api/userinfor/" + data[i].testResultId.testRequestId.examinationId.doctorId,
                                        success: function (datas) {
                                            localStorage.setItem("dataDoctor", JSON.stringify(datas));
                                            window.location.href = "doctorViewMorePackageHistory.jsp";
                                        }})
                                }
                            }

                        }
                        );
//                        $('td').click(function () {
//                            var row_index = $(this).parent().index();
//
//                        });
////                                   
//
//
//
//                        var b = JSON.parse(a);
//
                        $('#checkRequestTable').DataTable({
                            data: arrayTestRequestTotal.sort(),
                            columns: [
                                {data: '0'},
                                {data: '1'},
                                {data: '2'},
                                {
                                    defaultContent: '<td><button> <a> Select</a> </button></td>'

                                }
                            ],
                            "bDestroy": true,
                            "bFilter": false,
                            "order": [[2, "asc"]]
                        });
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log(' Error in processing! ' + textStatus);
                    }

                })
            });
            ;
            $(document).ajaxStop(function () {
                $("div").removeClass("loading");
            });

        </script>
    </body>


    <!-- patients23:19-->
</html>