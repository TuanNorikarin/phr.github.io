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

            .sidebar-menu li#aTest a {
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
            .addButton{
                left: 35%;
            }

        </style>
    </head>

    <%@include file="components/header.html" %>
    <%@include file="components/sidebar.html" %>

    <div class="page-wrapper">
        <div class="content">
            <div class="row">



                <div class="col-sm-8 col-9 text-right m-b-20 addButton">
                    <a id="buttonAdd" class="btn btn btn-primary btn-rounded"><i class="fa fa-plus"></i> Add Text Indexes to Package</a>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="col-8 testPackage">

                        <table id="testPackageTable" class="table table-border table-striped custom-table datatable mb-0">
                            <!--<caption id="namePackage" style="caption-side:top"></caption>-->

                            <thead>

                                <tr>
                                    <th style="width: 20%">Name</th>
                                    <th style="width: 15%">Male</th>
                                    <th style="width: 15%">Female</th>
                                    <th style="width: 15%">Children</th>
                                    <th style="width: 10%">Delete</th>


                                </tr>
                            </thead>

                            <tbody>
                                <tr>

                                    <td id="name"></td>
                                    <td id="male"></td>
                                    <td id="female"></td>
                                    <td id="children"></td>
                                    <td id="delete"></td>





                                </tr>



                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="overlay"></div>
        <%@include file="components/footer.html" %>
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
            var testId = [];
            var count = 0;
            var checkPackage = [];
            //==============================Loading Page=========================================
            $(document).ajaxStart(function () {
                $("div").addClass("loading");
            });
            $(document).ajaxStop(function () {
                $("div").removeClass("loading");

                if (testId.length === 0) {
                    $("#buttonAdd").show();
                    $("button[id='buttonX']").removeAttr('disabled');
                }
                console.log(testId);




            });

            window.onload = function () {
                $("#buttonAdd").show();
                $("button[id='buttonX']").removeAttr('disabled');
                localStorage.setItem("testName", "");
                var token = localStorage.getItem("key");
                var dataPackage = JSON.parse(localStorage.getItem("dataPackage"));
                var valueArray = [];
                var arrayTotal = [];
                var testName = [];
                console.log(dataPackage.name);
                $.ajax({
                    type: "GET",
                    dataType: "json",
                    contentType: "application/json; charset=UTF-8",
                    headers: {
                        Authorization: 'Bearer ' + token},
                    url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/package-tests/package-detail/" + dataPackage.id,
                    success: function (data) {
                        var a = JSON.stringify(data);
                        var b = JSON.parse(a);
                        console.log(b);
                        console.log(a);
                        for (var i = 0; i < data.length; i++) {

           
                            $.ajax({
                                type: "GET",
                                dataType: "json",
                                contentType: "application/json; charset=UTF-8",
                                headers: {
                                    Authorization: 'Bearer ' + token},
                                url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/package-tests/package-detail/" +dataPackage.id,
                                success: function (data) {


                                var mainData = [];
                                console.log(data);
                                data.forEach(element => {
                                    var dataShow = new Object();
                                    dataShow.name = element.name;
                                    dataShow.description = element.description;

                                    dataShow.maleIndex = '-';
                                    dataShow.femaleindex = '-';
                                    dataShow.childIndex = '-'
                                    
                                    element.samplelst.forEach(e => {
                                        if (e.type === 'Male' || e.type === 'male') {
                                            dataShow.maleIndex = e.indexValueMin + '-' + e.indexValueMax;
                                        } else if (e.type === 'Female' || e.type === 'female') {
                                            dataShow.femaleindex = e.indexValueMin + '-' + e.indexValueMax;
                                        } else if (e.type === 'Child' || e.type === 'child') {
                                            dataShow.childIndex = e.indexValueMin + '-' + e.indexValueMax;
                                        }
                                    });
                                    mainData.push(dataShow);
                                });
                                
                                localStorage.setItem("testName", testName);
//                                $('#testPackageTable').append('<caption style="caption-side: top">' + dataPackage.name + '</caption>');
                                $('#testPackageTable').DataTable({
                            data: mainData,
                            columns: [
                                        { data: 'name' },
                                        
                                        {
                                            data: 'maleIndex',
                                        },
                                        {
                                            data: 'femaleindex',
                                        },
                                        {
                                            data: 'childIndex',
                                        },
                                        {
                                            defaultContent: '<td id="actionIcon" class="close"><button id="buttonX" type="button" class="close" aria-label="Close"><span class="deleteButton" aria-hidden="true">&times;</span></button></td>'

                                        }
                            ],
                                    "bDestroy": true,
                                    "bFilter": false,
                                    "bPaginate": false,
                                    "bInfo": false,

                                });

                                },
                                error: function (jqXHR, textStatus, errorThrown) {
                                    console.log(' Error in processing! ' + textStatus);
                                }

                            })

                        }
                        $('#testPackageTable tbody').on('click', 'button', function () {

                            var tr = $(this).closest("tr");
                            var rowindex = tr.index();
                            table = document.getElementById("testPackageTable");
                            tr = table.getElementsByTagName("tr");
                            td = tr[rowindex + 1].getElementsByTagName("td")[0];
                            txtValue = td.textContent;
                            for (var i = 0; i < data.length; i++) {
                                if (data[i].testId.name === txtValue) {
                                    $.ajax({
                                        type: "DELETE",
                                        dataType: "json",
                                        contentType: "application/json; charset=utf-8",
                                        headers: {
                                            Authorization: 'Bearer ' + token},
                                        url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/package-tests/package-test/" + data[i].id,
                                        complete: function (jqXHR) {
                                            if (jqXHR.status === 200) {
                                                for (var k = 0; k < testName.length; k++) {
                                                    if (txtValue === testName[k]) {
                                                        testName.splice(k, 1);
                                                        
                                                        localStorage.setItem("testName", testName);
                                                        window.location.href = "test-detail.jsp";

                                                    }
                                                }

                                            }
                                        }
                                    });
                                }
                            }
                        });
//                        var b = JSON.parse(a);

                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log(' Error in processing! ' + textStatus);
                    },
                })
                $('#buttonAdd').click(function (event) {

                var ids = dataPackage.id;
//                if (ids !== null) {
//                    var listTestId = ids.split(",");
//                }
//                console.log(listTestId);
                var listTestDouple = [];
                $.ajax({
                    type: "GET",
                    dataType: "json",
                    contentType: "application/json; charset=UTF-8",
                    headers: {
                        // Authorization: 'Bearer ' + token
                        'Access-Control-Allow-Origin': '*'
                    },
                    url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/package-tests/package-detail/" + dataPackage.id,
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
                sessionStorage.setItem('packageId', dataPackage.id);
//                if (confirm('Do you want to choose some other testing services?')) {
                    window.location.href = "add-TestToPackage.jsp";
//                } else {
//                    window.location.href = "createExamination.jsp";
//                }

            });

            };
            
            
            



        </script>


    </body>


    <!-- patients23:19-->
</html>