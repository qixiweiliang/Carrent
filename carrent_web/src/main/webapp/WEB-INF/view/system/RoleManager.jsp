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
    <link rel="stylesheet" href="${ctx }/resources/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <link rel="stylesheet" type="text/css" href="${ctx }/resources/easyui/themes/metro/easyui.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx }/resources/css/wu.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx }/resources/css/icon.css"/>
    <script type="text/javascript" src="${ctx }/resources/js/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="${ctx }/resources/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${ctx }/resources/easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="${ctx }/resources/zTree/js/jquery.ztree.core.js"></script>
    <script type="text/javascript" src="${ctx }/resources/zTree/js/jquery.ztree.excheck.js"></script>
</head>
<body>
<!-- 查询条件开始 -->
<div class="easyui-panel" data-options="title:'查询条件',iconCls:'icon-search',width:'100%'">
    <form action="" id="searchFrm">
        <table width="100%" cellpadding="10" cellspacing="10">
            <tr>
                <td style="width:33%">
                    <input class="easyui-textbox" name="rolename"
                           data-options="prompt:'请输入角色名称',label:'角色名称:',labelAlign:'right',labelPosition:'left'"
                           style="width:85%;">
                </td>
                <td style="width:33%">
                    <input class="easyui-textbox" name="roledesc"
                           data-options="prompt:'请输入角色描述',label:'角色描述:',labelAlign:'right',labelPosition:'left'"
                           style="width:85%;">
                </td>
                <td style="width:33%">
                    <label class="textbox-label" style="text-align: right;">是否可用:</label>
                    <input class="easyui-radiobutton" name="available" value="1">是 <span
                        style="display:inline-block;width: 10px"></span>
                    <input class="easyui-radiobutton" name="available" value="0">否
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
<!-- 查询条件结束 -->


<%--dialog弹窗添加修改弹窗开始--%>
<div class="easyui-dialog" id="dlg" data-options="title:'添加角色',iconCls:'icon-save',width:'850px',height:'440px'
,closed:true,closable:true,collapsible:true,minimizable:true,maximizable:true,border:true,
modal:true,draggable:true,
buttons:'#bb'">
    <div class="easyui-panel" border="false" style="width:100%;padding:30px 60px;">
        <form method="post" id="dataFrm">
            <%--根据id修改--%>
            <input type="hidden" name="roleid">
            <div style="margin-bottom:20px">
                <input class="easyui-textbox" id="rolename" name="rolename"
                       data-options="prompt:'请输入角色标题',label:'角色标题:',labelAlign:'right',labelPosition:'left',required:true"
                       style="width:100%;">
            </div>

            <div style="margin-bottom:20px">
                <input class="easyui-textbox" id="roledesc" name="roledesc"
                       data-options="prompt:'请输入角色标题',label:'角色标题:',labelAlign:'right',labelPosition:'left',required:true"
                       style="width:100%;">
            </div>
            <div style="margin-bottom:20px">
                <label class="textbox-label" style="text-align: right;">是否可用:</label>
                <input class="easyui-radiobutton" name="available" value="1">是 <span
                    style="display:inline-block;width: 10px"></span>
                <input class="easyui-radiobutton" name="available" value="0">否
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
<%--dialog弹窗添加修改弹窗结束--%>

<%--dialog弹窗分配角色开始--%>
<div class="easyui-dialog" id="treeRelo" data-options="title:'添加角色',iconCls:'icon-save',width:'850px',height:'440px'
,closed:true,closable:true,collapsible:true,minimizable:true,maximizable:true,border:true,
modal:true,draggable:true,
buttons:'#reloBtn'">
    <%--弹出层的树--%>
    <div id="treeMenu" class="ztree"></div>
</div>
<div id="reloBtn" style="text-align: center;">
    <a href="javascript:void(0)" class="easyui-linkbutton" id="chooseSubmit" data-options="iconCls:'icon-save'"
       style="width:100px">确认分配</a>
    <a href="javascript:void(0)" onclick="javascript:$('#treeRelo').dialog('close')" class="easyui-linkbutton"
       data-options="iconCls:'icon-cancel'" style="width:100px">取消</a>
</div>
<%--dialog弹窗分配角色开始--%>


<%--EasyUi对齐渲染的表格 开始--%>
<table id="dg"></table>
<%--EasyUi对齐渲染的表格 结束--%>

<%--标题栏  toolbar 添加 修改 删除 开始--%>
<div id="tb">
    <a href="javascript:void(0)" id="addRole" class="easyui-linkbutton"
       data-options="iconCls:'icon-add',plain:true">添加角色
    </a>
    <a href="javascript:void(0)" id="updateRole" class="easyui-linkbutton"
       data-options="iconCls:'icon-edit',plain:true">修改角色
    </a>
    <a href="javascript:void(0)" id="deleteRole" class="easyui-linkbutton"
       data-options="iconCls:'icon-remove',plain:true">删除角色
    </a>
    <a href="javascript:void(0)" id="chooseRole" class="easyui-linkbutton"
       data-options="iconCls:'icon-remove',plain:true">分配菜单
    </a>
</div>
<%--标题栏  toolbar 添加 修改 删除 结束--%>

<script type="text/javascript">

    // 初始化zTree开始
    var setting = {
        data: {
            simpleData: {
                enable: true
            }
        },
        check: {
            enable: true
        }
    };

    function initTree(rid) {
        $.post("${ctx}/role/loadRoleMenuTreeJson.action?roleid=" + rid, function (zNodes) {
            $.fn.zTree.init($("#treeMenu"), setting, zNodes);
        });
    }


    // 初始化zTree结束

    //初始化数据表格 开始
    $("#dg").datagrid({
        width: '100%',
        height: 350,
        title: '角色列表',
        singleSelect: true,
        url: '${ctx}/role/loadAllRole.action',
        fitColumns: true,
        emptyMsg: '<font color=red>查无数据</font>',
        pagination: true,
        pagePosition: 'bottom',
        toolbar: '#tb',
        columns: [[
            {field: 'roleid', title: '角色编号', width: 100, height: 200, align: 'center'},
            {field: 'rolename', title: '角色名称', width: 100, height: 'auto', align: 'center'},
            {field: 'roledesc', title: '角色描述', width: 100, height: 'auto', align: 'center'},
            {
                field: 'available', title: '是否可用', width: 100, align: 'center', formatter: function (value) {
                    return value == 1 ? "<font color='green'>可用</font>" : "<font color='red'>不可用</font>"
                }
            }
        ]]
    });
    //初始化数据表格 结束
    var url = "";
    // 模糊查询 开始
    $("#doSearch").click(function () {
        var serialize = $("#searchFrm").serialize();
        $("#dg").datagrid({
            url: "${ctx}/role/loadAllRole.action?" + serialize
        })
    });
    // 模糊查询 结束

    //添加角色
    $("#addRole").click(function () {
        $("#dlg").dialog("open").dialog("setTitle", "添加角色");
        $("#dataFrm").form("clear");
        $("#dataFrm").form("load", {available: 1});
        url = "${ctx}/role/addRole.action"
    });

    //修改角色
    $("#updateRole").click(function () {
        // 调用getSelect方法获取到选中行在判断
        var row = $("#dg").datagrid('getSelected');
        if (row) {
            $("#dlg").dialog("open").dialog('setTitle', '修改角色');
            $("#dataFrm").form("clear");
            $("#dataFrm").form("load", row);
            url = "${ctx}/role/updateRole.action";
        } else {
            /*easyui 优化后的消息*/
            $.messager.show({
                title: '提示',
                msg: '请选中操作行'
            });
        }
    });

    //确认添加 保存 开始
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
    //确认添加 结束


    //删除角色
    $("#deleteRole").click(function () {
        var row = $("#dg").datagrid("getSelected");
        if (row) {
            $.messager.confirm('删除', '你确定要删除' + row.title + '这个角色吗?', function (r) {
                if (r) {
                    $.post("${ctx}/role/deleteRole.action", {roleid: row.roleid}, function (obj) {
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


    /*打开分配菜单弹出层*/
    $("#chooseRole").click(function () {
        // 调用getSelect方法获取到选中行在判断
        var row = $("#dg").datagrid('getSelected');
        if (row) {
            // 初始化树结构
            $("#treeRelo").dialog("open").dialog('setTitle', "分配【" + row.rolename + "】菜单");
            initTree(row.roleid);
        } else {
            /*easyui 优化后的消息*/
            $.messager.show({
                title: '提示',
                msg: '请选中操作行'
            });
        }

    });

    $("#chooseSubmit").click(function () {
        /*获取到这个树结构*/
        var zTreeObj = $.fn.zTree.getZTreeObj("treeMenu");
        /*通过这个树结构 获取到选中元素 id*/
        var nodes = zTreeObj.getCheckedNodes(true);
        var row = $("#dg").datagrid('getSelected');
        var param = "roleid=" + row.roleid;
        for (var i = 0; i < nodes.length; i++) {
            param += "&ids=" + nodes[i].id;
        }
        $.post("${ctx}/role/savaChooseRoleMenu.action", param,
            function (obj) {
                $.messager.show({
                    title: '提示',
                    msg: obj.mssage
                });
            })
    });
</script>
</body>
</html>
