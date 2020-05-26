<%--
  Created by IntelliJ IDEA.
  User: 驱傩
  Date: 2020/5/26
  Time: 13:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>网站活跃分析图</title>
    <!-- 引入 echarts.js -->
    <script src="${pageContext.request.contextPath}/js/echarts.min.js"></script>
</head>
<body>
<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
<div id="main" style="width: 1100px;height:550px;"></div>
<script src="${pageContext.request.contextPath}/bootstrap/js/jquery-3.4.1.js" type="text/javascript"
        charset="utf-8"></script>
<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));

    myChart.setOption({
        title: {
            text: '登录统计'
        },
        tooltip: {},
        legend: {
            data: ['访问次数']
        },
        xAxis: {
            data: []
        },
        yAxis: {},
        series: [{
            name: '访问次数',
            type: 'bar',
            showBackground: true,
            data: []
        }]
    });

    // Asynchronous data loading
    $.get('${pageContext.request.contextPath}/account/chart').done(function (data) {
        // fill in data
        // var obj = JSON.parse(data)
        // console.log(obj);
        var key = [];
        var value = [];
        $.each(data, function (k,v) {
            key.push(k);
            value.push(v);
        });
        myChart.setOption({
            xAxis: {
                data: key
            },
            series: [{
                // find series by name
                name: '访问量',
                data: value
            }]
        });
    });
</script>
</body>
</html>