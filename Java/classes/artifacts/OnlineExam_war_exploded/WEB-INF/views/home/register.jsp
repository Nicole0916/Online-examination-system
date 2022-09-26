<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@include file="common/header.jsp"%>
<html>
<head>
	<meta name="referrer" content="no-referrer"> <%--图片显示，一定要加--%>
	<link href="${pageContext.request.contextPath}/resources/home/css/styles.css" rel="stylesheet" type="text/css">
	<style>
		.tm_register_body{
			background:url('../resources/home/images/bgf.jpg');
			background-size:cover;
			-moz-background-size:cover;
			background-repeat:no-repeat;
		}
		.tm_register_container{ width:500px; margin:100px auto; clear:both}
		.tm_register_title{
			height:80px;
			margin:10px 0 15px 0;
			background:#fff;
			text-align:center;
			border-bottom:solid 1px #eee;
		}
		.tm_register_title img{
			height:50px;
		}
		.tm_register_title span{
			font-size:25px;
			line-height:80px;
			font-family:'Microsoft Yahei',Tahoma, Geneva, 'Simsun';
		}
		.tm_register_form{
			width:100%;
			height:630px;
			clear:both;
			-moz-border-radius:8px;
			-webkit-border-radius:8px;
			border-radius:8px;
			padding:1px;
			background:#fff;
		}
		.tm_register_table{ width:400px; margin:20px auto;}
		.tm_register_table caption{text-align:center; margin:0 0 10px 0}
		.tm_register_table tr th{ width:100px;}
		.tm_register_table tr td{ width:300px; text-align:left}

		.tm_register_title_table{ width:400px; margin:0px auto;}
		.tm_register_title_table tr th{ width:100px;}
		.tm_register_title_table tr td{ width:300px; text-align:left}

		.tm_register_foot{ width:100%; line-height:20px; color:white; text-align:center; clear:both; margin:20px 0}

	</style>
</head>
<body class="tm_register_body" style="">

	<div class="tm_register_container">
    	<div class="tm_register_form" style="opacity: 0.85">
			<div class="tm_register_title">
				<table border="0" cellpadding="0" cellspacing="0"  class="tm_register_title_table">
					<tbody><tr>
						<th><img src="../resources/admin/easyui/images/face.png" align="absmiddle" style="margin-left: 90%"></th>
						<td>
							<a style="text-decoration:none;" href="http://localhost:8085/OnlineExam_war_exploded/home/faceRecognize"><span style="margin-left: 15%">注册新用户</span></a>
						</td>
					</tr>
				</tbody></table>
			</div>
			
			<form action="http://demo.tomexam.com/" id="form_register" method="post">
            <table border="0" cellpadding="5" cellspacing="0" class="tm_register_table">
				<caption>
							<p style="margin-top: -2px">注册阶段会进行人脸信息采集</p>
				</caption>
                <tbody><tr>
                    <th>用户名</th>
                    <td>
						<input type="text" class="validate[required,minSize[3]] tm_txt" name="name" maxlength="30" value="" style="width:200px;height: 30px">
						<span class="tm_required">*</span> 
					</td>
                </tr>
                <tr>
                    <th><div style="margin-bottom:45px">密 &nbsp;&nbsp;&nbsp;码</div></th>
                    <td>
						<input type="password" class="validate[required] tm_txt" name="password" id="u_userpass" maxlength="30" value="" style="width:200px;height: 30px">
						<span class="tm_required">*</span>
						
						<div id="tm_level" class="pw-strength">
							<div class="pw-bar"></div>
							<div class="pw-bar-on"></div>
							<div class="pw-txt">
								<span>弱</span>
								<span>中</span>
								<span>强</span>
							</div>
						</div>

					</td>
                </tr>
                <tr>
                    <th>确认密码</th>
                    <td>
						<input type="password" class="validate[required,equals[u_userpass]] tm_txt" name="u_userpass2" maxlength="30" value="" style="width:200px;height: 30px">
						<span class="tm_required">*</span>
					</td>
                </tr>
				<tr>
					<th>真实姓名</th>
					<td>
						<input type="text" name="truename" class="validate[required] tm_txt" size="50" maxlength="30" style="width:200px;height: 30px">
						<span class="tm_required">*</span>
					</td>

				</tr>
				<tr>
					<th>所属学科</th>
					<td>
						<select class="validate[required] tm_select" name="subjectId" style="width:214px;height: 30px">
							<option value="">请选择</option>
							<c:forEach items="${subjectList }" var = "subject">
							<option value="${subject.id }">${subject.name }</option>
							</c:forEach>
						</select>
						<span class="tm_required">*</span>
					</td>
				</tr>
				
				<tr>
                    <th>手机号码</th>
                    <td><input type="text" class="tm_txt" name="tel" maxlength="30" value="" style="width:200px;height: 30px"></td>
                </tr>
				<tr>
				</tr>

                <tr>
                    <th></th>
                    <td>
						<div style="margin-top:60px;margin-left: -90px">

							<button type="button" class="btn btn-primary" style="width:50%" onclick="tm.doRegister();">提交</button>

							<button type="button" class="btn btn-primary" onclick="tm.doGoBack();" style="width:30%">返回</button>
						</div>
                    </td>
                </tr>
                <tr>
                    <th></th>
                    <td></td>
                </tr>
            </tbody></table>
			</form>
        </div>
		
		<div class="tm_register_foot">
			
			<div>Copyright © 基于教考分离的考试系统 All Right Reserved 2022</div>
		</div>
	</div>
	<script type="text/javascript">
		$(document).ready(function(){ 
			tm_bindPasswordLevelChecker("u_userpass");
		}); 




		var tm = {
			doGoBack : function(){
				window.location.href = 'login';
			},

			doRegister : function(){

				var formcheck = $("#form_register").validationEngine('validate', {showOneMessage: true});

				if(!formcheck){
					return false;
				}

				var u_username = $("input[name='name']").val();
				var u_userpass = $("input[name='password']").val();
				var u_truename = $("input[name='truename']").val();
				
				var u_subjectId = $("select[name='subjectId']").val();
				var u_tel = $("input[name='tel']").val();

				if(baseutil.isEmpty(u_username)){
					alert('没有填写用户名');
					return;
				}
				if(baseutil.isEmpty(u_userpass)){
					alert('没有填写登录密码');
					return;
				}

				if(baseutil.containsSpecialWord(u_username)){
					alert("用户名中不能包含特殊字符");
					return;
				}

				$(".tm_btn_primary").text('提交...');
				var tmdata = {
						"name":u_username, "password":u_userpass, 
						"subjectId":u_subjectId, "tel":u_tel, 
						"trueName":u_truename, "t":Math.random()};

				$.ajax({
					type: "POST",
					url: "register",
					dataType: "json",
					data: tmdata,
					success: function(data){
						if(data.type == 'success'){

							//window.open("http://222.19.236.133:8000/face_information_collection/?name="+u_username);

							//这个为分布式服务器 监控端的代码
							// window.location="http://222.19.236.133:8000"+"/face_information_collection/?name="+u_username;

							//跳转回本地
							window.location="http://localhost:8085/OnlineExam_war_exploded";


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



</body></html>