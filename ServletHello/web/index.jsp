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
    list.add("www.example.com");
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

  <h3>以页面片段作为属性的标签</h3>
  <mytag:fragment>
    <jsp:attribute name="fragment">
      <%--下面是动态的JSP页面片段--%>
      ${pageContext.request.remoteAddr}
    </jsp:attribute>
  </mytag:fragment>

  <h3>动态属性的标签: 标签的属性的个数是不确定的</h3>
  <mytag:dynamic name="东方融资网" url="www.rongzi.com"/><br>
  <mytag:dynamic 项目名="融助手" 工时="88.8" 负责人="厉运兴，樊俊坤" 上线时间="2018-09-12"/><br>
  </body>

</html>
