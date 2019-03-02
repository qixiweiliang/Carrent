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
    <script src="${ctx}/resources/js/jquery-1.8.0.min.js"></script>
    <script src="${ctx}/resources/echars/echarts.js"></script>
</head>
<body>
<%--对这个div进行渲染--%>
<div id="container" style="height: 83%"></div>
<script type="text/javascript">
    $.post("${ctx}/tjfx/loadAllCustomerArea.action",function (result) {
        var dom = document.getElementById("container");
        var myChart = echarts.init(dom);
        var app = {};
        option = null;
        option = {
            title : {
                text: '地区客户统计',
                subtext: '纯属虚构',
                x:'center'
            },
            tooltip : {
                trigger: 'item',
                formatter: "{a} <br/>{b} : {c} ({d}%)"
            },
            legend: {
                orient: 'vertical',
                left: 'left',
                data: result
            },
            series : [
                {
                    name: '客户统计',
                    type: 'pie',
                    radius : '55%',
                    center: ['50%', '60%'],
                    data:result,
                    itemStyle: {
                        emphasis: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }
            ]
        };
        if (option && typeof option === "object") {
            myChart.setOption(option, true);
        }
    },"json")
</script>
</body>
</html>
