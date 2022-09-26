<%--
  Created by IntelliJ IDEA.
  User: 友好邻居木子
  Date: 2022/7/30
  Time: 21:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--favicon-->
    <link rel="icon" href="${pageContext.request.contextPath}/resources/assets/images/favicon-32x32.png" type="image/png" />
    <!--plugins-->
    <link href="${pageContext.request.contextPath}/resources/assets/plugins/simplebar/css/simplebar.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/assets/plugins/perfect-scrollbar/css/perfect-scrollbar.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/assets/plugins/metismenu/css/metisMenu.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/assets/plugins/datatable/css/dataTables.bootstrap5.min.css" rel="stylesheet" />
    <!-- loader-->
    <link href="${pageContext.request.contextPath}/resources/assets/css/pace.min.css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/resources/assets/js/pace.min.js"></script>
    <!-- Bootstrap CSS -->
    <link href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/assets/css/app.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/assets/css/icons.css" rel="stylesheet">
    <!-- Theme Style CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/dark-theme.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/semi-dark.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/header-colors.css" />



    <title>我的考试</title>

</head>
<body class = "aaa">
<!--wrapper-->
<div class="wrapper">
    <!--sidebar wrapper -->
    <div class="sidebar-wrapper" data-simplebar="true">
        <div class="sidebar-header">
            <div>
                <img src="${pageContext.request.contextPath}/resources/assets/images/logo_min.png" class="logo-icon" alt="logo icon">
            </div>
            <div>
                <h4 class="logo-text" style="color:cornflowerblue">在线考试</h4>
            </div>
            <div class="toggle-icon ms-auto"><i class='bx bx-arrow-to-left'></i>
            </div>
        </div>
        <!--navigation-->
        <ul class="metismenu" id="menu">
            <li class="menu-label">EXAM</li>
            <li>
                <a href="javascript:;" class="has-arrow">
                    <div class="parent-icon"><i class='bx bx-home-circle'></i>
                    </div>
                    <div class="menu-title">考试管理</div>
                </a>
                <ul>
                    <li> <a href="welcome"><i class="bx bx-right-arrow-alt"></i>主页</a>
                    </li>
                    <li> <a href="exam_list"><i class="bx bx-right-arrow-alt"></i>我的考试</a>
                    </li>
                    <li> <a href="history_list"><i class="bx bx-right-arrow-alt"></i>历史考试</a>
                    </li>
                </ul>
            </li>
            <li class="menu-label">USER</li>
            <li>
                <a href="javascript:;" class="has-arrow">
                    <div class="parent-icon"><i class="bx bx-category"></i>
                    </div>
                    <div class="menu-title">个人信息</div>
                </a>
                <ul>
                    <li> <a href="password"><i class="bx bx-right-arrow-alt"></i>修改密码</a>
                    </li>
                    <li> <a href="profile"><i class="bx bx-right-arrow-alt"></i>账户信息</a>
                    </li>
                </ul>
            </li>
        </ul>
        <!--end navigation-->
    </div>
    <!--end sidebar wrapper -->

    <!--start header -->
    <header>
        <div class="topbar d-flex align-items-center">
            <nav class="navbar navbar-expand">
                <div class="mobile-toggle-menu"><i class='bx bx-menu'></i>
                </div>
                <div class="top-menu ms-auto">
                    <ul class="navbar-nav align-items-center">
                        <li class="nav-item mobile-search-icon">
                            <a class="nav-link" href="#">	<i class='bx bx-search'></i>
                            </a>
                        </li>

                        <li class="nav-item dropdown dropdown-large">
                            <a class="nav-link dropdown-toggle dropdown-toggle-nocaret position-relative" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"> <span class="alert-count">7</span>
                                <i class='bx bx-bell'></i>
                            </a>
                            <div class="dropdown-menu dropdown-menu-end">
                                <a href="javascript:;">
                                    <div class="msg-header">
                                        <p class="msg-header-title">Notifications</p>
                                        <p class="msg-header-clear ms-auto">Marks all as read</p>
                                    </div>
                                </a>
                                <div class="header-notifications-list">
                                    <a class="dropdown-item" href="javascript:;">
                                        <div class="d-flex align-items-center">
                                            <div class="notify bg-light-primary text-primary"><i class="bx bx-group"></i>
                                            </div>
                                            <div class="flex-grow-1">
                                                <h6 class="msg-name">New Customers<span class="msg-time float-end">14 Sec
												ago</span></h6>
                                                <p class="msg-info">5 new user registered</p>
                                            </div>
                                        </div>
                                    </a>

                                </div>
                            </div>
                        </li>
                        <li class="nav-item dropdown dropdown-large">
                            <a class="nav-link dropdown-toggle dropdown-toggle-nocaret position-relative" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"> <span class="alert-count">8</span>
                                <i class='bx bx-comment'></i>
                            </a>
                            <div class="dropdown-menu dropdown-menu-end">
                                <a href="javascript:;">
                                    <div class="msg-header">
                                        <p class="msg-header-title">Messages</p>
                                        <p class="msg-header-clear ms-auto">Marks all as read</p>
                                    </div>
                                </a>
                                <div class="header-message-list">

                                    <a class="dropdown-item" href="javascript:;">
                                        <div class="d-flex align-items-center">
                                            <div class="user-online">
                                                <img src="assets/images/avatars/avatar-11.png" class="msg-avatar" alt="user avatar">
                                            </div>
                                            <div class="flex-grow-1">
                                                <h6 class="msg-name">Johnny Seitz <span class="msg-time float-end">5 days
												ago</span></h6>
                                                <p class="msg-info">All the Lorem Ipsum generators</p>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                <a href="javascript:;">
                                    <div class="text-center msg-footer">View All Messages</div>
                                </a>
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="user-box dropdown">
                    <a class="d-flex align-items-center nav-link dropdown-toggle dropdown-toggle-nocaret" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <img src="${pageContext.request.contextPath}/resources/upload/1544880811060.jpg" class="user-img" alt="user avatar">
                        <div class="user-info ps-3">
                            <p class="user-name mb-0" id="user-name">正在获取账户信息...</p>

                        </div>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end">
                        <li><a class="dropdown-item" href="profile"><i class="bx bx-user"></i><span>账户信息</span></a>
                        </li>
                        <li><a class="dropdown-item" href="password"><i class="bx bx-cog"></i><span>修改密码</span></a>
                        </li>
                        <li><a class="dropdown-item" href="houtai"><i class='bx bx-home-circle'></i><span>登录后台</span></a>
                        </li>
                        <li>
                            <div class="dropdown-divider mb-0"></div>
                        </li>
                        <li><a class="dropdown-item" href="javascript:void(0);" onclick="return tm.logout();"><i class='bx bx-log-out-circle'></i><span>退出</span></a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
    </header>
    <!--end header -->

    <!--start page wrapper -->
    <div class="page-wrapper">
        <div class="page-content">
            <!--breadcrumb-->
            <div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
                <div class="breadcrumb-title pe-3"><h3>考试管理</h3></div>
                <div class="ps-3">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb mb-0 p-0">
                            <li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i></a>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page">我的考试</li>
                        </ol>
                    </nav>
                </div>
            </div>
            <!--end breadcrumb-->
            <h6 class="mb-0 text-uppercase" style="color: dimgrey;">请选择以下列表中需要参加的考试</h6>
            <hr/>
            <div class="card">
                <div class="card-body">
                    <div class="table-responsive">
                        <table id="example" class="table table-striped table-bordered" style="width:100%">
                            <thead>
                            <tr>
                                <th>考试名称</th>
                                <th>时间设定</th>
                                <th>考试时长</th>
                                <th>试卷类型</th>
                                <th>卷面总分</th>
                                <th>及格分数</th>
                                <th style="text-align: center;">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:if test="${empty examList}">
                                <tr>
                                    <td colspan="7" style="text-align: center"><strong>你还没有考试信息!</strong></td>
                                </tr>
                            </c:if>
                            <c:forEach items="${examList }" var = "exam">
                                <tr id="tr-${exam.id }" data-key="${exam.id }">
                                    <td >${exam.name }</td>
                                    <td ><fmt:formatDate value="${exam.startTime }" pattern="yyyy-MM-dd HH:mm:ss"/>---<fmt:formatDate value="${exam.endTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                    <td >${exam.avaliableTime }分钟</td>
                                    <td >${subject.name }</td>
                                    <td >${exam.totalScore }</td>
                                    <td >${exam.passScore }</td>
                                    <td style="text-align: center;">
                                        <c:if test="${nowTime > exam.endTime.time}">
                                            <%--<button type="button" class="tm_btn" >考试已结束</button>--%>
                                            <button type="button" class="btn btn-info px-5 radius-30">考试已结束</button>
                                        </c:if>
                                        <c:if test="${nowTime < exam.endTime.time}">
                                            <%--<button type="button" class="tm_btn tm_btn_primary" onclick="tm.startExam('tr-${exam.id }');">开始考试</button>--%>
                                            <button type="button" class="btn btn-info px-5 radius-30" onclick="tm1.startExam('tr-${exam.id }');">开始考试</button>
                                        </c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                            <tfoot>
                            <tr>
                                <th>考试名称</th>
                                <th>时间设定</th>
                                <th>考试时长</th>
                                <th>试卷类型</th>
                                <th>卷面总分</th>
                                <th>及格分数</th>
                                <th style="text-align: center;">操作</th>
                            </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--start overlay-->
    <div class="overlay toggle-icon"></div>
    <!--end overlay-->
    <!--Start Back To Top Button--> <a href="javaScript:;" class="back-to-top"><i class='bx bxs-up-arrow-alt'></i></a>
    <!--End Back To Top Button-->
    <footer class="page-footer">
        <p class="mb-0">Design & Develop by 楸三猛男</p>
    </footer>



</div>

<!-- Bootstrap JS -->
<script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap.bundle.min.js"></script>
<!--plugins-->
<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/plugins/simplebar/js/simplebar.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/plugins/metismenu/js/metisMenu.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/plugins/perfect-scrollbar/js/perfect-scrollbar.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/plugins/datatable/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/plugins/datatable/js/dataTables.bootstrap5.min.js"></script>

<script type="text/javascript">




    //全屏
    function fullScreen(){


        var el = document.getElementsByClassName("aaa");
        var rfs = el.requestFullScreen || el.webkitRequestFullScreen || el.mozRequestFullScreen || el.msRequestFullScreen;

        //typeof rfs != "undefined" && rfs
        if (rfs) {
            rfs.call(el);
        }
        else if (typeof window.ActiveXObject !== "undefined") {
            //for IE，这里其实就是模拟了按下键盘的F11，使浏览器全屏
            var wscript = new ActiveXObject("WScript.Shell");
            if (wscript != null) {
                wscript.SendKeys("{F11}");
            }
        }
        console.log("执行全屏")
    }


    var tm1 = {
        startExam : function(e){
            if(!tmCheckBrowserSupport()){
                alert("抱歉，您的浏览器不被支持，如需继续使用，请更换为：Chrome、Firefox、360极速浏览器。");
                return false;
            }
            var tr = $("#"+e);
            var eid = tr.attr("data-key");
            var html = [];
            html.push('<div style="margin:20px">');
            html.push('	<p style="line-height:20px"><strong>确定进入试卷并开始考试吗？</strong></p>');

            html.push('	<table style="margin:0 auto; width:350px" border="0" cellpadding="0" cellspacing="0">');
            html.push('	<tr>');
            html.push('		<td width="80"><img src="../../resources/home/images/paper_pencil.png" width="60" /></td>');
            html.push('		<td><p><b>考试名称</b>：'+tr.find("td").eq(0).text()+'<p>');
            html.push('			<p><b>考试时长</b>：'+tr.find("td").eq(2).text()+'<p>');
            html.push('			<p><b>卷面总分</b>：'+tr.find("td").eq(4).text()+'<p>');
            html.push('			<p><b>及格分数</b>：'+tr.find("td").eq(5).text()+'<p>');
            html.push('		</td>');
            html.push('	</tr>');
            html.push('</table>');

            html.push('<p style="text-align:center; margin-top:30px">');

            html.push('<button class="btn btn-outline-success px-5 radius-30" style="margin-top:-25px " type="button" onclick="tm1.joinExam(\''+eid+'\')">确定</button>');
            html.push('</p>');

            html.push('</div>');

            layer.open({
                type: 1,
                title: '开始考试',
                shadeClose: true,
                shade: 0.8,
                area: ['450px', '310px'],
                content: html.join("")
            });

            return false;
        },
        joinExam : function(eid){
            $(".confir-exam").text('请稍等...');
            $(".confir-exam").attr("disabled", true);
            $.ajax({
                type: "POST",
                url: "../exam/statr_exam",
                dataType: "json",
                data: {"examId":eid},
                success: function(data){
                    if(data.type == 'success'){
                        top.window.location="../exam/examing?examId="+eid;


                        setTimeout("fullScreen()",80)


                    }else{
                        alert(data.msg);
                        //$(".tm_btn_primary").text('提交');
                        //return;
                        window.location.reload();
                    }
                },
                error: function(){
                    //$(".tm_btn_primary").text('登录');
                    alert('系统忙，请稍后再试');
                    window.location.reload();
                }
            });
        }
    };

</script>



<script type="text/javascript">


    var tm = {
        logout : function(){
            if(window.confirm('确定要退出登录吗？')){
                top.location.href = "logout";
            }
        }
    };

    //异步获取登录帐号信息
    $.ajax({
        type: "POST",
        url: "get_current",
        dataType:'json',
        success: function(data){
            if(data.type == 'success'){
                $("#user-name").text(data.truename );
            }else{
                alert(data.msg);
            }
        },
        error : function(){
            top.location.href = "logout";
        }
    });
</script>
<script>
    $(document).ready(function() {
        $('#example').DataTable();
    } );

    $(document).ready(function() {
        $('#example3').DataTable();
    } );
</script>
<script>
    $(document).ready(function() {
        var table = $('#example2').DataTable( {
            lengthChange: false,
            buttons: [ 'copy', 'excel', 'pdf', 'print']
        } );

        table.buttons().container()
            .appendTo( '#example2_wrapper .col-md-6:eq(0)' );
    } );
</script>
<!--app JS-->
<script src="${pageContext.request.contextPath}/resources/assets/js/app.js"></script>
<script src="${pageContext.request.contextPath}/resources/home/js/layer.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/home/js/baseutil.js" type="text/javascript"></script>
</body>
</html>
