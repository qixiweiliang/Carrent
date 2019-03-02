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
    <script type="text/javascript" src="${ctx }/resources/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${ctx }/resources/easyui/locale/easyui-lang-zh_CN.js"></script>
</head>
<body>
<!-- 查询条件开始 -->
<div class="easyui-panel" border="false" style="width:98%;padding:30px 60px;">
    <form method="post" id="dataFrm">
        <input type="hidden" name="userid" value="${sessionScope.login.userid}"/>
        <input type="hidden"  class="easyui-validatebox" id="oldPwd" name="oldPwd" value="${sessionScope.login.pwd}"/>

        <div style="margin-bottom:20px">
            <label class="textbox-label" style="text-align: right;">原始密码:</label>
            <input  id="reoldPwd" name="reOldPwd" class="easyui-validatebox easyui-passwordbox"
                   required="required" data-options="prompt:'请输入原始密码'" validType="equalsPwd['#oldPwd']"
                    style="width:85%;">
        </div>
        <div style="margin-bottom:20px">
            <label class="textbox-label" style="text-align: right;">新密码:</label>
            <input  id="newpwd" name="newpwd" class="easyui-validatebox easyui-passwordbox"
                   data-options="prompt:'请输入新密码',required:true" style="width:85%;">
        </div>

        <div style="margin-bottom:20px">
            <label class="textbox-label" style="text-align: right;">确认新密码:</label>
            <input id="pwd" name="pwd"  class="easyui-validatebox easyui-passwordbox"
                   required="required" data-options="prompt:'请再次输入新密码'" validType="equals['#newpwd']"
                   style="width:85%;">
        </div>

        <div style="margin-bottom:20px;text-align: center">
            <a href="javascript:void(0)" class="easyui-linkbutton" id="doChange"
               data-options="iconCls:'icon-search'" style="width:auto;">确认修改</a>
            <a href="javascript:void(0)" onclick="javascript:$('#dataFrm').form('reset')"
               class="easyui-linkbutton" data-options="iconCls:'icon-reload'" style="width:80px">重置</a>
        </div>

    </form>
</div>

<script type="text/javascript">
    $.extend($.fn.validatebox.defaults.rules, {
        equalsPwd: {
            validator: function(value,param){
                return value === $(param[0]).val();
            },
            message: '原始密码不一致!'
        },
        equals: {
            validator: function(value,param){
                return value === $(param[0]).val();
            },
            message: '新密码不一致!'
        }
    });

    $("#doChange").click(function () {
        $("#dataFrm").form("submit",{
            url:"${ctx}/user/changePwd.action",
            onSubmit:function () {
                return $(this).form("validate")
            },
            success:function (result) {
                window.top.location.href="/index.jsp";
            }
        })
    });

</script>
</body>
</html>
