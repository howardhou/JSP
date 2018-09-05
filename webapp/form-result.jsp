<%--
  Created by IntelliJ IDEA.
  User: howard
  Date: 18/9/3
  Time: 23:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="error.jsp" pageEncoding="utf-8" %>
<%@ page import="java.util.*" %>
<html>

<head>
  <title>获取请求头，请求参数</title>
</head>
<body>

<%
  //  设置解码方式， 必须放在最前面，否则会无效 ： http://www.aichengxu.com/other/9234452.htm
  request.setCharacterEncoding("utf-8");

  // 获取所有请求头的名称
  Enumeration<String> headerNames = request.getHeaderNames();

  while (headerNames.hasMoreElements()){
      String headerName = headerNames.nextElement();
      //获取指定请求头的值
      out.println(headerName +" -- " + request.getHeader(headerName) + "<br>");
  }

  out.println("<hr/>");


//  获取请求参数的值
  String name = request.getParameter("name");
  String gender = request.getParameter("gender");
// 当参数的值为多个时， 获取请求参数的值（数组）
  String[] color = request.getParameterValues("color");
  String country = request.getParameter("country");

  Map map = request.getParameterMap();
  Enumeration enumeration = request.getParameterNames();
%>
  你的姓名：<%= name%> <br>
  你的性别：<%= gender%> <br>
  你喜欢的颜色：<% for (String c:color) { out.println(c); }%> <br>
  你来自的国家：<%= country%> <br>
<%= map %> <br>
<%= enumeration %> <br>
<%--<% for (String c:map) { out.println(c); }%> <br>--%>
<%--<% for (String c:enumeration) { out.println(c); }%> <br>--%>

</body>
</html>
