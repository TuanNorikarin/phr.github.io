<!DOCTYPE html>
<html lang="en">


    <!-- blog23:34-->

    <head>
        <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/logo-dark.png">
        <title>PHR - Manage Personal Health Record</title>
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/select2.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap-datetimepicker.min.css">
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
                /*background-color: #2a9c31;*/
                background-color: #e3e7e8;
            }

            button#createExamination.btn.btn-primary.submit-btn {
                margin-left: 180%;
            }

            .error {
                border-color: #FF0000 !important;
            }
        </style>
    </head>

    <%@include file="components/recepHeader.html" %>
    <%@include file="components/recepSidebar.html" %>

    <!-- ============================================== Add Examination Form ================================================ -->

    <div class="page-wrapper">
        <div class="content">
            <div class="row">
                <div class="col-lg-8 offset-lg-2">
                    <h4 class="page-title">Create Examination</h4>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-8 offset-lg-2">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label>Select Doctor</label><br />
                                <select id="doctorName" name="doctorPhone" class="select">

                                </select>
                            </div>
                        </div>

                        <div class="col-sm-12">
                            <div class="form-group">
                                <label for="exampleFormControlTextarea1">Description</label>
                                <textarea class="form-control" id="description" maxlength="255"
                                          name="description" rows="3"></textarea>
                            </div>
                        </div>



                        <div class="m-t-20 text-center">
                            <button id="createExamination" class="btn btn-primary submit-btn">Submit</button>

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
            <script src="assets/js/moment.min.js"></script>
            <script src="assets/js/bootstrap-datetimepicker.min.js"></script>
            <script src="assets/js/app.js"></script>
            <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
            <script type="text/javascript">


                //                =====================================Insert===============================================
                window.onload = function () {
                    
                    var patientId = sessionStorage.getItem('patientId');
                    var listTest = sessionStorage.getItem('listTestId');

                    console.log('------' + patientId + '-----' + listTest);
                }

                $(document).ready(function () {
                    var clinicId = localStorage.getItem("clinicId");
                    clinicId = 9;
                    $.ajax({
                        type: "GET",
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        headers: {
//                             Authorization: 'Bearer ' + token,
                            'Access-Control-Allow-Origin': '*',
                        },
                        url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/doctors/clinic/" + clinicId,
                        success: function (data) {
                            console.log(data);
                            for (var i in data) {
                                $('#doctorName').append('<option value=' + data[i].id + '>' + data[i].name + ' - ' + data[i].phone + '</option>');
                            }
                        }
                    });

                });

                //======================================= submit to create examination==========================
                $('#createExamination').click(function (event) {
                    var description = checkNull($('#description').val());
                    var patientId = checkNull(sessionStorage.getItem('patientId'));
                    var doctorId = checkNull($('option:selected').val());
                    var listPackageTest = parseStringToInt(sessionStorage.getItem('packageId'));
                    var listTest = parseStringToInt(sessionStorage.getItem('listTestId'));
                    console.log(sessionStorage.getItem('listTestId'))
                    console.log(typeof(listTest));
                    console.log(listTest)
                                        console.log("//////////")

                    
                    console.log(typeof(listPackageTest));
                    console.log(listPackageTest)
                    $.ajax({
                        type: "POST",
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        headers: {
                            // Authorization: 'Bearer ' + token
                            'Access-Control-Allow-Origin': '*',
                        },
                        data: JSON.stringify({
                            "description": description,
                            "doctorId": doctorId,
                            "packageId": listPackageTest,
                            "patientId": patientId,
                            "testId": listTest,
                        }),
                        url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT//examinations/examination",
                        complete: function (jqXHR) {
                            if (jqXHR.status === 200) {
                                alert("Create Request Successfully");
                                window.location.href = "receptionistPatients.jsp";
                            }
                        }               });
                });
                function checkNull(data) {
                    if (data === null) {
                        return " ";
                    }
                    return data;
                }
                
                function parseStringToInt(list){
                   var result = []
                   if(list !== null){
                       let temp = list.split(',');
                       console.log(temp);
                       for (var i = 0; i < temp.length; i++) {
                       result.push(parseInt(temp[i]));
                    }
                   }
                    return result;
                }
            </script>
            <i onclick="editDoctor()"></i>

            </body>



            </html>