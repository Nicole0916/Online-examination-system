<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="common/header.jsp"%>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Login - SB Admin</title>
    <link href="${pageContext.request.contextPath}/resources/home/css/styles.css" rel="stylesheet" type="text/css">
    <style>
        .bg-primary{
            background:url('../resources/home/images/bgf.jpg');
            background-size:cover;
            -moz-background-size:cover;
            background-repeat:no-repeat;
        }
    </style>
</head>

<body class="bg-primary">
<div id="layoutAuthentication">
    <div id="layoutAuthentication_content">
        <main>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-5" style="margin-top: 50px">
                        <div class="card shadow-lg border-0 rounded-lg mt-5">
                            <div class="card-header"><h3 class="text-center font-weight-light my-4">登录</h3></div>
                            <div class="card-body">
                                <form>
                                    <div class="form-floating mb-3">
                                        <input name="name" class="form-control" id="inputEmail" type="text" placeholder="用户名" value="" />
                                        <label>用户名</label>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <input name="password" class="form-control" id="inputPassword" type="password" placeholder="密码" value=""/>
                                        <label>密码</label>
                                    </div>
                                    <div class="form-check mb-3">
                                        <input class="form-check-input" id="inputRememberPassword" type="checkbox" value="" />
                                        <label class="form-check-label" for="inputRememberPassword" style="margin-left: -400px">记住密码</label>
                                    </div>
                                    <div class="d-flex align-items-center justify-content-between mt-4 mb-0">

                                        <button type="button" class="btn btn-primary" onclick="tm.goRegister();">注册</button>
                                        <button type="button" class="btn btn-primary" onclick="tm.doLogin();">登录</button>
                                    </div>
                                </form>
                            </div>
                            <div class="card-footer text-center py-3">
                                <div class="small"><a class="small" href="../system/login" style="font-size: 1rem">登录后台</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function(){
        checkBrowser();
    });

    function getBrowserInfo(){
        try{
            var Sys = {};
            var ua = navigator.userAgent.toLowerCase();
            console.log(ua);
            var re =/(msie|trident|firefox|chrome|opera|version).*?([\d.]+)/;
            var m = ua.match(re);
            Sys.browser = m[1].replace(/version/, "'safari");
            Sys.ver = m[2];
            return Sys;
        }catch(e){}
    }

    function checkBrowser(){
        var tmBrowser = getBrowserInfo();
        var isSupportedBrowser = false;
        if(tmBrowser){
            if(tmBrowser.browser == "firefox" || tmBrowser.browser == "chrome"){
                isSupportedBrowser = true;
            }
        }
        if(!isSupportedBrowser){
            layer.open({
                title:"浏览器提示",
                content:"为达到最佳使用效果，请使用Chrome、FireFox、或360极速浏览器访问系统。",
                btnAlign: "c"
            });
        }
    }


    var tm = {
        doReset : function(){
            $("input[name='name']").val('');
            $("input[name='password']").val('');
        },
        goRegister : function(){
            window.location="register";
        },
        doLogin : function(){
            var username = $("input[name='name']").val();
            var userpass = $("input[name='password']").val();
            if(baseutil.isEmpty(username)){
                alert('没有填写用户名');
                return;




            }
            if(baseutil.isEmpty(userpass)){
                alert('没有填写登录密码');
                return;
            }

            $(".tm_btn_primary").text('登录...');

            $.ajax({
                type: "POST",
                url: "login",
                dataType: "json",
                data: {"name":username, "password":userpass},
                success: function(data){
                    if(data.type == 'success'){
                        window.location="user/index";
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
</body>
</html>