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

            .sidebar-menu li#aTest a {
                color: #009efb;
                /*background-color: #2a9c31;*/
                background-color: #e3e7e8;
            }
            div.dropdown.dropdown-action{
                float: right;
            }
             #patientTable {
                width: 100% !important;
            }
            #description{
                display: none;    
            }
        </style>
    </head>

    <%@include file="components/doctorHeader.html" %>
    <%@include file="components/doctorSidebar.html" %>

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
                        <table id="patientTable" class="table table-border table-striped custom-table datatable mb-0">
                            <thead>
                                <tr>
                                    <th style="width: 25%">Name</th>

                                    <th id='description' style="width: 30%">Description</th>


                                    <th style="width: 5%" class="text-right">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td id="name"></td>

                                    <td id="description"></td>

                                    <td class="text-right">
                                        <div class="dropdown dropdown-action">
                                            
                                        </div>
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
                var token = sessionStorage.getItem("key");
                $.ajax({
                    type: "GET",
                    dataType: "json",
                    contentType: "application/json; charset=UTF-8",
                    headers: {
                        Authorization: 'Bearer ' + token},
                    url: "https://bt-application.herokuapp.com/api/package/getall",
                    success: function (data) {
                        var a = JSON.stringify(data);
                        $('#patientTable tbody').on('click', 'td', function ()
                        {
                            var tr = $(this).closest("tr");
                            var rowindex = tr.index();
                            table = document.getElementById("patientTable");
                            tr = table.getElementsByTagName("tr");
                            td = tr[rowindex + 1].getElementsByTagName("td")[0];
                            txtValue = td.textContent;
                            $.each(data, function (index, value) {
                                console.log(value.name);
                                if (value.name === txtValue) {
                                    localStorage.setItem("dataPackage", JSON.stringify(value));
                                }
                            });

                        }
                        );
                        $('td').click(function () {
                            var row_index = $(this).parent().index();

                        });
//                                   



                        var b = JSON.parse(a);

                        $('#patientTable').DataTable({
                            data: b,
                            columns: [
                                {data: 'name'},
                                {data: 'description'},
                                {
                                    defaultContent: '<td id="actionIcon" class="text-right"><div class ="dropdown dropdown-action"><a href = "#" class="action-icon dropdown-toggle" data-toggle = "dropdown" aria-expanded = "false"> <i class = "fa fa-ellipsis-v" > </i></a><div id = "d" class = "dropdown-menu dropdown-menu-right" ><a class = "dropdown-item" href = "test-detailDoctor.jsp"> <i class="fa fa-plus"></i> View Package Detail</a></div></div></td>'

                                }
                            ],
                            "bDestroy": true,
                            "bFilter": true,
                            "createdRow": function (row, data, dataIndex) {
                                $('td:eq(1)', row).css('display', 'none');
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