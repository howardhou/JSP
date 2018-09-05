<%--
  Created by IntelliJ IDEA.
  User: howard
  Date: 18/9/3
  Time: 23:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<html>
<head>
  <title>错误提示页面</title>
</head>
<body>

<%--提醒用户系统出现异常--%>
<b>系统出现异常</b> <br>

异常类型：<%= exception.getClass() %><br>
异常信息：<%= exception.getMessage() %><br>

</body>
</html>
