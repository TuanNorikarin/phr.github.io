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

    <%@include file="components/doctorHeader.html" %>
    <%@include file="components/doctorSidebar.html" %>

    <div class="page-wrapper">
        <div class="content">
            <div class="row">
                <div class="col-sm-4 col-3">
                    <h4 class="page-title">Patients List</h4>
                </div>

            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="table-responsive">

                        <table id="patientTable" class="table table-border table-striped custom-table datatable mb-0">

                            <thead>
                                <tr>
                                    <th style="width: 3%">Avatar</th>
                                    <th style="width: 15%">Name</th>
                                    <th style="width: 14%">Date of Birth</th>
                                    <th style="width: 30%">Address</th>

                                    <th style="width: 10%">Phone</th>
                                    <th style="width: 5%">Email</th>
                                    <th style="width: 10%">Status</th>
                                    <!--<th style="width: 3%" class="text-right">Action</th>-->
                                </tr>
                            </thead>

                            <tbody>

                                <tr>

                                    <td id="avatar"></td>
                                    <td id="name"></td>
                                    <td id="dob"></td>
                                    <td id="address"></td>
                                    <td id="phoneNum"></td>

                                    <td id="email"></td>
                                    <td id="status"></td>


<!--                                    <td  class="text-right">
                                        <div class="dropdown dropdown-action">
                                            <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v"></i></a>
                                            <div id="d" class="dropdown-menu dropdown-menu-right">
                                                <a class="dropdown-item" href="view-patientDoctor.jsp"><i class="fa fa-pencil m-r-5"></i> Edit</a>
                                            </div>
                                        </div>
                                    </td>-->
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
                var token = sessionStorage.getItem("key");
                var clinicId = localStorage.getItem("clinicId");
                clinicId = 9;
                $.ajax({
                    type: "GET",
                    dataType: "json",
                    contentType: "application/json; charset=UTF-8",
                    headers: {
                        Authorization: 'Bearer ' + token},
                    url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/patients/patient/clinic/" + clinicId,
                    success: function (data) {
                        var a = JSON.stringify(data);
                        $('#patientTable tbody').on('click', 'td', function ()
                        {
                            var tr = $(this).closest("tr");
                            var rowindex = tr.index();
                            table = document.getElementById("patientTable");
                            tr = table.getElementsByTagName("tr");
                            td = tr[rowindex + 1].getElementsByTagName("td")[4];
                            txtValue = td.textContent;
                            $.each(data, function (index, value) {
                                if (value.userId.phone === txtValue) {
                                    localStorage.setItem("dataPat", JSON.stringify(value.userId));
                                    console.log(value);
                                }
                            });

                        }
                        );
                        $('td').click(function () {
                            var row_index = $(this).parent().index();

                        });
//                                   



                        var b = JSON.parse(a);
//                        var uniqueArray = b
//                                .map(v => v['userId'])
//                                .map(v => v['id'])
//                                .map((v, i, array) => array.indexOf(v) === i && i)
//                                .filter(v => b[v])
//                                .map(v => b[v]);

                        $('#patientTable').DataTable({
                            data: b,
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
//                                {
//                                    defaultContent: '<td id="actionIcon" class="text-right"><div class ="dropdown dropdown-action"><a href = "" class="action-icon dropdown-toggle" data-toggle = "dropdown" aria-expanded = "false"> <i class = "fa fa-ellipsis-v" > </i></a><div id = "d" class = "dropdown-menu dropdown-menu-right" ><a class = "dropdown-item" href = "view-patientDoctor.jsp"> <i class = "fa fa-pencil m-r-5" > </i> View Detail</a></div></div></td>'
//
//                                },
                            ],
                            "bDestroy": true,
                            "bFilter": true,
                            language: {
                                search: 'Search:',
                                searchPlaceholder: ""
                            },
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
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log(' Error in processing! ' + textStatus);
                    }

                })
            };



        </script>


    </body>


    <!-- patients23:19-->
</html>