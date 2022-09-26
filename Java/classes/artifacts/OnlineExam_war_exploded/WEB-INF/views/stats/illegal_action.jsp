<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="../common/header.jsp"%>


<link href="${pageContext.request.contextPath}/resources/stats/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/stats/css/materialdesignicons.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/stats/css/style.min.css" rel="stylesheet">

<style>
  .chart_block{
    height: 400px;
  }

</style>

<%--右侧添加滚轮--%>
<style rel="stylesheet/scss" lang="scss" scoped>
  #dashboard-editor-container1 {
    padding: 15px;
    background-color: rgb(240, 242, 245);

    overflow-y: auto;
    height: 100%;
  }

  .chart-wrapper {
    background: #fff;
    padding: 16px 16px 0;
    margin-bottom: 32px;
  }
</style>


<div class="lyear-layout-web" id="dashboard-editor-container1">
  <div class="lyear-layout-container" >


    <!--页面主要内容-->
    <main class="lyear-layout-content" style="padding-left: 0px;padding-top: 8px ">

      <div class="card-header">
        <h2>${detail.ename}-${detail.sname}</h2>
      </div>
      <div class="container-fluid">

        <div class="row">
          <div class="col-sm-6 col-lg-3">
            <div class="card bg-primary">
              <div class="card-body clearfix">
                <div class="pull-right">
                  <p class="h6 text-white m-t-0">考生偏头次数</p>
                  <p class="h3 text-white m-b-0" id="piantou"></p>
                </div>
                <div class="pull-left"> <span class="img-avatar img-avatar-48 bg-translucent"><i class="mdi mdi-baby fa-1-5x"></i></span> </div>
                <!--                                <div class="pull-left"> <span class="img-avatar img-avatar-48 bg-translucent"><i class="mdi mdi-currency-cny fa-1-5x"></i></span> </div>-->
              </div>
            </div>
          </div>

          <div class="col-sm-6 col-lg-3">
            <div class="card bg-danger">
              <div class="card-body clearfix">
                <div class="pull-right">
                  <p class="h6 text-white m-t-0">考生镜头内无人次数</p>
                  <p class="h3 text-white m-b-0" id="wuren"></p>
                </div>
                <div class="pull-left"> <span class="img-avatar img-avatar-48 bg-translucent"><i class="mdi mdi-account-off fa-1-5x"></i></span> </div>
              </div>
            </div>
          </div>

          <div class="col-sm-6 col-lg-3">
            <div class="card bg-success">
              <div class="card-body clearfix">
                <div class="pull-right">
                  <p class="h6 text-white m-t-0">考生镜头内多人次数</p>
                  <p class="h3 text-white m-b-0" id="duoren"></p>
                </div>
                <!--                                <div class="pull-left"> <span class="img-avatar img-avatar-48 bg-translucent"><i class="mdi mdi-arrow-down-bold fa-1-5x"></i></span> </div>-->
                <div class="pull-left"> <span class="img-avatar img-avatar-48 bg-translucent"><i class="mdi mdi-account-multiple-plus fa-1-5x"></i></span> </div>
              </div>
            </div>
          </div>

          <div class="col-sm-6 col-lg-3">
            <div class="card bg-purple">
              <div class="card-body clearfix">
                <div class="pull-right">
                  <p class="h6 text-white m-t-0">异常行为合计次数</p>
                  <p class="h3 text-white m-b-0" id="total_action"></p>
                </div>
                <!--                                <div class="pull-left"> <span class="img-avatar img-avatar-48 bg-translucent"><i class="mdi mdi-comment-outline fa-1-5x"></i></span> </div>-->
                <div class="pull-left"> <span class="img-avatar img-avatar-48 bg-translucent"><i class="mdi mdi-tooltip-text fa-1-5x"></i></span> </div>
              </div>
            </div>
          </div>
        </div>

        <div class="row">

          <div class="col-lg-6">
            <div class="card">
              <div class="card-header">
                <h4>异常行为饼状图</h4>
              </div>
              <div class="card-body">
                <div id="chart1" class="chart_block"></div>
              </div>
            </div>
          </div>

          <div class="col-lg-6">
            <div class="card">
              <div class="card-header">
                <h4>异常行为雷达图</h4>
              </div>
              <div class="card-body">
                <div id="chart2" class="chart_block"></div>
              </div>
            </div>
          </div>

        </div>

        <div class="row">

          <div class="col-lg-6">
            <div class="card">
              <div class="card-header">
                <h4>异常行为柱状图</h4>
              </div>
              <div class="card-body">
                <div id="chart3" class="chart_block"></div>
              </div>
            </div>
          </div>

          <div class="col-lg-6">
            <div class="card">
              <div class="card-header">
                <h4>考生答题得分情况</h4>
              </div>
              <div class="card-body">
                <div id="chart4" class="chart_block"></div>
              </div>
            </div>
          </div>

        </div>
      </div>

    </main>
    <!--End 页面主要内容-->
  </div>
</div>


<script src="${pageContext.request.contextPath}/resources/stats/js/echarts.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/stats/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/stats/js/bootstrap.min.js"></script>

<!--图表插件-->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/stats/js/Chart.js"></script>
<script type="text/javascript">

  $(document).ready(function(e) {
    var piantou=Math.floor(Math.random()*10);
    var wuren=Math.floor(Math.random()*10);
    var duoren=Math.floor(Math.random()*10);

    $("#piantou").text(piantou);
    $("#wuren").text(wuren);
    $("#duoren").text(duoren);
    $("#total_action").text(
            piantou+wuren+duoren
    );



    var chartDom = document.getElementById('chart1');
    var myChart1 = echarts.init(chartDom);
    var option;

    option = {
      title: [
        {
          text: '异常行为饼状图'
        }
      ],
      tooltip: {
        trigger: 'item'
      },
      legend: {
        top: '5%',
        left: 'center'
      },
      series: [
        {
          name: 'Access From',
          type: 'pie',
          radius: ['40%', '70%'],
          avoidLabelOverlap: false,
          itemStyle: {
            borderRadius: 10,
            borderColor: '#fff',
            borderWidth: 2
          },
          label: {
            show: false,
            position: 'center'
          },
          emphasis: {
            label: {
              show: true,
              fontSize: '40',
              fontWeight: 'bold'
            }
          },
          labelLine: {
            show: false
          },
          data: [
            { value: piantou, name: '转头' },
            { value: wuren, name: '镜头内无人' },
            { value: duoren, name: '镜头内多人' },
          ]
        }
      ]
    };

    myChart1.setOption(option);



    var chartDom = document.getElementById('chart2');
    var myChart2 = echarts.init(chartDom);
    var option;

    option = {
      tooltip: {
        trigger: 'item'
      },
      title: {
        text: '异常行为雷达图'
      },

      radar: {
        // shape: 'circle',
        indicator: [
          { name: '转头', max: 12 },
          { name: '镜头内无人', max: 12 },
          { name: '镜头内多人', max: 12 },
        ]
      },
      series: [
        {
          name: 'Budget vs spending',
          type: 'radar',
          data: [
            {
              value: [piantou, wuren, duoren],
              name: 'Allocated Budget'
            },
          ]
        }
      ]
    };
    myChart2.setOption(option);


    var chartDom = document.getElementById('chart3');
    var myChart3 = echarts.init(chartDom);
    var option;

    option = {
      title: [
        {
          text: '异常行为柱状图'
        }
      ],
      tooltip: {
        trigger: 'item'
      },
      xAxis: {
        type: 'category',
        data: ['转头', '镜头内无人', '镜头内多人']
      },
      yAxis: {
        type: 'value'
      },
      series: [
        {
          data: [piantou, wuren, duoren],
          type: 'bar',
          showBackground: true,
          backgroundStyle: {
            color: 'rgba(180, 180, 180, 0.2)'
          }
        }
      ]
    };

    myChart3.setOption(option);



    var chartDom = document.getElementById('chart4');
    var myChart4 = echarts.init(chartDom);
    var option;
    option = {
      title: [
        {
          text: '考生各项得分情况'
        }
      ],
      angleAxis: {},
      radiusAxis: {
        type: 'category',
        data: ['客观题', '主观题','总分'],
        z: 10
      },

      color: ["#4aa766"],
      polar: {},
      series: [
        {
          type: 'bar',
          data: [${detail.score}, ${detail.subScore}, ${detail.finalScore}],
          coordinateSystem: 'polar',
          name: 'A',
          stack: 'a',
          emphasis: {
            focus: 'series'
          }
        },
      ],
    };


    myChart4.setOption(option);

    window.onresize = function(){
      myChart1.resize();
      myChart2.resize();
      myChart3.resize();
      myChart4.resize();
    }
  });


</script>


