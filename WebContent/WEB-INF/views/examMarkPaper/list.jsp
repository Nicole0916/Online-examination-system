<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../common/header.jsp" %>
<div class="easyui-layout" data-options="fit:true">
    <!-- Begin of toolbar -->
    <div id="wu-toolbar">
        <div class="wu-toolbar-button">
            <%@include file="../common/menus.jsp" %>
        </div>
        <div class="wu-toolbar-search">
            <label>所属考试:</label>
            <select id="search-exam" class="easyui-combobox" panelHeight="200px" style="width:120px">
                <option value="-1">全部</option>
                <c:forEach items="${examList}" var="exam">
                    <option value="${exam.id}">${exam.name}</option>
                </c:forEach>
            </select>
            <label>所属考生:</label>
            <select id="search-student" class="easyui-combobox" panelHeight="200px" style="width:120px">
                <option value="-1">全部</option>
                <c:forEach items="${studentList}" var="student">
                    <option value="${student.id}">${student.name}</option>
                </c:forEach>
            </select>
            <label>所属试题:</label>
            <select id="search-question" class="easyui-combobox" panelHeight="300px" style="width:120px">
                <option value="-1">全部</option>
                <c:forEach items="${questionList}" var="question">
                    <option value="${question.id}">${question.title}</option>
                </c:forEach>
            </select>
            <a href="#" id="search-btn" class="easyui-linkbutton" iconCls="icon-search">搜索</a>
        </div>
    </div>
    <!-- End of toolbar -->
    <table id="data-datagrid" class="easyui-datagrid" toolbar="#wu-toolbar"></table>
</div>
<!-- 修改窗口 -->
<div id="edit-dialog" class="easyui-dialog" data-options="closed:true,iconCls:'icon-save'"
     style="width:450px; padding:10px;">
    <form id="edit-form" method="post">
        <input type="hidden" name="id" id="edit-id">
        <table>
            <tr>
                <td align="right">得分:</td>
                <td><input type="text" id="edit-score" name="subScore" class="wu-text easyui-numberbox"
                           data-options="required:true,precision:0,missingMessage:'填空题满分2分，简答题满分10分。'"></td>
            </tr>
        </table>
    </form>
</div>

<%@include file="../common/footer.jsp" %>

<!-- End of easyui-dialog -->
<script type="text/javascript">


    //评分
    function edit() {
        var validate = $("#edit-form").form("validate");
        if (!validate) {
            $.messager.alert("消息提醒", "请检查你输入的数据!", "warning");
            return;
        }
        //var data = $("#edit-form").serialize();
        var item = $('#data-datagrid').datagrid('getSelected');
        var subScore = $("#edit-score").val();

        $.ajax({
            url: 'editScore',
            dataType: 'json',
            type: 'post',
            data: {"id": item.id, "subScore": subScore},
            success: function (data) {
                if (data.type == 'success') {
                    $.messager.alert('信息提示', '评分成功！', 'info');
                    $("#edit-score").val('');
                    $('#edit-dialog').dialog('close');
                    $('#data-datagrid').datagrid('reload');
                } else {
                    $.messager.alert('信息提示', data.msg, 'warning');
                }
            }
        });
    }

    //打开评分弹窗
    function openEdit() {
        //$('#add-form').form('clear');
        var item = $('#data-datagrid').datagrid('getSelected');
        if (item == null || item.length == 0) {
            $.messager.alert('信息提示', '请选择要编辑的数据！', 'info');
            return;
        }
        $('#edit-dialog').dialog({
            closed: false,
            modal: true,
            title: "评分框",
            buttons: [{
                text: '确定',
                iconCls: 'icon-ok',
                handler: edit
            }, {
                text: '取消',
                iconCls: 'icon-cancel',
                handler: function () {
                    $('#edit-dialog').dialog('close');
                }
            }],
            onBeforeOpen: function () {
                //$("#add-form input").val('');
                $("#edit-score").val(item.subScore);
            }
        });
    }


    //搜索按钮监听
    $("#search-btn").click(function () {
        var option = {};
        var examId = $("#search-exam").combobox('getValue');
        if (examId != -1) {
            option.examId = examId;
        }
        var studentId = $("#search-student").combobox('getValue');
        if (studentId != -1) {
            option.studentId = studentId;
        }
        var questionId = $("#search-question").combobox('getValue');
        if (questionId != -1) {
            option.questionId = questionId;
        }
        $('#data-datagrid').datagrid('reload', option);
    });


    /**
     * 载入数据
     */
    $('#data-datagrid').datagrid({
        //条纹
        striped:true,
        url: 'list',
        rownumbers: true,
        singleSelect: true,
        pageSize: 20,
        pagination: true,
        multiSort: true,
        fitColumns: true,
        idField: 'id',
        treeField: 'name',
        nowrap: false,
        fit: true,
        columns: [[
            {field: 'chk', checkbox: true},
            {
                field: 'examId', title: '所属考试', width: 180, formatter: function (value, index, row) {
                    var examList = $("#search-exam").combobox("getData");
                    console.log(examList);
                    console.log(value);
                    for (var i = 0; i < examList.length; i++) {
                        if (examList[i].value == value) return examList[i].text;
                    }
                    return value;
                }
            },
            {field: 'examPaperId', title: '试卷ID', width: 50},

            {
                field: 'studentId', title: '所属考生', width: 100, formatter: function (value, index, row) {
                    var studentList = $("#search-student").combobox("getData");
                    for (var i = 0; i < studentList.length; i++) {
                        if (studentList[i].value == value) return studentList[i].text;
                    }
                    return value;
                }
            },
            {
                field: 'questionId', title: '所属试题', width: 200, formatter: function (value, index, row) {
                    var questionList = $("#search-question").combobox("getData");
                    for (var i = 0; i < questionList.length; i++) {
                        if (questionList[i].value == value) return questionList[i].text;
                    }
                    return value;
                }
            },
            {field: 'answer', title: '提交答案', width: 200},
            {field: 'subScore', title: '得分', width: 50},


        ]]
    });
    window.onload = function () {
        $('.datagrid-cell').css('font-size', '15px');
        $('.datagrid-header .datagrid-cell span ').css('font-size', '18px');
        $('.panel-title ').css('font-size', '36px');

    }


</script>

<style type="text/css" rel="stylesheet">
    .datagrid-row {
        height: 42px;
        text-align: center;
    }

    .datagrid-cell {
        margin: 0;
        padding: 0 4px;
        white-space: nowrap;
        word-wrap: normal;
        overflow: hidden;
        height: 18px;
        line-height: 18px;
        font-weight: normal;
        font-size: 15px;
        font-family: KaiTi;
        text-align: center;
    }


    .datagrid-body td {
        border-bottom: 1px dotted transparent;
    }
</style>