<%@ page language="java"  contentType="text/html; charset=GB2312" %>
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
        <div class="form-group" >
          <input type="text" class="form-control" placeholder="������ҳ��URL" name="input_url">
        </div>
        <button type="submit" class="btn btn-default">��ʼʶ��͹���</button>
      </form>
    </div>
  </div>
</nav>

</body>
</html>
