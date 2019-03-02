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
    <script type="text/javascript" src="${ctx }/resources/easyui/datagrid-detailview.js"></script>
    <script type="text/javascript" src="${ctx }/resources/easyui/locale/easyui-lang-zh_CN.js"></script>
</head>
<body>
<!-- 查询条件开始 -->
<div class="easyui-panel" style="text-align: center;padding: 15px"
     data-options="title:'查询条件',iconCls:'icon-search',width:'98%'">

    <input class="easyui-searchbox" id="serach_identity" data-options="prompt:'请输入客户身份证号',searcher:doSearch"
           style="width:60%">

</div>
<!-- 查询条件jiehsu -->

<%--添加修改弹窗开始--%>
<div class="easyui-dialog" id="dlg" data-options="title:'添加车辆',iconCls:'icon-save',width:'850px',height:'440px'
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
                <label class="textbox-label" style="text-align: right;">归还状态:</label>
                <input class="easyui-radiobutton" name="rentflag" value="1">已归还 <span
                    style="display:inline-block;width: 10px"></span>
                <input class="easyui-radiobutton" name="rentflag" value="0">未归还
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

<div id="content">
    <table id="dg"></table><%-- class="easyui-datagrid"--%>
    <div id="tb">
        <a href="javascript:void(0)" id="addRents" class="easyui-linkbutton"
           data-options="iconCls:'icon-add',plain:true">车辆出租
        </a>
    </div>
</div>

<script type="text/javascript">
    $("#content").hide();

    function initCarData() {
        //初始化数据表格
        $("#dg").datagrid({
            width: '98%',
            height: 350,
            title: '车辆列表',
            rownumbers: true,
            singleSelect: true,
            url: '${ctx}/car/loadAllCar.action?isrenting=0',
            fitColumns: true,
            emptyMsg: '<font color=red>查无数据</font>',
            pagination: true,
            pagePosition: 'bottom',
            toolbar: '#tb',
            columns: [[
                {field: 'carnumber', title: '车牌号', width: 100, align: 'center'},
                {field: 'cartype', title: '车型', width: 100, align: 'center'},
                {field: 'color', title: '车辆颜色', width: 100, align: 'center'},
                {field: 'price', title: '购买价格', width: 100, align: 'center'},
                {field: 'rentprice', title: '租金', width: 100, align: 'center'},
                {field: 'deposit', title: '押金', width: 100, align: 'center'},
                {
                    field: 'isrenting', title: '归还状态', width: 100, align: 'center', formatter: function (value) {
                        return value == 1 ? '<font color="red">已出租</font>' : '<font color="green">未出租</font>';
                    }
                },
                {field: 'description', title: '车辆描述', width: 100, align: 'center'}
            ]],
            view: detailview,
            detailFormatter: function (rowIndex, rowData) { //rowIndex索引     rowData 代表当前行的json对象
                return '<img src=' + rowData.carimg + ' width=150 height=120 />';
            }
        });
    }

    // 根据客户ID查询 开始
    function doSearch(value) {
        $.post("${ctx}/customer/queryCustomerByIndetity.action", {identity: value}, function (result) {
            if (result.flag) {
                $("#content").show();
                initCarData();
            } else {
                $("#content").hide();
                $.messager.show({
                    title: '提示',
                    msg: '身份证号不存在'
                });

            }
        }, 'json')
    }

    // 根据客户ID查询 结束

    //添加 车辆出租
    $("#addRents").click(function () {
        var row = $("#dg").datagrid("getSelected");
        if (row) {
            $("#dlg").dialog("open").dialog("setTitle", "车辆出租");
            $("#dataFrm").form("clear");
            $("#dataFrm").form('load', {rentflag: 0});//默认选中未归还
            $("#rentid").textbox("readonly", true);
            $("#carnumber").textbox("readonly", true);
            $("#identity").textbox("readonly", true);
            $("#opername").textbox("readonly", true);
            $.post('${ctx}/rent/initRentCarForm.action',{
                identity:$("#serach_identity").val(),
                carnumber:row.carnumber,
                price:row.rentprice
                
            },function (obj) {alert($("#serach_identity").val())
                $("#dataFrm").form("load",obj);
            })
        } else {
            $.messager.show({
                title: '提示',
                msg: '请选中操作行'
            });
        }

    });
    ;
    // 保存
    $('#doSubmit').click(function () {
        $("#dataFrm").form("submit", {
            url:"${ctx}/rent/addRents.action",
            onSubmit: function () {
                return $(this).form('validate');//触发验证
            },
            success: function (result) {
                //刷新表格
                $("#dg").datagrid("reload");
                //关闭弹出层
                $("#dlg").dialog("close");
                $("#content").hide(); //完成订单业务后应隐藏租车界面
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
