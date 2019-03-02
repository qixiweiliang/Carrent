<%--
  Created by IntelliJ IDEA.
  User: 气息微凉
  Date: 2019/1/16
  Time: 13:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>日志管理</title>
    <link rel="stylesheet" type="text/css" href="${ctx }/resources/easyui/themes/metro/easyui.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx }/resources/css/wu.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx }/resources/css/icon.css"/>
    <script type="text/javascript" src="${ctx }/resources/js/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="${ctx }/resources/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${ctx }/resources/easyui/locale/easyui-lang-zh_CN.js"></script>
</head>
<body>
<!-- 查询条件开始 -->
<div class="easyui-panel" data-options="title:'查询条件',iconCls:'icon-search',width:'100%'">
    <form action="" id="searchFrm">
        <table width="100%" cellpadding="10" cellspacing="10">
            <tr>
                <td style="width:33%">
                    <input class="easyui-textbox" name="loginname"
                           data-options="prompt:'请输入登录名',label:'登录名称:',labelAlign:'right',labelPosition:'left'"
                           style="width:100%;">
                </td>
                <td style="width:33%">
                    <input class="easyui-textbox" name="loginip"
                           data-options="prompt:'请输入用户名',label:'登录IP:',labelAlign:'right',labelPosition:'left'"
                           style="width:100%;">
                </td>

            </tr>
            <tr>
                <td style="width:33%">
                    <input class="easyui-datetimebox" name="startTime"
                           data-options="prompt:'请输入开始时间',label:'开始时间:',labelAlign:'right',labelPosition:'left'"
                           style="width:100%;">
                </td>
                <td style="width:33%">
                    <input class="easyui-datetimebox" name="endTime"
                           data-options="prompt:'请输入结束时间',label:'结束时间:',labelAlign:'right',labelPosition:'left'"
                           style="width:100%;">
                </td>

            </tr>
            <tr>
                <td align="center" colspan="3">
                    <a href="javascript:void(0)" class="easyui-linkbutton" id="doSearch"
                       data-options="iconCls:'icon-search'" style="width:80px">查询</a>
                    <a href="javascript:void(0)" onclick="javascript:$('#searchFrm').form('reset')"
                       class="easyui-linkbutton" data-options="iconCls:'icon-reload'" style="width:80px">重置</a>
                </td>
            </tr>
        </table>
    </form>
</div>
<!-- 查询条件jiehsu -->

<table id="dg" ></table><%--class="easyui-datagrid"--%>
<div id="tb">
    <a href="javascript:void(0)" id="deleteLoginInfo" class="easyui-linkbutton"
       data-options="iconCls:'icon-remove',plain:true">删除</a>
</div>

<script type="text/javascript">

    //初始化数据表格
    $("#dg").datagrid({
        width: '100%',
        height: 400,
        title: '数据列表',
        rownumbers: true,
        singleSelect: true,
        url: '${ctx}/loginInfo/loadAllLoginInfo.action',
        fitColumns: true,
        emptyMsg: '<font color=red>查无数据</font>',
        pagination: true,
        pagePosition: 'bottom',
        toolbar: '#tb',
        columns: [[
            {field: 'id', title: '编号', width: 100, align: 'center'},
            {field: 'loginname', title: '登录名称', width: 100, align: 'center'},
            {field: 'loginip', title: '登录IP', width: 100, align: 'center'},
            {field: 'logintime', title: '登陆时间', width: 100, align: 'center'}
        ]]
    });
    $("#doSearch").click(function () {
        var serialize = $("#searchFrm").serialize();
        $("#dg").datagrid({
            url: "${ctx}/loginInfo/loadAllLoginInfo.action?" + serialize
        })
    });

    //删除用户
    $("#deleteLoginInfo").click(function () {
        var row = $("#dg").datagrid("getSelected");
        if (row) {
            $.messager.confirm('删除', '你确定要删除' + row.loginname + '这个登陆日志吗?', function (r) {
                if (r) {
                    $.post("${ctx}/logInfo/deleteLogInfo.action", {id: row.id}, function (obj) {
                        //刷新表格
                        $("#dg").datagrid("reload");
                        $.messager.show({
                            title: '提示',
                            msg: obj.mssage
                        });
                    });
                }
            })
        } else {
            $.messager.show({
                title: '提示',
                msg: '请选中操作行'
            });

        }


    })

</script>
</body>
</html>
