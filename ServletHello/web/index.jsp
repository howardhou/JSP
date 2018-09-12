<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: dongdong
  Date: 2018/9/7
  Time: 上午10:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="mytag" uri="http://www.rongzi.com/mytaglib" %>

<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>

  <h3>显示自定义标签内容</h3>
  <mytag:helloWorld/><br>

  <h3>带属性的自定义标签，不建议查询mysql，会被调用3次</h3>
  <mytag:query driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/testdb" username="root" password="123456" sql="SELECT * FROM user" />

  <h3>带标签体的自定义标签 - 迭代标签</h3>
  <%
    List<String> list = new ArrayList<String>();
    list.add("疯狂Java");
    list.add("www.rongzi.com");
    list.add("java");
    pageContext.setAttribute("list", list);
  %>

  <table border="1" bgcolor="#a52a2a" width="300">
    <mytag:iterator collection="list" item="item">
      <tr>
        <td>${pageScope.item}</td>
      </tr>
    </mytag:iterator>
  </table>

  </body>

</html>
