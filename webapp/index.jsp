<%--
  Created by IntelliJ IDEA.
  User: howard
  Date: 18/9/3
  Time: 23:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <%-- jsp 声明 --%>
  <%!
    public  int count;
    public String info(){
      return  "Hello World...";
    }
  %>

  <body>
  学习 Java Web 知识<br>

  现在时间是：<% out.println(new java.util.Date());%> <br>

  <% for (int i =0; i< 3; i++){ out.println("<font size ='"+i+"'>"); %>
  Java EE </font> <br>
  <% } %>

  <%-- 访问 jsp 声明： <%! 声明部分 %> --%>
  <% out.println(count++); %> <br>
  <% out.println(info()); %> <br>

  <%-- jsp 输出表达式：<%= 表达式 %> --%>
  <%= count++ %> <br>
  <%= info() %>

  <%-- JSP 脚本：<% 脚本 %> --%>
  <table border="1" width="300px" bgcolor="#7fffd4">
    <% for (int i=0; i< 5; i++){ %>
    <tr>
      <td>
        循环值：
      </td>
      <td>
        <%=i%>
      </td>
    </tr>
    <% } %>
  </table>
  </body>
</html>
