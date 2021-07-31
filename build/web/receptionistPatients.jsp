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

            .sidebar-menu li#aPatient a {
                color: #009efb;

                background-color: #e3e7e8;
            }
            div.dropdown.dropdown-action{
                float: right;

            }


        </style>
    </head>

    <%@include file="components/recepHeader.html" %>
    <%@include file="components/recepSidebar.html" %>

    <div class="page-wrapper">
        <div class="content">
            <div class="row">
                <div class="col-sm-4 col-3">
                    <h4 class="page-title">Patients List</h4>
                </div>
                <div class="col-sm-8 col-9 text-right m-b-20">
                    <a href="add-patientReceptionist.jsp" class="btn btn btn-primary btn-rounded float-right"><i class="fa fa-plus"></i> Add Patient</a>
                </div>
            </div>
            <input id="searchPatient" class="custom-seach " type="text" name="search" placeholder=" Search by Phone" required/>
            <button id="buttonPatient">Search</button>
            <div class="row">
                <div class="col-md-12">
                    <div class="">

                        <table id="patientTable" class="table table-border table-striped custom-table datatable mb-0">

                            <thead>
                                <tr>
                                    <th style="width: 3%">Avatar</th>
                                    <th style="width: 15%">Name</th>
                                    <th style="width: 14%">Date of Birth</th>
                                    <th style="width: 30%">Address</th>

                                    <th style="width: 10%">Phone</th>
                                    <th style="width: 5%">Gender</th>
                                    <th style="width: 10%">Status</th>
                                    <th style="width: 3%" class="text-right">Action</th>
                                </tr>
                            </thead>

                            <tbody>

                                <tr>

                                    <td id="avatar"></td>
                                    <td id="name"></td>
                                    <td id="dob"></td>
                                    <td id="address"></td>
                                    <td id="phoneNum"></td>

                                    <td id="gender"></td>
                                    <td id="status"></td>


                                    <td  class="text-right">
                                        <button type="button" class="btn btn-primary">Select patient</button>
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
            var dataTable;
//========================================== TÌm theo số điện thoại====================================================
            window.onload = function () {
                var token = localStorage.getItem("key");
                var clinicId = localStorage.getItem("clinicId");
                clinicId = 9;
                $('#buttonPatient').on('click', function () {
                    console.log('button clicked');
                    var searchPatientValue = $('#searchPatient').val();
                    $.ajax({
                        type: "GET",
                        dataType: "json",
                        contentType: "application/json; charset=UTF-8",
                        headers: {
                            Authorization: 'Bearer ' + token},
                        url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/patients/patient/account/" + searchPatientValue,
                        statusCode: {
                            200: function (data) {
                                console.log('data khi click:  ', data);
                                dataTable.clear();
                                dataTable.rows.add([data]);
                                dataTable.draw();
                            },
                            404: function () {
                                alert("Patient is not found!");
                            },
                            400: function () {
                                alert("Patient's phone can not null");
                            },
                        }
                    });
                });
//====================================================Load List Patient==========================================
                $.ajax({
                    type: "GET",
                    dataType: "json",
                    contentType: "application/json; charset=UTF-8",
//                    headers: {
//                        Authorization: 'Bearer ' + token},
                    headers: {
                        'Access-Control-Allow-Origin': '*'},
                    url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/patients/patient/clinic/" + clinicId,
                    statusCode: {
                        200: function (data) {
                            console.log('data khi load: ', data);
                            var listPatient = [];
                            data.forEach(element => {
                                var dataShow = new Object();
                                dataShow.id = element.id;
                                dataShow.image = element.image;
                                dataShow.name = element.name;
                                dataShow.dob = element.dob;
                                dataShow.address = element.address;
                                dataShow.phone = element.phone;
                                dataShow.gender = element.gender;
                                dataShow.status = element.status;

                                listPatient.push(dataShow);
                            });
                            console.log(listPatient);
                            dataTable = $('#patientTable').DataTable({
                                data: listPatient,
                                columns: [
                                    {data: "image",
                                        "render": function (data, type, row, meta) {
                                            return '<img width="35" height="35" src="' + data + '" class="rounded-circle m-r-5">';
                                        }},
                                    {data: 'name'},
                                    {data: 'dob'},
                                    {data: 'address'},
                                    {data: 'phone'},
                                    {data: 'gender'},
                                    {data: 'status'},
                                    {
                                        data: 'id',
                                        "render": function (data, type, row, meta) {
                                            return '<td  class="text-right"><button onclick="getPatientId(' + data + ')" type="button" class="btn btn-primary">Select patient</button></td>'
                                        }

                                    }
                                ],
                                "bDestroy": true,
                                "bFilter": false,
                                "createdRow": function (row, data, dataIndex) {
                                if (data.status === "disable") {
                                    console.log(row);
                                    $('td', row).css('color', '#b5b5b5');
                                    $('td', row).css('font-style', 'italic');
                                }
                                if (data.status === "enable") {
                                    $('td:eq(6)', row).css('color', '#2a9c31');
                                    $('td:eq(6)', row).css('font-weight', 'bolder');
                                }
                            }
                            });
                        },
                        400: function (jqXHR, textStatus, errorThrown) {
                            console.log(' Error in processing! ' + textStatus);
                        }
                    }

                });
            };//end load

            function getPatientId(id) {
                console.log(id);
                sessionStorage.setItem('patientId', id);
                window.location.href = "selectService.jsp";
            }





        </script>


    </body>


    <!-- patients23:19-->
</html>