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
                    <h4 class="page-title">Waiting Requests</h4>
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
                    <div class="">
                        <table id="checkRequestTable" class="table table-border table-striped custom-table datatable mb-0">
                            <thead>
                                <tr>
                                    <th style="width: 30%">Patient</th>
                                    <th style="width: 60%">Description</th>
                                    <th style="width: 10%">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td id="name"></td>
                                    <td id="description"></td>
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
        <script src="https://cdn.datatables.net/plug-ins/1.10.15/dataRender/datetime.js"></script>
        <script type="text/javascript">
            //==============================Loading Page=========================================
            $(document).ajaxStart(function () {
                $("div").addClass("loading");
            });
            $(document).ajaxStop(function () {
                $("div").removeClass("loading");
            });

//============================================================================================    



//            =========================================   =====================================
            window.onload = function () {
                var token = sessionStorage.getItem("key");
                var id = localStorage.getItem("userId");
                var arrayTestRequest = [];
                var arrayTestRequestTotal = [];
                $.ajax({
                    type: "GET",
                    dataType: "json",
                    contentType: "application/json; charset=UTF-8",
                    headers: {
                        Authorization: 'Bearer ' + token},
                    url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/examinations/examination/doctor/7",
                    success: function (data) {
                        var string = [];
                        var array = "";
                        var arrayTime = [];
                        var a = JSON.stringify(data);


                        var b = JSON.parse(a);
                        console.log(b);
                        var listPatient = [];
                        if (b !== null) {
                            for (var i = 0; i < b.length; i++) {
                                var patient = new Object();
                                patient.name = b[i].patientName;
                                patient.description = b[i].description;
                                var gender;
                                if(b[i].gender === "Male"){
                                    gender = 1;
                                }else{
                                    gender = 2;
                                }
                                patient.dataPatient = b[i].examinationId + "." + gender;
                                listPatient.push(patient);
                            }
                        }

                        $('#checkRequestTable').DataTable({
                            data: listPatient,
                            columns: [
                                {data: 'name'},
                                {data: 'description'},
                                {
                                    data: 'dataPatient',
                                    render: function (data, type, row, meta) {
                                        return '<td><button class="inputResult" onClick="selectPatientToInputResult('+data+')"> <a> Select</a> </button></td>'
                                    }

                                }
                            ],
                            "bDestroy": true,
                            "bFilter": true,
//                             "createdRow": function (row, data, dataIndex) {
//                                $('td:eq(1)', row).css('display', 'none');
//                            }
                        });
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log(' Error in processing! ' + textStatus);
                    }

                })
            };
            function selectPatientToInputResult(dataPatient) {
                console.log(dataPatient);
                var patientData = (dataPatient+"").split(".");
                var examId = patientData[0];
                var gender = (patientData[1] === "1") ? "Male" : "Female";
                console.log(examId+"......"+gender);
                $.ajax({
                    type: "GET",
                    dataType: "json",
                    contentType: "application/json; charset=UTF-8",
                    headers: {
//                    Authorization: 'Bearer ' + token
                    },
                    url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/examination-details/examination-detail/examination/" + examId + "?typeGender=" + gender,
                    success: function (data) {
                        localStorage.setItem("dataTestRequestId", JSON.stringify(data));
//                                            window.location.href = "checkMorePackage.jsp";
                        window.location.href = "inputResult.jsp";
                    }, error: function (jqXHR, textStatus, errorThrown) {
                        console.log(errorThrown)
                    }})
            }

        </script>
    </body>


    <!-- patients23:19-->
</html>