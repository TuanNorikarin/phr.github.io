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
                /*background-color: #2a9c31;*/
                background-color: #e3e7e8;
            }
            table, th, td {
                border: 1px solid black;
                text-align: center;
            }
            thead{
                text-align: center;
            }
            .close{
                margin-right: 40%;
                transform: scale(1.2);
                -ms-transform: scale(1.2);
                -webkit-transform: scale(1.2);
                opacity: 0.85;
                font-weight: 500;
                color: red;

            }
            .close:hover{
                opacity: 1;
                color: orangered;
            }

            caption{
                color: #000;
                font-size: 18px;
                font-weight: bold;

            }
            .testPackage{
                left: 12%;
            }
            .doctorComment{
                left: 12%;
                width: 100%;
                margin-top: 5%;
                resize: none;
            }
            button.btn.btn-primary.account-btn.finishResult{
                margin-left: 48%;
            }


        </style>
    </head>

    <%@include file="components/doctorHeader.html" %>
    <%@include file="components/doctorSidebar.html" %>

    <div class="page-wrapper">
        <div class="content">
            <!--            <div class="row">
            
            
            
                            <div class="col-sm-8 col-9 text-right m-b-20 addButton">
                                <a href="add-TestToPackage.jsp" class="btn btn btn-primary btn-rounded"><i class="fa fa-plus"></i> Add Text Indexes to Package</a>
                            </div>
                        </div>-->

            <div class="row">
                <div class="col-md-12">
                    <div class="titleResult">
                        <div class="patientShow">Name:&nbsp; <span id="patientExam"> </span></div>
                        <span class="doctorShow">Clinic:&nbsp;&nbsp;<span id="clinicExam"> </span></span><br/>
                        <span class="doctorShow">Examination Doctor:&nbsp;&nbsp;<span id="doctorExam"> </span></span><br/>

                    </div>
                    <div class="col-8 testPackage">

                        <table id="testPackageTable" class="table table-border table-striped custom-table datatable mb-0">
                            <!--<caption id="namePackage" style="caption-side:top"></caption>-->

                            <thead>

                                <tr>
                                    <th style="width: 20%">Name</th>
                                    <th style="width: 15%">Male</th>
                                    <th style="width: 15%">Female</th>
                                    <th style="width: 15%">Result</th>


                                </tr>
                            </thead>

                            <tbody>
                                <tr>

                                    <td id="name"></td>
                                    <td id="male"></td>
                                    <td id="female"></td>
                                    <td id="result"></td>





                                </tr>



                            </tbody>
                        </table>
                    </div>
                    <div class="form-group col-8 doctorComment">
                        <label>Doctor's Diagnose:</label>
                        <textarea id="textArea" readonly rows="7" cols="5" class="form-control" style="resize: none;" placeholder=""></textarea>
                    </div>
                    <div class="form-group col-8 doctorComment">
                        <label>Doctor's Advise:</label>
                        <textarea id="textArea1" readonly rows="7" cols="5" class="form-control" style="resize: none;" placeholder=""></textarea>
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
        <!--        <link href="https://nightly.datatables.net/css/jquery.dataTables.css" rel="stylesheet" type="text/css" />
                <script src="https://nightly.datatables.net/js/jquery.dataTables.js"></script>-->
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
                var namePackage = localStorage.getItem("namePackage");
                var valueArray = [];
                var arrayTotal = [];
                var idExamination = localStorage.getItem("idExamination");
                var dataDoctor = JSON.parse(localStorage.getItem("dataDoctor"));
                var examination = JSON.parse(localStorage.getItem("examination"));
                var testrequestidDone = JSON.parse(localStorage.getItem("testrequestidDone"));

                $.ajax({
                    type: "GET",
                    dataType: "json",
                    contentType: "application/json; charset=UTF-8",
                    headers: {
                        Authorization: 'Bearer ' + token},
                    url: "https://bt-application.herokuapp.com/api/testresult/findbytestrequestid/" + testrequestidDone.id,
                    success: function (data) {
                        $.ajax({
                            type: "GET",
                            dataType: "json",
                            contentType: "application/json; charset=UTF-8",
                            headers: {
                                Authorization: 'Bearer ' + token},
                            url: "https://bt-application.herokuapp.com/api/testresultdetail/findbytestresultid/" + data.id,
                            success: function (dataResult) {

                                $.ajax({
                                    type: "GET",
                                    dataType: "json",
                                    contentType: "application/json; charset=UTF-8",
                                    headers: {
                                        Authorization: 'Bearer ' + token},
                                    url: "https://bt-application.herokuapp.com/api/testtestrequest/findbyexamination/" + idExamination,
                                    success: function (data) {
                                        for (var j = 0; j < data.length; j++) {
                                            $.ajax({
                                                type: "GET",
                                                dataType: "json",
                                                contentType: "application/json; charset=UTF-8",
                                                headers: {
                                                    Authorization: 'Bearer ' + token},
                                                url: "https://bt-application.herokuapp.com/api/testresultsample/findbytestid/" + data[j].testId.id,
                                                success: function (values) {
                                                    valueArray.push(values[0].testId.name);
                                                    for (var i = 0; i < values.length; i++) {
                                                        if (values[i].type === 'Male') {
                                                            if (values[i].indexValueMin === -9999) {
                                                                valueArray.splice(1, 0, "Âm tính");
                                                            } else {
                                                                valueArray.splice(1, 0, values[i].indexValueMin + " - " + values[i].indexValueMax);
                                                            }
                                                        }
                                                        if (values[i].type === 'Female') {
                                                            if (values[i].indexValueMin === -9999) {
                                                                valueArray.splice(2, 0, "Âm tính");
                                                            } else {
                                                                valueArray.splice(2, 0, values[i].indexValueMin + " - " + values[i].indexValueMax);

                                                            }
                                                        }
//                                    
                                                    }
                                                    for (var i = 0; i < dataResult.length; i++) {
                                                        if (values[0].testId.name === dataResult[i].testId.name) {
                                                            if (dataResult[i].indexValueResult < 0) {
                                                                valueArray.push("Âm tính");
                                                            } else if (dataResult[i].indexValueResult >= 0 && valueArray[1] === "Âm tính") {
                                                                valueArray.push("Dương tính");
                                                            } else {
                                                                valueArray.push(dataResult[i].indexValueResult);
                                                            }
                                                        }
                                                    }
                                                    arrayTotal.push(valueArray);
                                                    valueArray = [];
                                                    if (arrayTotal.length === data.length) {
                                                        document.getElementById("textArea").value = testrequestidDone.examinationId.diagnose;
                                                        document.getElementById("textArea1").value = testrequestidDone.examinationId.advise;
                                                        document.getElementById("doctorExam").innerHTML = dataDoctor.fullname;
                                                        document.getElementById("patientExam").innerHTML = examination.userId.fullname;
                                                        document.getElementById("clinicExam").innerHTML = examination.clinicId.name;
                                                        $('#testPackageTable').append('<caption class="packageCap" style="caption-side: top">' + namePackage + '</caption>');
                                                        $('#testPackageTable').DataTable({
                                                            data: arrayTotal,
                                                            columns: [
                                                                {data: '0'},
                                                                {data: '1'},
                                                                {data: '2'},
                                                                {data: '3'}
                                                            ],
                                                            "bDestroy": true,
                                                            "bFilter": false,
                                                            "bPaginate": false,
                                                            "bInfo": false,
                                                            "aaSorting": [],
                                                            "bSort": false,
                                                            "createdRow": function (row, data, dataIndex) {
                                                                if (examination.userId.gender === 1) {
                                                                    var valueSplit = data[2].split("-");
                                                                    if (data[3] > valueSplit[1] || data[3] < valueSplit[0]) {
                                                                        $('td:eq(3)', row).css('color', 'red');
                                                                        $('td:eq(3)', row).css('font-style', 'italic');
                                                                        $('td:eq(2)', row).css('color', 'red');
                                                                        $('td:eq(2)', row).css('font-style', 'italic');
                                                                    }
//                                                                    
                                                                } else if (examination.userId.gender === 0) {
                                                                    var valueSplit = data[1].split("-");
                                                                    if (data[3] > valueSplit[1] || data[3] < valueSplit[0]) {
                                                                        $('td:eq(3)', row).css('color', 'red');
                                                                        $('td:eq(3)', row).css('font-style', 'italic');
                                                                        $('td:eq(1)', row).css('color', 'red');
                                                                        $('td:eq(1)', row).css('font-style', 'italic');
                                                                    }
//                                                                    
                                                                }
                                                            }
                                                        });
                                                    }


                                                }
                                                ,
                                                error: function (jqXHR, textStatus, errorThrown) {
                                                    console.log(' Error in processing! ' + textStatus);
                                                }

                                            })
                                        }
                                    },
                                    error: function (jqXHR, textStatus, errorThrown) {
                                        console.log(' Error in processing! ' + textStatus);
                                    }

                                })
                            }})
                    }})
            };




        </script>


    </body>


    <!-- patients23:19-->
</html>