

<%--
  Created by IntelliJ IDEA.
  User: 友好邻居木子
  Date: 2022/4/12
  Time: 13:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>后台管理系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="Premium Multipurpose Admin & Dashboard Template"
          name="description" />
    <meta content="Themesbrand" name="author" />
    <meta name="referrer" content="no-referrer"> <%--图片显示，一定要加--%>


    <!-- preloader css -->
    <link rel="stylesheet" type="text/css" href="../resources/admin/easyui/assets/css/preloader.min.css" />
    <!-- Bootstrap Css -->
    <link rel="stylesheet" type="text/css" id="bootstrap-style" href="../resources/admin/easyui/assets/css/bootstrap.min.css"/>

    <!-- App Css-->
    <link rel="stylesheet" type="text/css" id="app-style" href="../resources/admin/easyui/assets/css/app.min.css"/>
    <!-- Custom Css -->
    <link rel="stylesheet" type="text/css" href="../resources/admin/easyui/assets/css/custom.css"/>



</head>
<body style="background-image: url(../resources/admin/easyui/images/bgc.png)">
<div id="layout-wrapper" >

    <!--头部-->
    <header id="page-topbar" style="background-color: #f4f4f4b3">
        <div class="navbar-header">

            <div class="d-flex">
                <div class="navbar-brand-box" style="background-color:#f4f4f4b3">
                    <a href="welcome" class="logo logo-dark" target="admin">
                            <span class="logo-sm">
                                <img src="../resources/admin/easyui/icon/platform-color.png" alt=""
                                     height="24">
                            </span>
                        <span class="logo-lg">
                                <img src="../resources/admin/easyui/icon/platform-color.png" alt=""
                                     height="24"> <span class="logo-txt">后台管理系统</span>
                            </span>
                    </a>

                    <a href="welcome" class="logo logo-light" target="admin">
                            <span class="logo-sm">
                                <img src="../resources/admin/easyui/icon/platform-color.png" alt=""
                                     height="24">
                            </span>
                        <span class="logo-lg">
                                <img src="../resources/admin/easyui/icon/platform-color.png" alt=""
                                     height="24"> <span class="logo-txt">后台管理系统</span>
                            </span>

                    </a>
                </div>
            </div><!--LOGO，侧边栏头部-->


            <div class="d-flex">
                <div class="dropdown d-none d-sm-inline-block">
                    <button type="button" class="btn header-item"
                            data-bs-toggle="dropdown" aria-haspopup="true"
                            aria-expanded="false">
                        <img id="header-lang-img"
                             src="../resources/admin/easyui/icon/Lan.png" alt="Header
                                Language" height="25" width="25">
                    </button>
                    <div class="dropdown-menu dropdown-menu-end">

                        <!-- item-->
                        <a href="javascript:void(0);"
                           class="dropdown-item notify-item language"
                           data-lang="en">
                            <img src="../resources/admin/easyui/icon/Lan.png"
                                 alt="user-image" class="me-1"
                                 height="22" width="22"> <span class="align-middle">Chinese</span>
                        </a>
                        <!-- item-->
                        <a href="javascript:void(0);"
                           class="dropdown-item notify-item language"
                           data-lang="sp">
                            <img src="../resources/admin/easyui/icon/Lan.png"
                                 alt="user-image" class="me-1"
                                 height="22" width="22"> <span class="align-middle">English</span>
                        </a>
                    </div>
                </div><!--头部，语言-->

                <div class="dropdown d-inline-block">
                    <button type="button" class="btn header-item
                            bg-soft-light border-start border-end"
                            id="page-header-user-dropdown"
                            data-bs-toggle="dropdown" aria-haspopup="true"
                            aria-expanded="false">
                        <img class="rounded-circle header-profile-user"
                             src="../resources/admin/easyui/icon/avatar11.png"
                             alt="Header Avatar">
                        <span class="d-none d-xl-inline-block ms-1
                                fw-medium">${admin.username}</span>
                        <i class="mdi mdi-chevron-down d-none
                                d-xl-inline-block"></i>
                    </button>
                    <div class="dropdown-menu dropdown-menu-end">
                        <!-- item-->
                        <a class="dropdown-item" href="edit_password" target="admin"><img src="../resources/admin/easyui/icon/tp.png"
                                                                                          height="20" width="20">
                            <i class="mdi
                                    mdi-face-profile font-size-16
                                    align-middle me-1"></i> 修改密码</a>
                        <a class="dropdown-item" href="../home/login" ><img src="../resources/admin/easyui/icon/doors.png"
                                                                            height="20" width="20">
                            <i class="mdi
                                    mdi-credit-card-outline font-size-16
                                    align-middle me-1"></i> 网站首页</a>
                        <a class="dropdown-item" href="#"><img src="../resources/admin/easyui/icon/uss.png"
                                                               height="20" width="20">
                            <i class="mdi
                                    mdi-lock font-size-16 align-middle
                                    me-1"></i> 关于我们</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="logout"> <img src="../resources/admin/easyui/icon/lo.png"
                                                                     height="20" width="20">
                            <i class="mdi
                                    mdi-logout font-size-16 align-middle
                                    me-1"></i> 安全退出</a>
                    </div>
                </div><!--头部，个人信息-->
            </div>
        </div>
    </header>
    <!--侧边栏-->
    <div class="vertical-menu" style="background-color: #f4f4f4b3">

        <div data-simplebar class="h-100">

            <!--- Sidemenu -->
            <div id="sidebar-menu" style="background-color: #f4f4f4b3">
                <ul class="metismenu list-unstyled" id="side-menu">
                    <!---首页 -->
                    <li class="menu-title" data-key="t-menu" style="color: #545a6d">系统管理</li>
                    <li>
                        <a href="welcome" target="admin" id="index_page">
                            <i data-feather="home"></i>
                            <img src="../resources/admin/easyui/icon/more-color.png" height="20" width="20"  style="margin-left: -27px;">
                            <span data-key="t-dashboard">首页</span>
                        </a>
                    </li>

                    <!---用户管理（用户列表）  -->
                    <li>
                        <a href="javascript: void(0);"
                           class="has-arrow1">
                            <i data-feather="users"></i>
                            <img src="../resources/admin/easyui/icon/portray-color.png" height="20" width="20"  style="margin-left: -27px">
                            <span data-key="t-authentication">用户管理</span>
                            <img src="../resources/admin/easyui/icon/right.png" height="12" width="12" style="margin-top: -6px;margin-left: 95px">
                        </a>
                        <ul class="sub-menu" aria-expanded="false">
                            <li><a href="../admin/user/list?_mid=15" target="admin"
                                   data-key="t-login">用户列表</a></li>
                        </ul>
                    </li>

                    <!---系统管理（菜单管理、角色管理、修改密码）  -->
                    <li>
                        <a href="javascript: void(0)"
                           class="has-arrow1">
                            <i data-feather="grid"></i>
                            <img src="../resources/admin/easyui/icon/work-flow-color.png" height="20" width="20"  style="margin-left: -27px;">
                            <span data-key="t-apps">系统管理</span>
                            <img src="../resources/admin/easyui/icon/right.png" height="12" width="12" style="margin-top: -6px;margin-left: 95px">
                        </a>
                        <ul class="sub-menu" aria-expanded="false">
                            <li>
                                <a href="../admin/menu/list?_mid=5" target="admin">
                                    <span data-key="t-calendar">菜单管理</span>
                                </a>
                            </li>

                            <li>
                                <a href="../admin/role/list?_mid=13" target="admin">
                                    <span data-key="t-chat">角色管理</span>
                                </a>
                            </li>
                        </ul>
                    </li>


                    <!---系统日志（日志列表）  -->
                    <li>
                        <a href="javascript: void(0);"
                           class="has-arrow1">
                            <i data-feather="share-2"></i>
                            <img src="../resources/admin/easyui/icon/tag-color.png" height="20" width="20"  style="margin-left: -27px;">
                            <span data-key="t-multi-level">系统日志</span>
                            <img src="../resources/admin/easyui/icon/right.png" height="12" width="12" style="margin-top: -6px;margin-left: 95px">
                        </a>
                        <ul class="sub-menu" aria-expanded="false">
                            <li><a href="../admin/log/list?_mid=32" target="admin"
                                   data-key="t-level-1-1">日志列表</a></li>
                        </ul>
                    </li>
                    <li class="menu-title" data-key="t-menu" style="color: #545a6d">考试管理</li>

                    <!---学科管理（学科列表）  -->
                    <li>
                        <a href="javascript: void(0);"
                           class="has-arrow1">
                            <i data-feather="file-text"></i>
                            <img src="../resources/admin/easyui/icon/standar-color.png" height="20" width="20"  style="margin-left: -27px;">
                            <span data-key="t-pages">学科管理</span>
                            <img src="../resources/admin/easyui/icon/right.png" height="12" width="12" style="margin-top: -6px;margin-left: 95px">
                        </a>
                        <ul class="sub-menu" aria-expanded="false">
                            <li><a href="../admin/subject/list?_mid=38" target="admin"
                                   data-key="t-starter-page">学科列表</a></li>
                        </ul>
                    </li>

                    <!---考生管理（考生列表）  -->
                    <li>
                        <a href="javascript: void(0);"
                           class="has-arrow1">
                            <i data-feather="briefcase"></i>
                            <img src="../resources/admin/easyui/icon/talent-color.png" height="20" width="20"  style="margin-left: -27px;">
                            <span data-key="t-components">考生管理</span>
                            <img src="../resources/admin/easyui/icon/right.png" height="12" width="12" style="margin-top: -6px;margin-left: 95px">
                        </a>
                        <ul class="sub-menu" aria-expanded="false">
                            <li><a href="../admin/student/list?_mid=43" target="admin"
                                   data-key="t-alerts">考生列表</a></li>
                        </ul>
                    </li>

                    <!---试题管理（试题列表）  -->
                    <li>
                        <a href="javascript: void(0);"
                           class="has-arrow1">
                            <i data-feather="gift"></i>
                            <img src="../resources/admin/easyui/icon/table-color.png" height="20" width="20"  style="margin-left: -27px;">
                            <span data-key="t-ui-elements">试题管理</span>
                            <img src="../resources/admin/easyui/icon/right.png" height="12" width="12" style="margin-top: -6px;margin-left: 95px">
                        </a>
                        <ul class="sub-menu" aria-expanded="false">
                            <li><a href="../admin/question/list?_mid=48" target="admin"
                                   data-key="t-lightbox">试题列表</a></li>
                        </ul>
                    </li>

                    <!---考试管理（考试列表）  -->
                    <li>
                        <a href="javascript: void(0);" class="has-arrow1">
                            <i data-feather="box"></i>
                            <img src="../resources/admin/easyui/icon/amount-color.png" height="20" width="20"  style="margin-left: -27px;">
                            <span data-key="t-forms">考试管理</span>
                            <img src="../resources/admin/easyui/icon/right.png" height="12" width="12" style="margin-top: -6px;margin-left: 95px">
                        </a>
                        <ul class="sub-menu" aria-expanded="false">
                            <li><a href="../admin/exam/list?_mid=53" target="admin"
                                   data-key="t-form-elements">考试列表</a></li>
                        </ul>
                    </li>

                    <!---试卷管理（试卷列表）  -->
                    <li>
                        <a href="javascript: void(0);"
                           class="has-arrow1">
                            <i data-feather="sliders"></i>
                            <img src="../resources/admin/easyui/icon/recommend-color.png" height="20" width="20"  style="margin-left: -27px;">
                            <span data-key="t-tables">试卷管理</span>
                            <img src="../resources/admin/easyui/icon/right.png" height="12" width="12" style="margin-top: -6px;margin-left: 95px">
                        </a>
                        <ul class="sub-menu" aria-expanded="false">
                            <li><a href="../admin/examPaper/list?_mid=58" target="admin"
                                   data-key="t-basic-tables">试卷列表</a></li>
                        </ul>
                    </li>

                    <!---答题管理（答题列表）  -->
                    <li>
                        <a href="javascript: void(0);"
                           class="has-arrow1">
                            <i data-feather="pie-chart"></i>
                            <img src="../resources/admin/easyui/icon/content-color.png" height="20" width="20"  style="margin-left: -27px;">
                            <span data-key="t-charts">答题管理</span>
                            <img src="../resources/admin/easyui/icon/right.png" height="12" width="12" style="margin-top: -6px;margin-left: 95px">
                        </a>
                        <ul class="sub-menu" aria-expanded="false">
                            <li><a href="../admin/examPaperAnswer/list" target="admin"
                                   data-key="t-apex-charts">答题列表</a></li>
                        </ul>
                    </li>

                    <!---成绩统计（统计图表）  -->
                    <li>
                        <a href="javascript: void(0);"
                           class="has-arrow1">
                            <i data-feather="cpu"></i>
                            <img src="../resources/admin/easyui/icon/visualize-color.png" height="20" width="20"  style="margin-left: -27px;">
                            <span data-key="t-icons">成绩统计</span>
                            <img src="../resources/admin/easyui/icon/right.png" height="12" width="12" style="margin-top: -6px;margin-left: 95px">
                        </a>
                        <ul class="sub-menu" aria-expanded="false">
                            <li><a href="../admin/stats/exam_stats" target="admin"
                                   data-key="t-boxicons">统计图表</a></li>
                        </ul>
                    </li>

                    <!---评卷管理（主观题评卷）  -->

                    <li>
                        <a href="javascript: void(0);"
                           class="has-arrow1">
                            <i data-feather="map"></i>
                            <img src="../resources/admin/easyui/icon/file-color.png" height="20" width="20"  style="margin-left: -27px;">
                            <span data-key="t-maps">评卷管理</span>
                            <img src="../resources/admin/easyui/icon/right.png" height="12" width="12" style="margin-top: -6px;margin-left: 95px">
                        </a>
                        <ul class="sub-menu" aria-expanded="false">
                            <li><a href="../admin/examMarkPaper/list?_mid=68" target="admin"
                                   data-key="t-g-maps">主观题评卷</a></li>
                        </ul>
                    </li>

                </ul>
            </div>
        </div>
    </div>
    <div class="main-content" id="miniaresult"></div>

    <footer class="footer "style="background-color: #f4f4f4b3">
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-6">
                    <script>document.write(new Date().getFullYear())</script>

                </div>
                <div class="col-sm-6">
                    <div class="text-sm-end d-none d-sm-block">
                        Design & Develop by <a href="http://www.bootstrapmb.com/"
                                               class="text-decoration-underline">楸三猛男</a>
                    </div>
                </div>
            </div>
        </div>
    </footer>
</div>
<div >
    <%--    				var content = '<iframe scrolling="auto"  allowfullscreen="true" frameborder="0"  src="'+ href +'" style="width:100%;height:100%;"></iframe>';--%>
    <iframe id="admin" name="admin" scrolling="no"   frameborder="0" style="width:100%;height: 100%" scrolling="no" onLoad="this.height=100"></iframe>
</div>

<script>
    $(function () {
        //时间控制每隔200毫秒检查当前页面高度以及滚动高度，测试多遍，cpu占用极少，不明显影响程序运行速度
        window.setInterval("reinitIframe()", 200);
    })
    //iframe自适应高度,解决了动态更换页面高度无法自适应问题
    function reinitIframe() {
        var iframe = document.getElementById("admin");
        try {
            //bHeight 和 dHeight 如果相等，用其一等于iframe.height 即可
            // var bHeight = iframe.contentWindow.document.body.scrollHeight;
            var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;
            // var height = Math.max(bHeight, dHeight);
            console.log(dHeight)
            iframe.height = dHeight;
        } catch (ex) { }
    }
</script>



<!-- JAVASCRIPT -->
<script type="text/javascript" src="../resources/admin/easyui/assets/libs/jquery/jquery.min.js"></script>
<script type="text/javascript" src="../resources/admin/easyui/assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="../resources/admin/easyui/assets/libs/metismenu/metisMenu.min.js"></script>
<script type="text/javascript" src="../resources/admin/easyui/assets/libs/simplebar/simplebar.min.js"></script>
<script type="text/javascript" src="../resources/admin/easyui/assets/libs/node-waves/waves.min.js"></script>
<script type="text/javascript" src="../resources/admin/easyui/assets/libs/feather-icons/feather.min.js"></script>
<!-- pace js -->
<script type="text/javascript" src="../resources/admin/easyui//assets/libs/pace-js/pace.min.js"></script>

<script type="text/javascript" src="http://www.google.cn/maps/api/js?key=AIzaSyCtSAR45TFgZjOs4nBFFZnII-6mMHLfSYI"></script>

<script type="text/javascript" src="../resources/admin/easyui/assets/js/app.js"></script>
</body>
</html>

