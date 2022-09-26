

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
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

    <!-- Bootstrap 3.3.5 -->
    <link rel="stylesheet" href="../resources/admin/easyui/assets/libs/plugins/bootstrap/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="../resources/admin/easyui/assets/libs/plugins/adminLTE/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
          page. However, you can choose any other skin. Make sure you
          apply the skin class to the body tag so the changes take effect.
    -->
    <link rel="stylesheet" href="../resources/admin/easyui/assets/libs/plugins/adminLTE/css/skins/skin-blue.min.css">
    <!-- Multi Tabs -->
    <link rel="stylesheet"  type="text/css" href="../resources/admin/easyui/assets/css/style.css"/>

    <style type="text/css">
        body,
        body.full-height-layout .wrapper,
        html{
            height: 100% ;
        }
        body.full-height-layout .content-wrapper{
            height: calc(100% - 140px) ;
        }
    </style>


</head>
<body class="hold-transition sidebar-mini sidebar-collapse fixed skin-blue">
<div class="wrapper">

    <!-- Main Header -->
    <header class="main-header">

        <!-- Logo -->
        <a href="index2.html" class="logo">
            <!-- mini logo for sidebar mini 50x50 pixels -->
            <span class="logo-mini"> <img src="../demo/plugins/bootstrap/fonts/platform-color.png" alt=""
                                          height="24" style="margin-top: 5px"></span>
            <!-- logo for regular state and mobile devices -->
            <span class="logo-lg"><img src="../demo/plugins/bootstrap/fonts/platform-color.png" alt=""
                                       height="24" style="margin-top: 0px;margin-left: -10px">后台管理系统</span>
        </a>

        <!-- Header Navbar -->
        <nav class="navbar navbar-static-top" role="navigation">
            <!-- Sidebar toggle button-->
            <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                <span class="sr-only">Toggle navigation</span>
            </a>
            <!-- Navbar Right Menu -->
            <div class="navbar-custom-menu">
            </div>
        </nav>
    </header>
    <!-- Left side column. contains the logo and sidebar -->
    <aside class="main-sidebar">

        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">

            <!-- Sidebar Menu -->
            <ul class="sidebar-menu">
                <li class="header">HEADER</li>
                <!-- Optionally, you can add icons to the links -->
                <li class="active">
                    <a class="multitabs" href="pages/index-ajax-1.html" data-type="main"><i class="fa fa-dashboard"></i> <span> MAIN Tab</span></a>
                </li>
                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-briefcase"></i> <span>External Link</span>
                        <i class="fa fa-angle-left pull-right"></i>
                    </a>
                    <ul class="treeview-menu">
                        <li><a class="multitabs" href="http://localhost:5675/OnlineExam_war_exploded/admin/subject/list?_mid=38" data-type="info"><i class="fa fa-angle-double-right"></i> Wikipedia</a></li>
                    </ul>
                </li>
                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-shopping-cart"></i> <span>Local link in iframe mode</span>
                        <i class="fa fa-angle-left pull-right"></i>
                    </a>
                    <ul class="treeview-menu">
                        <li><a class="multitabs" href="#pages/index-1.html" data-type="info" data-iframe="true" ><i class="fa fa-angle-double-right"></i> iframe INFO tab 1</a></li>
                        <li><a class="multitabs" href="pages/index-2.html" data-type="main" data-iframe="true" ><i class="fa fa-angle-double-right"></i> iframe MAIN tab 2</a></li>
                        <li><a class="multitabs" href="pages/index-3.html" data-type="info" data-iframe="true" ><i class="fa fa-angle-double-right"></i> iframe INFO tab 3</a></li>
                        <li><a class="multitabs" href="pages/index-4.html" data-type="info" data-iframe="true" ><i class="fa fa-angle-double-right"></i> iframe INFO tab 4</a></li>
                        <li><a class="multitabs" href="pages/index-5.html" data-type="info" data-iframe="true" ><i class="fa fa-angle-double-right"></i> iframe INFO tab 5</a></li>
                        <li><a class="multitabs" href="pages/index-6.html" data-type="info" data-iframe="true" ><i class="fa fa-angle-double-right"></i> iframe INFO tab 6</a></li>
                        <li><a class="multitabs" href="pages/index-2.html" data-type="main" data-iframe="true" ><i class="fa fa-angle-double-right"></i> iframe MAIN tab 2 long long long long long long long text</a></li>
                    </ul>
                </li>
                <li class="treeview">
                    <a href="#">
                        <i class="fa fa-shopping-cart"></i> <span>Local link in ajax mode(default)</span>
                        <i class="fa fa-angle-left pull-right"></i>
                    </a>
                    <ul class="treeview-menu">
                        <li><a class="multitabs" href="pages/index-ajax-1.html" data-type="info" ><i class="fa fa-angle-double-right"></i> ajax INFO Tab 1</a></li>
                        <li><a class="multitabs" href="pages/index-ajax-2.html"><i class="fa fa-angle-double-right"></i> ajax INFO Tab 2</a></li>
                        <li><a class="multitabs" href="pages/index-ajax-3.html" data-type="main" ><i class="fa fa-angle-double-right"></i> ajax MAIN Tab 3</a></li>
                        <li><a class="multitabs" href="pages/index-ajax-4.html"><i class="fa fa-angle-double-right"></i> ajax INFO Tab 4</a></li>
                        <li><a class="multitabs" href="pages/index-ajax-5.html"><i class="fa fa-angle-double-right"></i> ajax INFO Tab 5</a></li>
                        <li><a class="multitabs" href="pages/index-ajax-6.html"><i class="fa fa-angle-double-right"></i> ajax INFO Tab 6</a></li>
                    </ul>
                </li>
            </ul>
            <!-- /.sidebar-menu -->
        </section>
        <!-- /.sidebar -->
    </aside>

    <!-- Content Wrapper. Contains page content -->
    <div id="content_wrapper" class="content-wrapper" >

    </div>
    <!-- /.content-wrapper -->

    <!-- Main Footer -->
    <footer class="main-footer">
        <!-- To the right -->
        <div class="pull-right hidden-xs">
            Anything you want
        </div>
        <!-- Default to the left -->
        <strong>Copyright &copy; 2015 <a href="#">Company</a>.</strong> All rights reserved.
    </footer>


</div>
<!-- ./wrapper -->

<!-- REQUIRED JS SCRIPTS -->

<!-- jQuery 2.2.0 -->
<script type="text/javascript" src="../resources/admin/easyui/assets/libs/plugins/jQuery/jQuery-2.2.0.min.js"></script>
<!-- Bootstrap 3.3.5 -->
<script type="text/javascript" src="../resources/admin/easyui/assets/libs/plugins/bootstrap/js/bootstrap.min.js"></script>
<!-- Slimscroll -->
<script type="text/javascript" src="../resources/admin/easyui/assets/libs/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- AdminLTE App -->
<script type="text/javascript" src="../resources/admin/easyui/assets/libs/plugins/adminLTE/js/app.js?v=2"></script>
<!-- Multi Tabs -->
<script type="text/javascript" src="../resources/admin/easyui/assets/js/multitabs.js"></script>

<!-- Optionally, you can add Slimscroll and FastClick plugins.
     Both of these plugins are recommended to enhance the
     user experience. Slimscroll is required when using the
     fixed layout. -->

<script>
    var multitabs = $('#content_wrapper').multitabs({
        init:[
            {
                type : 'main',
                title : '首页',
                url : 'https://en.wikipedia.org/wiki/Main_Page'
            }
        ]
    });
</script>
</body>
</html>

