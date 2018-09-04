<%--
  Created by IntelliJ IDEA.
  User: howard
  Date: 18/9/3
  Time: 23:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="error.jsp" %>
<%--Page指令的info属性--%>
<%@ page info="this is a jsp page"%>
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

  <h3> 一个简单的JSP动态界面 </h3>
  现在时间是：<% out.println(new java.util.Date());%> <br>

  <% for (int i =0; i< 3; i++){ out.println("<font size ='"+i+"'>"); %>
  Java EE </font> <br>
  <% } %>

  <h3> 访问 jsp 声明： <\%! 声明部分 \%> </h3>
  <% out.println(count++); %> <br>
  <% out.println(info()); %> <br>

  <h3> jsp 输出表达式：<\%= 表达式 \%> </h3>
  <%= count++ %> <br>
  <%= info() %> <br>

  <h3> JSP 脚本：<\% 脚本 \%> </h3>
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

  <h3>输出 Info 信息</h3>
  <%= getServletInfo() %> <br>

  <h3>异常代码</h3>
  <%--<% int a = 5 / 0 ; %>--%>

  <h3>使用 include 编译指令导入页面</h3>
  <%@include file="staticInclude.jsp"%> <br>

  <h3>使用 jsp:forward 动作指令，实现页面转发</h3>
  <form id="login" method="post" action="forward.jsp">
    <input type="text" name="username" />
    <input type="submit" value="登录"/>
  </form>


  </body>
</html>
