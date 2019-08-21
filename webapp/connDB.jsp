<%--
  Created by IntelliJ IDEA.
  User: howard
  Date: 18/9/3
  Time: 23:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" errorPage="error.jsp" %>
<%@ page import="java.sql.*" %>
<html>
<head>
  <title>$Title$</title>
</head>
<body>
<%--mysql--%>

<%
  String url = "jdbc:mysql://localhost:3306/testdb" ;
  String username = "root" ;
  String password = "123456" ;


  Class.forName("com.mysql.jdbc.Driver");

  Connection con = DriverManager.getConnection(url, username, password);

  Statement statement = con.createStatement();
  ResultSet rs = statement.executeQuery("select * from user");

%>
<table>
  <%
    while (rs.next()) {
  %>
  <tr>
    <td><%=rs.getInt(1)%></td>
    <td><%=rs.getString(2)%></td>
    <td><%=rs.getString(3)%></td>
  </tr>
  <%
    }
  %>
</table>

</body>
</html>
