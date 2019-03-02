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
    <link rel="stylesheet" href="${ctx }/resources/zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <link rel="stylesheet" type="text/css" href="${ctx }/resources/easyui/themes/metro/easyui.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx }/resources/css/wu.css"/>
    <link rel="stylesheet" type="text/css" href="${ctx }/resources/css/icon.css"/>
    <script type="text/javascript" src="${ctx }/resources/js/jquery-1.8.0.min.js"></script>
    <script type="text/javascript" src="${ctx }/resources/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${ctx }/resources/easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="${ctx }/resources/zTree/js/jquery.ztree.core.js"></script>
</head>
<body class="easyui-layout">
<div class="easyui-panel" data-options="region:'west',split:true,title:'菜单树',iconCls:'icon-node-tree32',width:'25%'">
    <div id="treeMenu" class="ztree"></div>
</div>
<div class="easyui-panel" data-options="region:'center',split:true,title:'菜单列表',iconCls:'icon-save',width:'75%'">
    <div>
        <table id="treeTable"></table>
    </div>
    <div id="but">
        <a href="javascript:void(0)" id="addMenu" class="easyui-linkbutton"
           data-options="iconCls:'icon-add',plain:true">添加
        </a>
        <a href="javascript:void(0)" id="updateMenu" class="easyui-linkbutton"
           data-options="iconCls:'icon-edit',plain:true">修改
        </a>
        <a href="javascript:void(0)" id="deleteMenu" class="easyui-linkbutton"
           data-options="iconCls:'icon-remove',plain:true">删除
        </a>
    </div>
</div>
<%--弹出层 添加修改 删除 开始--%>
<div class="easyui-dialog" id="dlg" data-options="title:'添加车辆',iconCls:'icon-save',width:'850px',height:'450px'
,closed:true,closable:true,collapsible:true,minimizable:true,maximizable:true,border:true,
modal:true,draggable:true,method:'get',
buttons:'#bb'">
    <div class="easyui-panel" border="false" style="width:100%;padding:30px 60px;">
        <form method="post" id="dataFrm" style="position:relative">
            <div style="margin-bottom:20px">
                <%--菜单根据id修改--%>
                <input type="hidden" name="id">
                <input class="easyui-combotree" id="pid" name="pid"
                       data-options="label:'父节点:',
                       url:'${ctx}/menu/loadMenuManagerComboTreeJson.action',
                       labelAlign:'right',labelPosition:'left',required:true"
                       style="width:100%;">
            </div>

            <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="name"
                       data-options="prompt:'请输入菜单名称',label:'菜单名称:',labelAlign:'right',labelPosition:'left',required:true"
                       style="width:100%;">
            </div>

            <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="href"
                       data-options="prompt:'请输入菜单地址',label:'菜单地址:',labelAlign:'right',labelPosition:'left'"
                       style="width:100%;">
            </div>

            <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="icon"
                       data-options="label:'菜单图标:',labelPosition:'left',labelAlign:'right'" style="width:100%;">
            </div>
            <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="tabicon"
                       data-options="label:'Tab 图标:',labelPosition:'left',labelAlign:'right'" style="width:100%;">
            </div>
            <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="target"
                       data-options="label:'TARGET:',labelPosition:'left',labelAlign:'right'" style="width:100%;">
            </div>
            <div style="margin-bottom:20px">
                <label class="textbox-label" style="text-align: right;">是否父节点:</label>
                <input class="easyui-radiobutton" name="parent" value="1">是 <span
                    style="display:inline-block;width: 10px"></span>
                <input class="easyui-radiobutton" name="parent" value="0">否
            </div>
            <div style="margin-bottom:20px">
                <label class="textbox-label" style="text-align: right;">是否展开:</label>
                <input class="easyui-radiobutton" name="open" value="1"> 展开<span
                    style="display:inline-block;width: 10px"></span>
                <input class="easyui-radiobutton" name="open" value="0">不展开
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
<%--弹出层 添加修改 删除 结束--%>
<script>
    function zTreeOnClick(event, treeId, treeNode) {
        $("#treeTable").datagrid({
            url: '${ctx}/menu/loadAllMenu.action?id=' + treeNode.id
        })
    }
    var setting = {
        data: {
            simpleData: {
                enable: true
            }
        },
        callback: {
            onClick: zTreeOnClick
        }
    };

    function initTree() {
        $.post("${ctx}/menu/loadMenuManagerTreeJson.action", function (zNodes) {
            $.fn.zTree.init($("#treeMenu"), setting, zNodes);
        });
    }

    initTree();


    //初始化数据表格 开始
    $("#treeTable").datagrid({
        width: '99%',
        height: 630,
        title: '新闻列表',
        singleSelect: true,
        url: '${ctx}/menu/loadAllMenu.action',
        fitColumns: true,
        emptyMsg: '<font color=red>查无数据</font>',
        pagination: true,
        pagePosition: 'bottom',
        toolbar: '#but',
        columns: [[
            {field: 'id', title: '菜单编号', width: 100, align: 'center'},
            {field: 'pid', title: '父级ID', width: 100, align: 'center'},
            {field: 'name', title: '菜单名称', width: 100, align: 'center'},
            {field: 'href', title: '路径', width: 100, align: 'center'},
            {
                field: 'open', title: '是否展开', width: 100, align: 'center', formatter: function (value) {
                    return value == 1 ? "<font color='green'>展开</font>" : "<font color='red'>不展开</font>"
                }
            },
            {
                field: 'parent', title: '是否父节点', width: 100, align: 'center', formatter: function
                    (value) {
                    return value == 1 ? "<font color='green'>是父节点</font>" : "<font color='red'>不是父节点</font>"
                }
            },
            {
                field: 'available', title: '是否可用', width: 100, align: 'center', formatter: function (value) {
                    return value == 1 ? "<font color='green'>可用</font>" : "<font color='red'>不可用</font>"
                }
            },
            {
                field: 'icon', title: '菜单图标', width: 100, align: 'center', formatter: function (value) {
                    return '<img src=' + value + ' />' + value;
                }
            },
            {field: 'tabicon', title: 'Tab图标', width: 100, align: 'center'},
            {field: 'target', title: 'TARGET', width: 100, align: 'center'}

        ]]
    });
    //初始化数据表格 结束
    /*添加菜单*/
    var url = "";
    $("#addMenu").click(function () {
        $("#dlg").dialog("open").dialog("setTitle", "添加菜单");
        $("#dataFrm").form("clear");
        $("#dataFrm").form("load", {
            parent: 0,
            open: 0,
            available: 1
        });
        url = "${ctx}/menu/addMenu.action"
    });
    /*修改菜单*/
    $("#updateMenu").click(function () {
        // 调用getSelect方法获取到选中行在判断
        var row = $("#treeTable").datagrid('getSelected');
        if (row) {
            $("#dlg").dialog("open").dialog('setTitle', '修改菜单');
            $("#dataFrm").form("clear");
            $("#dataFrm").form("load", row);
            $("#id").textbox("readonly", true);
            url = "${ctx}/menu/updateMenu.action";
        } else {
            /*easyui 优化后的消息*/
            $.messager.show({
                title: '提示',
                msg: '请选中操作行'
            });
        }
    });

    //删除菜单
    $("#deleteMenu").click(function () {
        var row = $("#treeTable").datagrid("getSelected");
        if (row) {
            $.post("${ctx}/menu/queryMenuCount.action", {id: row.id}, function (obj) {
                if (obj.code < 0) {
                    $.messager.confirm('删除', '你确定要删除' + row.name + '这条菜单吗?', function (r) {
                        if (r) {
                            $.post("${ctx}/menu/deleteMenu.action", {id: row.id}, function (obj) {
                                //刷新表格
                                $("#treeTable").datagrid("reload");
                                //刷新左边的树结构
                                initTree();
                                //刷新ComboTree
                                $("#pid").combotree("reload");
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
                        msg: obj.mssage /*"该菜单下有子菜单,请先删除子菜单！"*/
                    });
                }
            },"json");
        } else {
            $.messager.show({
                title: '提示',
                msg: '请选中操作行'
            });
        }
    });

    /*保存提交表单*/
    $("#doSubmit").click(function () {
        $("#dataFrm").form("submit", {
            url: url,
            onSubmit: function () {
                return $(this).form("validate")
            },
            success: function (result) {
                //刷新表格
                $("#treeTable").datagrid("reload");
                //刷新ComboTree
                $("#pid").combotree("reload");
                //刷新总菜单 重新 请求一次
                initTree();
                //关闭弹出层
                $("#dlg").dialog("close");
                $.messager.show({
                    title: '提示',
                    msg: JSON.parse(result)['mssage']
                });
            }
        });
    })

</script>
</body>
</html>
