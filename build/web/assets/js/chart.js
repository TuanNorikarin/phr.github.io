$(document).ready(function () {
    // Bar Chart
    var token = localStorage.getItem("key");
    var roleId = JSON.parse(localStorage.getItem("userInformation"));
    if (roleId.roleId.id === 1) {
        var q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, bt, td, tb, bth, pn, gv, tp;
        $.ajax({
            type: "GET",
            dataType: "text",
            contentType: "application/json; charset=utf-8",
            headers: {
                Authorization: 'Bearer ' + token},
            url: "https://bt-application.herokuapp.com/api/clinic/countdistrict/1",
            success: function (data) {
                q1 = data;
            },
            error: function (jqXHR, textStatus, errorThrown) {


            }
        });
        $.ajax({
            type: "GET",
            dataType: "text",
            contentType: "application/json; charset=utf-8",
            headers: {
                Authorization: 'Bearer ' + token},
            url: "https://bt-application.herokuapp.com/api/clinic/countdistrict/2",
            success: function (data) {
                q2 = data;
            },
            error: function (jqXHR, textStatus, errorThrown) {


            }
        });
        $.ajax({
            type: "GET",
            dataType: "text",
            contentType: "application/json; charset=utf-8",
            headers: {
                Authorization: 'Bearer ' + token},
            url: "https://bt-application.herokuapp.com/api/clinic/countdistrict/3",
            success: function (data) {
                q3 = data;
            },
            error: function (jqXHR, textStatus, errorThrown) {


            }
        });
        $.ajax({
            type: "GET",
            dataType: "text",
            contentType: "application/json; charset=utf-8",
            headers: {
                Authorization: 'Bearer ' + token},
            url: "https://bt-application.herokuapp.com/api/clinic/countdistrict/4",
            success: function (data) {
                q4 = data;
            },
            error: function (jqXHR, textStatus, errorThrown) {


            }
        });
        $.ajax({
            type: "GET",
            dataType: "text",
            contentType: "application/json; charset=utf-8",
            headers: {
                Authorization: 'Bearer ' + token},
            url: "https://bt-application.herokuapp.com/api/clinic/countdistrict/5",
            success: function (data) {
                q5 = data;
            },
            error: function (jqXHR, textStatus, errorThrown) {


            }
        });
        $.ajax({
            type: "GET",
            dataType: "text",
            contentType: "application/json; charset=utf-8",
            headers: {
                Authorization: 'Bearer ' + token},
            url: "https://bt-application.herokuapp.com/api/clinic/countdistrict/6",
            success: function (data) {
                q6 = data;
            },
            error: function (jqXHR, textStatus, errorThrown) {


            }
        });
        $.ajax({
            type: "GET",
            dataType: "text",
            contentType: "application/json; charset=utf-8",
            headers: {
                Authorization: 'Bearer ' + token},
            url: "https://bt-application.herokuapp.com/api/clinic/countdistrict/7",
            success: function (data) {
                q7 = data;
            },
            error: function (jqXHR, textStatus, errorThrown) {


            }
        });
        $.ajax({
            type: "GET",
            dataType: "text",
            contentType: "application/json; charset=utf-8",
            headers: {
                Authorization: 'Bearer ' + token},
            url: "https://bt-application.herokuapp.com/api/clinic/countdistrict/8",
            success: function (data) {
                q8 = data;
            },
            error: function (jqXHR, textStatus, errorThrown) {


            }
        });
        $.ajax({
            type: "GET",
            dataType: "text",
            contentType: "application/json; charset=utf-8",
            headers: {
                Authorization: 'Bearer ' + token},
            url: "https://bt-application.herokuapp.com/api/clinic/countdistrict/9",
            success: function (data) {
                q9 = data;
            },
            error: function (jqXHR, textStatus, errorThrown) {


            }
        });
        $.ajax({
            type: "GET",
            dataType: "text",
            contentType: "application/json; charset=utf-8",
            headers: {
                Authorization: 'Bearer ' + token},
            url: "https://bt-application.herokuapp.com/api/clinic/countdistrict/10",
            success: function (data) {
                q10 = data;
            },
            error: function (jqXHR, textStatus, errorThrown) {


            }
        });
        $.ajax({
            type: "GET",
            dataType: "text",
            contentType: "application/json; charset=utf-8",
            headers: {
                Authorization: 'Bearer ' + token},
            url: "https://bt-application.herokuapp.com/api/clinic/countdistrict/11",
            success: function (data) {
                q11 = data;
            },
            error: function (jqXHR, textStatus, errorThrown) {


            }
        });
        $.ajax({
            type: "GET",
            dataType: "text",
            contentType: "application/json; charset=utf-8",
            headers: {
                Authorization: 'Bearer ' + token},
            url: "https://bt-application.herokuapp.com/api/clinic/countdistrict/12",
            success: function (data) {
                q12 = data;
            },
            error: function (jqXHR, textStatus, errorThrown) {


            }
        });
        $.ajax({
            type: "GET",
            dataType: "text",
            contentType: "application/json; charset=utf-8",
            headers: {
                Authorization: 'Bearer ' + token},
            url: "https://bt-application.herokuapp.com/api/clinic/countdistrict/Bình Thạnh",
            success: function (data) {
                bth = data;
            },
            error: function (jqXHR, textStatus, errorThrown) {


            }
        });
        $.ajax({
            type: "GET",
            dataType: "text",
            contentType: "application/json; charset=utf-8",
            headers: {
                Authorization: 'Bearer ' + token},
            url: "https://bt-application.herokuapp.com/api/clinic/countdistrict/Bình Tân",
            success: function (data) {
                bt = data;
            },
            error: function (jqXHR, textStatus, errorThrown) {


            }
        });
        $.ajax({
            type: "GET",
            dataType: "text",
            contentType: "application/json; charset=utf-8",
            headers: {
                Authorization: 'Bearer ' + token},
            url: "https://bt-application.herokuapp.com/api/clinic/countdistrict/Phú Nhuận",
            success: function (data) {
                pn = data;
            },
            error: function (jqXHR, textStatus, errorThrown) {


            }
        });
        $.ajax({
            type: "GET",
            dataType: "text",
            contentType: "application/json; charset=utf-8",
            headers: {
                Authorization: 'Bearer ' + token},
            url: "https://bt-application.herokuapp.com/api/clinic/countdistrict/Tân Bình",
            success: function (data) {
                tb = data;
            },
            error: function (jqXHR, textStatus, errorThrown) {


            }
        });
        $.ajax({
            type: "GET",
            dataType: "text",
            contentType: "application/json; charset=utf-8",
            headers: {
                Authorization: 'Bearer ' + token},
            url: "https://bt-application.herokuapp.com/api/clinic/countdistrict/Thủ Đức",
            success: function (data) {
                td = data;
            },
            error: function (jqXHR, textStatus, errorThrown) {


            }
        });
        $.ajax({
            type: "GET",
            dataType: "text",
            contentType: "application/json; charset=utf-8",
            headers: {
                Authorization: 'Bearer ' + token},
            url: "https://bt-application.herokuapp.com/api/clinic/countdistrict/Gò Vấp",
            success: function (data) {
                gv = data;
            },
            error: function (jqXHR, textStatus, errorThrown) {


            }
        });
        $.ajax({
            type: "GET",
            dataType: "text",
            contentType: "application/json; charset=utf-8",
            headers: {
                Authorization: 'Bearer ' + token},
            url: "https://bt-application.herokuapp.com/api/clinic/countdistrict/Tân Phú",
            success: function (data) {
                tp = data;
            },
            error: function (jqXHR, textStatus, errorThrown) {


            }
        });
        $(document).ajaxStop(function () {
            var barChartData = {
                labels: ['Quận 1', 'Quận 2', 'Quận 3', 'Quận 4', 'Quận 5', 'Quận 6', 'Quận 7', 'Quận 8', 'Quận 9', 'Quận 10', 'Quận 11', 'Quận 12', 'Gò Vấp', 'Bình Thạnh', 'Thủ Đức', 'Bình Tân', 'Tân Bình', 'Phú Nhuận', 'Tân Phú'],
                datasets: [{
                        label: 'Clinics',
                        backgroundColor: 'rgba(0, 158, 251, 0.5)',
                        borderColor: 'rgba(0, 158, 251, 1)',
                        borderWidth: 1,
                        data: [q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, gv, bth, td, bt, tb, pn, tp]
                    }]
            };
            var ctx = document.getElementById('bargraph').getContext('2d');
            window.myBar = new Chart(ctx, {
                type: 'bar',
                data: barChartData,
                options: {
                    responsive: true,
                    legend: {
                        display: false,
                    }
                }
            });
        });











        // Line Chart

//	var lineChartData = {
//		labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
//		datasets: [{
//			label: "My First dataset",
//			backgroundColor: "rgba(0, 158, 251, 0.5)",
//			data: [100, 70, 20, 100, 120, 50, 70, 50, 50, 100, 50, 90]
//		}, {
//		label: "My Second dataset",
//		backgroundColor: "rgba(255, 188, 53, 0.5)",
//		fill: true,
//		data: [28, 48, 40, 19, 86, 27, 20, 90, 50, 20, 90, 20]
//		}]
//	};

//	var linectx = document.getElementById('linegraph').getContext('2d');
//	window.myLine = new Chart(linectx, {
//		type: 'line',
//		data: lineChartData,
//		options: {
//			responsive: true,
//			legend: {
//				display: false,
//			},
//			tooltips: {
//				mode: 'index',
//				intersect: false,
//			}
//		}
//	});

        // Bar Chart 2

//    barChart();
//    
//    $(window).resize(function(){
//        barChart();
//    });
//    
//    function barChart(){
//        $('.bar-chart').find('.item-progress').each(function(){
//            var itemProgress = $(this),
//            itemProgressWidth = $(this).parent().width() * ($(this).data('percent') / 100);
//            itemProgress.css('width', itemProgressWidth);
//        });
//    };
    } else if (roleId.roleId.id === 2 || roleId.roleId.id === 4) {
        var t1, t2, t3, t4, t5, t6, t7, t8, t9, t10, t11, t12;
        $.ajax({
            type: "GET",
            dataType: "text",
            contentType: "application/json; charset=utf-8",
            headers: {
                Authorization: 'Bearer ' + token},
            url: "https://bt-application.herokuapp.com/api/examination/month/2020-01-01 00:00:00.000/2020-01-31 00:00:00.000/" + roleId.clinicId.id,
            success: function (data) {
                t1 = data;
            },
            error: function (jqXHR, textStatus, errorThrown) {


            }
        });
        $.ajax({
            type: "GET",
            dataType: "text",
            contentType: "application/json; charset=utf-8",
            headers: {
                Authorization: 'Bearer ' + token},
            url: "https://bt-application.herokuapp.com/api/examination/month/2020-02-01 00:00:00.000/2020-02-31 00:00:00.000/" + roleId.clinicId.id,
            success: function (data) {
                t2 = data;
            },
            error: function (jqXHR, textStatus, errorThrown) {


            }
        });
        $.ajax({
            type: "GET",
            dataType: "text",
            contentType: "application/json; charset=utf-8",
            headers: {
                Authorization: 'Bearer ' + token},
            url: "https://bt-application.herokuapp.com/api/examination/month/2020-03-01 00:00:00.000/2020-03-31 00:00:00.000/" + roleId.clinicId.id,
            success: function (data) {
                t3 = data;
            },
            error: function (jqXHR, textStatus, errorThrown) {


            }
        });
        $.ajax({
            type: "GET",
            dataType: "text",
            contentType: "application/json; charset=utf-8",
            headers: {
                Authorization: 'Bearer ' + token},
            url: "https://bt-application.herokuapp.com/api/examination/month/2020-04-01 00:00:00.000/2020-04-31 00:00:00.000/" + roleId.clinicId.id,
            success: function (data) {
                t4 = data;
            },
            error: function (jqXHR, textStatus, errorThrown) {


            }
        });
        $.ajax({
            type: "GET",
            dataType: "text",
            contentType: "application/json; charset=utf-8",
            headers: {
                Authorization: 'Bearer ' + token},
            url: "https://bt-application.herokuapp.com/api/examination/month/2020-05-01 00:00:00.000/2020-05-31 00:00:00.000/" + roleId.clinicId.id,
            success: function (data) {
                t5 = data;
            },
            error: function (jqXHR, textStatus, errorThrown) {


            }
        });
        $.ajax({
            type: "GET",
            dataType: "text",
            contentType: "application/json; charset=utf-8",
            headers: {
                Authorization: 'Bearer ' + token},
            url: "https://bt-application.herokuapp.com/api/examination/month/2020-06-01 00:00:00.000/2020-06-31 00:00:00.000/" + roleId.clinicId.id,
            success: function (data) {
                t6 = data;
            },
            error: function (jqXHR, textStatus, errorThrown) {


            }
        });
        $.ajax({
            type: "GET",
            dataType: "text",
            contentType: "application/json; charset=utf-8",
            headers: {
                Authorization: 'Bearer ' + token},
            url: "https://bt-application.herokuapp.com/api/examination/month/2020-07-01 00:00:00.000/2020-07-31 00:00:00.000/" + roleId.clinicId.id,
            success: function (data) {
                t7 = data;
            },
            error: function (jqXHR, textStatus, errorThrown) {


            }
        });
        $.ajax({
            type: "GET",
            dataType: "text",
            contentType: "application/json; charset=utf-8",
            headers: {
                Authorization: 'Bearer ' + token},
            url: "https://bt-application.herokuapp.com/api/examination/month/2020-08-01 00:00:00.000/2020-08-31 00:00:00.000/" + roleId.clinicId.id,
            success: function (data) {
                t8 = data;
            },
            error: function (jqXHR, textStatus, errorThrown) {


            }
        });
        $.ajax({
            type: "GET",
            dataType: "text",
            contentType: "application/json; charset=utf-8",
            headers: {
                Authorization: 'Bearer ' + token},
            url: "https://bt-application.herokuapp.com/api/examination/month/2020-09-01 00:00:00.000/2020-09-31 00:00:00.000/" + roleId.clinicId.id,
            success: function (data) {
                t9 = data;
            },
            error: function (jqXHR, textStatus, errorThrown) {


            }
        });
        $.ajax({
            type: "GET",
            dataType: "text",
            contentType: "application/json; charset=utf-8",
            headers: {
                Authorization: 'Bearer ' + token},
            url: "https://bt-application.herokuapp.com/api/examination/month/2020-10-01 00:00:00.000/2020-10-31 00:00:00.000/" + roleId.clinicId.id,
            success: function (data) {
                t10 = data;
            },
            error: function (jqXHR, textStatus, errorThrown) {


            }
        });
        $.ajax({
            type: "GET",
            dataType: "text",
            contentType: "application/json; charset=utf-8",
            headers: {
                Authorization: 'Bearer ' + token},
            url: "https://bt-application.herokuapp.com/api/examination/month/2020-11-01 00:00:00.000/2020-11-31 00:00:00.000/" + roleId.clinicId.id,
            success: function (data) {
                t11 = data;
            },
            error: function (jqXHR, textStatus, errorThrown) {


            }
        });
        $.ajax({
            type: "GET",
            dataType: "text",
            contentType: "application/json; charset=utf-8",
            headers: {
                Authorization: 'Bearer ' + token},
            url: "https://bt-application.herokuapp.com/api/examination/month/2020-12-01 00:00:00.000/2020-12-31 00:00:00.000/" + roleId.clinicId.id,
            success: function (data) {
                t12 = data;
                console.log("a");
                console.log(t12);
            },
            error: function (jqXHR, textStatus, errorThrown) {


            }
        });
        $(document).ajaxStop(function () {
            var barChartData = {
                labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
                datasets: [{
                        label: 'Examination',
                        backgroundColor: 'rgba(0, 158, 251, 0.5)',
                        borderColor: 'rgba(0, 158, 251, 1)',
                        borderWidth: 1,
                        data: [t1,t2, t3, t4, t5, t6, t7, t8, t9, t10, t11, t12]
                    }]
            };
            var ctx = document.getElementById('bargraph').getContext('2d');
            window.myBar = new Chart(ctx, {
                type: 'bar',
                data: barChartData,
                options: {
                    responsive: true,
                    legend: {
                        display: false
                    }
                }
            });
        });
    }
});