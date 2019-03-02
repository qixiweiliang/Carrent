<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="copyright" content="All Rights Reserved, Copyright (C) 2013, Wuyeguo, Ltd."/>
    <title>尚学堂汽车出租系统</title>
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
<!-- begin of header -->
<div class="wu-header" data-options="region:'north',border:false,split:true">
    <div class="wu-header-left">
        <h1>尚学堂汽车出租系统</h1>
    </div>
    <div class="wu-header-right">
        <p><strong class="easyui-tooltip" title="2条未读消息">${user.realname }</strong>, 欢迎您！</p>
        <p><a href="#">网站首页</a>|<a href="#">支持论坛</a>|<a href="#">帮助中心</a>|
            <a href="javascript:void(0)" onclick="loginOut()">
            安全退出</a></p>
    </div>
</div>
<!-- end of header -->
<!-- begin of sidebar -->
<div class="wu-sidebar" data-options="region:'west',split:true,border:true,title:'导航菜单'">
    <div class="ztree" id="treeMenus" data-options="border:false,fit:true"></div>
</div>
<!-- end of sidebar -->
<!-- begin of main -->
<div class="wu-main" data-options="region:'center',split:true,border:true">
    <div id="wu-tabs" class="easyui-tabs" data-options="border:false,fit:true">
        <div title="首页"
             data-options="href:'${ctx }/desk/toDeskManager.action',closable:false,iconCls:'icon-tip',cls:'pd3'"></div>
    </div>
</div>
<!-- end of main -->
<!-- begin of footer -->
<div class="wu-footer" data-options="region:'south',border:true,split:true">
    &copy; 2018 老雷 All Rights Reserved
</div>

<SCRIPT type="text/javascript">
    function zTreeOnClick(event, treeId, treeNode) {
        if (treeNode.isParent != undefined && treeNode.isParent != true) {
            addTab(treeNode.name, treeNode.href, treeNode.tabicon, true);
        }
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


    $(document).ready(function () {
        $.post("${ctx}/menu/loadIndexMenuTreeJson.action", function (zNodes) {
            $.fn.zTree.init($("#treeMenus"), setting, zNodes);
        });
    });

    /**
     * Name 选项卡初始化
     */
    $('#wu-tabs').tabs({
        tools: [{
            iconCls: 'icon-reload',
            border: false,
            handler: function () {
                $('#wu-datagrid').datagrid('reload');
            }
        }]
    });

    /**
     * Name 添加菜单选项
     * Param title 名称
     * Param href 链接
     * Param iconCls 图标样式
     * Param iframe 链接跳转方式（true为iframe，false为href）
     */
    function addTab(title, href, iconCls, iframe) {
        var tabPanel = $('#wu-tabs');
        if (!tabPanel.tabs('exists', title)) {
            var content = '<iframe scrolling="auto" frameborder="0"  src="' + href + '" style="width:100%;height:100%;"></iframe>';
            if (iframe) {
                tabPanel.tabs('add', {
                    title: title,
                    content: content,
                    iconCls: iconCls,
                    fit: true,
                    cls: 'pd3',
                    closable: true
                });
            }
            else {
                tabPanel.tabs('add', {
                    title: title,
                    href: href,
                    iconCls: iconCls,
                    fit: true,
                    cls: 'pd3',
                    closable: true
                });
            }
        }
        else {
            tabPanel.tabs('select', title);
        }
    }

    /**
     * Name 移除菜单选项
     */
    function removeTab() {
        var tabPanel = $('#wu-tabs');
        var tab = tabPanel.tabs('getSelected');
        if (tab) {
            var index = tabPanel.tabs('getTabIndex', tab);
            tabPanel.tabs('close', index);
        }
    }
    function loginOut() {
        $.messager.confirm('退出登录', '你确定要退出登录吗?', function (r) {
            if (r) {
                $.post("${ctx}/login/loginOut.action", function (obj) {
                    window.top.location.href="/index.jsp";
                });
            }
        })
    }

</SCRIPT>
</body>
</html>
