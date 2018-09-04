<%--
  Created by IntelliJ IDEA.
  User: howard
  Date: 18/9/3
  Time: 23:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="" %>
<html>
<head>
  <title>forward 目标页面</title>
</head>
<body>

<%--获取Age 参数--%>
Age = <%= request.getParameter("age") %> <br>

<%= request.getParameter("username") %> <br>
</body>
</html>
