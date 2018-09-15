<%--
  Created by IntelliJ IDEA.
  User: howard
  Date: 18/9/15
  Time: 18:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>内置对象</title>
</head>
<body>
<%
    session.setAttribute("aaa", "abc");

    Cookie cookie = new Cookie("bbb", "yeeku");
    cookie.setMaxAge(24*3600);
    response.addCookie(cookie);
%>

<table border="1">
    <tr>
        <td>功能</td>
        <td>表达式语句</td>
        <td>计算结果</td>
    </tr>
    <tr>
        <td>取得请求参数值</td>
        <td>\${param.name}</td>
        <td>${param.name}</td>
    </tr>
    <tr>
        <td>取得请求参数值</td>
        <td>\${param["name"]}</td>
        <td>${param["name"]}</td>
    </tr>
    <tr>
        <td>取得请求头的值</td>
        <td>\${header.host}</td>
        <td>${header.host}</td>
    </tr>
    <tr>
        <td>取得请求头的值</td>
        <td>\${header["accept"]}</td>
        <td>${header["accept"]}</td>
    </tr>
    <tr>
        <td>取得Web应用的初始化参数值</td>
        <td>\${initParam["sql"]}</td>
        <td>${initParam["sql"]}</td>
    </tr>
    <tr>
        <td>取得session的属性值</td>
        <td>\${sessionScope["aaa"]}</td>
        <td>${sessionScope["aaa"]}</td>
    </tr>
    <tr>
        <td>取得 cookie 的值</td>
        <td>\${cookie["bbb"].value}</td>
        <td>${cookie["bbb"].value}</td>
    </tr>
</table>
</body>
</html>
