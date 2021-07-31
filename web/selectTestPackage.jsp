<!DOCTYPE html>
<html lang="en">


    <!-- blog23:34-->

    <head>
        <%@page contentType="text/html" pageEncoding="UTF-8" %>
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

            .sidebar-menu li#aTestRequest a {
                color: #009efb;
                /*background-color: #2a9c31;*/
                background-color: #e3e7e8;
            }

            .selectPackage {
                float: right;
            }

            #patientTable {
                width: 100% !important;
            }

            #description {
                display: none;
            }
        </style>
    </head>

    <%@include file="components/recepHeader.html" %>
    <%@include file="components/recepSidebar.html" %>

    <div class="page-wrapper">
        <div class="content">
            <div class="row">
                <div class="col-sm-4 col-3">
                    <h4 class="page-title">Test Package</h4>
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
                        <table id="patientTable"
                               class="table table-border table-striped custom-table datatable mb-0">
                            <thead>
                                <tr>
                                    <th style="width: 25%">Name</th>

                                    <th style="width: 70%">Description</th>


                                    <th style="width: 5%" class="text-right">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td id="name"></td>

                                    <td id="description"></td>

                                    <td>
                                        <button class="selectPackage"> <a> Select</a> </button>
                                    </td>
                                </tr>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="components/recepFooter.html" %>
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

            window.onload = function () {

                var token = localStorage.getItem("key");
                var allData;


                $.ajax({
                    type: "GET",
                    dataType: "json",
                    contentType: "application/json; charset=UTF-8",
                    headers: {
                        // Authorization: 'Bearer ' + token
                        'Access-Control-Allow-Origin': '*'
                    },
                    url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/packages/packages",
                    success: function (data) {
                        console.log(data);
                        allData = $('#patientTable').DataTable({
                            data: data,
                            columns: [
                                {data: 'name'},
                                {data: 'description'},
                                {
                                    data: 'id',
                                    "render": function (data, type, row, meta) {
                                        return '<td><button type="button" onclick="getpackageId(' + data + ')" class="btn btn-success">Select</button></td>'
                                    }
                                }
                            ],
                            "bDestroy": true,
                            "bFilter": true,
                            select: {
                                style: 'single'
                            }
                        });
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log(' Error in processing! ' + textStatus);
                    }

                });
            };

            /*
             
             */
            function getpackageId(id) {
                var ids = sessionStorage.getItem('listTestId');
                if (ids !== null) {
                    var listTestId = ids.split(",");
                }
                console.log(listTestId);
                var listTestDouple = [];
                $.ajax({
                    type: "GET",
                    dataType: "json",
                    contentType: "application/json; charset=UTF-8",
                    headers: {
                        // Authorization: 'Bearer ' + token
                        'Access-Control-Allow-Origin': '*'
                    },
                    url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/package-tests/package-detail/" + id,
                    success: function (data) {
                        console.log(data);
                        for (var i = 0; i < data.length; i++) {
                            let id = data[i].id.toString();
                            console.log(typeof (id));
                            for (var j = 0; j < listTestId.length; j++) {
                                console.log(listTestId[j]);
                                if (id === listTestId[j]) {
                                    listTestDouple.push(j);

                                }
                            }
                        }
                        if (listTestDouple.length !== 0) {
                            let flag = true;

                            while (flag) {
                                if (confirm('Some test you choice have been in package, do you want to remove them?')) {
                                    flag = false;
                                } else {
                                }
                            }
                        }

                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log(' Error in processing! ' + textStatus);
                    }
                });
                sessionStorage.setItem('packageId', id);
                if (confirm('Do you want to choose some other testing services?')) {
                    window.location.href = "selectTestManual.jsp";
                } else {
                    window.location.href = "createExamination.jsp";
                }
            }
        </script>
    </body>


    <!-- patients23:19-->

</html>