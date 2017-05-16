<%@ page language="java" import="java.util.*" contentType="text/html; charset=GB2312" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>新闻网页的自动识别与过滤</title>
    <link rel="stylesheet" type="text/css" href="../../css/bootstrap-theme.min.css">
    <link rel="stylesheet" type="text/css" href="../../css/bootstrap.min.css">
    <script type="text/javascript" src="../../js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="../../js/bootstrap.min.js"></script>
</head>
<body style="background: #40ABEF">

<!-- 接收用户输入的URL值 -->
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <a href="#" class="navbar-brand">新闻网页的自动识别与过滤</a>
        </div>
        <div class="collapse navbar-collapse">
            <form class="navbar-form navbar-right" action="/classify" method="post">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="输入网页的URL" name="input_url">
                </div>
                <button type="submit" class="btn btn-default">开始识别和过滤</button>
            </form>
        </div>
    </div>
</nav>
<br>
<br>
<br>
<br>


<!-- 输入新闻内容提取规则 -->

<br>
<div style="margin: 0px auto;width: 700px;text-align: center">
    <div>
        <c:if test="${isNewsPage}">
            <p style="font-size: 40pt;color: red">该网页是新闻网页</p>
        </c:if>
        <c:if test="${!isNewsPage}">
            <p style="font-size: 40pt;color: red">该是网页不是新闻网页</p>
        </c:if>
    </div>

    <c:if test="${isNewsPage}">
        <form method="post" action="/result">
            <div class="form-group">
                <input type="hidden" name="handledUrl" value="${handledUrl}">
                <input style="height: 40px;width: 300px;" type="text" placeholder="输入新闻内容提取规则" name="fetch_rule">
                <button style="height: 40px;" class="btn btn-default" type="submit">开始提取</button>
            </div>
        </form>
    </c:if>


    <div>
        <p style="font-size: 20pt;color: blueviolet">具体对网页的URL属性、网页内容、网页结构分析如下：</p>
    </div>
</div>

<!-- URL属性处理模块 -->
<table class="table table-bordered" >
    <caption>URL属性处理模块</caption>
    <thead>
    <tr>
        <th>属性名称</th>
        <th>代表的意义</th>
        <th>值</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>containsKeywordOfNews</td>
        <td>是否包含体现新闻属性的关键字</td>
        <td>${urlResult.containsKeywordOfNews}</td>
    </tr>
    <tr>
        <td>containsKeywordOfNotNews</td>
        <td>是否包含体现非新闻属性的关键字</td>
        <td>${urlResult.containsKeywordOfNotNews}</td>
    </tr>
    <tr>
        <td>containsDateIndicator</td>
        <td>是否包含日期指示器</td>
        <td>${urlResult.containsDateIndicator}</td>
    </tr>
    <tr>
        <td>lastPartNumberAndEnoughLong</td>
        <td>最后一个片段是否包含数字，且该数字长度够长</td>
        <td>${urlResult.lastPartEnoughLong}</td>
    </tr>
    </tbody>
</table>
<!-- 网页结构处理模块 -->
<table class="table table-bordered" >
    <caption>网页结构处理模块</caption>
    <thead>
    <tr>
        <th>属性名称</th>
        <th>代表的意义</th>
        <th>值</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>containsH1</td>
        <td>网页源码中是否包含H1标签</td>
        <td>${structureResult.containsH1}</td>
    </tr>
    <tr>
        <td>H1ContainsElements</td>
        <td>H1标签是否包含子元素</td>
        <td>${structureResult.h1ContainsElements}</td>
    </tr>
    <tr>
        <td>containsH2</td>
        <td>网页源码中是否包含H2标签</td>
        <td>${structureResult.containsH2}</td>
    </tr>
    <tr>
        <td>H2ContainsElements</td>
        <td>H2标签是否包含子元素</td>
        <td>${structureResult.h2ContainsElements}</td>
    </tr>
    <tr>
        <td>webPattern</td>
        <td>网页源码中是否拥有满足新闻网页的结构模式</td>
        <td>${structureResult.webPattern}</td>
    </tr>
    </tbody>
</table>
<!-- 网页内容处理模块 -->
<table class="table table-bordered" >
    <caption>网页内容处理模块</caption>
    <thead>
    <tr>
        <th>属性名称</th>
        <th>代表的意义</th>
        <th>值</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>containsKeywordOfNews</td>
        <td>网页内容中是否包含体现新闻属性的关键字</td>
        <td>${contentResult.containsKeywordOfNews}</td>
    </tr>
    <tr>
        <td>containsKeywordOfNotNews</td>
        <td>网页内容中是否包含体现非新闻属性的关键字</td>
        <td>${contentResult.containsKeywordOfNotNews}</td>
    </tr>
    <tr>
        <td>containsNewsPatternCount</td>
        <td>网页内容中包含体现新闻内容属性特征的模式的数量</td>
        <td>${contentResult.containsNewsPatternCount}</td>
    </tr>
    </tbody>
</table>



</body>
</html>

