<%--
  Created by IntelliJ IDEA.
  User: 气息微凉
  Date: 2019/1/16
  Time: 16:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="${ctx }/resources/easyui/themes/metro/easyui.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx }/resources/css/wu.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx }/resources/css/icon.css"/>
    <script type="text/javascript" src="${ctx }/resources/js/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="${ctx }/resources/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${ctx }/resources/easyui/locale/easyui-lang-zh_CN.js"></script>
</head>
<body>
<!-- 查询条件开始 -->
<div class="easyui-panel" data-options="title:'查询条件',iconCls:'icon-search',width:'98%',height:'auto'">
    <form action="" id="searchFrm">
        <table width="100%" cellpadding="10" cellspacing="10">
            <tr>
                <td style="width:30%">
                    <input class="easyui-textbox" name="checkid"
                           data-options="prompt:'请输入检查单编号',label:'检查单编号:',labelAlign:'right',labelPosition:'left'"
                           style="width:80%;">
                </td>
                <td style="width:30%">
                    <input class="easyui-textbox" name="rentid"
                           data-options="prompt:'请输入租车单号',label:'租车单号:',labelAlign:'right',labelPosition:'left'"
                           style="width:80%;">
                </td>
                <td style="width:30%">
                    <input class="easyui-textbox" name="problem"
                           data-options="prompt:'请输入存在问题',label:'存在问题:',labelAlign:'right',labelPosition:'left'"
                           style="width:80%;">
                </td>
            </tr>
            <tr>
                <td style="width:30%">
                    <input class="easyui-datetimebox" name="startTime"
                           data-options="prompt:'请输入开始时间',label:'开始时间:',labelAlign:'right',labelPosition:'left'"
                           style="width:80%;">
                </td>
                <td style="width:30%">
                    <input class="easyui-datetimebox" name="endTime"
                           data-options="prompt:'请输入结束时间',label:'结束时间:',labelAlign:'right',labelPosition:'left'"
                           style="width:80%;">
                </td>

                <td style="width:30%">
                    <input class="easyui-textbox" name="checkdesc"
                           data-options="prompt:'请输入问题描述',label:'问题描述:',labelAlign:'right',labelPosition:'left'"
                           style="width:80%;">
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

<%--添加修改弹窗开始--%>
<div class="easyui-dialog" id="dlg" data-options="title:'添加租车订单',iconCls:'icon-save',width:'850px',height:'440px'
,closed:true,closable:true,collapsible:true,minimizable:true,maximizable:true,border:true,
modal:true,draggable:true,
buttons:'#bb'">
    <div class="easyui-panel" border="false" style="width:100%;padding:30px 60px;">
        <form method="post" id="dataFrm" style="position:relative">
            <div style="margin-bottom:20px">
                <input class="easyui-textbox" id="checkid" name="checkid"
                       data-options="label:'检查单号:',labelAlign:'right',labelPosition:'left',required:true"
                       style="width:100%;">
            </div>

            <div style="margin-bottom:20px">
                <input class="easyui-datetimebox" name="checkdate"
                       data-options="prompt:'请输入检查单号',label:'检查单号:',labelAlign:'right',labelPosition:'left',required:true"
                       style="width:100%;">
            </div>

            <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="checkdesc"
                       data-options="prompt:'请输入问题描述',label:'存在问题:',labelAlign:'right',labelPosition:'left',required:true"
                       style="width:100%;">
            </div>

            <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="problem"
                       data-options="label:'存在问题:',labelPosition:'left',labelAlign:'right'" style="width:100%;">
            </div>

            <div style="margin-bottom:20px">
                <input class="easyui-numberbox" id="paymoney" name="paymoney"
                       data-options="label:'赔付金额:',labelPosition:'left',labelAlign:'right'" style="width:100%;">
            </div>
            <div style="margin-bottom:20px">
                <input class="easyui-textbox" id="rentid" name="rentid"
                       data-options="label:'租车单号:',labelPosition:'left',labelAlign:'right'" style="width:100%;">
            </div>

            <div style="margin-bottom:20px">
                <input class="easyui-textbox" id="opername" name="opername"
                       data-options="label:'操作人员:',labelPosition:'left',labelAlign:'right'" style="width:100%;">
            </div>
        </form>
    </div>
</div>
<div id="bb" style="text-align: center;">
    <a href="javascript:void(0)" class="easyui-linkbutton" id="doSubmit" data-options="iconCls:'icon-save'"
       style="width:80px">保存</a>
    <a href="javascript:void(0)" onclick="javascript:$('#dlg').dialog('close')" class="easyui-linkbutton"
       data-options="iconCls:'icon-cancel'" style="width:80px">取消</a>
</div>
<%--添加修改弹窗结束--%>


<table id="dg"></table><%-- class="easyui-datagrid"--%>
<div id="tb">

    <a href="javascript:void(0)" id="updateCheck" class="easyui-linkbutton"
       data-options="iconCls:'icon-edit',plain:true">修改检查单</a>
    <a href="javascript:void(0)" id="exportCheck" class="easyui-linkbutton"
       data-options="iconCls:'icon-page-excel',plain:true">导出检查单
    </a>
</div>

<script type="text/javascript">

    //初始化数据表格
    $("#dg").datagrid({
        width: '98%',
        height: 400,
        title: '租车订单列表',
        rownumbers: true,
        singleSelect: true,
        url: '${ctx}/check/loadAllCheck.action',
        fitColumns: true,
        emptyMsg: '<font color=red>查无数据</font>',
        pagination: true,
        pagePosition: 'bottom',
        toolbar: '#tb',
        columns: [[
            {field: 'checkid', title: '检查单号', width: 100, align: 'center'},
            {field: 'checkdate', title: '检查日期', width: 100, align: 'center'},
            {field: 'problem', title: '存在问题', width: 100, align: 'center'},
            {field: 'checkdesc', title: '问题描述', width: 100, align: 'center'},
            {field: 'paymoney', title: '赔付金额', width: 100, align: 'center'},
            {field: 'rentid', title: '租车单号', width: 100, align: 'center'},
            {field: 'opername', title: '操作人员', width: 100, align: 'center'}
        ]]
    });
    // 模糊查询
    $("#doSearch").click(function () {
        var serialize = $("#searchFrm").serialize();
        $("#dg").datagrid({
            url: "${ctx}/check/loadAllCheck.action?" + serialize
        })
    });

    //修改租车订单
    $("#updateCheck").click(function () {
        // 调用getSelect方法获取到选中行在判断
        var row = $("#dg").datagrid('getSelected');
        if (row) {
            $("#dlg").dialog("open").dialog('setTitle', '修改租车订单');
            $("#dataFrm").form("clear");
            $("#dataFrm").form("load", row);
            $("#checkid").textbox("readonly", true);
            $("#rentid").textbox("readonly", true);
            $("#opername").textbox("readonly", true);
        } else {
            /*easyui 优化后的消息*/
            $.messager.show({
                title: '提示',
                msg: '请选中操作行'
            });
        }
    });
    //保存
    $('#doSubmit').click(function () {
        $("#dataFrm").form("submit", {
            url: "${ctx}/check/updateCheck.action",
            onSubmit: function () {
                return $(this).form('validate');//触发验证
            },
            success: function (result) {
                //刷新表格
                $("#dg").datagrid("reload");
                //关闭弹出层
                $("#dlg").dialog("close");
                $.messager.show({
                    title: '提示',
                    msg: JSON.parse(result)['mssage']
                });
            }
        });
    });

</script>
</body>
</html>
