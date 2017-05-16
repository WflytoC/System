<%@ page language="java" import="java.util.*" contentType="text/html; charset=GB2312" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>������ҳ���Զ�ʶ�������</title>
    <link rel="stylesheet" type="text/css" href="../../css/bootstrap-theme.min.css">
    <link rel="stylesheet" type="text/css" href="../../css/bootstrap.min.css">
    <script type="text/javascript" src="../../js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript" src="../../js/bootstrap.min.js"></script>
</head>
<body style="background: #40ABEF">

<!-- �����û������URLֵ -->
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <div class="navbar-header">
            <a href="#" class="navbar-brand">������ҳ���Զ�ʶ�������</a>
        </div>
        <div class="collapse navbar-collapse">
            <form class="navbar-form navbar-right" action="/classify" method="post">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="������ҳ��URL" name="input_url">
                </div>
                <button type="submit" class="btn btn-default">��ʼʶ��͹���</button>
            </form>
        </div>
    </div>
</nav>
<br>
<br>
<br>
<br>


<!-- ��������������ȡ���� -->

<br>
<div style="margin: 0px auto;width: 700px;text-align: center">
    <div>
        <c:if test="${isNewsPage}">
            <p style="font-size: 40pt;color: red">����ҳ��������ҳ</p>
        </c:if>
        <c:if test="${!isNewsPage}">
            <p style="font-size: 40pt;color: red">������ҳ����������ҳ</p>
        </c:if>
    </div>

    <c:if test="${isNewsPage}">
        <form method="post" action="/result">
            <div class="form-group">
                <input type="hidden" name="handledUrl" value="${handledUrl}">
                <input style="height: 40px;width: 300px;" type="text" placeholder="��������������ȡ����" name="fetch_rule">
                <button style="height: 40px;" class="btn btn-default" type="submit">��ʼ��ȡ</button>
            </div>
        </form>
    </c:if>


    <div>
        <p style="font-size: 20pt;color: blueviolet">�������ҳ��URL���ԡ���ҳ���ݡ���ҳ�ṹ�������£�</p>
    </div>
</div>

<!-- URL���Դ���ģ�� -->
<table class="table table-bordered" >
    <caption>URL���Դ���ģ��</caption>
    <thead>
    <tr>
        <th>��������</th>
        <th>���������</th>
        <th>ֵ</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>containsKeywordOfNews</td>
        <td>�Ƿ���������������ԵĹؼ���</td>
        <td>${urlResult.containsKeywordOfNews}</td>
    </tr>
    <tr>
        <td>containsKeywordOfNotNews</td>
        <td>�Ƿ�������ַ��������ԵĹؼ���</td>
        <td>${urlResult.containsKeywordOfNotNews}</td>
    </tr>
    <tr>
        <td>containsDateIndicator</td>
        <td>�Ƿ��������ָʾ��</td>
        <td>${urlResult.containsDateIndicator}</td>
    </tr>
    <tr>
        <td>lastPartNumberAndEnoughLong</td>
        <td>���һ��Ƭ���Ƿ�������֣��Ҹ����ֳ��ȹ���</td>
        <td>${urlResult.lastPartEnoughLong}</td>
    </tr>
    </tbody>
</table>
<!-- ��ҳ�ṹ����ģ�� -->
<table class="table table-bordered" >
    <caption>��ҳ�ṹ����ģ��</caption>
    <thead>
    <tr>
        <th>��������</th>
        <th>���������</th>
        <th>ֵ</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>containsH1</td>
        <td>��ҳԴ�����Ƿ����H1��ǩ</td>
        <td>${structureResult.containsH1}</td>
    </tr>
    <tr>
        <td>H1ContainsElements</td>
        <td>H1��ǩ�Ƿ������Ԫ��</td>
        <td>${structureResult.h1ContainsElements}</td>
    </tr>
    <tr>
        <td>containsH2</td>
        <td>��ҳԴ�����Ƿ����H2��ǩ</td>
        <td>${structureResult.containsH2}</td>
    </tr>
    <tr>
        <td>H2ContainsElements</td>
        <td>H2��ǩ�Ƿ������Ԫ��</td>
        <td>${structureResult.h2ContainsElements}</td>
    </tr>
    <tr>
        <td>webPattern</td>
        <td>��ҳԴ�����Ƿ�ӵ������������ҳ�Ľṹģʽ</td>
        <td>${structureResult.webPattern}</td>
    </tr>
    </tbody>
</table>
<!-- ��ҳ���ݴ���ģ�� -->
<table class="table table-bordered" >
    <caption>��ҳ���ݴ���ģ��</caption>
    <thead>
    <tr>
        <th>��������</th>
        <th>���������</th>
        <th>ֵ</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>containsKeywordOfNews</td>
        <td>��ҳ�������Ƿ���������������ԵĹؼ���</td>
        <td>${contentResult.containsKeywordOfNews}</td>
    </tr>
    <tr>
        <td>containsKeywordOfNotNews</td>
        <td>��ҳ�������Ƿ�������ַ��������ԵĹؼ���</td>
        <td>${contentResult.containsKeywordOfNotNews}</td>
    </tr>
    <tr>
        <td>containsNewsPatternCount</td>
        <td>��ҳ�����а�������������������������ģʽ������</td>
        <td>${contentResult.containsNewsPatternCount}</td>
    </tr>
    </tbody>
</table>



</body>
</html>

