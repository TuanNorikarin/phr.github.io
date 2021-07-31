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

            .sidebar-menu li#aViewMedicalProfile a {
                color: #009efb;
                /*background-color: #2a9c31;*/
                background-color: #e3e7e8;
            }

            div.dropdown.dropdown-action{
                float: right;
            }

            #buttonOutGroup {
                margin-left: 20%;
                border-radius: 5px;
                height: 32px;
                width: 78%;
                border: 0.1px gainsboro solid;
            }
            .fullname-bold {
                font-weight: bold;
            }
            #groupMemberTable {
                width: 100% !important;
            }
            .overlay{
                display: none;
                position: fixed;
                width: 100%;
                height: 100%;
                top: 0;
                left: 6%;
                z-index: 999;
                background:rgba(255,255,255,1)
                    url("assets/img/loadingscreen2.gif") center no-repeat;
            }
            /* Turn off scrollbar when body element has the loading class */
            div.loading{
                overflow: hidden;   
            }
            /* Make spinner image visible when body element has the loading class */
            div.loading.overlay{
                display: block;
            }
        </style>

    </head>
    <%@include file="components/userHeader.html" %>
    <%@include file="components/userSidebar.html" %>
    <div class="page-wrapper">
        <div class="content">
            <div class="row">
                <div class="col-sm-4 col-3">
                    <h4 class="page-title">Medical Information</h4>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="table-responsive">

                        <table id="groupMemberTable" class="table table-border table-striped custom-table datatable mb-0">

                            <thead>
                                <tr>
                                    <th style="width: 20%">Name</th>
                                    <th style="width: 20%">Blood Type</th>
                                    <th style="width: 10%">Public</th>
                                    <th style="width: 20%">Group Name</th>
                                    <th style="width: 10%" class="text-right">Action</th>
                                </tr>
                            </thead>
                            <tbody>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </div>
        <div class="overlay"></div>
        <%@include file="components/userFooter.html" %>
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
                var userId = localStorage.getItem("userId");
                var dataUser = "";
                var array = [];
                var array1 = [];
                var arrayTotal = [];
                $.ajax({
                    type: "GET",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    headers: {
                        Authorization: 'Bearer ' + token},
                    url: "https://bt-application.herokuapp.com/api/userfamilygroup/findByUserId/" + userId,
                    success: function (value) {
                        for (var i = 0; i < value.length; i++) {
                            $.ajax({
                                type: "GET",
                                dataType: "json",
                                contentType: "application/json; charset=utf-8",
                                headers: {
                                    Authorization: 'Bearer ' + token},
                                url: "https://bt-application.herokuapp.com/api/userfamilygroup/findByGroupId/" + value[i].familyGroupId.id,
                                success: function (values) {
                                    dataUser = values;
                                    $.ajax({
                                        type: "GET",
                                        dataType: "json",
                                        contentType: "application/json; charset=UTF-8",
                                        headers: {
                                            Authorization: 'Bearer ' + token},
                                        url: "https://bt-application.herokuapp.com/api/sharedinformation/findbytype/3",
                                        success: function (data) {
                                            
                                            for (var i = 0; i < values.length; i++) {
                                                for (var j = 0; j < data.length; j++) {
                                                    if (values[i].userId.id === data[j].healthRecordId.userId.id) {
                                                        array.push(data[j].healthRecordId.userId.fullname);
                                                        array.push(data[j].healthRecordId.bloodType);
                                                        array.push("✘");
                                                        array.push(values[i].familyGroupId.name);
                                                        arrayTotal.push(array);
                                                        array = [];
                                                    }
                                                }
                                            }





                                        },
                                        error: function (jqXHR, textStatus, errorThrown) {
                                            console.log(' Error in processing! ' + textStatus);
                                        }

                                    });
                                }});
                        }

                    }});
                $.ajax({
                    type: "GET",
                    dataType: "json",
                    contentType: "application/json; charset=UTF-8",
                    headers: {
                        Authorization: 'Bearer ' + token},
                    url: "https://bt-application.herokuapp.com/api/sharedinformation/findbytype/1",
                    success: function (datas) {
                        for (var j = 0; j < datas.length; j++) {

                            array1.push(datas[j].healthRecordId.userId.fullname);
                            array1.push(datas[j].healthRecordId.bloodType);
                            array1.push("✔");
                            array1.push("✘");
                            arrayTotal.push(array1);
                            array1 = [];
                        }
                    }});

                $(document).ajaxStop(function () {
                    console.log(arrayTotal);
                    var table = $('#groupMemberTable').DataTable({
                        data: arrayTotal,
                        columns: [
                            {data: '0'},
                            {data: '1'},
                            {data: '2'},
                            {data: '3'},
                            {
                                "render": function (data, type, row) {
                                    return '<td id="actionIcon" class="text-right"><div class ="dropdown dropdown-action"><a href = "#" class="action-icon dropdown-toggle" data-toggle = "dropdown" aria-expanded = "false"> <i class = "fa fa-ellipsis-v" > </i></a><div id = "d" class = "dropdown-menu dropdown-menu-right" ><a class = "dropdown-item" href = "view-medical-information.jsp"> <i class = "fa fa-pencil m-r-5" > </i> View</a></i></div></div></td>';
                                }
                            }
                        ],
                        "bDestroy": true,
                        "bFilter": true,
                        language: {
                            search: 'Search:',
                            searchPlaceholder: "Search by item..."
                        },
                        "createdRow": function (row, data, dataIndex) {
                            if (data[2] === "✔") {
                                $('td:eq(2)', row).css('color', 'green');
                            }
                            if (data[2] === "✘") {
                                $('td:eq(2)', row).css('color', 'red');
                            }
                            if (data[3] === "✘") {
                                $('td:eq(3)', row).css('color', 'red');
                            }
                        }
                    });
                    $('.form-control.form-control-sm').on('keyup', function () {
                        table
                                .columns(1)
                                .search(this.value)
                                .draw();
                    });
                });
                $('#groupMemberTable tbody').on('click', 'td', function ()
                {
                    var tr = $(this).closest("tr");
                    var rowindex = tr.index();
                    table = document.getElementById("groupMemberTable");
                    tr = table.getElementsByTagName("tr");
                    td = tr[rowindex + 1].getElementsByTagName("td")[0];
                    txtValue = td.textContent;
                    $.each(dataUser, function (index, value) {
                        if (value.userId.fullname === txtValue) {
                            localStorage.setItem("dataUser", JSON.stringify(value.userId));
                        }
                    });

                }
                );
            };
            $(document).ajaxStart(function () {
                $("div").addClass("loading");
            });
            $(document).ajaxStop(function () {
                $("div").removeClass("loading");
            });
        </script>
    </body>

</html>