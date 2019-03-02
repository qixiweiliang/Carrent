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
    <script type="text/javascript" src="${ctx }/resources/js/wangEditor.min.js"></script>
</head>
<body>
<!-- 查询条件开始 -->
<div class="easyui-panel" data-options="title:'查询条件',iconCls:'icon-search',width:'100%'">
    <form action="" id="searchFrm">
        <table width="100%" cellpadding="10" cellspacing="10">
            <tr>
                <td style="width:33%">
                    <input class="easyui-textbox" name="title"
                           data-options="prompt:'请输入新闻标题',label:'新闻标题:',labelAlign:'right',labelPosition:'left'"
                           style="width:85%;">
                </td>
                <td style="width:33%">
                    <input class="easyui-textbox" name="content"
                           data-options="prompt:'请输入新闻内容',label:'新闻内容:',labelAlign:'right',labelPosition:'left'"
                           style="width:85%;">
                </td>
            </tr>

            <tr>
                <td style="width:33%">
                    <input class="easyui-datetimebox" name="startTime"
                           data-options="prompt:'请输入开始时间',label:'开始时间:',labelAlign:'right',labelPosition:'left'"
                           style="width:85%;">
                </td>
                <td style="width:33%">
                    <input class="easyui-datetimebox" name="endTime"
                           data-options="prompt:'请输入结束时间',label:'结束时间:',labelAlign:'right',labelPosition:'left'"
                           style="width:85%;">
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
<div class="easyui-dialog" id="dlg" data-options="title:'添加新闻',iconCls:'icon-save',width:'850px',height:'440px'
,closed:true,closable:true,collapsible:true,minimizable:true,maximizable:true,border:true,
modal:true,draggable:true,
buttons:'#bb'">
    <div class="easyui-panel" border="false" style="width:100%;padding:30px 60px;">
        <form method="post" id="dataFrm">
            <%--根据id修改--%>
            <input type="hidden" name="id">
            <div style="margin-bottom:20px">
                <input class="easyui-textbox" id="title" name="title"
                       data-options="prompt:'请输入新闻标题',label:'新闻标题:',labelAlign:'right',labelPosition:'left',required:true"
                       style="width:100%;">
            </div>

            <div style="margin-bottom:20px">
                <label class="textbox-label" style="text-align: right;">新闻内容:</label>
                <%--富文本要渲染的div--%>
                <div id="divcontent" name="content"></div>
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

<%--EasyUi对齐渲染的表格 开始--%>
<table id="dg"></table><%-- class="easyui-datagrid"--%>
<%--EasyUi对齐渲染的表格 结束--%>

<%--标题栏  toolbar 添加 修改 删除 开始--%>
<div id="tb">
    <a href="javascript:void(0)" id="addNews" class="easyui-linkbutton"
       data-options="iconCls:'icon-add',plain:true">添加
    </a>
    <a href="javascript:void(0)" id="updateNews" class="easyui-linkbutton"
       data-options="iconCls:'icon-edit',plain:true">修改
    </a>
    <a href="javascript:void(0)" id="deleteNew" class="easyui-linkbutton"
       data-options="iconCls:'icon-remove',plain:true">删除
    </a>
</div>
<%--标题栏  toolbar 添加 修改 删除 结束--%>

<script type="text/javascript">

    // 获取富文本编辑器内容
    var E = window.wangEditor
    var editor = new E('#divcontent')
    var content;
    editor.create()
    document.getElementById('doSubmit').addEventListener('click', function () {
        // 读取 html
        content = editor.txt.html();
    }, false)


    //初始化数据表格 开始
    $("#dg").datagrid({
        width: '100%',
        height: 350,
        title: '新闻列表',
        singleSelect: true,
        url: '${ctx}/news/loadAllNew.action',
        fitColumns: true,
        emptyMsg: '<font color=red>查无数据</font>',
        pagination: true,
        pagePosition: 'bottom',
        toolbar: '#tb',
        columns: [[
            {field: 'id', title: '新闻编号', width: 100, height: 200, align: 'center'},
            {field: 'title', title: '新闻标题', width: 100, height: 'auto', align: 'center'},
            {field: 'content', title: '新闻内容', width: 100, height: 'auto', align: 'center'},
            {field: 'createtime', title: '发布时间', width: 100, height: 'auto', align: 'center'},
            {field: 'opername', title: '发布人姓名', width: 100, height: 'auto', align: 'center'}
        ]]
    });
    //初始化数据表格 结束
    var url = "";
    // 模糊查询 开始
    $("#doSearch").click(function () {
        var serialize = $("#searchFrm").serialize();
        $("#dg").datagrid({
            url: "${ctx}/news/loadAllNew.action?" + serialize
        })
    });
    // 模糊查询 结束

    //添加新闻
    $("#addNews").click(function () {
        $("#dlg").dialog("open").dialog("setTitle", "添加新闻");
        $("#dataFrm").form("clear");
        editor.txt.clear();
        $("#id").textbox("readonly", false);
        url = "${ctx}/news/addNews.action"
    });

    //修改新闻
    $("#updateNews").click(function () {
        // 调用getSelect方法获取到选中行在判断
        var row = $("#dg").datagrid('getSelected');
        if (row) {
            $("#dlg").dialog("open").dialog('setTitle', '修改新闻');
            $("#dataFrm").form("clear");
            editor.txt.clear();
            $("#dataFrm").form("load", row);
            editor.txt.html(row.content);

            $("#id").textbox("readonly", true);
            url = "${ctx}/news/updateNew.action";
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
            url: url + "?content=" + content,
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


    //删除新闻
    $("#deleteNew").click(function () {
        var row = $("#dg").datagrid("getSelected");
        if (row) {
            $.messager.confirm('删除', '你确定要删除' + row.title + '这条新闻吗?', function (r) {
                if (r) {
                    $.post("${ctx}/news/deleteNew.action", {id: row.id}, function (obj) {
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

</script>
</body>
</html>
