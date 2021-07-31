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

            input#exampleCheck1.form-check-input {
                left: 90%;
                top: -12px;

            }

            .addButton {
                left: 30%;
                padding-top: 20px;
            }

            input[type=checkbox] {
                transform: scale(1.5);
                -ms-transform: scale(1.5);
                -webkit-transform: scale(1.5);

            }

            a:not([href]):not([tabindex]) {
                color: white;
                text-decoration: none;
            }

            #description {
                display: none;
            }

            #indexTable {
                width: 100% !important;
            }
        </style>
    </head>

    <%@include file="components/recepHeader.html" %>
    <%@include file="components/recepSidebar.html" %>

    <div class="page-wrapper">
        <div class="content">
            <div class="row">
                <div class="col-sm-4 col-3">
                    <h4 class="page-title">All Test Indexes</h4>
                </div>

            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="table-responsive">

                        <table id="indexTable" class="table table-border table-striped custom-table datatable mb-0">

                            <thead>
                                <tr>
                                    <th style="width: 20%">Name</th>
                                    <th id="description" style="width: 30%; display: block !important;">Description
                                    </th>
                                    <th style="width: 15%">Male Value</th>
                                    <th style="width: 15%">FeMale Value</th>
                                    <th style="width: 15%">Children Value</th>
                                    <th style="width: 5%" class="text-right">Select</th>
                                </tr>
                            </thead>

                            <tbody>

                                <tr>

                                    <td id="name"></td>
                                    <td id="description"></td>
                                    <td id="maleVal"></td>
                                    <td id="femaleVal"></td>
                                    <td id="childVal"></td>
                                    <td class="text-right">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="exampleCheck">

                                        </div>
                                    </td>
                                </tr>



                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-sm-8 col-9 text-right m-b-20 addButton">
                    <a id="addTest" class="btn btn btn-primary btn-rounded float-right"><i class="fa fa-plus"></i>
                        Create Examination</a>
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
        <script src="assets/js/app.js"></script>
        <script type="text/javascript">
            var table;
            window.onload = function () {
                var token = localStorage.getItem("key");
//                var testName = localStorage.getItem("testName");

                var packageId = sessionStorage.getItem('packageId');
                $.ajax({
                    type: "GET",
                    dataType: "json",
                    contentType: "application/json; charset=UTF-8",
                    headers: {
                         Authorization: 'Bearer ' + token
//                        'Access-Control-Allow-Origin': '*'
                    },
                    url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/tests/test-indexs",
                    success: function (data) {


                        jQuery.makeArray(packageId);
                        var listResult = data;
                        var mainData = [];

                        //get all test of package test to check douple
                        if (packageId !== null) {
                            for (var i = 0, max = packageId.length; i < max; i++) {
                                $.ajax({
                                    type: "GET",
                                    dataType: "json",
                                    contentType: "application/json; charset=UTF-8",
                                    headers: {
                                        // Authorization: 'Bearer ' + token
                                        'Access-Control-Allow-Origin': '*'
                                    },
                                    url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/package-tests/package-detail/" + packageId[i],
                                    success: function (data) {
                                        for (var j = 0; j < data.length; j++) {
                                            let id = data[j].id;
                                            var a = listResult.findIndex(test => test.id === id);
                                            listResult.splice(a, 1);
                                        }

                                        console.log(listResult);
                                        listResult.forEach(element => {
                                            var dataShow = new Object();
                                            dataShow.id = element.id;
                                            dataShow.name = element.name;
                                            dataShow.description = element.description;

                                            dataShow.maleIndex = '-';
                                            dataShow.femaleindex = '-';
                                            dataShow.childIndex = '-'

                                            element.samplelst.forEach(e => {
                                                if (e.type === 'Male') {
                                                    dataShow.maleIndex = e.indexValueMin + '-' + e.indexValueMax;
                                                } else if (e.type === 'Female') {
                                                    dataShow.femaleindex = e.indexValueMin + '-' + e.indexValueMax;
                                                } else if (e.type === 'Child') {
                                                    dataShow.childIndex = e.indexValueMin + '-' + e.indexValueMax;
                                                }
                                            });
                                            mainData.push(dataShow);
                                        });

                                        console.log(mainData);
                                        table = $('#indexTable').DataTable({
                                            data: mainData,
                                            columns: [
                                                {data: 'name'},
                                                {
                                                    data: 'description',
                                                },
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
                                                    data: 'id',
                                                    render: function (data, type, row, meta) {
                                                        return '<td id="actionIcon" class="text-right"><div class="form-check"><input name="checkBox" type="checkbox" class="form-check-input" value="' + data + '"id="exampleCheck1"></div></td>'
                                                    }
                                                },
                                            ],
                                            "bDestroy": true,
                                            "bFilter": true,

                                        });
                                    },
                                    error: function (jqXHR, textStatus, errorThrown) {
                                        console.log(' Error in processing! ' + textStatus);
                                    }
                                });
                            }
                        } else {
                            data.forEach(element => {
                                var dataShow = new Object();
                                dataShow.id = element.id;
                                dataShow.name = element.name;
                                dataShow.description = element.description;

                                dataShow.maleIndex = '-';
                                dataShow.femaleindex = '-';
                                dataShow.childIndex = '-'

                                element.samplelst.forEach(e => {
                                    if (e.type === 'Male') {
                                        dataShow.maleIndex = e.indexValueMin + '-' + e.indexValueMax;
                                    } else if (e.type === 'Female') {
                                        dataShow.femaleindex = e.indexValueMin + '-' + e.indexValueMax;
                                    } else if (e.type === 'Child') {
                                        dataShow.childIndex = e.indexValueMin + '-' + e.indexValueMax;
                                    }
                                });
                                mainData.push(dataShow);
                            });

                            console.log('xxx' + mainData);
                            table = $('#indexTable').DataTable({
                                data: mainData,
                                columns: [
                                    {data: 'name'},
                                    {
                                        data: 'description',
                                    },
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
                                        data: 'id',
                                        render: function (data, type, row, meta) {
                                            return '<td id="actionIcon" class="text-right"><div class="form-check"><input name="checkBox" type="checkbox" class="form-check-input" value="' + data + '"id="exampleCheck1"></div></td>'
                                        }
                                    },
                                ],
                                "bDestroy": true,
                                "bFilter": true,

                            });
                        }


                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log(' Error in processing! ' + textStatus);
                    }

                })
            };




            $('#addTest').click(function (event) {

//                sessionStorage.clear();
//                localStorage.clear();
                var listId = sessionStorage.getItem('listTestId');
                var array = jQuery.makeArray(listId);
                console.log('luc dau' + array);
                var checkArray = [];
                if (array.length !== 0) {
                    checkArray = array[0].toString().split(",");
                    console.log('......' + checkArray);
                }
                var checkboxTMP = document.getElementsByName('checkBox');
                for (var i = 0; i < checkboxTMP.length; i++) {
                    console.log('bat dau lay du lieu');
                    if (checkboxTMP[i].checked === true) {
                        console.log('du lieu dc select' + checkboxTMP[i].value);
                        let flag = false;
                        for (var j = 0; j < checkArray.length; j++) {
                            console.log('check douple' + checkArray[j]);
                            if (checkArray[j] === checkboxTMP[i].value) {
                                flag = true;
                                console.log("douple");
                                break;
                            }
                        }
                        if (!flag) {
                            array.push(checkboxTMP[i].value);
                        }
                    }
                }
                console.log('sau khi su li' + array);

                sessionStorage.removeItem('listTestId');
                sessionStorage.setItem('listTestId', array);


                if (confirm('Do you want to choose some other package testing services?')) {
                    window.location.href = "selectTestPackage.jsp";
                } else {
                    window.location.href = "createExamination.jsp";
                }

            });
        </script>


    </body>


    <!-- patients23:19-->

</html>