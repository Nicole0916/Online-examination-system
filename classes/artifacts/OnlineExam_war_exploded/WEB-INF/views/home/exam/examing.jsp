<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="content-type" content="text/html;charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta name="referrer" content="no-referrer"/> <%--图片显示，一定要加--%>
<title>${title }</title>
<link href="../../resources/home/exam/css/main.css" rel="stylesheet" type="text/css" />
<link href="../../resources/home/exam/css/iconfont.css" rel="stylesheet" type="text/css" />
<link href="../../resources/home/exam/css/test.css" rel="stylesheet" type="text/css" />

	<!--favicon-->
	<link rel="icon" href="${pageContext.request.contextPath}/resources/assets/images/favicon-32x32.png" type="image/png" />
	<!--plugins-->
	<link href="${pageContext.request.contextPath}/resources/assets/plugins/simplebar/css/simplebar.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/resources/assets/plugins/perfect-scrollbar/css/perfect-scrollbar.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/resources/assets/plugins/metismenu/css/metisMenu.min.css" rel="stylesheet" />
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
	<link href="${pageContext.request.contextPath}/resources/stats/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/resources/stats/css/style.min.css" rel="stylesheet">

<style>
.hasBeenAnswer {
	background: #5d9cec;
	color:#fff;
}

.rt_nr1 h2{
	margin-top:0px;
}

.rt_nr1_title h1 {
	width: 130px;
	height: 45px;
	background: #389fc3;
	text-align: center;
	font-size: 14px;
	display: block;
	float: left;
	color: #fff;
	margin: 0;
	line-height: 45px;
}

</style>

</head>
<body onclick="fullScreen();displayShowUI()">
<%--<button onclick="fullScreen()">按鈕</button>--%>
<div class="main">
	<!--nr start-->

	<div class="test_main">


		<div class="nr_left">

			<div class="test" style="display: none;margin-left: 150px" id ="sss">
				<form action="" method="post">
					<div class="test_title">
						<p class="test_time">
							<img style="float:left;margin-top:15px;margin-left:10px;" src="../../resources/home/exam/images/time.png" width="16px"><b class="alt-1">${hour }:${minitute }:${second }</b>
						</p>
						<font><input type="button" onclick="submitExam()" name="test_jiaojuan" value="交卷"></font>
					</div>
						<c:if test="${exam.singleQuestionNum !=0 }">
						<div class="test_content">
							<div class="test_content_title">
								<h2>单选题</h2>
								
								<p>
									<span>共</span><i class="content_lit">${exam.singleQuestionNum }</i><span>题，</span><span>合计</span><i class="content_fs">${singleScore * exam.singleQuestionNum}</i><span>分</span>
								</p>
							</div>
						</div>
						<div class="test_content_nr">
							<ul>
								<c:forEach items="${singleQuestionList}" var="sq" varStatus="sqids">
									<li id="qu_${singleQuestion }_${sq.question.id}" data-key="${sq.id}">
										<div class="test_content_nr_tt">
											<i>${sqids.index+1}</i><span>(${sq.question.score}分)</span><font>${sq.question.title }</font>
										</div>

										<div class="test_content_nr_main">
											<ul>
												
													<li class="option" data-type="single" data-value="A">
														
															<input type="radio" class="radioOrCheck" name="answer${sq.id}"
																id="${singleQuestion }_answer_${sq.id}_option_1"

																	<c:if test="${sq.answer =='A' }">
																		checked
																	</c:if>
															/>
														
														
														<label for="${singleQuestion }_answer_${sq.id}_option_1">
															A.
															<p class="ue" style="display: inline;">${sq.question.attrA }</p>
														</label>
													</li>
												
													<li class="option" data-type="single" data-value="B">
														
															<input type="radio" class="radioOrCheck" name="answer${sq.id}"
																id="${singleQuestion }_answer_${sq.id}_option_2"

																	<c:if test="${sq.answer =='B' }">
																		checked
																	</c:if>
															/>
														
														
														<label for="${singleQuestion }_answer_${sq.id}_option_2">
															B.
															<p class="ue" style="display: inline;">${sq.question.attrB }</p>
														</label>
													</li>
												
													<li class="option" data-type="single" data-value="C">
														
															<input type="radio" class="radioOrCheck" name="answer${sq.id}"
																id="${singleQuestion }_answer_${sq.id}_option_3"

																	<c:if test="${sq.answer =='C' }">
																		checked
																	</c:if>
															/>
														
														
														<label for="${singleQuestion }_answer_${sq.id}_option_3">
															C.
															<p class="ue" style="display: inline;">${sq.question.attrC }</p>
														</label>
													</li>
												
													<li class="option" data-type="single" data-value="D">
														
															<input type="radio" class="radioOrCheck" name="answer${sq.id}"
																id="${singleQuestion }_answer_${sq.id}_option_4"
																	<c:if test="${sq.answer =='D' }">
																		checked
																	</c:if>
															/>
														
														
														<label for="${singleQuestion }_answer_${sq.id}_option_4">
															D.
															<p class="ue" style="display: inline;">${sq.question.attrD }</p>
														</label>
													</li>
												
											</ul>
										</div>
									</li>
								</c:forEach>
							</ul>
						</div>
					</c:if>
						<c:if test="${exam.muiltQuestionNum !=0 }">
						<div class="test_content">
							<div class="test_content_title">
								<h2>多选题</h2>
								<p>
									<span>共</span><i class="content_lit">${exam.muiltQuestionNum }</i><span>题，</span><span>合计</span><i class="content_fs">${exam.muiltQuestionNum * muiltScore}</i><span>分</span>
								</p>
							</div>
						</div>
						<div class="test_content_nr">
							<ul>
								<c:forEach items="${muiltQuestionList}" var="mq" varStatus="mqids">
									<li id="qu_${muiltQuestion }_${mq.question.id}" data-key="${mq.id}">
										<div class="test_content_nr_tt">
											<i>${mqids.index + exam.singleQuestionNum + 1 }</i><span>(${mq.question.score}分)</span><font>${mq.question.title }</font>
										</div>

										<div class="test_content_nr_main">
											<ul>
												
													<li class="option" data-type="muilt" data-value="A">
														
														
															<input type="checkbox" class="radioOrCheck" name="answer1"
																id="${muiltQuestion }_answer_${mq.id}_option_1" value="A"

																	<c:if test="${fn:contains(mq.answer, 'A')}">
																		checked
																	</c:if>
															/>
														
														<label for="${muiltQuestion }_answer_${mq.id}_option_1">
															A.
															<p class="ue" style="display: inline;">${mq.question.attrA}</p>
														</label>
													</li>
												
													<li class="option" data-type="muilt" data-value="B">
														
														
															<input type="checkbox" class="radioOrCheck" name="answer1"
																id="${muiltQuestion }_answer_${mq.id}_option_2" value="B"
																	<c:if test="${fn:contains(mq.answer, 'B')}">
																		checked
																	</c:if>
															/>
														
														<label for="${muiltQuestion }_answer_${mq.id}_option_2">
															B.
															<p class="ue" style="display: inline;">${mq.question.attrB}</p>
														</label>
													</li>
												
													<li class="option" data-type="muilt" data-value="C">
														
														
															<input type="checkbox" class="radioOrCheck" name="answer1"
																id="${muiltQuestion }_answer_${mq.id}_option_3" value="C"
																	<c:if test="${fn:contains(mq.answer, 'C')}">
																		checked
																	</c:if>
															/>
														
														<label for="${muiltQuestion }_answer_${mq.id}_option_3">
															C.
															<p class="ue" style="display: inline;">${mq.question.attrC}</p>
														</label>
													</li>
												
													<li class="option" data-type="muilt" data-value="D">
														
														
															<input type="checkbox" class="radioOrCheck" name="answer1"
																id="${muiltQuestion }_answer_${mq.id}_option_4" value="D"
																	<c:if test="${fn:contains(mq.answer, 'D')}">
																		checked
																	</c:if>
															/>
														
														<label for="${muiltQuestion }_answer_${mq.id}_option_4">
															D.
															<p class="ue" style="display: inline;">${mq.question.attrD}</p>
														</label>
													</li>
												
											</ul>
										</div>
									</li>
									</c:forEach>
							</ul>
						</div>
					</c:if>
					
					<c:if test="${exam.chargeQuestionNum !=0 }">
						<div class="test_content">
							<div class="test_content_title">
								<h2>判断题</h2>
								<p>
									<span>共</span><i class="content_lit">${exam.chargeQuestionNum }</i><span>题，</span><span>合计</span><i class="content_fs">${chargeScore * exam.chargeQuestionNum}</i><span>分</span>
								</p>
							</div>
						</div>
						<div class="test_content_nr">
							<ul>
								<c:forEach items="${chargeQuestionList}" var="cq" varStatus="cqids">
									<li id="qu_${chargeQuestion }_${cq.question.id}" data-key="${cq.id}">
										<div class="test_content_nr_tt">
											<i>${cqids.index+exam.singleQuestionNum+exam.muiltQuestionNum+1}</i><span>(${cq.question.score}分)</span><font>${cq.question.title }</font>
										</div>

										<div class="test_content_nr_main">
											<ul>
												
													<li class="option" data-type="charge" data-value="A">
														
															<input type="radio" class="radioOrCheck" name="answer${cq.id}"
																id="${chargeQuestion }_answer_${cq.id}_option_1"
																	<c:if test="${cq.answer =='A' }">
																		checked
																	</c:if>
															/>
														
														
														<label for="${chargeQuestion }_answer_${cq.id}_option_1">
															A.
															<p class="ue" style="display: inline;">${cq.question.attrA }</p>
														</label>
													</li>
												
													<li class="option" data-type="charge" data-value="B">
														
															<input type="radio" class="radioOrCheck" name="answer${cq.id}"
																id="${chargeQuestion }_answer_${cq.id}_option_2"
																	<c:if test="${cq.answer =='B' }">
																		checked
																	</c:if>
															/>
														
														
														<label for="${chargeQuestion }_answer_${cq.id}_option_2">
															B.
															<p class="ue" style="display: inline;">${cq.question.attrB }</p>
														</label>
													</li>
											</ul>
										</div>
									</li>
								</c:forEach>
							</ul>
						</div>
					</c:if>
					
					<c:if test="${exam.fillQuestionNum !=0 }">
						<div class="test_content">
							<div class="test_content_title">
								<h2>填空题</h2>
								<p>
									<span>共</span><i class="content_lit">${exam.fillQuestionNum }</i><span>题，</span><span>合计</span><i class="content_fs">${fillScore * exam.fillQuestionNum}</i><span>分</span>
								</p>
							</div>
						</div>
						<div class="test_content_nr">
							<ul>
								<c:forEach items="${fillQuestionList}" var="fq" varStatus="fqids">
									<li id="qu_${fillQuestion }_${fq.question.id}" data-key="${fq.id}">
										<div class="test_content_nr_tt">
											<i>${fqids.index+exam.singleQuestionNum+exam.muiltQuestionNum+exam.chargeQuestionNum+1}</i><span>(${fq.question.score}分)</span><font>${fq.question.title }</font>
										</div>

											<div class="test_content_nr_main" data-type="fill">

<%--  											<textarea rows="1" cols="80" placeholder="请填写答案" >${fq.answer}</textarea>--%>

													<label for="fq_description">请作答：</label>
													<textarea class="form-control" id="fq_description" name="fq_description" rows="5" value="" placeholder="请填写答案">${fq.answer}</textarea>

											
											</div>
									
								</c:forEach>
							</ul>
						</div>
						</c:if>
						<c:if test="${exam.shortQuestionNum !=0 }">
						<div class="test_content">
							<div class="test_content_title">
								<h2>简答题</h2>
								<p>
									<span>共</span><i class="content_lit">${exam.shortQuestionNum }</i><span>题，</span><span>合计</span><i class="content_fs">${shortScore * exam.shortQuestionNum}</i><span>分</span>
								</p>
							</div>
						</div>
						<div class="test_content_nr">
							<ul>
								<c:forEach items="${shortQuestionList}" var="shortq" varStatus="shortqids">
									<li id="qu_${shortQuestion }_${shortq.question.id}" data-key="${shortq.id}">
										<div class="test_content_nr_tt">
											<i>${shortqids.index+exam.singleQuestionNum+exam.muiltQuestionNum+exam.chargeQuestionNum+exam.fillQuestionNum+1}</i><span>(${shortq.question.score}分)</span><font>${shortq.question.title }</font>
										</div>

										<div class="test_content_nr_main" data-type="short">

<%--  											<textarea rows="20" cols="100" placeholder="请填写答案">${shortq.answer}</textarea>--%>

											<label for="shortq_description">请作答：</label>
											<textarea class="form-control" id="shortq_description" name="shortq_description" rows="10" value="" placeholder="请填写答案">${shortq.answer}</textarea>


										</div>
									</li>
								</c:forEach>
							</ul>
						</div>
						</c:if>
					
					
				</form>
			</div>

		</div>
		<div class="nr_right">
			<div class="nr_rt_main">
				<div class="rt_nr1" style="margin-left: 150px">
					<div class="rt_nr1_title">
						<h1>
							<span style="font-size:18px;">答题卡</span>
						</h1>
						<p class="test_time">
							<img style="float:left;margin-top:15px;margin-left:10px;" src="../../resources/home/exam/images/time.png" width="16px">
							<b class="alt-1">${hour }:${minitute }:${second }</b>
						</p>
					</div>
					<c:if test="${exam.singleQuestionNum !=0 }">
						<div class="rt_content">
							<div class="rt_content_tt">
								<h2>单选题</h2>
								<p>
									<span>共</span><i class="content_lit">${exam.singleQuestionNum }</i><span>题</span>
								</p>
							</div>
							<div class="rt_content_nr answerSheet">
								<ul>
									<c:forEach items="${singleQuestionList}" var="ssq" varStatus="ssqids">
										<li><a href="#qu_${singleQuestion}_${ssq.question.id}">${ssqids.index + 1 }</a></li>
									</c:forEach>
								</ul>
							</div>
						</div>
					</c:if>
						<c:if test="${exam.muiltQuestionNum !=0 }">
						<div class="rt_content">
							<div class="rt_content_tt">
								<h2>多选题</h2>
								<p>
									<span>共</span><i class="content_lit">${exam.muiltQuestionNum }</i><span>题</span>
								</p>
							</div>
							<div class="rt_content_nr answerSheet">
								<ul>
									<c:forEach items="${muiltQuestionList}" var="mmq" varStatus="mmqids">
										<li><a href="#qu_${muiltQuestion }_${mmq.question.id }">${mmqids.index + exam.singleQuestionNum + 1 }</a></li>
									</c:forEach>
								</ul>
							</div>
						</div>
					</c:if>
					<c:if test="${exam.chargeQuestionNum !=0 }">
						<div class="rt_content">
							<div class="rt_content_tt">
								<h2>判断题</h2>
								<p>
									<span>共</span><i class="content_lit">${exam.chargeQuestionNum }</i><span>题</span>
								</p>
							</div>
							<div class="rt_content_nr answerSheet">
								<ul>
									<c:forEach items="${chargeQuestionList}" var="ccq" varStatus="ccqids">
										<li><a href="#qu_${chargeQuestion}_${ccq.question.id}">${ccqids.index+exam.singleQuestionNum+exam.muiltQuestionNum+1}</a></li>
									</c:forEach>
								</ul>
							</div>
						</div>
					</c:if>
					<c:if test="${exam.fillQuestionNum !=0 }">
						<div class="rt_content">
							<div class="rt_content_tt">
								<h2>填空题</h2>
								<p>
									<span>共</span><i class="content_lit">${exam.fillQuestionNum }</i><span>题</span>
								</p>
							</div>
							<div class="rt_content_nr answerSheet">
								<ul>
									<c:forEach items="${fillQuestionList}" var="ffq" varStatus="ffqids">
										<li><a href="#qu_${fillQuestion}_${ffq.question.id}">${ffqids.index+exam.singleQuestionNum+exam.muiltQuestionNum+exam.chargeQuestionNum+1}</a></li>
									</c:forEach>
								</ul>
							</div>
						</div>
						</c:if>
						<c:if test="${exam.shortQuestionNum !=0 }">
						<div class="rt_content">
							<div class="rt_content_tt">
								<h2>简答题</h2>
								<p>
									<span>共</span><i class="content_lit">${exam.shortQuestionNum }</i><span>题</span>
								</p>
							</div>
							<div class="rt_content_nr answerSheet">
								<ul>
									<c:forEach items="${shortQuestionList}" var="sssq" varStatus="sssqids">
										<li><a href="#qu_${shortQuestion}_${sssq.question.id}">${sssqids.index+exam.singleQuestionNum+exam.muiltQuestionNum+exam.chargeQuestionNum+exam.fillQuestionNum+1}</a></li>
									</c:forEach>
								</ul>
							</div>
						</div>
						</c:if>

						<div style="width:280px; position:fixed; top:2%; margin-left: -1207px;z-index:1000;">
							<div class="rt_nr1_title">
								<h1>
									<span style="font-size:18px;">摄像头</span>
								</h1>
								<p class="test_time">
									<img style="float:left;margin-top:15px;margin-left:10px;" src="../../resources/admin/easyui/icon/talent-color.png" width="16px">
									<b class="alt-1">${trueName }</b>
								</p>
							</div>
							<div class="tpl-portlet-components">
								<div class="am-cf" style="position: relative;overflow: hidden;width: 276px;height: 300px;">
									<!-- 只需要插入下面这行代码就可以了，配合js指定所展示的url -->
									<iframe id="mainContent" scrolling="no" style="width:800px; height:900px; position: absolute; top: -150px;left:0px;" allow="microphone;camera;midi;encrypted-media;"></iframe>
								</div>
							</div>
						</div>


				</div>

			</div>
		</div>





	</div>
	<!--nr end-->
	<div class="foot"></div>
</div>

<script src="../../resources/home/exam/js/jquery-1.11.3.min.js"></script>
<script src="../../resources/home/exam/js/jquery.easy-pie-chart.js"></script>
<!--时间js-->
<script src="../../resources/home/exam/js/jquery.countdown.js"></script>
<script>

	var mainContent = document.getElementById('mainContent');
	mainContent.src = "http://222.19.236.133:8000/vidieo/?name=${studentName }";


	function displayShowUI()
    {
        var ui = document.getElementById("sss");
        ui.style.display="block";//display为空的话会好使，为block会使后边的空间换行
    }



    $(document).keydown(function(event){
        if(event.keyCode == 27){
            alert('考试结束！');

            $.ajax({
                type: "POST",
                url: "submit_exam",
                dataType: "json",
                data: {"examId":'${exam.id}',examPaperId:'${examPaper.id}'},
                success: function(data){
                    if(data.type == 'success'){
                        alert('考试成绩已出，请到会员中心查看');
                        window.location="../user/welcome";
                    }else{
                        alert(data.msg);
                        //$(".tm_btn_primary").text('提交');
                        //return;
                        //window.location.reload();
                    }
                },
                error: function(){
                    //$(".tm_btn_primary").text('登录');
                    alert('系统忙，请稍后再试');
                    window.location.reload();
                }
            });
        }
    });








    window.jQuery(function($) {
		"use strict";
		
		$('time').countDown({
			with_separators : false
		});
		$('.alt-1').countDown({
			css_class : 'countdown-alt-1'
		});
		$('.alt-2').countDown({
			css_class : 'countdown-alt-2'
		});
		$('.alt-3').countDown({
			css_class : 'countdown-alt-3'
		});
	});




	function fullScreen(){
		var el = document.documentElement;
		var rfs = el.requestFullScreen || el.webkitRequestFullScreen || el.mozRequestFullScreen || el.msRequestFullScreen;
		console.log("执行全屏")
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
		// console.log("执行全屏")
	}




	//断电保存
	$(function() {
		$('li.option input').click(function() { 
			var examId = $(this).closest('.test_content_nr_main').closest('li').attr('id'); // 得到题目ID
			var cardLi = $('a[href=#' + examId + ']'); // 根据题目ID找到对应答题卡
			// 设置已答题
			if(!cardLi.hasClass('hasBeenAnswer')){
				cardLi.addClass('hasBeenAnswer');
			}
			var examArr = examId.split('_');
			var questionId = examArr[2];
			var submitExamId = ${exam.id};
			var examPaperId = ${examPaper.id};
			var examPaperAnswerId = $("#"+examId).attr("data-key");
			//console.log(questionId+'--'+submitExamId+'--'+examPaperId);
			var selectedAnswer = $(this).closest("li.option").attr("data-value")
			if($(this).closest("li.option").attr("data-type") == 'muilt'){
				//如果是多选
				selectedAnswer = '';
				var checkedBox = $(this).closest("li.option").parent("ul").find("input[type='checkbox']:checked")
				for(var i=0;i<checkedBox.length;i++){
					selectedAnswer += $(checkedBox[i]).val();
				}
				//console.log(checkedBox)
			}
			//console.log(selectedAnswer)
			
			
			
			//提交单选、多选、判断题答案
			$.ajax({
				type: "POST",
				url: "submit_answer",
				dataType: "json",
				data: {"examId":submitExamId,examPaperId:examPaperId,questionId:questionId,answer:selectedAnswer,id:examPaperAnswerId},
				success: function(data){
					if(data.type == 'success'){
						//top.window.location="../exam/examing?examId="+eid;
					}else{
						alert(data.msg);
						//$(".tm_btn_primary").text('提交');
						//return;
						//window.location.reload();
					}
				},
				error: function(){
					//$(".tm_btn_primary").text('登录');
					alert('系统忙，请稍后再试');
					window.location.reload();
				}
			});
		});
		
		
		
		$("textarea").bind('input propertychange', function(){// 监听键盘事件
			var examId = $(this).closest('.test_content_nr_main').closest('li').attr('id'); // 得到题目ID
			var cardLi = $('a[href=#' + examId + ']'); // 根据题目ID找到对应答题卡
			// 设置已答题
			// 如果textarea不为空的话，设置答题卡对应题号状态为：已答
			if(!($(this).val()==null)|!($(this).val()=='')){
				if(!cardLi.hasClass('hasBeenAnswer')){
					cardLi.addClass('hasBeenAnswer');
				}
			}
			// 如果textarea为空的话，设置答题卡对应题号状态为：未答
			if(($(this).val()==null)|($(this).val()=='')){
				if(cardLi.hasClass('hasBeenAnswer')){
					cardLi.removeClass('hasBeenAnswer');
				}
			}
			var examArr = examId.split('_');
			var questionId = examArr[2];
			var submitExamId = ${exam.id};
			var examPaperId = ${examPaper.id};
			var examPaperAnswerId = $("#"+examId).attr("data-key");
			//console.log("测试..."));
			if(($(this).closest("div").attr("data-type") == 'fill')|($(this).closest("div").attr("data-type") == 'short')){
				//如果是填空题和简答题的话：
				var writeAnswer = $(this).val(); 
				// console.log("提交的答案为："+writeAnswer);
				
			}
		    
		    
		  //提交填空题和简答题答案
			$.ajax({
				type: "POST",
				url: "submit_answer",
				dataType: "json",
				data: {"examId":submitExamId,examPaperId:examPaperId,questionId:questionId,answer:writeAnswer,id:examPaperAnswerId},
				success: function(data){
					if(data.type == 'success'){
						//top.window.location="../exam/examing?examId="+eid;
					}else{
						alert(data.msg);
						//$(".tm_btn_primary").text('提交');
						//return;
						//window.location.reload();
					}
				},
				error: function(){
					//$(".tm_btn_primary").text('登录');
					alert('系统忙，请稍后再试');
					window.location.reload();
				}
			});
		  });
		
	});
var autoSubmit = false;
//当考试时间结束后自动提交试卷
function autoSubmitExam(){
	if(autoSubmit)return;
	//提交试卷
	$.ajax({
		type: "POST",
		url: "submit_exam",
		dataType: "json",
		data: {"examId":'${exam.id}',examPaperId:'${examPaper.id}'},
		success: function(data){
			if(data.type == 'success'){
				alert('考试时间到，考试成绩已出，请到会员中心查看');
				window.location="../user/welcome";
			}else{
				alert(data.msg);
				//$(".tm_btn_primary").text('提交');
				//return;
				//window.location.reload();
			}
		},
		beforeSend:function(){
			autoSubmit = true;
		},
		error: function(){
			//$(".tm_btn_primary").text('登录');
			alert('系统忙，请稍后再试');
			window.location.reload();
		}
	});	
}
function submitExam(){
	var wcm = window.confirm('提交后将不能再进行考试，确认提交？');
	if(!wcm){
		return;
	}
	//提交试卷
	$.ajax({
		type: "POST",
		url: "submit_exam",
		dataType: "json",
		data: {"examId":'${exam.id}',examPaperId:'${examPaper.id}'},
		success: function(data){
			if(data.type == 'success'){
				alert('考试成绩已出，请到会员中心查看');
				window.location="../user/welcome";
			}else{
				alert(data.msg);
				//$(".tm_btn_primary").text('提交');
				//return;
				//window.location.reload();
			}
		},
		error: function(){
			//$(".tm_btn_primary").text('登录');
			alert('系统忙，请稍后再试');
			window.location.reload();
		}
	});
}
</script>

<div class="row" style="width: 900px;margin-left: 290px">

	<div class="col col-lg-9 mx-auto">
		<div class="card bg-transparent shadow-none">
			<div class="card-body">
				<h4 class="card-title"><strong>考试科目：${exam.name }</strong></h4>
				<hr/>

				<div class="alert border-0 border-start border-5 border-danger alert-dismissible fade show py-2" >
					<div class="d-flex align-items-center">
						<div class="font-35 text-danger"><i class='bx bxs-message-square-x'></i>
						</div>
						<div class="ms-3">
							<h5 class="mb-0 text-danger"><strong>警告：强制退出，后果自负！！！</strong></h5>
						</div>
					</div>
					<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
				</div>

			</div>
		</div>
	</div>
</div>


</body>

<!-- Bootstrap JS -->
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
<!--plugins-->
<script src="${pageContext.request.contextPath}/resources/assets/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/easyui/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/plugins/simplebar/js/simplebar.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/ssets/plugins/metismenu/js/metisMenu.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/assets/plugins/perfect-scrollbar/js/perfect-scrollbar.js"></script>
<!--app JS-->
<script src="${pageContext.request.contextPath}/resources/assets/js/app.js"></script>
</html>