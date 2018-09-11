<%--
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

  <h3>带属性的自定义标签，查询mysql</h3>
  <mytag:query driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/testdb" username="root" password="123456" sql="SELECT * FROM user" />
  </body>
</html>
