<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>系统首页</title>
    <link rel="stylesheet" type="text/css" href="${ctx }/resources/easyui/themes/metro/easyui.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx }/resources/css/wu.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx }/resources/css/icon.css"/>
    <script type="text/javascript" src="${ctx }/resources/js/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="${ctx }/resources/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${ctx }/resources/easyui/datagrid-detailview.js"></script>
    <script type="text/javascript" src="${ctx }/resources/easyui/locale/easyui-lang-zh_CN.js"></script>

</head>

<body>
<div class="easyui-layout" style="width: 100%;height: 300px">
    <!-- 系统公告 开始-->
    <div class="easyui-panel" style="width: 70%"
         data-options="region:'center',iconCls:'icon-save',split:true,border:true,title:'系统公告'">

        <%--EasyUi对齐渲染的表格 开始--%>
        <table id="dg-table" class="easyui-datagrid"></table>
        <%--EasyUi对齐渲染的表格 结束--%>
    </div>
    <!-- 系统公告 结束-->

    <!-- 日历 开始-->
    <div class="easyui-panel" style="width: 30%"
         data-options="region:'east',iconCls:'icon-save',split:true,border:true,title:'系统公告'">
        <div class="easyui-calendar" data-options="border:false" style="width:100%;height:100%;"></div>
    </div>
    <!-- 日历 结束-->
</div>
<%--弹出层内容详情 开始--%>
<div class="easyui-dialog" id="dlg-detial"
     data-options="title:'新闻内容',iconCls:'icon-save',width:'850px',height:'440px'
,closed:true,closable:true,collapsible:true,minimizable:true,maximizable:true,border:true,
modal:true,draggable:true,
buttons:'#bb'">
    <form action="" method="post" id="dataForm">
        <div style="text-align: center">
            <h2>关系系统升级公告</h2>
        </div>
        <div>
            <hr style="width: 90%;text-align: center ">
        </div>
        <div style="text-align: right;padding-right: 40px">
            <label class="textbox-label" style="text-align: right;font-size: 14px">发布人:</label>
            <span id="opername" style="display: inline-block; "></span>
            <label class="textbox-label" style="text-align: right;font-size: 14px">发布时间:</label>
            <span id="createtime" style="display: inline-block;"></span>
        </div>
        <div>
            <hr style="width: 90%;text-align: center ">
        </div>
        <div>
            <span id="content" style="display: inline-block; padding-left: 35px"></span>
        </div>
    </form>
</div>
<div id="bb" style="text-align: center;">
    <a href="javascript:void(0)" onclick="javascript:$('#dlg-detial').dialog('close')" class="easyui-linkbutton"
       data-options="iconCls:'icon-cancel'" style="width:80px">关闭</a>
</div>
<%--弹出层内容详情 结束--%>


<script>
    //初始化数据表格 开始
    $("#dg-table").datagrid({
        width: "100%",
        height: 267,
        title: '系统公告',
        singleSelect: true,
        url: '${ctx}/news/loadAllNew.action', /* 查询出所有新闻*/
        fitColumns: true,
        emptyMsg: '<font color=red>查无数据</font>',
        pagination: true,
        pagePosition: 'bottom',
        columns: [[
            {field: 'id', title: '新闻编号', width: 100, height: 200, hidden: true, align: 'center'},
            {field: 'title', title: '新闻标题', width: 100, height: 'auto', align: 'center'},
            {field: 'content', title: '新闻内容', width: 100, height: 'auto', hidden: true, align: 'center'},
            {field: 'createtime', title: '发布时间', width: 100, height: 'auto', align: 'center'},
            {field: 'opername', title: '发布人姓名', width: 100, height: 'auto', align: 'center'}
        ]]

    });
    //初始化数据表格 结束
    //双击查看内容祥情 开始
    // $("#onDblClickRow")
    $("#dg-table").datagrid({
        onDblClickRow: function (rowIndex, rowData) {
            console.log("zhiqia" + rowData.content);
            if (rowData) {
                $("#dlg-detial").dialog("open").dialog('setTitle', '新闻内容');
                $("#opername").html(rowData.opername);
                $("#createtime").html(rowData.createtime);
                $("#content").html(rowData.content);
            } else {
                /*easyui 优化后的消息*/
                $.messager.show({
                    title: '提示',
                    msg: '请选中操作行'
                });
            }
        }
    })
    //双击查看内容祥情 结束
</script>
</body>
</html>
