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
                    <input class="easyui-textbox" name="identity"
                           data-options="prompt:'请输入客户ID',label:'身份证号:',labelAlign:'right',labelPosition:'left'"
                           style="width:80%;">
                </td>
                <td style="width:30%">
                    <input class="easyui-textbox" name="custname"
                           data-options="prompt:'请输入客户姓名',label:'客户姓名:',labelAlign:'right',labelPosition:'left'"
                           style="width:80%;">
                </td>
                <td style="width:30%">
                    <input class="easyui-textbox" name="address"
                           data-options="prompt:'请输入客户地址',label:'客户地址:',labelAlign:'right',labelPosition:'left'"
                           style="width:80%;">
                </td>
            </tr>
            <tr>
                <td style="width:30%">
                    <input class="easyui-numberbox" name="phone"
                           data-options="prompt:'请输入客户号码',label:'客户号码:',labelAlign:'right',labelPosition:'left'"
                           style="width:80%;">
                </td>
                <td style="width:30%">
                    <input class="easyui-textbox" name="career"
                           data-options="prompt:'请输入客户职位',label:'客户职位:',labelAlign:'right',labelPosition:'left'"
                           style="width:80%;">
                </td>
                <td style="width:30%">
                    <label class="textbox-label" style="text-align: right;">性别:</label>
                    <input class="easyui-radiobutton" name="sex" value="1">男 <span
                        style="display:inline-block;width: 10px"></span>
                    <input class="easyui-radiobutton" name="sex" value="0">女
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
<div class="easyui-dialog" id="dlg" data-options="title:'添加客户',iconCls:'icon-save',width:'850px',height:'440px'
,closed:true,closable:true,collapsible:true,minimizable:true,maximizable:true,border:true,
modal:true,draggable:true,
buttons:'#bb'">
    <div class="easyui-panel" border="false" style="width:100%;padding:30px 60px;">
        <form method="post" id="dataFrm">

            <div style="margin-bottom:20px">
                <input class="easyui-textbox" id="identity" name="identity"
                       data-options="prompt:'请输入身份证号',label:'身份证号:',labelAlign:'right',labelPosition:'left',required:true"
                       style="width:100%;">
            </div>

            <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="custname"
                       data-options="prompt:'请输入客户姓名',label:'客户姓名:',labelAlign:'right',labelPosition:'left',required:true"
                       style="width:100%;">
            </div>

            <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="address"
                       data-options="prompt:'请输入客户住址',label:'客户住址:',labelAlign:'right',labelPosition:'left',required:true"
                       style="width:100%;">
            </div>

            <div style="margin-bottom:20px">
                <input class="easyui-numberbox" name="phone"
                       data-options="label:'手机号码:',labelPosition:'left',labelAlign:'right'" style="width:100%;">
            </div>

            <div style="margin-bottom:20px">
                <label class="textbox-label" style="text-align: right;">客户性别:</label>
                <input class="easyui-radiobutton" name="sex" value="1">男 <span
                    style="display:inline-block;width: 10px"></span>
                <input class="easyui-radiobutton" name="sex" value="0">女
            </div>
            <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="career"
                       data-options="prompt:'请输入客户职位',label:'客户职位:',labelAlign:'right',labelPosition:'left',required:true"
                       style="width:100%;">
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
    <a href="javascript:void(0)" id="addCustomer" class="easyui-linkbutton"
       data-options="iconCls:'icon-add',plain:true">添加
    </a>
    <a href="javascript:void(0)" id="updateCustomer" class="easyui-linkbutton"
       data-options="iconCls:'icon-edit',plain:true">修改
    </a>
    <a href="javascript:void(0)" id="deleteCustomer" class="easyui-linkbutton"
       data-options="iconCls:'icon-remove',plain:true">删除
    </a>
    <a href="javascript:void(0)" id="exportCustomer" class="easyui-linkbutton"
       data-options="iconCls:'icon-remove',plain:true">导出数据
    </a>
</div>

<script type="text/javascript">

    //初始化数据表格
    $("#dg").datagrid({
        width: '98%',
        height: 350,
        title: '客户列表',
        rownumbers: true,
        singleSelect: true,
        url: '${ctx}/customer/loadAllCustomer.action',
        fitColumns: true,
        emptyMsg: '<font color=red>查无数据</font>',
        pagination: true,
        pagePosition: 'bottom',
        toolbar: '#tb',
        columns: [[
            {field: 'identity', title: '身份证号', width: 100, align: 'center'},
            {field: 'custname', title: '客户姓名', width: 100, align: 'center'},
            {field: 'address', title: '客户地址', width: 100, align: 'center'},
            {field: 'phone', title: '客户电话', width: 100, align: 'center'},
            {
                field: 'sex', title: '性别', width: 100, align: 'center', formatter: function (value) {
                    return value == 1 ? '男' : '女';
                }
            },
            {field: 'career', title: '客户职位', width: 100, align: 'center'}
        ]]
    });
    var url = "";
    // 模糊查询
    $("#doSearch").click(function () {
        var serialize = $("#searchFrm").serialize();
        $("#dg").datagrid({
            url: "${ctx}/customer/loadAllCustomer.action?" + serialize
        })
    });
    //添加客户
    $("#addCustomer").click(function () {
        $("#dlg").dialog("open").dialog("setTitle", "添加客户");
        $("#dataFrm").form("clear");
        //让女默认选中
        $("#dataFrm").form('load', {sex: 0});
        $("#identity").textbox("readonly", false);
        url = "${ctx}/customer/addCustomer.action";
    });
    //修改客户
    $("#updateCustomer").click(function () {
        // 调用getSelect方法获取到选中行在判断
        var row = $("#dg").datagrid('getSelected');
        if (row) {
            $("#dlg").dialog("open").dialog('setTitle', '修改客户');
            $("#dataFrm").form("clear");
            $("#dataFrm").form("load", row);
            $("#identity").textbox("readonly", true);
            url = "${ctx}/customer/updateCustomer.action"
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
            url: url,
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

    //删除客户
    $("#deleteCustomer").click(function () {
        var row = $("#dg").datagrid("getSelected");
        if (row) {
            $.messager.confirm('删除', '你确定要删除' + row.custname + '这个登陆日志吗?', function (r) {
                if (r) {
                    $.post("${ctx}/customer/deleteCustomer.action", {identity: row.identity}, function (obj) {
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

    $("#exportCustomer").click(function () {
        var serialize = $("#searchFrm").serialize();
        window.location.href="${ctx}/customer/exportCustomerBySearch.action?"+serialize
    })

</script>
</body>
</html>
