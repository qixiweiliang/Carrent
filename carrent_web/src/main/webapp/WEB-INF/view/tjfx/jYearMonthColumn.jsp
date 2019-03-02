<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 气息微凉
  Date: 2019/1/22
  Time: 15:09
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
    <script type="text/javascript" src="${ctx }/resources/echars/echarts.js"></script>
</head>
<body>
<div class="easyui-panel" style="padding: 20px;text-align: center;" data-options=
        "title:'查询条件',iconCls:'icon-search',width:'98%'">
    <select class="easyui-combobox" id="year" name="year" data-options="onChange:chageData" label="选择年份:"
            labelPosition="left" style="width:30%;">
        <c:forEach var="sn" begin="2015" end="2020">
            <option value="${sn }">${sn }年</option>
        </c:forEach>
    </select>
</div>

<%--对这个div进行渲染--%>
<div id="container" style="height: 83%"></div>
<script type="text/javascript">

    var fullYear = new Date().getFullYear();
    //默认选中当前年
    $("#year").val(fullYear);

    function chageData(newValue, oldValue) {
        initLoadjYearMonthLine(newValue)
    }

    initLoadjYearMonthLine(fullYear);

    function initLoadjYearMonthLine(newValue) {
        $.post("${ctx}/tjfx/loadjYearMonthColumn.action?year=" + newValue, function (result) {
            var dom = document.getElementById("container");
            var myChart = echarts.init(dom);
            var app = {};
            option = null;
            option = {
                title : {
                    text : '汽车出租系统销售员年度业绩统计',
                    subtext : '真实有效',
                    x : 'center'
                },
                color: ['#3398DB'],
                tooltip : {
                    trigger: 'axis',
                    axisPointer : {            // 坐标轴指示器，坐标轴触发有效
                        type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                    }
                },

                xAxis: {
                    type: 'category',
                    data: result.names
                },
                yAxis: {
                    type: 'value'
                },
                series: [{
                    name:'销售额',
                    barWidth: '60%',
                    data: result.values,
                    type: 'bar'
                }]
            };
            ;
            if (option && typeof option === "object") {
                myChart.setOption(option, true);
            }
        }, "json")
    }
</script>
</body>
</html>
