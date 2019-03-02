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
                           data-options="prompt:'请输入用户ID',label:'身份证号:',labelAlign:'right',labelPosition:'left'"
                           style="width:80%;">
                </td>
                <td style="width:30%">
                    <input class="easyui-textbox" name="loginname"
                           data-options="prompt:'请输入用户登录名称',label:'登录名称:',labelAlign:'right',labelPosition:'left'"
                           style="width:80%;">
                </td>
                <td style="width:30%">
                    <input class="easyui-textbox" name="realname"
                           data-options="prompt:'请输入用户真实姓名',label:'真实姓名:',labelAlign:'right',labelPosition:'left'"
                           style="width:80%;">
                </td>
            </tr>
            <tr>
                <td style="width:30%">
                    <input class="easyui-textbox" name="address"
                           data-options="prompt:'请输入用户地址',label:'用户地址:',labelAlign:'right',labelPosition:'left'"
                           style="width:80%;">
                </td>
                <td style="width:30%">
                    <input class="easyui-textbox" name="phone"
                           data-options="prompt:'请输入用户号码',label:'用户号码:',labelAlign:'right',labelPosition:'left'"
                           style="width:80%;">
                </td>
                <td style="width:30%">
                    <input class="easyui-textbox" name="position"
                           data-options="prompt:'请输入用户职位',label:'用户职位:',labelAlign:'right',labelPosition:'left'"
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
<div class="easyui-dialog" id="dlg" data-options="title:'添加用户',iconCls:'icon-save',width:'850px',height:'440px'
,closed:true,closable:true,collapsible:true,minimizable:true,maximizable:true,border:true,
modal:true,draggable:true,
buttons:'#bb'">
    <div class="easyui-panel" border="false" style="width:100%;padding:30px 60px;">
        <form method="post" id="dataFrm">

            <div style="margin-bottom:20px">
                <input type="hidden" name="userid">
                <input class="easyui-textbox" id="realname" name="realname"
                       data-options="prompt:'请输入真实姓名',label:'真实姓名:',labelAlign:'right',labelPosition:'left',required:true"
                       style="width:100%;">
            </div>

            <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="loginname" id="loginname"
                       data-options="prompt:'请输入登录名',label:'登录名:',labelAlign:'right',labelPosition:'left',required:true"
                       style="width:100%;">
            </div>

            <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="identity"
                       data-options="prompt:'请输入用户身份证',label:'用户住址:',labelAlign:'right',labelPosition:'left',required:true"
                       style="width:100%;">
            </div>

            <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="address"
                       data-options="label:'地址:',labelPosition:'left',labelAlign:'right'" style="width:100%;">
            </div>
            <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="phone"
                       data-options="label:'手机号码:',labelPosition:'left',labelAlign:'right'" style="width:100%;">
            </div>
            <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="position"
                       data-options="label:'职位:',labelPosition:'left',labelAlign:'right'" style="width:100%;">
            </div>

            <div style="margin-bottom:20px">
                <label class="textbox-label" style="text-align: right;">用户性别:</label>
                <input class="easyui-radiobutton" name="sex" value="1">男 <span
                    style="display:inline-block;width: 10px"></span>
                <input class="easyui-radiobutton" name="sex" value="0">女
            </div>
            <div style="margin-bottom:20px">
                <label class="textbox-label" style="text-align: right;">是否可用:</label>
                <input class="easyui-radiobutton" name="available" value="1">可用 <span
                    style="display:inline-block;width: 10px"></span>
                <input class="easyui-radiobutton" name="available" value="0">不可用
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

<%--分配角色弹窗开始--%>
<div class="easyui-dialog" id="dlg-chooseRole" data-options="title:'添加用户',iconCls:'icon-save',width:'850px',height:'450'
,closed:true,closable:true,collapsible:true,minimizable:true,maximizable:true,border:true,
modal:true,draggable:true,
buttons:'#chooseRoleBtn'">
    <%--角色初始化表格--%>
    <table id="roleTable"></table>
</div>
<div id="chooseRoleBtn" style="text-align: center;">
    <a href="javascript:void(0)" class="easyui-linkbutton" id="dochooseRole" data-options="iconCls:'icon-save'"
       style="width:80px">保存</a>
    <a href="javascript:void(0)" onclick="javascript:$('#dlg-chooseRole').dialog('close')" class="easyui-linkbutton"
       data-options="iconCls:'icon-cancel'" style="width:80px">取消</a>
</div>
<%--分配角色弹窗结束--%>

<table id="dg"></table>
<%-- class="easyui-datagrid"--%>
<div id="tb">
    <a href="javascript:void(0)" id="addUser" class="easyui-linkbutton"
       data-options="iconCls:'icon-add',plain:true">添加
    </a>
    <a href="javascript:void(0)" id="updateUser" class="easyui-linkbutton"
       data-options="iconCls:'icon-edit',plain:true">修改
    </a>
    <a href="javascript:void(0)" id="deleteUser" class="easyui-linkbutton"
       data-options="iconCls:'icon-remove',plain:true">删除
    </a>
    <a href="javascript:void(0)" id="resertPwd" class="easyui-linkbutton"
       data-options="iconCls:'icon-remove',plain:true">重置密码
    </a>
    <a href="javascript:void(0)" id="chooseRole" class="easyui-linkbutton"
       data-options="iconCls:'icon-remove',plain:true">分配角色
    </a>
</div>

<script type="text/javascript">

    //初始化数据表格
    $("#dg").datagrid({
        width: '98%',
        height: 350,
        title: '用户列表',
        rownumbers: true,
        singleSelect: true,
        url: '${ctx}/user/loadAllUser.action',
        fitColumns: true,
        emptyMsg: '<font color=red>查无数据</font>',
        pagination: true,
        pagePosition: 'bottom',
        toolbar: '#tb',
        columns: [[
            {field: 'userid', title: '用户编号', width: 100, align: 'center'},
            {field: 'loginname', title: '登录名称', width: 100, align: 'center'},
            {field: 'identity', title: '身份证号', width: 100, align: 'center'},
            {field: 'realname', title: '真实名称', width: 100, align: 'center'},
            {
                field: 'sex', title: '性别', width: 100, align: 'center', formatter: function (value) {
                    return value == 1 ? "<font color='green'>男</font>" : "<font color='red'>女</font>";
                }
            },
            {field: 'address', title: '用户地址', width: 100, align: 'center'},
            {field: 'phone', title: '用户电话', width: 100, align: 'center'},
            {
                field: 'pwd', title: '登录密码', width: 100, align: 'center', formatter: function () {
                    return "******"
                }
            },
            {field: 'position', title: '用户职位', width: 100, align: 'center'},
            {
                field: 'available', title: '是否可用', width: 100, align: 'center', formatter: function (value) {
                    return value == 1 ? "<font color='green'>可用</font>" : "<font color='red'>不可用</font>"
                }
            }
        ]]
    });
    var url = "";
    // 模糊查询
    $("#doSearch").click(function () {
        var serialize = $("#searchFrm").serialize();
        $("#dg").datagrid({
            url: "${ctx}/user/loadAllUser.action?" + serialize
        })
    });
    //添加用户
    $("#addUser").click(function () {
        $("#dlg").dialog("open").dialog("setTitle", "添加用户");
        $("#dataFrm").form("clear");
        //让女默认选中
        $("#dataFrm").form('load', {sex: 0, available: 1});
        $("#identity").textbox("readonly", false);

        //将汉字转为拼音
        $("#realname").textbox('textbox').bind("blur", function (e) {
            var val = $(this).val();
            $.post("${ctx}/user/getPinyinName.action", {realname: val}, function (result) {
                console.log(result);
                $("#dataFrm").form('load', {loginname: result});
            })
        });

        url = "${ctx}/user/addUser.action";
    });
    //修改用户
    $("#updateUser").click(function () {
        // 调用getSelect方法获取到选中行在判断
        var row = $("#dg").datagrid('getSelected');
        if (row) {
            $("#dlg").dialog("open").dialog('setTitle', '修改用户');
            $("#dataFrm").form("clear");
            $("#dataFrm").form("load", row);
            $("#identity").textbox("readonly", true);
            url = "${ctx}/user/updateUser.action";
            //将汉字转为拼音
            $("#realname").textbox("textbox").bind("blur", function (e) {
                var val = $(this).val();
                $.post("${ctx}/user/getPinyinName.action", {realname: val}, function (result) {
                    $("#dataFrm").form('load', {loginname: result});
                })
            });


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

    //删除用户
    $("#deleteUser").click(function () {
        var row = $("#dg").datagrid("getSelected");
        if (row) {
            $.messager.confirm('删除', '你确定要删除' + row.realname + '这个用户吗?', function (r) {
                if (r) {
                    $.post("${ctx}/user/deleteUser.action", {userid: row.userid}, function (obj) {
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
    });

    /*重置密码*/
    $("#resertPwd").click(function () {
        var row = $("#dg").datagrid("getSelected");
        if (row) {
            $.messager.confirm('重置密码', '你确定要重置' + row.realname + '这个用户的密码吗?', function (r) {
                if (r) {
                    $.post("${ctx}/user/resertPwd.action", {userid: row.userid}, function (obj) {
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

    });

    /*初始化角色数据表格 开始*/

    function initroleTable(userid) {
        $("#roleTable").datagrid({
            width: '98%',
            height: 350,
            title: '用户列表',
            rownumbers: true,
            fitColumns: true,
            url: '${ctx}/user/loadAllByRoleUserid.action?userid='+userid, /*请求所有可用的并设置为checked*/
            columns: [[
                {field: 'ck',checkbox:true},
                {field: 'roleid', title: '用户编号', width: 100, align: 'center'},
                {field: 'rolename', title: '登录名称', width: 100, align: 'center'},
                {field: 'roledesc', title: '角色编号', width: 100, height: 200, align: 'center'}
            ]],
            onLoadSuccess:function (data) {
                $.each(data.rows,function (index, item) {
                    if(item.checked){
                        $("#roleTable").datagrid("checkRow",index);
                    }
                })
            }
        });
    }
    /*初始化角色数据表格 结束*/
    $("#chooseRole").click(function () {
        var row = $("#dg").datagrid("getSelected");
        if (row) {
            $("#dlg-chooseRole").dialog('open').dialog("setTitle","分配【"+row.realname+"】角色");
            console.log(row.userid)
            initroleTable(row.userid);
        } else {
            $.messager.show({
                title: '提示',
                msg: '请选中操作行'
            });
        }
    });
    /*分配角色权限提交*/
    $("#dochooseRole").click(function () {
        var row = $("#dg").datagrid("getSelected");
        var rows = $("#roleTable").datagrid("getSelections");
        var param="userid="+row.userid;
        for (var i =0;i<rows.length;i++){
            param+="&ids="+rows[i].roleid
        }
        console.log(param);
        $.post("${ctx}/user/saveUserRole.action",param,function (result) {
            $.messager.show({
                title: '提示',
                msg: result.mssage
            });
        })
    })
</script>
</body>
</html>
