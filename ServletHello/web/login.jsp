<%--
  Created by IntelliJ IDEA.
  User: dongdong
  Date: 2018/9/7
  Time: 下午6:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View</title>
</head>
<body>
<span style="color: red;font-weight: bold">
    <% if (request.getAttribute("error") != null){
        out.println(request.getAttribute("error") + "<br>");
    }
    %>
</span>

请输入用户名和密码：
<form method="post" action="/login">
    用户名： <input type="text" name="username" /> <br>
    密码： <input type="password" name="password" /> <br>
    <input type="submit" value="登录" /> <br>
</form>
</body>
</html>
