<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../common/header.jsp"%>


<link href="${pageContext.request.contextPath}/resources/stats/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/stats/css/materialdesignicons.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/stats/css/style.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="${pageContext.request.contextPath}/resources/stats/js/echarts.min.js"></script>



<%--右侧添加滚轮--%>
<style rel="stylesheet/scss" lang="scss" scoped>
    #dashboard-editor-container {
        padding: 15px;
        background-color: rgb(240, 242, 245);

        overflow-y: auto;
        height: 800px;

    .chart-wrapper {
        background: #fff;
        padding: 16px 16px 0;
        margin-bottom: 32px;
    }
    }
</style>


<div class="lyear-layout-web" id="dashboard-editor-container" style="height: 100%">
    <div class="lyear-layout-container">
        <div class="container-fluid">

            <div class="wu-toolbar-search">
                <label style="font-size: 14px">查询考试：</label>
                <select id="search-exam" size="1" style="width:180px;display:inline;height: 25px" >
                    <option value="-1">全部</option>
                    <c:forEach items="${examList}" var="exam">
                        <option value="${exam.id}">${exam.name}</option>
                    </c:forEach>
                </select>
                <a href="#" id="search-btn" class="btn btn-label btn-success" ><i class="mdi mdi-magnify"></i>搜索</a>
            </div>
            <br/>

            <div class="row">
                <div class="col-sm-6 col-lg-3">
                    <div class="card bg-primary">
                        <div class="card-body clearfix">
                            <div class="pull-right">
                                <p class="h6 text-white m-t-0">已考人数</p>
                                <p class="h3 text-white m-b-0" id="examedNum"></p>
                            </div>
                            <div class="pull-left"> <span class="img-avatar img-avatar-48 bg-translucent"><i class="mdi mdi-account fa-1-5x"></i></span> </div>
                        </div>
                    </div>
                </div>

                <div class="col-sm-6 col-lg-3">
                    <div class="card bg-danger">
                        <div class="card-body clearfix">
                            <div class="pull-right">
                                <p class="h6 text-white m-t-0">未考人数</p>
                                <p class="h3 text-white m-b-0" id="notExamedNum"></p>
                            </div>
                            <div class="pull-left"> <span class="img-avatar img-avatar-48 bg-translucent"><i class="mdi mdi-account fa-1-5x"></i></span> </div>
                        </div>
                    </div>
                </div>

                <div class="col-sm-6 col-lg-3">
                    <div class="card bg-success">
                        <div class="card-body clearfix">
                            <div class="pull-right">
                                <p class="h6 text-white m-t-0">通过考试人数</p>
                                <p class="h3 text-white m-b-0" id="passNum"></p>
                            </div>
                            <div class="pull-left"> <span class="img-avatar img-avatar-48 bg-translucent"><i class="mdi mdi-account fa-1-5x"></i></span> </div>
                        </div>
                    </div>
                </div>

                <div class="col-sm-6 col-lg-3">
                    <div class="card bg-purple">
                        <div class="card-body clearfix">
                            <div class="pull-right">
                                <p class="h6 text-white m-t-0">考试通过率</p>
                                <p class="h3 text-white m-b-0" id="passRate"></p>
                            </div>
                            <div class="pull-left"> <span class="img-avatar img-avatar-48 bg-translucent"><i class="mdi mdi-spellcheck fa-1-5x"></i></span> </div>
                        </div>
                    </div>
                </div>
            </div>



            <div class="row">

                <div class="col-lg-12">

                    <div class="card">



                        <div class="card-header">
                            <h4>考试成绩单</h4>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-striped">
                                    <thead>
                                    <tr>
                                        <th>排名</th>
                                        <th>姓名</th>
                                        <th>专业</th>
                                        <th>总分</th>
                                        <th>成绩评定</th>
                                        <th>作弊检测</th>
                                    </tr>
                                    </thead>
                                    <tbody id="datagrid">
                                    <%--                                    <tr>--%>
                                    <%--                                        <td>1</td>--%>
                                    <%--                                        <td>设计新主题</td>--%>
                                    <%--                                        <td>10/02/2019</td>--%>
                                    <%--                                        <td>12/05/2019</td>--%>
                                    <%--                                        <td><span class="label label-warning">待定</span></td>--%>
                                    <%--                                        <td>--%>
                                    <%--                                            <div class="progress progress-striped progress-sm">--%>
                                    <%--                                                <div class="progress-bar progress-bar-warning" style="width: 45%;"></div>--%>
                                    <%--                                            </div>--%>
                                    <%--                                        </td>--%>
                                    <%--                                    </tr>--%>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

            <div class="row">

                <div class="col-lg-6">
                    <div class="card">
                        <div class="card-header">
                            <h4>得分环</h4>
                        </div>
                        <div class="card-body">
                            <!--<canvas id="main" class="js-chartjs-1"></canvas> $( '.js-chartjs-bars' )-->
                            <div id="main1" style="width: 100%;height:450px;"></div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="card">
                        <div class="card-header">
                            <h4>南丁格尔玫瑰成绩图</h4>
                        </div>
                        <div class="card-body">
                            <div id="main2" style="width: 100%;height:450px;"></div>
                        </div>
                    </div>
                </div>

            </div>

            <div class="row">

                <div class="col-lg-6">
                    <div class="card">
                        <div class="card-header">
                            <h4>成绩折线图</h4>
                        </div>
                        <div class="card-body">
                            <!--<canvas id="main" class="js-chartjs-1"></canvas> $( '.js-chartjs-bars' )-->
                            <div id="main3" style="width: 100%;height:450px;"></div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6">
                    <div class="card">
                        <div class="card-header">
                            <h4>成绩评定雷达图</h4>
                        </div>
                        <div class="card-body">
                            <div id="main4" style="width: 100%;height:450px;"></div>
                        </div>
                    </div>
                </div>

            </div>


        </div>
    </div>
</div>

<%--<script type="text/javascript" src="${pageContext.request.contextPath}/resources/stats/js/jquery.min.js"></script>--%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/stats/js/bootstrap.min.js"></script>
<%--<script type="text/javascript" src="${pageContext.request.contextPath}/resources/stats/js/perfect-scrollbar.min.js"></script>--%>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/stats/js/main.min.js"></script>

<script type="text/javascript">




    //基于准备好的dom，初始化echarts实例
    var myChart1 = echarts.init(document.getElementById('main1')); // 得分环
    var myChart2 = echarts.init(document.getElementById('main2')); // 雷达图
    var myChart3 = echarts.init(document.getElementById('main3')); // 折线图
    var myChart4 = echarts.init(document.getElementById('main4')); //

    // 指定图表的配置项和数据

    $("#search-btn").click(function(){
        var examId = $("#search-exam").val();
        if(examId == -1){
            $.messager.alert('信息提示','请选择要统计的考试！','info');
            return;
        }

        $.ajax({
            type: "POST",
            url: "get_exam_stats",
            dataType: "json",
            data: {"examId":examId},
            success: function(data){ //
                if(data.type == 'success'){
                    var candidates = data.examCounting.candidates
                    examedNum = data.examCounting.examedNum
                    var passNum = data.examCounting.passNum
                    var passRate = (passNum*100/examedNum).toFixed(1);


                    single = data.examCounting.singleQuestionNum*examedNum; //考试发放单选题数量
                    mutil = data.examCounting.muiltQuestionNum*examedNum; //考试发放多选题数量
                    charge = data.examCounting.chargeQuestionNum*examedNum; //考试发放判断题数量
                    fill = data.examCounting.fillQuestionNum*examedNum; //考试发放填空题数量
                    short = data.examCounting.shortQuestionNum*examedNum; //考试发放简答题数量


                    $("#examedNum").text(examedNum)
                    $("#notExamedNum").text(candidates-examedNum)
                    $("#passNum").text(passNum)
                    $("#passRate").text(passRate + "%")


                }else{
                    alert(data.msg);
                }
            },
            error: function(){
                //$(".tm_btn_primary").text('登录');
                alert('系统忙，请稍后再试');
                window.location.reload();
            }
        });

        console.log("echarts版本为"+echarts.version);
        // 折线图 表格
        $.ajax({
            type: "POST",
            url: "get_stats",
            dataType: "json",
            data: {"examId":examId},
            success: function(data){
                if(data.type == 'success'){

                    // 表格
                    var stats = data.examStats;
                    // 清空当前
                    $("#datagrid").html("");

                    //统计成绩评定的人数 （饼状图）
                    var grade1 = 0; //优
                    var grade2 = 0; //良
                    var grade3 = 0; //中
                    var grade4 = 0; //合格
                    var grade5 = 0; //不及格

                    //统计各块总得分 （得分环）
                    var examScoreTotal = 0; //考试的总分
                    var examObjScore = 0; //考试的客观题总分
                    var examSubScore = 0; //考试的主观题总分


                    var stuScoreTotal = 0; //学生的总得分
                    var stuObjScoreTotal = 0; //学生的客观题总得分
                    var stuSubScoreTotal =0; //学生的主观题总得分

                    var html = '';
                    $.each(stats,function (i,n) {
                        var pass = "不合格"
                        if(n.finalScore>=n.totalScore*0.9){
                            pass = "优秀"
                            grade1 +=1
                        }
                        else if(n.finalScore>=n.totalScore*0.8 && n.finalScore<n.totalScore*0.9){
                            pass = "良好"
                            grade2 +=1
                        }
                        else if(n.finalScore>=n.totalScore*0.7 && n.finalScore<n.totalScore*0.8){
                            pass = "中等"
                            grade3 +=1
                        }
                        else if(n.finalScore>=n.totalScore*0.6 && n.finalScore<n.totalScore*0.7){
                            pass = "合格"
                            grade4 +=1
                        }
                        else {
                            pass = "不合格"
                            grade5 +=1
                        }



                        stuScoreTotal += n.finalScore;
                        stuObjScoreTotal += n.score;
                        stuSubScoreTotal += n.subScoreTotal;


                        html += "<tr>"
                        html += "<td>" +(i+1)+ "</td>"
                        html += "<td>" +n.sname+ "</td>"
                        html += "<td>" +n.subject+ "</td>"
                        html += "<td>" +n.finalScore+ "</td>"
                        html += "<td>" + pass + "</td>"
                        if(n.cheat==1) html += "<td><a href='illegal_action?examId="+ examId+ "&sname=" + n.sname  + "' target='_blank'><span class='label label-danger'>作弊</span></a></td>"
                        else html += "<td><a href='illegal_action?examId="+ examId + "&sname=" + n.sname  + "' target='_blank'><span class='label label-success'>无异常</span></a></td>"
                        html += "</tr>"

                        // $("#datagrid").append("<tr>")
                        //     .append("<td>" +(i+1)+ "</td>")
                        //     .append("<td>" +n.sname+ "</td>")
                        //     .append("<td>" +n.subject+ "</td>")
                        //     .append("<td>" +n.finalScore+ "</td>")
                        //     .append("<td>" + pass + "</td>")
                        // if(n.cheat==1) $("#datagrid").append("<td><span class=\'label label-danger\'>作弊</span></td>")
                        // else $("#datagrid").append("<td><span class=\'label label-success\'>无异常</span></td>")
                        // $("#datagrid").append("</tr>")
                    })
                    $("#datagrid").append(html)


                    examObjScore = (single + charge)*2 + mutil*4 // 计算客观题总分

                    examScoreTotal = (single + charge)*2 + mutil*4 + fill*2 + short*10 // 计算总分

                    examSubScore = examScoreTotal - examObjScore // 计算主观题总分

                    console.log("客观题总分："+examObjScore)
                    console.log("主观题总分："+examSubScore)
                    console.log("考试总分"+examScoreTotal)

                    console.log("学生客观题得分："+stuObjScoreTotal)
                    console.log("学生主观题得分："+stuSubScoreTotal)
                    console.log("学生总得分"+stuScoreTotal)


                    var examSubScoreRate = (stuSubScoreTotal*100/examSubScore).toFixed(1) // 主观题得分率
                    var examObjScoreRate = (stuObjScoreTotal*100/examObjScore).toFixed(1) // 客观题得分率
                    var allScoreRate = (stuScoreTotal*100/examScoreTotal).toFixed(1) // 总分得分率

                    // 得分环
                    const gaugeData = [
                        {
                            value: examSubScoreRate,
                            name: '主观得分率',
                            title: {
                                offsetCenter: ['0%', '-30%']
                            },
                            detail: {
                                valueAnimation: true,
                                offsetCenter: ['0%', '-20%']
                            }
                        },
                        {
                            value: examObjScoreRate,
                            name: '客观得分率',
                            title: {
                                offsetCenter: ['0%', '0%']
                            },
                            detail: {
                                valueAnimation: true,
                                offsetCenter: ['0%', '10%']
                            }
                        },
                        {
                            value: allScoreRate,
                            name: '总得分率',
                            title: {
                                offsetCenter: ['0%', '30%']
                            },
                            detail: {
                                valueAnimation: true,
                                offsetCenter: ['0%', '40%']
                            }
                        }
                    ];
                    var option1 = {
                        series: [
                            {
                                type: 'gauge',
                                startAngle: 90,
                                endAngle: -270,
                                pointer: {
                                    show: false
                                },
                                progress: {
                                    show: true,
                                    overlap: false,
                                    roundCap: true,
                                    clip: false,
                                    itemStyle: {
                                        borderWidth: 1,
                                        borderColor: '#464646'
                                    }
                                },
                                axisLine: {
                                    lineStyle: {
                                        width: 40
                                    }
                                },
                                splitLine: {
                                    show: false,
                                    distance: 0,
                                    length: 10
                                },
                                axisTick: {
                                    show: false
                                },
                                axisLabel: {
                                    show: false,
                                    distance: 50
                                },
                                data: gaugeData,
                                title: {
                                    fontSize: 14
                                },
                                detail: {
                                    width: 50,
                                    height: 14,
                                    fontSize: 14,
                                    color: 'auto',
                                    borderColor: 'auto',
                                    borderRadius: 20,
                                    borderWidth: 1,
                                    formatter: '{value}%'
                                }
                            }
                        ]
                    };
                    myChart1.setOption(option1);

                    //折线图
                    var option3 = {
                        xAxis: {
                            type: 'category',
                            data: data.studentList
                        },
                        yAxis: {
                            type: 'value'
                        },
                        series: [
                            {
                                data: data.studentScore,
                                type: 'line',
                                symbol: 'roundRect',
                                symbolSize: 13,
                                lineStyle: {
                                    color: '#5470C6',
                                    width: 4,
                                    type: 'dashed'
                                },
                                itemStyle: {
                                    borderWidth: 3,
                                    borderColor: '#EE6666',
                                    color: 'yellow'
                                }
                            }
                        ]
                    };
                    // 使用刚指定的配置项和数据显示图表。
                    myChart3.setOption(option3);

                    // 南丁格尔玫瑰图
                    var option2 = {
                        legend: {
                            top: 'bottom'
                        },
                        toolbox: {
                            show: true,
                        },
                        color:["#3ba272","#73c0de","#fac858","#9a60b4","#ee6666"],
                        series: [
                            {
                                name: 'Nightingale Chart',
                                type: 'pie',
                                radius: [30, 180],
                                center: ['50%', '45%'],
                                roseType: 'area',
                                itemStyle: {
                                    borderRadius: 8
                                },
                                data: [
                                    { value: grade1, name: '优秀' },
                                    { value: grade2, name: '良好' },
                                    { value: grade3, name: '中等' },
                                    { value: grade4, name: '合格' },
                                    { value: grade5, name: '不及格' },
                                ]
                            }
                        ]
                    };
                    myChart2.setOption(option2);

                    var all = Math.max(grade1, grade2, grade3, grade4, grade5)
                    // 雷达图
                    var option4 = {

                        color: ['#67F9D8', '#FFE434', '#56A3F1', '#FF917C'],
                        legend: {
                            top: 'top'
                        },
                        radar: [
                            {
                                indicator: [
                                    { text: '优秀' ,max: all},
                                    { text: '良好' ,max: all},
                                    { text: '中等' ,max: all},
                                    { text: '合格' ,max: all},
                                    { text: '不及格',max: all}
                                ],
                                center: ['50%', '50%'],
                                radius: 130,
                                startAngle: 90,
                                splitNumber: 4,
                                shape: 'circle',
                                axisName: {
                                    formatter: '{value}',
                                    color: '#2F4F4F'
                                },
                                splitArea: {
                                    areaStyle: {
                                        color: ['#77EADF', '#26C3BE', '#64AFE9', '#428BD4'],
                                        shadowColor: 'rgba(0, 0, 0, 0.2)',
                                        shadowBlur: 10
                                    }
                                },
                                axisLine: {
                                    lineStyle: {
                                        color: 'rgba(211, 253, 250, 0.8)'
                                    }
                                },
                                splitLine: {
                                    lineStyle: {
                                        color: 'rgba(211, 253, 250, 0.8)'
                                    }
                                }
                            },

                        ],
                        color:["#FFE434"],
                        series: [
                            {
                                type: 'radar',
                                emphasis: {
                                    lineStyle: {
                                        width: 4
                                    }
                                },
                                data: [
                                    {
                                        value: [grade1, grade2, grade3, grade4, grade5],
                                        name: '成绩评定人数',
                                        areaStyle: {
                                            color: 'rgba(255, 228, 52, 0.6)'
                                        }
                                    }
                                ]
                            },
                        ]
                    };
                    myChart4.setOption(option4);


                }else{
                    alert(data.msg);
                }
            },
            error: function(){
                //$(".tm_btn_primary").text('登录');
                alert('系统忙，请稍后再试');
                window.location.reload();
            }
        });
    });

    window.onresize = function(){
        myChart1.resize();
        myChart2.resize();
        myChart3.resize();
        myChart4.resize();
    }

</script>

