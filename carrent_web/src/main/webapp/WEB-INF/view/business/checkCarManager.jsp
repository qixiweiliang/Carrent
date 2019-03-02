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
    <input class="easyui-searchbox" id="serach_identity" data-options="prompt:'请输入租车单号',searcher:doSearch"
           style="width:60%">
</div>
<!-- 查询条件 结束 -->

<!-- 数据表格开始 -->
<div id="content">
    <div class="easyui-panel" data-options="title:'查询条件',iconCls:'icon-search',width:'98%'">
        <form action="" id="checkFrm">
            <table width="100%" cellpadding="5">
                <tr>
                    <td style="width:50%">
                        <input class="easyui-textbox" name="checkid" id="checkid"
                               data-options="prompt:'请输入检查单号',required:true,label:'检查单号:',labelAlign:'right',labelPosition:'left'"
                               style="width:80%;">
                    </td>
                    <td style="width:50%">
                        <input class="easyui-datetimebox" name="checkdate" id="checkdate"
                               data-options="prompt:'请输入检查日期',required:true,label:'检查日期:',labelAlign:'right',labelPosition:'left'"
                               style="width:80%;">
                    </td>
                </tr>
                <tr>
                    <td style="width:50%">
                        <input class="easyui-textbox" name="rentid" id="rentid"
                               data-options="prompt:'请输入租车单号',label:'租车单号:',required:true,labelAlign:'right',labelPosition:'left'"
                               style="width:80%;">
                    </td>
                    <td style="width:50%">
                        <input class="easyui-textbox" name="opername" id="opername"
                               data-options="prompt:'请输入操作人员',label:'操作人员:',required:true,labelAlign:'right',labelPosition:'left'"
                               style="width:80%;">
                    </td>
                </tr>
                <tr>
                    <td style="width:50%">
                        <input class="easyui-textbox" name="problem" id="problem"
                               data-options="prompt:'请输入存在问题',label:'存在问题:',required:true,labelAlign:'right',labelPosition:'left'"
                               style="width:80%;">
                    </td>

                    <td style="width:50%">
                        <input class="easyui-numberbox" name="paymoney" id="paymoney"
                               data-options="prompt:'请输入赔付金额',label:'赔付金额:',required:true,labelAlign:'right',labelPosition:'left'"
                               style="width:80%;">
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="width:100%">
                        <input class="easyui-textbox" name="checkdesc" id="checkdesc"
                               data-options="prompt:'请输入问题描述',multiline:true,label:'问题描述:',labelAlign:'right',labelPosition:'left'"
                               style="width:90%;height:60px">
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="2">
                        <a href="javascript:void(0)" class="easyui-linkbutton" id="doSubmit"
                           data-options="iconCls:'icon-search'" style="width:80px">保存</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <!-- 查询条件jiehsu -->
    <div style="height: 2px"></div>
    <!-- 出租单   客户    车辆 信息显示 -->
    <div class="easyui-layout" style="width: 100%;height: 200px">
        <div class="easyui-panel"
             data-options="region:'west',split:true,title:'车辆信息',iconCls:'icon-save',width:'33%',height:'100%'">
            <table cellpadding="5">
                <tr>
                    <td width="50%" align="right">车牌号:</td>
                    <td id="car_carnumber"></td>
                </tr>
                <tr>
                    <td width="50%" align="right">车辆类型:</td>
                    <td id="car_cartype"></td>
                </tr>
                <tr>
                    <td width="50%" align="right">车辆颜色:</td>
                    <td id="car_color"></td>
                </tr>
                <tr>
                    <td width="50%" align="right">车辆价格:</td>
                    <td id="car_price"></td>
                </tr>
                <tr>
                    <td width="50%" align="right">默认出租价格:</td>
                    <td id="car_rentprice"></td>
                </tr>
                <tr>
                    <td width="50%" align="right">出租押金:</td>
                    <td id="car_deposit"></td>
                </tr>
                <tr>
                    <td width="50%" align="right">车辆描述:</td>
                    <td id="car_description"></td>
                </tr>
                <tr>
                    <td width="50%" align="right">车辆图片:</td>
                    <td><img alt="车辆图片" width="100" height="80" id="car_carimg"
                             src="${ctx }/resources/images/carDefault.jpg"></td>
                </tr>
            </table>
        </div>

        <div class="easyui-panel"
             data-options="region:'center',split:true,title:'出租单信息',iconCls:'icon-save',width:'33%',height:'100%'">
            <table cellpadding="5">
                <tr>
                    <td width="50%" align="right">出租单号:</td>
                    <td id="rent_rentid"></td>
                </tr>
                <tr>
                    <td width="50%" align="right">出租价格:</td>
                    <td id="rent_price"></td>
                </tr>
                <tr>
                    <td width="50%" align="right">起租时间:</td>
                    <td id="rent_begindate"></td>
                </tr>
                <tr>
                    <td width="50%" align="right">还车时间:</td>
                    <td id="rent_returndate"></td>
                </tr>
                <tr>
                    <td width="50%" align="right">操作员:</td>
                    <td id="rent_opername"></td>
                </tr>
            </table>
        </div>
        <div class="easyui-panel"
             data-options="region:'east',split:true,title:'客户信息',iconCls:'icon-save',width:'33%',height:'100%'">
            <table cellpadding="5">
                <tr>
                    <td width="50%" align="right">身份证号:</td>
                    <td id="cus_identity"></td>
                </tr>
                <tr>
                    <td width="50%" align="right">客户姓名:</td>
                    <td id="cus_custname"></td>
                </tr>
                <tr>
                    <td width="50%" align="right">客户性别:</td>
                    <td id="cus_sex"></td>
                </tr>
                <tr>
                    <td width="50%" align="right">客户地址:</td>
                    <td id="cus_address"></td>
                </tr>
                <tr>
                    <td width="50%" align="right">客户职位:</td>
                    <td id="cus_career"></td>
                </tr>
                <tr>
                    <td width="50%" align="right">电话:</td>
                    <td id="cus_phone"></td>
                </tr>
            </table>
        </div>
    </div>

</div>
<!-- 出租单   客户    车辆 信息显示 结束-->

<script type="text/javascript">
    $(function () {
        $("#content").hide()
    });
    function doSearch(value) {
        $.post("${ctx}/rent/queryRentByRentid.action", {rentid: value},
            function (obj) {
                alert(obj);
                if (obj == null) {
                    $("#content").hide();
                    $.messager.show({
                        title: '提示',
                        msg: '出租单号不存在'
                    });
                } else if (obj.rentflag === 1) {
                    $("#content").hide();
                    $.messager.show({
                        title: '提示',
                        msg: '该订单车辆已归还'
                    });
                } else {
                    $("#content").show();
                    /*此处初始化数据*/
                    initCheckFormAndAllMessage(value);
                }

            }, "json")
    }

    /*此处需要 车辆信息 出租单信息  及 客户信息 */
    function initCheckFormAndAllMessage(rentid) {
        $.post("${ctx}/check/initCheckFormAndAllMessage.action", {rentid: rentid},
            function (map) {
                /*填充检查订单信息*/
                var check = map.check;
                $("#checkFrm").form("load", check);
                /*填充车辆信息*/
                var car = map.car;
                $("#car_carnumber").html(car.carnumber);
                $("#car_cartype").html(car.cartype);
                $("#car_color").html(car.carnumber);
                $("#car_price").html(car.price);
                $("#car_rentprice").html(car.rentprice);
                $("#car_deposit").html(car.deposit);
                $("#car_description").html(car.description);
                /*填充租车订单信息*/
                var rent = map.rent;
                $("#rent_rentid").html(rent.rentid);
                $("#rent_price").html(rent.price);
                $("#rent_begindate").html(rent.begindate);
                $("#rent_returndate").html(rent.returndate);
                $("#rent_rentprice").html(rent.rentprice);
                $("#rent_opername").html(rent.opername);
                /*填充客户信息*/

                var cus = map.customer;
                $("#cus_identity").html(cus.identity);
                $("#cus_custname").html(cus.custname);
                $("#cus_sex").html(cus.sex);
                $("#cus_address").html(cus.address);
                $("#cus_career").html(cus.career);
                $("#cus_phone").html(cus.phone);
            }, "json")
    }

    //保存
    $('#doSubmit').click(function () {
        $("#checkFrm").form("submit", {
            url: "${ctx}/check/addCheck.action",
            onSubmit: function () {
                return $(this).form('validate');//触发验证
            },
            success: function (result) {
                //刷新表格
                $("#dg").datagrid("reload");
                $("#content").hide()
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
