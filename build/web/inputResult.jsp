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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


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
            .error {
                border: 1px solid red !important;
            }
            #inputResult{
                text-align: right;
            }
        </style>
    </head>

    <%@include file="components/doctorHeader.html" %>
    <%@include file="components/doctorSidebar.html" %>

    <div class="page-wrapper">
        <div class="content">


            <div class="row">
                <div class="col-md-12">
                    <div class="col-8 testPackage">

                        <table id="testPackageTable" name="requesttable" class="table table-border table-striped custom-table datatable mb-0">
                            <caption id="namePackage" style="caption-side:top">Result</caption>

                            <thead>

                                <tr>
                                    <th style="width: 20%">Name</th>
                                    <th style="width: 15%">Min</th>
                                    <th style="width: 15%">Max</th>
                                    <th style="width: 15%">Result</th>
                                    <th style="width: 15%">Diagnose</th>


                                </tr>
                            </thead>

                            <tbody>
                                <tr>

                                    <td id="name"></td>
                                    <td id="male"></td>
                                    <td id="female"></td>
                                    <td id="result" name="result"></td>
                                    <td id="diagnose" name="diagnose"></td>





                                </tr>



                            </tbody>
                        </table>
                    </div>
                    <div class="form-group col-8 doctorComment">
                        <label>Summary Diagnose:</label>
                        <textarea id="textArea" rows="7" cols="5" class="form-control" style="resize: none;" placeholder=""></textarea>
                    </div>
                    <div class="form-group col-8 doctorComment">
                        <label>Doctor's Advise:</label>
                        <textarea id="textArea1" rows="7" cols="5" class="form-control" style="resize: none;" placeholder=""></textarea>
                    </div>
                    <div class="form-group text-center">
                        <button id="finishResult" type="submit" class="btn btn-primary account-btn finishResult">Submit</button>
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
            var listExamiationDetailsResult = [];
            var listResult = [];
            var listDiagnose = []


                    window.onload = function () {


                    var dataTestRequestId = JSON.parse(localStorage.getItem("dataTestRequestId"));
//                console.log(dataTestRequestId[3].testId +" TestID");
                    console.log(dataTestRequestId);
                    var dataTestRequest = JSON.parse(localStorage.getItem("dataTestRequestId"));
                    var patientGender = localStorage.getItem("patientGender");
                    console.log(patientGender);
                    var token = localStorage.getItem("key");
                    var namePackage = localStorage.getItem("namePackage");
                    var valueArray = [];
                    var arrayTotal = [];
                    var idExamination = dataTestRequestId[0].examinationId;
//                var idExamination = localStorage.getItem("idExamination");
                    console.log(idExamination + " examinationID");
                    var testRequest = [];
                    var todayRating = moment().format("YYYY-MM-DDTHH:mm:ss");
                    var today = moment().format("YYYY-MM-DDTHH:mm:ss");
                    var dayExpire = moment().add(2, 'd').format("YYYY-MM-DD");
//                var uuidRating = uuidv4();
                    $.ajax({
                    type: "GET",
                            dataType: "json",
                            contentType: "application/json; charset=UTF-8",
                            headers: {
                            Authorization: 'Bearer ' + token},
                            url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/examination-details/examination-detail/examination/" + idExamination + "?typeGender=" + patientGender,
                            success: function (data) {
//                        var examA = JSON.stringify(data);
//                        
//                        var examB = JSON.parse(examA);
//                        console.log(examB)
                            console.log(data)

//                      $('#testPackageTable').append('<caption style="caption-side: top">' + namePackage + '</caption>');
                                    $('#testPackageTable').DataTable({
                            data: data,
                                    columns: [
                                    {data: 'test_name'},
                                    {data: 'indexValueMin'},
                                    {data: 'indexValueMax'},
                                    {
                                    data: 'testId',
                                            render: function (data, type, row, meta) {
                                            return '<input id="inputResult' + data + '" onChange="createResult(' + data + ')" class="inputResult" type="number"></input>'
                                            }
                                    },
                                    {
                                    data: 'testId',
                                            render: function (data, type, row, meta) {
                                            return '<input id="inputDignose' + data + '" onChange="createDiagnose(' + data + ')" class="inputDiagnose" type="text"></input>'
                                            }
                                    },
                                    ],
                                    "bDestroy": true,
                                    "bFilter": false,
                                    "bPaginate": false,
                                    "bInfo": false,
                                    "aaSorting": [],
                                    "bSort": false
                            });
                            },
                            error: function (jqXHR, textStatus, errorThrown) {
                            console.log(' Error in processing! ' + textStatus);
                            }

                    });
                    $(document).on('click', '[id^="inputResult"]', function () {
                    $('.inputResult').removeClass('error');
                    });
                    $(document).on('click', '[id^="textArea"]', function () {
                    $('#textArea').removeClass('error');
                    });
                    $(document).on('click', '[id^="textArea1"]', function () {
                    $('#textArea1').removeClass('error');
                    });
                    $(document).on('click', '[id^="finishResult"]', function () {
                    if(listResult.length >=  listDiagnose.length){
                        for (var i = 0; i < listResult.length; i++) {
                            if(listDiagnose.length === 0){
                               listResult[i].examinationId = idExamination;
                               listExamiationDetailsResult.push(listResult[i]); 
                            }
                            for (var j = 0; j < listDiagnose.length; j++) {
                                listResult[i].examinationId = idExamination;
                                if ((listResult[i].testId + '') === (listDiagnose[j].testId + '')){
                                    listResult[i].diagnose = listDiagnose[j].dia;
                                 }
                                 listExamiationDetailsResult.push(listResult[i]);

                             }
                        }
                    }else{
                       for (var i = 0; i < listDiagnose.length; i++) {
                            for (var j = 0; j < listResult.length; j++) {
                                   listResult[i].examinationId = idExamination;

                                if ((listDiagnose[i].testId + '') === (listResult[j].testId + '')){
                                    listResult[i].diagnose = listDiagnose[j].dia;
                                 }
                                    listExamiationDetailsResult.push(listResult[i]);

                             }
                        } 
                    }
                    
                    console.log('----------------------');
                    console.log(listExamiationDetailsResult);
                    //===============================tuan
                    var a = $('.inputResult');
                    $('.inputResult').removeClass('error');
                    $('#textArea').removeClass('error');
                    $('#textArea1').removeClass('error');
                    console.log(a.val());
                    var b = $('.inputResult').length;
                    var result = [];
                    var regexp = /^-?\d{1,4}(\.\d{1})?$/;
                    for (var i = 0; i < b; i++) {
                    if (regexp.test(a.eq(i).val())) {
                    result.push(a.eq(i).val());
                    } else {
                    $('.inputResult').addClass('error');
                    }

                    }
                    var sumDiagnose = document.getElementById("textArea").value;
                    var advise = document.getElementById("textArea1").value;





                    console.log(sumDiagnose);
                    console.log(advise);
                    console.log(idExamination);
                    if (sumDiagnose.length === 0 || sumDiagnose.length > 255) {
                    $('#textArea').addClass('error');
                    if (advise.length === 0 || advise.length > 255) {
                    $('#textArea1').addClass('error');
                    }
                    } else if (advise.length === 0 || advise.length > 255) {
                    $('#textArea1').addClass('error');
                    } else {

                                    $.ajax({
                                        type: "PUT",
                                        dataType: "json",
                                        contentType: "application/json; charset=UTF-8",
                                        headers: {
                                            Authorization: 'Bearer ' + token},
                                        data: JSON.stringify({
                                            "advise": advise,
                                            "diagnose": sumDiagnose,
                                            "examinationDetailRequests": listExamiationDetailsResult,
                                            "examinationId": idExamination


                                        }),
                                        url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/examinations/examination",
                                        complete: function (jqXHR) {
                                            
                                        }});
                                    $.ajax({
                                        type: "POST",
                                        dataType: "json",
                                        contentType: "application/json; charset=UTF-8",
                                        headers: {
                                            Authorization: 'Bearer ' + token},
                                        data: JSON.stringify({
                                            "rate": 0,
                                            "comment": "",
                                            "examinationId": idExamination
                                        }),
                                        url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/ratings/rating",
                                        complete: function (jqXHR) {
                                                        if (jqXHR.status === 201 || jqXHR.status === 200) {
                                                            alert("COMPLETE!!!")
                                                            window.location.href = "doctorCheckRequest.jsp";
                                                        }
                                                    }
                                    });
//                               
                       
                    }
                    });
                    };
            function createResult(id) {
            let result = new Object();
            let temp = parseInt($('#inputResult' + id + '').val(), 10);
            result.testId = id;
            result.result = temp;
            listResult.push(result);
            console.log(listResult);
            }

            function createDiagnose(id) {
            let diagnose = new Object();
            let temp = $('#inputDignose' + id + '').val();
            diagnose.testId = id;
            diagnose.dia = temp;
            listDiagnose.push(diagnose)
                    console.log(listDiagnose);
            }


        </script>


    </body>


    <!-- patients23:19-->
</html>