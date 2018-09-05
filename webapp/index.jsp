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

  <h3> 访问 jsp 声明： <\%! 声明部分 %> </h3>
  <% out.println(count++); %> <br>
  <% out.println(info()); %> <br>

  <h3> jsp 输出表达式：<\%= 表达式 %> </h3>
  <%= count++ %> <br>
  <%= info() %> <br>

  <h3> JSP 脚本：<\% 脚本 %> </h3>
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

  <h3>使用 include 编译指令，静态引入页面</h3>
  <%@include file="staticInclude.jsp"%> <br>

  <h3>使用 jsp:forward 动作指令，实现页面转发</h3>
  <form id="login" method="post" action="forward.jsp">
    <input type="text" name="username" />
    <input type="submit" value="登录"/>
  </form>

  <h3>使用 jsp:include 动作指令，动态引入JSP页面</h3>
  <jsp:include page="forward-target.jsp">
    <jsp:param name="age" value="27"/>
  </jsp:include>

  <h3>使用 jsp:useBean 动作指令，初始化一个 Java 实例</h3>
  <%--除了实例化 JavaBean 之外， 还会将实例放入 page 范围内--%>
  <%--需要对 User.java 进行编译，才能对Web起作用: `javac User.java`--%>
  <jsp:useBean id="user" class="com.rongzi.User" type="com.rongzi.User" scope="page" />
  <jsp:setProperty name="user" property="name" value="Hou dongdong" />
  <jsp:getProperty name="user" property="name" /> <br>

  <h3>可以使用如下代码代替 jsp:useBean , jsp:setProperty , jsp:getProperty 动作指令</h3>
  <% com.rongzi.User user2 = new com.rongzi.User();
    user2.setName("howard hou");
    //将 user2 放入到 page 范围中
    pageContext.setAttribute("user2", user2);
  %>
  <%= user2.getName()%> <br>

  <h3>使用application内置对象，保存变量</h3>
  <% application.setAttribute("count", count); %>

  <h3>使用application内置对象，从配置中获取参数</h3>
  User Name : <%= application.getInitParameter("username") %><br>
  Password : <%= application.getInitParameter("password") %><br>

  <h3>使用 config 内置对象，获取JSP页面的 servlet 名称</h3>
  <%= config.getServletName() %>

  <h3>使用 pageContext 内置对象，获取和设置共享数据</h3>
  <%
    // 使用 pageContext 内置对象，设置page变量，存储在 默认的 page 范围内
    pageContext.setAttribute("page", "hello");
    // 使用 request 内置对象，设置 request 变量， 存储在 request 范围内
    request.setAttribute("request","hello request");
    // 使用 pageContext 内置对象，设置 request2 变量，存储在 默认的 request 范围内
    pageContext.setAttribute("request2", "hello request 2", pageContext.REQUEST_SCOPE);
    // 使用 session 内置对象，设置 session 变量， 存储在 session 范围内
    session.setAttribute("session","hello session");
    // 使用 pageContext 内置对象，设置 session2 变量，存储在 默认的 session 范围内
    pageContext.setAttribute("session2", "hello session 2", pageContext.SESSION_SCOPE);
    // 使用 application 内置对象，设置 application 变量， 存储在 application 范围内
    application.setAttribute("application","hello application");
    // 使用 pageContext 内置对象，设置 application2 变量，存储在 默认的 application 范围内
    pageContext.setAttribute("application2", "hello application 2", pageContext.APPLICATION_SCOPE);
    // 获取个范围内的变量
    out.println("page 变量： "+ pageContext.getAttribute("page") + "<br>");
    out.println("request 变量： "+ request.getAttribute("request") + "<br>");
    out.println("request2 变量： "+ request.getAttribute("request2") + "<br>");
    out.println("session 变量： "+ pageContext.getAttribute("session",pageContext.SESSION_SCOPE) + "<br>");
    out.println("session2 变量： "+ pageContext.getAttribute("session2",pageContext.SESSION_SCOPE) + "<br>");
    out.println("application 变量： "+ application.getAttribute("application") + "<br>");
    out.println("application2 变量： "+ pageContext.getAttribute("application2",pageContext.APPLICATION_SCOPE) + "<br>");
  %>

  </body>
</html>
