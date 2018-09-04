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
  <title>forward 原始页面</title>
</head>
<body>

<h3>forward 原始页面</h3>
<jsp:forward page="forward-target.jsp">
  <jsp:param name="age" value="39"/>
</jsp:forward>

</body>
</html>
