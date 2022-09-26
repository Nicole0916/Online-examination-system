<%--
  Created by IntelliJ IDEA.
  User: 友好邻居木子
  Date: 2022/7/30
  Time: 21:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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


    <title>修改密码</title>
</head>
<body>
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

    <div class="page-wrapper">
        <div class="page-content">
            <!--breadcrumb-->
            <div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
                <div class="breadcrumb-title pe-3"><h3>个人信息</h3></div>
                <div class="ps-3">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb mb-0 p-0">
                            <li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i></a>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page">修改密码</li>
                        </ol>
                    </nav>
                </div>

            </div>
            <!--end breadcrumb-->
            <div class="row">
                <div class="col-xl-7 mx-auto">
                    <h6 class="mb-0 text-uppercase" style="color: dimgrey;">在下列表单中修改登录密码</h6>
                    <hr/>
                    <div class="card border-top border-0 border-4 border-primary">
                        <div class="card-body p-5">
                            <div class="card-title d-flex align-items-center">
                                <div><i class="bx bxs-user me-1 font-22 text-primary"></i>
                                </div>
                                <h5 class="mb-0 text-primary" id="user_name1"></h5>
                            </div>
                            <hr>

                            <form class="row g-3" id="form_user_form" method="post" >
                                <div class="col-md-6">
                                    <label class="form-label"><strong>用户名</strong></label>
                                    <input class="form-control mb-3" type="text" placeholder="${student.name}" aria-label="Disabled input example" disabled>
                                </div>


                                <div class="col-md-6">
                                    <label class="form-label"><strong>旧密码</strong></label>
                                    <input type="password" class="form-control " id="old_password" name="old_password">

                                </div>
                                <div class="col-md-6">
                                    <label  class="form-label"><strong>新密码</strong></label>
                                    <input type="password" class="form-control validate[required]" id="new_password" name="new_password">
                                </div>
                                <div class="col-md-6">
                                <label for="inputPassword" class="form-label " ><strong>确认密码</strong></label>
                                <input type="password" class="form-control" id="inputPassword" name="new_password2">
                                </div>

                                <div class="col-12">
                                    <button type="button" class="btn btn-primary px-5" onclick="tmProfile.doUpdate();">保存</button>
                                </div>
                            </form>

                        </div>
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
<script src="${pageContext.request.contextPath}/resources/home/js/jquery.validationEngine.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/home/js/jquery.validationEngine-zh_CN.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/plugins/simplebar/js/simplebar.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/plugins/metismenu/js/metisMenu.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/plugins/perfect-scrollbar/js/perfect-scrollbar.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/plugins/datatable/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/plugins/datatable/js/dataTables.bootstrap5.min.js"></script>



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
                $("#user-name,#user_name1").text(data.truename );
            }else{
                alert(data.msg);
            }
        },
        error : function(){
            top.location.href = "logout";
        }
    });

    $(document).ready(function() {
        tm_bindPasswordLevelChecker("new_password");
    });

    var tmProfile = {
        doUpdate : function(){
            var formcheck =true;/*$("#form_user_form").validationEngine('validate');*/
            if(formcheck){
                var wcm = window.confirm('确定要修改密码吗？');
                if(!wcm){
                    return;
                }

                $.ajax({
                    type: "POST",
                    url: "update_password",
                    dataType:'json',
                    data:{password:$("#new_password").val(),oldPassword:$("#old_password").val()},
                    success: function(data){
                        if(data.type == 'success'){
                            window.location.reload();
                        }else{
                            alert(data.msg);
                        }
                    },
                    error : function(){
                        //top.location.href = "home/login";
                        alert('网络错误');
                    }
                });

            }else{
                return false;
            }
        }
    };
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
</body>
</html>
