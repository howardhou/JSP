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
  <title>redirect 原始页面</title>
</head>
<body>

<h3>redirect 原始页面</h3>
<%
  out.println("=============");
  response.sendRedirect("/webapp/forward-target.jsp");
%>

</body>
</html>
