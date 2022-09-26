<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en" class="light-theme">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="${pageContext.request.contextPath}/resources/assets_system/images/favicon-32x32.png" type="image/png" />
    <!--plugins-->
    <link href="${pageContext.request.contextPath}/resources/assets_system/plugins/simplebar/css/simplebar.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/assets_system/plugins/perfect-scrollbar/css/perfect-scrollbar.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/assets_system/plugins/metismenu/css/metisMenu.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/assets_system/plugins/vectormap/jquery-jvectormap-2.0.2.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/assets_system/plugins/datatable/css/dataTables.bootstrap5.min.css" rel="stylesheet" />
    <!-- Bootstrap CSS -->
    <link href="${pageContext.request.contextPath}/resources/assets_system/css/bootstrap.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/assets_system/css/bootstrap-extended.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/assets_system/css/style.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/assets_system/css/icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">

    <!-- loader-->
    <link href="${pageContext.request.contextPath}/resources/assets_system/css/pace.min.css" rel="stylesheet" />

    <!--Theme Styles-->
    <link href="${pageContext.request.contextPath}/resources/assets_system/css/dark-theme.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/assets_system/css/light-theme.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/assets_system/css/semi-dark.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/assets_system/css/header-colors.css" rel="stylesheet" />

    <title>Skodash - Bootstrap 5 Admin Template</title>
</head>

<body>


<!--start wrapper-->
<div class="wrapper">

    <!--start content-->
    <main class="page-content" style="margin: 0">

        <div class="row row-cols-1 row-cols-md-2 row-cols-lg-2 row-cols-xl-4">
            <div class="col">
                <div class="card radius-10">
                    <div class="card-body">
                        <div class="d-flex align-items-center">
                            <div>
                                <p class="mb-0 text-secondary">即将开始的考试</p>
                                <h4 class="my-1">5</h4>
                                <p class="mb-0 font-13 text-success"><i class="bi bi-caret-up-fill"></i> upcoming exam</p>
                            </div>
                            <div class="widget-icon-large bg-gradient-purple text-white ms-auto"><i class="bi bi-hdd-fill"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card radius-10">
                    <div class="card-body">
                        <div class="d-flex align-items-center">
                            <div>
                                <p class="mb-0 text-secondary">正在进行中的考试</p>
                                <h4 class="my-1">3</h4>
                                <p class="mb-0 font-13 text-success"><i class="bi bi-caret-up-fill"></i> exam in progress</p>
                            </div>
                            <div class="widget-icon-large bg-gradient-success text-white ms-auto"><i class="bi bi-flag-fill"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card radius-10">
                    <div class="card-body">
                        <div class="d-flex align-items-center">
                            <div>
                                <p class="mb-0 text-secondary">系统用户总数</p>
                                <h4 class="my-1" id="total_user_num">5.8K</h4>
                                <p class="mb-0 font-13 text-success"><i class="bi bi-caret-up-fill"></i> Total number of system users</p>
                            </div>
                            <div class="widget-icon-large bg-gradient-danger text-white ms-auto"><i class="bi bi-people-fill"></i>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card radius-10">
                    <div class="card-body">
                        <div class="d-flex align-items-center">
                            <div class="">
                                <p class="mb-1">本月新增用户数与比例</p>
                                <h4 class="mb-0 text-orange" id="new_user_num">214</h4>
                            </div>
                            <div class="ms-auto">
                                <div class="w_chart" id="chart20" data-percent="70">
                                    <span class="w_percent"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div><!--end row-->


        <div class="row">
            <div class="col-12 col-lg-8 col-xl-7 d-flex">
                <div class="card radius-10 w-100">
                    <div class="card-body">
                        <div class="row row-cols-1 row-cols-lg-2 g-3 align-items-center">
                            <div class="col">
                                <h5 class="mb-0">当周用户使用情况</h5>
                            </div>
                            <div class="col">
                                <div class="d-flex align-items-center justify-content-sm-end gap-3 cursor-pointer">
                                    <div class="font-13"><i class="bi bi-circle-fill text-primary"></i><span class="ms-2">前台用户</span></div>
                                    <div class="font-13"><i class="bi bi-circle-fill text-success"></i><span class="ms-2">后台用户</span></div>
                                </div>
                            </div>
                        </div>
                        <div id="chart1"></div>
                    </div>
                </div>
            </div>

            <div class="col-12 col-lg-12 col-xl-12 col-xxl-5 d-flex">
                <div class="card radius-10 w-100">
                    <div class="card-header bg-transparent">
                        <div class="row g-3 align-items-center">
                            <div class="col">
                                <h5 class="mb-0">服务器参数</h5>
                            </div>
                            <div class="col">
                                <div class="d-flex align-items-center justify-content-end gap-3 cursor-pointer">
                                    <div class="dropdown">
                                        <a class="dropdown-toggle dropdown-toggle-nocaret" href="#" data-bs-toggle="dropdown" aria-expanded="false"><i class="bx bx-dots-horizontal-rounded font-22 text-option"></i>
                                        </a>
                                        <ul class="dropdown-menu">
                                            <li><a class="dropdown-item" href="javascript:;">Action</a>
                                            </li>
                                            <li><a class="dropdown-item" href="javascript:;">Another action</a>
                                            </li>
                                            <li>
                                                <hr class="dropdown-divider">
                                            </li>
                                            <li><a class="dropdown-item" href="javascript:;">Something else here</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="row align-items-center justify-content-center">
                            <div class="col-12 col-lg-6 col-xl-6">
                                <div id="chart_system"></div>
                            </div>
                            <div class="col-12 col-lg-6 col-xl-6">
                                <div class="row row-cols-1 row-cols-lg-2 row-cols-xl-2 g-3">
                                    <div class="col">
                                        <div class="card radius-10 mb-0 shadow-none bg-light-purple">
                                            <div class="card-body p-4">
                                                <div class="text-center">
                                                    <h5 class="mb-0 text-purple">8核</h5>
                                                    <p class="mb-0 text-purple">CPU</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="card radius-10 mb-0 shadow-none bg-light-orange">
                                            <div class="card-body p-4">
                                                <div class="text-center">
                                                    <h5 class="mb-0 text-orange">2080Ti</h5>
                                                    <p class="mb-0 text-orange">GPU</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="card radius-10 mb-0 shadow-none bg-light-success">
                                            <div class="card-body p-4">
                                                <div class="text-center">
                                                    <h5 class="mb-0 text-success" id="CPU">18%</h5>
                                                    <p class="mb-0 text-success">CPU利用率</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col">
                                        <div class="card radius-10 mb-0 shadow-none bg-light-primary">
                                            <div class="card-body p-4">
                                                <div class="text-center">
                                                    <h5 class="mb-0 text-primary" id="GPU">7%</h5>
                                                    <p class="mb-0 text-primary">GPU使用率</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div><!--end row-->

        <div class="row">
            <div class="col-12 col-lg-6 col-xl-6 d-flex">
                <div class="card radius-10 w-100">
                    <div class="card-header bg-transparent">
                        <div class="row g-3 align-items-center">
                            <div class="col">
                                <h5 class="mb-0">系统用户比例</h5>
                            </div>
                            <div class="col">
                                <div class="d-flex align-items-center justify-content-end gap-3 cursor-pointer">
                                    <div class="dropdown">
                                        <a class="dropdown-toggle dropdown-toggle-nocaret" href="#" data-bs-toggle="dropdown" aria-expanded="false"><i class="bx bx-dots-horizontal-rounded font-22 text-option"></i>
                                        </a>
                                        <ul class="dropdown-menu">
                                            <li><a class="dropdown-item" href="javascript:;">Action</a>
                                            </li>
                                            <li><a class="dropdown-item" href="javascript:;">Another action</a>
                                            </li>
                                            <li>
                                                <hr class="dropdown-divider">
                                            </li>
                                            <li><a class="dropdown-item" href="javascript:;">Something else here</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="d-lg-flex align-items-center justify-content-center gap-4" id="user_persent">
                            <div id="chart3"></div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-12 col-lg-12 col-xl-6 d-flex">
                <div class="card radius-10 w-100">
                    <div class="card-header bg-transparent">
                        <div class="row g-3 align-items-center">
                            <div class="col">
                                <h5 class="mb-0">系统用户</h5>
                            </div>
                            <div class="col">
                                <div class="d-flex align-items-center justify-content-end gap-3 cursor-pointer">
                                    <div class="dropdown">
                                        <a class="dropdown-toggle dropdown-toggle-nocaret" href="#" data-bs-toggle="dropdown" aria-expanded="false"><i class="bx bx-dots-horizontal-rounded font-22 text-option"></i>
                                        </a>
                                        <ul class="dropdown-menu">
                                            <li><a class="dropdown-item" href="javascript:;">Action</a>
                                            </li>
                                            <li><a class="dropdown-item" href="javascript:;">Another action</a>
                                            </li>
                                            <li>
                                                <hr class="dropdown-divider">
                                            </li>
                                            <li><a class="dropdown-item" href="javascript:;">Something else here</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <div id="chart_user_bar"></div>
                    </div>
                </div>
            </div>
        </div><!--end row-->





    </main>
    <!--end page main-->

    <!--start overlay-->
    <div class="overlay nav-toggle-icon"></div>
    <!--end overlay-->

    <!--Start Back To Top Button-->
    <a href="javaScript:;" class="back-to-top"><i class='bx bxs-up-arrow-alt'></i></a>
    <!--End Back To Top Button-->

    <!--start switcher-->
    <div class="switcher-body">
        <button class="btn btn-primary btn-switcher shadow-sm" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasScrolling" aria-controls="offcanvasScrolling"><i class="bi bi-paint-bucket me-0"></i></button>
        <div class="offcanvas offcanvas-end shadow border-start-0 p-2" data-bs-scroll="true" data-bs-backdrop="false" tabindex="-1" id="offcanvasScrolling">
            <div class="offcanvas-header border-bottom">
                <h5 class="offcanvas-title" id="offcanvasScrollingLabel">Theme Customizer</h5>
                <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas"></button>
            </div>
            <div class="offcanvas-body">
                <h6 class="mb-0">Theme Variation</h6>
                <hr>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="inlineRadioOptions" id="LightTheme" value="option1" checked>
                    <label class="form-check-label" for="LightTheme">Light</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="inlineRadioOptions" id="DarkTheme" value="option2">
                    <label class="form-check-label" for="DarkTheme">Dark</label>
                </div>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="inlineRadioOptions" id="SemiDarkTheme" value="option3">
                    <label class="form-check-label" for="SemiDarkTheme">Semi Dark</label>
                </div>
                <hr>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="inlineRadioOptions" id="MinimalTheme" value="option3">
                    <label class="form-check-label" for="MinimalTheme">Minimal Theme</label>
                </div>
                <hr/>
                <h6 class="mb-0">Header Colors</h6>
                <hr/>
                <div class="header-colors-indigators">
                    <div class="row row-cols-auto g-3">
                        <div class="col">
                            <div class="indigator headercolor1" id="headercolor1"></div>
                        </div>
                        <div class="col">
                            <div class="indigator headercolor2" id="headercolor2"></div>
                        </div>
                        <div class="col">
                            <div class="indigator headercolor3" id="headercolor3"></div>
                        </div>
                        <div class="col">
                            <div class="indigator headercolor4" id="headercolor4"></div>
                        </div>
                        <div class="col">
                            <div class="indigator headercolor5" id="headercolor5"></div>
                        </div>
                        <div class="col">
                            <div class="indigator headercolor6" id="headercolor6"></div>
                        </div>
                        <div class="col">
                            <div class="indigator headercolor7" id="headercolor7"></div>
                        </div>
                        <div class="col">
                            <div class="indigator headercolor8" id="headercolor8"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--end switcher-->

</div>
<!--end wrapper-->


<!-- Bootstrap bundle JS -->
<script src="${pageContext.request.contextPath}/resources/assets_system/js/bootstrap.bundle.min.js"></script>
<!--plugins-->
<script src="${pageContext.request.contextPath}/resources/assets_system/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets_system/plugins/simplebar/js/simplebar.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets_system/plugins/metismenu/js/metisMenu.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets_system/plugins/easyPieChart/jquery.easypiechart.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets_system/plugins/peity/jquery.peity.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets_system/plugins/perfect-scrollbar/js/perfect-scrollbar.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets_system/js/pace.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets_system/plugins/vectormap/jquery-jvectormap-2.0.2.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets_system/plugins/vectormap/jquery-jvectormap-world-mill-en.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets_system/plugins/apexcharts-bundle/js/apexcharts.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets_system/plugins/datatable/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets_system/plugins/datatable/js/dataTables.bootstrap5.min.js"></script>
<!--app-->
<script src="${pageContext.request.contextPath}/resources/assets_system/js/app.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets_system/js/index.js"></script>

<script>
    new PerfectScrollbar(".best-product")
    new PerfectScrollbar(".top-sellers-list")
</script>

<script>

    <%--生成指定范围的随机数--%>

    function RandomNumBoth(Min, Max) {
        var Range = Max - Min;
        var Rand = Math.random();
        var num = Min + Math.round(Rand * Range); //四舍五入
        return num;
    }

    //计算数组内元素的和
    function sum(arr) {
        return eval(arr.join("+"));
    };

    var persent_cache = RandomNumBoth(43,51);
    $("#CPU").text(RandomNumBoth(15,21)+"%");
    $("#GPU").text(RandomNumBoth(15,21)+"%");
    var options = {
        series: [persent_cache],
        chart: {
            foreColor: '#9ba7b2',
            height: 280,
            type: 'radialBar',
        },
        plotOptions: {
            radialBar: {
                //startAngle: -130,
                //endAngle: 130,
                hollow: {
                    margin: 0,
                    size: '82%',
                    //background: '#fff',
                    image: undefined,
                    imageOffsetX: 0,
                    imageOffsetY: 0,
                    position: 'front',
                    dropShadow: {
                        enabled: false,
                        top: 3,
                        left: 0,
                        blur: 4,
                        color: 'rgba(0, 169, 255, 0.15)',
                        opacity: 0.65
                    }
                },
                track: {
                    background: '#dfecff',
                    //strokeWidth: '67%',
                    margin: 0, // margin is in pixels
                    dropShadow: {
                        enabled: false,
                        top: -3,
                        left: 0,
                        blur: 4,
                        color: 'rgba(0, 169, 255, 0.85)',
                        opacity: 0.65
                    }
                },
                dataLabels: {
                    showOn: 'always',
                    name: {
                        offsetY: -25,
                        show: true,
                        color: '#6c757d',
                        fontSize: '16px'
                    },
                    value: {
                        formatter: function (val) {
                            return val + "%";
                        },
                        color: '#000',
                        fontSize: '45px',
                        show: true,
                        offsetY: 10,
                    }
                }
            }
        },
        fill: {
            type: 'gradient',
            gradient: {
                shade: 'dark',
                type: 'horizontal',
                shadeIntensity: 0.5,
                gradientToColors: ['#3361ff'],
                inverseColors: false,
                opacityFrom: 1,
                opacityTo: 1,
                stops: [0, 100]
            }
        },
        colors: ["#3361ff"],
        labels: ['内存占用率'],
    };
    var chart_system = new ApexCharts(document.querySelector("#chart_system"), options);
    chart_system.render();

    setInterval(function (){
        var persent_cache = RandomNumBoth(43,51);
        chart_system.updateSeries([persent_cache])
        $("#CPU").text(RandomNumBoth(15,21)+"%");
        $("#GPU").text(RandomNumBoth(15,21)+"%")
    },3000)



    var  new_user_num=9;
    var user_categories=["学生", "管理员", "教师","教务处", "阅卷组","命题组"]
    var user_num = [23,5, 8, 4, 3]
    var total_user_num = sum(user_num)
    $("#total_user_num").text(total_user_num)
    $("#new_user_num").text(new_user_num)

    var new_user_persent = (new_user_num/(total_user_num-new_user_num))*100

    $("#chart20").attr("data-percent",new_user_persent)
    // chart 2
    var options = {
        series: [{
            name: "Users",
            data: user_num
        }],
        chart: {
            foreColor: '#9a9797',
            type: "bar",
            //width: 130,
            height: 270,
            toolbar: {
                show: !1
            },
            zoom: {
                enabled: !1
            },
            dropShadow: {
                enabled: 0,
                top: 3,
                left: 14,
                blur: 4,
                opacity: .12,
                color: "#12bf24"
            },
            sparkline: {
                enabled: !1
            }
        },
        markers: {
            size: 0,
            colors: ["#12bf24"],
            strokeColors: "#fff",
            strokeWidth: 2,
            hover: {
                size: 7
            }
        },
        plotOptions: {
            bar: {
                horizontal: 1,
                columnWidth: "20%",
                columnHeight: "20%",
                endingShape: "rounded"
            }
        },
        legend: {
            show: false,
            position: 'top',
            horizontalAlign: 'left',
            offsetX: -20
        },
        dataLabels: {
            enabled: !1
        },
        grid: {
            show: false,
            // borderColor: '#eee',
            // strokeDashArray: 4,
        },
        stroke: {
            show: !0,
            // width: 3,
            curve: "smooth"
        },
        //colors: ["#12bf24"],
        xaxis: {
            categories: user_categories
        },
        tooltip: {
            theme: 'dark',
            y: {
                formatter: function (val) {
                    return "" + val + ""
                }
            }
        }
    };

    var chart = new ApexCharts(document.querySelector("#chart_user_bar"), options);
    chart.render();


    // chart 3
    $("#user_persent").append(`<ul class="list-group list-group-flush" id="user_persent_ul">`)
    for (var i=0;i<user_num.length;i++){
        $("#user_persent_ul").append(`<li class="list-group-item"><i class="bi bi-circle-fill text-info me-1"></i>` +user_categories[i]+`:<span class="me-1">`+user_num[i]+`</span></li>`)
    }
    $("#user_persent").append(`</ul>`)
    var options = {
        series: user_num,
        chart: {
            width: 340,
            type: 'donut',
        },
        labels: user_categories,
        fill: {
            type: 'gradient',
            gradient: {
                shade: 'light',
                type: "vertical",
                shadeIntensity: 0.5,
                gradientToColors: ["#667eea", "#00c6fb", "#f77062", "#fcfcff", "#98ec2d","#667eea", "#00c6fb", "#f77062", "#fcfcff", "#98ec2d"],
                inverseColors: true,
                opacityFrom: 1,
                opacityTo: 1,
                //stops: [0, 50, 100],
                //colorStops: []
            }
        },
        colors: ["#764ba2", "#005bea", "#fe5196", "#12bf24"],
        legend: {
            show: false,
            position: 'top',
            horizontalAlign: 'left',
            offsetX: -20
        },
        responsive: [{
            breakpoint: 480,
            options: {
                chart: {
                    height: 260
                },
                legend: {
                    position: 'bottom'
                }
            }
        }]
    };

    var chart = new ApexCharts(document.querySelector("#chart3"), options);
    chart.render();

    $('#chart20').easyPieChart({

        easing: 'easeOutBounce',
        barColor : '#ff6632',
        lineWidth: 8,
        trackColor : 'rgb(255 102 50 / 15%)',
        scaleColor: false,
        onStep: function(from, to, percent) {
            $(this.el).find('.w_percent').text(Math.round(percent));
        }

    });



    var qiantai_data=[RandomNumBoth(3,23),RandomNumBoth(3,23),RandomNumBoth(3,23),RandomNumBoth(3,23),RandomNumBoth(3,23),RandomNumBoth(3,23),RandomNumBoth(3,23)]
    var houtai_data = [RandomNumBoth(2,10),RandomNumBoth(2,10),RandomNumBoth(2,10),RandomNumBoth(2,10),RandomNumBoth(2,10),RandomNumBoth(2,10),RandomNumBoth(2,10)]
    // chart 1
    var options = {
        series: [{
            name: "前台用户",
            data: qiantai_data
        },{
            name: "后台用户",
            data: houtai_data
        }],
        chart: {
            foreColor: '#9a9797',
            type: "area",
            //width: 130,
            height: 370,
            toolbar: {
                show: !1
            },
            zoom: {
                enabled: !1
            },
            dropShadow: {
                enabled: 0,
                top: 3,
                left: 14,
                blur: 4,
                opacity: .12,
                color: "#3461ff"
            },
            sparkline: {
                enabled: !1
            }
        },
        markers: {
            size: 0,
            colors: ["#3461ff", "#12bf24"],
            strokeColors: "#fff",
            strokeWidth: 2,
            hover: {
                size: 7
            }
        },
        plotOptions: {
            bar: {
                horizontal: !1,
                columnWidth: "35%",
                endingShape: "rounded"
            }
        },
        legend: {
            show: false,
            position: 'top',
            horizontalAlign: 'left',
            offsetX: -20
        },
        dataLabels: {
            enabled: !1
        },
        grid: {
            show: true,
            // borderColor: '#eee',
            // strokeDashArray: 4,
        },
        stroke: {
            show: !0,
            width: 3,
            curve: "smooth"
        },
        fill: {
            type: 'gradient',
            gradient: {
                shade: 'light',
                type: "vertical",
                shadeIntensity: 0.5,
                gradientToColors: ["#3461ff", "#12bf24"],
                inverseColors: true,
                opacityFrom: 0.8,
                opacityTo: 0.2,
                //stops: [0, 50, 100],
                //colorStops: []
            }
        },
        colors: ["#3461ff", "#12bf24"],
        xaxis: {
            categories: ["6天前", "5天前", "4天前", "3天前", "前天", "昨天", "今天"]
        },
        tooltip: {
            theme: 'dark',
            y: {
                formatter: function (val) {
                    return "" + val + ""
                }
            }
        }
    };

    var chart = new ApexCharts(document.querySelector("#chart1"), options);
    chart.render();


</script>

</body>

</html>