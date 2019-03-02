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
<div class="easyui-panel" data-options="title:'查询条件',iconCls:'icon-search',width:'98%'">
    <form action="" id="searchFrm">
        <table width="100%" cellpadding="10" cellspacing="10">
            <tr>
                <td style="width:30%">
                    <input class="easyui-textbox" name="carnumber"
                           data-options="prompt:'请输入车辆牌号',label:'车牌号:',labelAlign:'right',labelPosition:'left'"
                           style="width:80%;">
                </td>
                <td style="width:30%">
                    <input class="easyui-textbox" name="cartype"
                           data-options="prompt:'请输入车型',label:'车型:',labelAlign:'right',labelPosition:'left'"
                           style="width:80%;">
                </td>
                <td style="width:30%">
                    <input class="easyui-textbox" name="color"
                           data-options="prompt:'请输入车辆颜色',label:'车辆颜色:',labelAlign:'right',labelPosition:'left'"
                           style="width:80%;">
                </td>
            </tr>
            <tr>
                <td style="width:30%">
                    <input class="easyui-textbox" name="description"
                           data-options="prompt:'请输入车辆描述',label:'车辆描述:',labelAlign:'right',labelPosition:'left'"
                           style="width:80%;">
                </td>
                <td style="width:30%">
                    <label class="textbox-label" style="text-align: right;">状态:</label>
                    <input class="easyui-radiobutton" name="isrenting" value="1">已出租 <span
                        style="display:inline-block;width: 10px"></span>
                    <input class="easyui-radiobutton" name="isrenting" value="0">未出租
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
<div class="easyui-dialog" id="dlg" data-options="title:'添加车辆',iconCls:'icon-save',width:'850px',height:'440px'
,closed:true,closable:true,collapsible:true,minimizable:true,maximizable:true,border:true,
modal:true,draggable:true,
buttons:'#bb'">
    <div class="easyui-panel" border="false" style="width:100%;padding:30px 60px;">
        <form method="post" id="dataFrm" style="position:relative">
            <div style="margin-bottom:20px">
                <input class="easyui-textbox" id="carnumber" name="carnumber"
                       data-options="prompt:'请输入车牌号',label:'车牌号:',labelAlign:'right',labelPosition:'left',required:true"
                       style="width:60%;">
            </div>

            <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="cartype"
                       data-options="prompt:'请输入车辆车型',label:'车型:',labelAlign:'right',labelPosition:'left',required:true"
                       style="width:60%;">
            </div>

            <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="color"
                       data-options="prompt:'请输入车辆颜色',label:'车辆颜色:',labelAlign:'right',labelPosition:'left',required:true"
                       style="width:60%;">
            </div>

            <div style="margin-bottom:20px">
                <input class="easyui-numberbox" name="price"
                       data-options="label:'购买价格:',labelPosition:'left',labelAlign:'right'" style="width:60%;">
            </div>
            <div style="margin-bottom:20px">
                <input class="easyui-numberbox" name="rentprice"
                       data-options="label:'出租价格:',labelPosition:'left',labelAlign:'right'" style="width:100%;">
            </div>
            <div style="margin-bottom:20px">
                <input class="easyui-numberbox" name="deposit"
                       data-options="label:'押金:',labelPosition:'left',labelAlign:'right'" style="width:100%;">
            </div>
            <div style="margin-bottom:20px">
                <input class="easyui-textbox" name="description"
                       data-options="label:'车辆描述:',labelPosition:'left',labelAlign:'right'" style="width:100%;">
            </div>

            <div style="margin-bottom:20px">
                <label class="textbox-label" style="text-align: right;">归还状态:</label>
                <input class="easyui-radiobutton" name="isrenting" value="1">已出租 <span
                    style="display:inline-block;width: 10px"></span>
                <input class="easyui-radiobutton" name="isrenting" value="0">未出租
            </div>
            <%--展示图片的位置--%>
            <input type="hidden" id="carimg" name="carimg">
            <img alt="上传图片" id="img_carimg" style="width: 38%;margin:5px;height: 180px;position: absolute;left:
            60%;top: 0px" src="${ctx}/resources/images/carDefault.jpg">
            <%--展示图片的位置结束--%>

        </form>
        <%--图片上传表单--%>
        <form action="" method="post" id="uploadImg" enctype="multipart/form-data">
            <div style="margin-bottom:20px">
                <input class="easyui-filebox" name="mf"
                       data-options="label:'车辆图片:',labelPosition:'left',labelAlign:'right'" style="width:60%;">
                <a href="javascript:void(0)" id="addImg" class="easyui-linkbutton"
                   data-options="iconCls:'icon-add'">上传
                </a>
            </div>
        </form>
        <%--结束--%>
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
    <a href="javascript:void(0)" id="addCar" class="easyui-linkbutton"
       data-options="iconCls:'icon-add',plain:true">添加
    </a>
    <a href="javascript:void(0)" id="updateCar" class="easyui-linkbutton"
       data-options="iconCls:'icon-edit',plain:true">修改</a>
    <a href="javascript:void(0)" id="deleteCar" class="easyui-linkbutton"
       data-options="iconCls:'icon-remove',plain:true">删除</a>
</div>

<script type="text/javascript">

    //初始化数据表格
    $("#dg").datagrid({
        width: '98%',
        height: 350,
        title: '车辆列表',
        rownumbers: true,
        singleSelect: true,
        url: '${ctx}/car/loadAllCar.action',
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
            return '<img src=' + rowData.carimg + ' style="width:150;height=120;"/>';
        }
    });
    // 车辆图片上传开始
    $("#addImg").click(function () {
        //$("#carimgfrm")[0]是把jq对象转成js对象
        var formData = new FormData($("#uploadImg")[0]);
        $.ajax({
            url: "${ctx}/upload/uploadImg.action",
            type: 'POST',
            data: formData, /*图片表单的数据*/
            async: false,
            cache: false,
            contentType: false,
            processData: false,
            success: function (path) { /*返回文件上传的地址*/
                $("#img_carimg").attr({src: path});
                //给表单设置值 ，目地是当提交表单时把这个图片地址传到后台
                $("#carimg").val(path); //值付给隐藏域
            },
        })
    });
    // 车辆图片上传结束
    var url = "";
    // 模糊查询
    $("#doSearch").click(function () {
        var serialize = $("#searchFrm").serialize();
        $("#dg").datagrid({
            url: "${ctx}/car/loadAllCar.action?" + serialize
        })
    });
    //添加车辆
    $("#addCar").click(function () {
        $("#dlg").dialog("open").dialog("setTitle", "添加车辆");
        $("#dataFrm").form("clear");
        $("#dataFrm").form('load', {isrenting: 0});//默认选中未出租
        $("#img_carimg").attr({src: '${ctx}/resources/images/carDefault.jpg'});  //每次添加车辆显示默认车辆图片
        $("#carnumber").textbox("readonly", false)
        url = "${ctx}/car/addCar.action"
    });
    //修改车辆
    $("#updateCar").click(function () {
        // 调用getSelect方法获取到选中行在判断
        var row = $("#dg").datagrid('getSelected');
        if (row) {
            $("#dlg").dialog("open").dialog('setTitle', '修改车辆');
            $("#dataFrm").form("clear");
            $("#dataFrm").form("load", row);
            $("#carnumber").textbox("readonly", true)
            $("#img_carimg").attr({src: row.carimg});
            /*修改显示要修改的图片*/
            url = "${ctx}/car/updateCar.action";
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

    //删除车辆
    $("#deleteCar").click(function () {
        var row = $("#dg").datagrid("getSelected");
        if (row) {
            $.messager.confirm('删除', '你确定要删除' + row.carnumber + '这条记录吗?', function (r) {
                if (r) {
                    $.post("${ctx}/car/deleteCar.action", {
                        carnumber: row.carnumber,
                        carimg: row.carimg
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
