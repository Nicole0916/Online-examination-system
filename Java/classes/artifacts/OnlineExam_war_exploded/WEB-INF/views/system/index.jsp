

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

    <!-- App favicon -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/admin/easyui/assets/images/favicon.ico">
    <!-- preloader css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/admin/easyui/assets/css/preloader.min.css" />
    <!-- Bootstrap Css -->
    <link rel="stylesheet" type="text/css" id="bootstrap-style" href="${pageContext.request.contextPath}/resources/admin/easyui/assets/css/bootstrap.min.css"/>

    <!-- App Css-->
    <link rel="stylesheet" type="text/css" id="app-style" href="${pageContext.request.contextPath}/resources/admin/easyui/assets/css/app.min.css"/>
    <!-- Custom Css -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/admin/easyui/assets/css/custom.css"/>
    <!-- Icons Css -->
    <link href="${pageContext.request.contextPath}/resources/admin/easyui/assets/css/icons.min.css" rel="stylesheet" type="text/css"/>


    <%--
        <!-- Multi Tabs -->
        <link rel="stylesheet"  type="text/css" href="../resources/admin/easyui/assets/css/style.css"/>
        <!-- Theme style -->
        <style type="text/css">
            body,
            body.full-height-layout .wrapper,
            html{
                height: 100% ;
            }
            body.full-height-layout .content-wrapper{
                height: calc(100% - 140px) ;
            }
        </style>--%>
</head>
<%--<body style="background-image: url(../resources/admin/easyui/images/bgc.png)">--%>
<body>
<div id="layout-wrapper" class="wrapper">









    <!--头部-->
    <header id="page-topbar" style="background-color: #f4f4f4b3;height: 6%">
        <div class="navbar-header" style="height:100%">

            <div class="d-flex" style="height: 100%;width: 15% ">
                <div class="navbar-brand-box" style="background-color:#f4f4f4b3;width: 100%">
                    <a href="welcome" class="logo logo-dark" target="admin">
                            <span class="logo-sm">
                                <img src="../resources/admin/easyui/icon/platform-color.png" alt=""
                                     height="24" style="margin-top: 24px">
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
    <aside class="main-sidebar">
        <div class="vertical-menu" style="width:15%;top:5%;background-color: #f4f4f4b3">

            <div data-simplebar class="h-100">

                <!--- Sidemenu -->
                <div id="sidebar-menu" style="background-color: #f4f4f4b3">
                    <ul class="metismenu list-unstyled" id="side-menu">
                        <!---首页 -->
                        <li class="menu-title" data-key="t-menu" style="color: #545a6d">系统管理</li>
                        <li>
                            <a  class="multitabs" href="welcome"  id="index_page" target="admin">
                                <i data-feather="home"></i>
                                <img src="../resources/admin/easyui/icon/more-color.png" height="20" width="20"  style="margin-left: -27px;">
                                <span data-key="t-dashboard">首页</span>
                            </a>
                        </li>







                        <!---用户管理（用户列表）！！！！！！！！！！！！！！！！！！！！！！！！！！！！  -->
                        <li id="li1">
                            <a href="javascript: void(0);"
                               class="has-arrow">
                                <i data-feather="users"></i>
                                <img src="../resources/admin/easyui/icon/portray-color.png" height="20" width="20"  style="margin-left: -27px">
                                <span data-key="t-authentication">用户管理</span>

                            </a>
                            <ul class="sub-menu" aria-expanded="false">
                                <li><a class="multitabs" href="../admin/user/list?_mid=15"
                                       data-key="t-login" target="admin" iframe="1" data-link="../admin/user/list?_mid=15">用户列表</a></li>
                            </ul>
                        </li>

                        <!---系统管理（菜单管理、角色管理、修改密码）  -->
                        <li id="li2">
                            <a href="javascript: void(0)"
                               class="has-arrow">
                                <i data-feather="grid"></i>
                                <img src="../resources/admin/easyui/icon/work-flow-color.png" height="20" width="20"  style="margin-left: -27px;">
                                <span data-key="t-apps">系统设置</span>

                            </a>
                            <ul  class="sub-menu" aria-expanded="false">
                                <li id="li2-1">
                                    <a class="multitabs" href="../admin/menu/list?_mid=5" target="admin" data-link="../admin/menu/list?_mid=5" iframe="1">
                                        <span data-key="t-calendar">菜单管理</span>
                                    </a>
                                </li>

                                <li id="li2-2">
                                    <a class="multitabs" href="../admin/role/list?_mid=13" target="admin" data-link="../admin/role/list?_mid=13" iframe="1">
                                        <span data-key="t-chat">角色管理</span>
                                    </a>
                                </li>
                            </ul>
                        </li>


                        <!---系统日志（日志列表）  -->
                        <li id="li3">
                            <a href="javascript: void(0);"
                               class="has-arrow">
                                <i data-feather="share-2"></i>
                                <img src="../resources/admin/easyui/icon/tag-color.png" height="20" width="20"  style="margin-left: -27px;">
                                <span data-key="t-multi-level">系统日志</span>

                            </a>
                            <ul class="sub-menu" aria-expanded="false">
                                <li><a class="multitabs" href="../admin/log/list?_mid=32"
                                       data-key="t-level-1-1" target="admin" data-link="../admin/log/list?_mid=32" iframe="1">日志列表</a></li>
                            </ul>
                        </li>
                        <li class="menu-title" data-key="t-menu" style="color: #545a6d">考试管理</li>

                        <!---学科管理（学科列表）  -->
                        <li id="li4">
                            <a href="javascript: void(0);"
                               class="has-arrow">
                                <i data-feather="file-text"></i>
                                <img src="../resources/admin/easyui/icon/standar-color.png" height="20" width="20"  style="margin-left: -27px;">
                                <span data-key="t-pages">学科管理</span>

                            </a>
                            <ul class="sub-menu" aria-expanded="false">
                                <li><a class="multitabs" href="../admin/subject/list?_mid=38"
                                       data-key="t-starter-page" target="admin" data-link="../admin/subject/list?_mid=38" iframe="1">学科列表</a></li>
                            </ul>
                        </li>

                        <!---考生管理（考生列表）  -->
                        <li id="li5">
                            <a href="javascript: void(0);"
                               class="has-arrow">
                                <i data-feather="briefcase"></i>
                                <img src="../resources/admin/easyui/icon/talent-color.png" height="20" width="20"  style="margin-left: -27px;">
                                <span data-key="t-components">考生管理</span>

                            </a>
                            <ul class="sub-menu" aria-expanded="false">
                                <li><a class="multitabs" href="../admin/student/list?_mid=43"
                                       data-key="t-alerts" target="admin" data-link="../admin/student/list?_mid=43" iframe="1">考生列表</a></li>
                            </ul>
                        </li>

                        <!---试题管理（试题列表）  -->
                        <li id="li6">
                            <a href="javascript: void(0);"
                               class="has-arrow">
                                <i data-feather="gift"></i>
                                <img src="../resources/admin/easyui/icon/table-color.png" height="20" width="20"  style="margin-left: -27px;">
                                <span data-key="t-ui-elements">试题管理</span>

                            </a>
                            <ul class="sub-menu" aria-expanded="false">
                                <li><a class="multitabs" href="../admin/question/list?_mid=48"
                                       data-key="t-lightbox" target="admin" data-link="../admin/question/list?_mid=48" iframe="1">试题列表</a></li>
                            </ul>
                        </li>

                        <!---考试管理（考试列表）  -->
                        <li id="li7">
                            <a href="javascript: void(0);" class="has-arrow">
                                <i data-feather="box"></i>
                                <img src="../resources/admin/easyui/icon/amount-color.png" height="20" width="20"  style="margin-left: -27px;">
                                <span data-key="t-forms">考试管理</span>

                            </a>
                            <ul class="sub-menu" aria-expanded="false">
                                <li><a class="multitabs" href="../admin/exam/list?_mid=53"
                                       data-key="t-form-elements" target="admin" data-link="../admin/exam/list?_mid=53" iframe="1">考试列表</a></li>
                            </ul>
                        </li>

                        <!---试卷管理（试卷列表）  -->
                        <li id="li8">
                            <a href="javascript: void(0);"
                               class="has-arrow">
                                <i data-feather="sliders"></i>
                                <img src="../resources/admin/easyui/icon/recommend-color.png" height="20" width="20"  style="margin-left: -27px;">
                                <span data-key="t-tables">试卷管理</span>

                            </a>
                            <ul class="sub-menu" aria-expanded="false">
                                <li><a href="../admin/examPaper/list?_mid=58"
                                       data-key="t-basic-tables" target="admin" data-link="../admin/examPaper/list?_mid=58" iframe="1">试卷列表</a></li>
                            </ul>
                        </li>

                        <!---答题管理（答题列表）  -->
                        <li id="li9">
                            <a href="javascript: void(0);"
                               class="has-arrow">
                                <i data-feather="pie-chart"></i>
                                <img src="../resources/admin/easyui/icon/content-color.png" height="20" width="20"  style="margin-left: -27px;">
                                <span data-key="t-charts">答题管理</span>

                            </a>
                            <ul class="sub-menu" aria-expanded="false">
                                <li><a class="multitabs" href="../admin/examPaperAnswer/list"
                                       data-key="t-apex-charts" target="admin" data-link="../admin/examPaperAnswer/list" iframe="1">答题列表</a></li>
                            </ul>
                        </li>

                        <!---成绩统计（统计图表）  -->
                        <li id="li10">
                            <a href="javascript: void(0);"
                               class="has-arrow">
                                <i data-feather="cpu"></i>
                                <img src="../resources/admin/easyui/icon/visualize-color.png" height="20" width="20"  style="margin-left: -27px;">
                                <span data-key="t-icons">成绩统计</span>

                            </a>
                            <ul class="sub-menu" aria-expanded="false">
                                <li><a class="multitabs" href="../admin/stats/exam_stats"
                                       data-key="t-boxicons" target="admin" data-link="../admin/stats/exam_stats" iframe="1">统计图表</a></li>
                            </ul>
                        </li>

                        <!---评卷管理（主观题评卷）  -->

                        <li id="li11">
                            <a href="javascript: void(0);"
                               class="has-arrow">
                                <i data-feather="map"></i>
                                <img src="../resources/admin/easyui/icon/file-color.png" height="20" width="20"  style="margin-left: -27px;">
                                <span data-key="t-maps">评卷管理</span>

                            </a>
                            <ul class="sub-menu " >
                                <li><a  href="../admin/examMarkPaper/list?_mid=68"
                                        data-link="../admin/examMarkPaper/list?_mid=68" target="admin" iframe="1">主观题评卷</a></li>
                            </ul>
                        </li>

                    </ul>

                </div>

            </div>
        </div>

    </aside>



    <footer class="footer "style="background-color: #f4f4f4b3;height: 6%;left: 15%">
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
<div><li><iframe id="admin" name="admin" scrolling="yes"   frameborder="1" align="right" style="z-index:1005;height:88%;width:85%;margin-top:3% " allowtransparency="true"></iframe></li></div>



<script>


    <%--    模拟点击首页  --%>
    document.getElementsByClassName("multitabs")[0].click();


    var topM = [] // 顶级菜单 ['系统设置', '用户管理', '系统日志', '学科管理', '考生管理', '试题管理', '考试管理', '试卷管理', '答题管理', '成绩统计', '评卷管理']
    var menu = [] // 二级菜单 ['菜单管理', '角色管理', '修改密码', '用户列表', '日志列表', '学科列表', '考生列表', '试题列表', '考试列表', '试卷列表', '答题列表', '统计图表', '主观题评卷']

    <c:forEach items="${topMenuList }" var="topMenu">
    var s = "${topMenu.name }";
    topM.push(s);
    <c:forEach items="${secondMenuList }" var="secondMenu">
    <c:if test="${secondMenu.parentId == topMenu.id }">
    var m = "${secondMenu.name }";
    menu.push(m);
    </c:if>
    </c:forEach>
    </c:forEach>

    var li1 = document.getElementById("li1"); // 用户管理
    if(topM.includes("用户管理")){
    }else{
        li1.parentNode.removeChild(li1)
    }

    var li2 = document.getElementById("li2"); // 系统设置
    if(topM.includes("系统设置")){
    }else{
        li2.parentNode.removeChild(li2)
    }
    var li2_1 = document.getElementById("li2-1"); // 菜单管理
    if(menu.includes("菜单管理")){
    }else{
        li2_1.parentNode.removeChild(li2_1)
    }
    var li2_2 = document.getElementById("li2-2"); // 角色管理
    if(menu.includes("角色管理")){
    }else{
        li2_2.parentNode.removeChild(li2_2)
    }

    var li3 = document.getElementById("li3"); // 系统日志
    if(topM.includes("系统日志")){
    }else{
        li3.parentNode.removeChild(li3)
    }

    var li4 = document.getElementById("li4"); // 学科管理
    if(topM.includes("学科管理")){
    }else{
        li4.parentNode.removeChild(li4)
    }

    var li5 = document.getElementById("li5"); // 考生管理
    if(topM.includes("考生管理")){
    }else{
        li5.parentNode.removeChild(li5)
    }

    var li6 = document.getElementById("li6"); // 试题管理
    if(topM.includes("试题管理")){
    }else{
        li6.parentNode.removeChild(li6)
    }

    var li7 = document.getElementById("li7"); // 考试管理
    if(topM.includes("考试管理")){
    }else{
        li7.parentNode.removeChild(li7)
    }

    var li8 = document.getElementById("li8"); // 试卷管理
    if(topM.includes("试卷管理")){
    }else{
        li8.parentNode.removeChild(li8)
    }

    var li9 = document.getElementById("li9"); // 答题管理
    if(topM.includes("答题管理")){
    }else{
        li9.parentNode.removeChild(li9)
    }

    var li10 = document.getElementById("li10"); // 成绩统计
    if(topM.includes("成绩统计")){
    }else{
        li10.parentNode.removeChild(li10)
    }

    var li11 = document.getElementById("li11"); // 评卷管理
    if(topM.includes("评卷管理")){
    }else{
        li11.parentNode.removeChild(li11)
    }



    // li1.innerHTML = "items";

    //li1.parentNode.removeChild(li1)
    // li2.parentNode.removeChild(li2)
    // li2.style.visibility="hidden";
    // li3.style.visibility="hidden";


</script>




<%--<script type="text/javascript" src="../resources/admin/easyui/assets/js/multitabs.js"></script>--%>
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

