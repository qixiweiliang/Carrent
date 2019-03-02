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
                    <input class="easyui-textbox" name="rentid"
                           data-options="prompt:'请输入租车订单编号',label:'订单编号:',labelAlign:'right',labelPosition:'left'"
                           style="width:80%;">
                </td>
                <td style="width:30%">
                    <input class="easyui-textbox" name="carnumber"
                           data-options="prompt:'请输入车牌号',label:'车牌号:',labelAlign:'right',labelPosition:'left'"
                           style="width:80%;">
                </td>
                <td style="width:30%">
                    <input class="easyui-textbox" name="identity"
                           data-options="prompt:'请输入身份证号',label:'身份证号:',labelAlign:'right',labelPosition:'left'"
                           style="width:80%;">
                </td>
            </tr>
            <tr>
                <td style="width:30%">
                    <input class="easyui-datetimebox" name="begindate"
                           data-options="prompt:'请输入开始时间',label:'开始时间:',labelAlign:'right',labelPosition:'left'"
                           style="width:80%;">
                </td>
                <td style="width:30%">
                    <input class="easyui-datetimebox" name="returndate"
                           data-options="prompt:'请输入归还时间',label:'归还时间:',labelAlign:'right',labelPosition:'left'"
                           style="width:80%;">
                </td>

                <td style="width:30%">
                    <label class="textbox-label" style="text-align: right;">订单状态:</label>
                    <input class="easyui-radiobutton" name="rentflag" value="1">已归还<span
                        style="display:inline-block;width: 10px"></span>
                    <input class="easyui-radiobutton" name="rentflag" value="0">未归还
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
                <input class="easyui-textbox" id="rentid" name="rentid"
                       data-options="label:'出租单号:',labelAlign:'right',labelPosition:'left',required:true"
                       style="width:100%;">
            </div>

            <div style="margin-bottom:20px">
                <input class="easyui-numberbox" name="price"
                       data-options="prompt:'请输入出租价格',label:'出租价格:',labelAlign:'right',labelPosition:'left',required:true"
                       style="width:100%;">
            </div>

            <div style="margin-bottom:20px">
                <input class="easyui-datetimebox" name="begindate"
                       data-options="prompt:'请输入开始时间',label:'开始时间:',labelAlign:'right',labelPosition:'left',required:true"
                       style="width:100%;">
            </div>

            <div style="margin-bottom:20px">
                <input class="easyui-datetimebox" name="returndate"
                       data-options="label:'归还时间:',labelPosition:'left',labelAlign:'right'" style="width:100%;">
            </div>

            <div style="margin-bottom:20px">
                <input class="easyui-textbox" id="identity" name="identity"
                       data-options="label:'客户身份证号:',labelPosition:'left',labelAlign:'right'" style="width:100%;">
            </div>
            <div style="margin-bottom:20px">
                <input class="easyui-textbox" id="carnumber" name="carnumber"
                       data-options="label:'车牌号:',labelPosition:'left',labelAlign:'right'" style="width:100%;">
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


<table id="dg"></table>
<%-- class="easyui-datagrid"--%>
<div id="tb">

    <a href="javascript:void(0)" id="updateRent" class="easyui-linkbutton"
       data-options="iconCls:'icon-edit',plain:true">修改出租单</a>
    <a href="javascript:void(0)" id="deleteRent" class="easyui-linkbutton"
       data-options="iconCls:'icon-remove',plain:true">删除出租单</a>
    <a href="javascript:void(0)" id="exportRent" class="easyui-linkbutton"
       data-options="iconCls:'icon-page-excel',plain:true">导出出租单
    </a>
</div>

<script type="text/javascript">

    //初始化数据表格
    $("#dg").datagrid({
        width: '98%',
        height: 350,
        title: '租车订单列表',
        rownumbers: true,
        singleSelect: true,
        url: '${ctx}/rent/loadAllRent.action',
        fitColumns: true,
        emptyMsg: '<font color=red>查无数据</font>',
        pagination: true,
        pagePosition: 'bottom',
        toolbar: '#tb',
        columns: [[
            {field: 'rentid', title: '租车编号', width: 100, align: 'center'},
            {field: 'identity', title: '身份证号', width: 100, align: 'center'},
            {field: 'price', title: '租车金额', width: 100, align: 'center'},
            {field: 'carnumber', title: '车牌号', width: 100, align: 'center'},
            {field: 'begindate', title: '开始时间', width: 100, align: 'center'},
            {field: 'returndate', title: '归还时间', width: 100, align: 'center'},
            {
                field: 'rentflag', title: '订单状态', width: 100, align: 'center', formatter: function (value) {
                    return value == 1 ? '<font color="red">已归还</font>' : '<font color="green">未归还</font>';
                }
            },
            {field: 'opername', title: '操作人员', width: 100, align: 'center'}
        ]]
    });
    // 模糊查询
    $("#doSearch").click(function () {
        var serialize = $("#searchFrm").serialize();
        $("#dg").datagrid({
            url: "${ctx}/rent/loadAllRent.action?" + serialize
        })
    });

    //修改租车订单
    $("#updateRent").click(function () {
        // 调用getSelect方法获取到选中行在判断
        var row = $("#dg").datagrid('getSelected');
        if (row) {
            $("#dlg").dialog("open").dialog('setTitle', '修改租车订单');
            $("#dataFrm").form("clear");
            $("#dataFrm").form("load", row);
            $("#rentid").textbox("readonly", true);
            $("#carnumber").textbox("readonly", true);
            $("#identity").textbox("readonly", true);
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
            url: "${ctx}/rent/updateRents.action",
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

    //删除租车订单
    $("#deleteRent").click(function () {
        var row = $("#dg").datagrid("getSelected");
        if (row) {
            $.messager.confirm('订单提醒', '当前要删除【' + row.rentid + '】这个出租状态为未归还，如果删除车辆状态会发生变化?', function (r1) {
                if (r1) {
                    $.messager.confirm('删除', '你确定要删除' + row.rentid + '这条订单吗?', function (r2) {
                        if (r2) {
                            $.post("${ctx}/rent/deleteRents.action", {
                                rentid: row.rentid, /*根据订单ID删除*/
                                carnumber: row.carnumber/*同时修改车辆状态*/
                            }, function (obj) {
                                //刷新表格
                                $("#dg").datagrid("reload");
                                $.messager.show({
                                    title: '提示',
                                    msg: obj.mssage
                                });
                            });
                        }
                    })
                }
            });
        } else {
            $.messager.show({
                title: '提示',
                msg: '请选中操作行'
            });
        }
    });

    $("#exportRent").click(function () {
        var row = $("#dg").datagrid("getSelected");
        if (row) {
            window.location.href="${ctx}/rent/exportRentBySearch.action?rentid="+row.rentid;
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
