<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Map" %><%--
  Created by IntelliJ IDEA.
  User: dongdong
  Date: 2018/9/7
  Time: 上午10:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="mytag" uri="http://www.example.com/mytaglib" %>
<%@ taglib prefix="myfunction" uri="http://www.example.com/myfunctionlib" %>
<%@ taglib prefix="tagfile" tagdir="/WEB-INF/tags" %>

<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>

  <h3>第一个 Servlet</h3>

  <a href="/firstservlet">第一个 Servlet</a>

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

  <h3>表达式语言支持的算术运算符和逻辑运算符</h3>
  <table border="1">
    <tr>
      <td>表达式语言</td>
      <td>计算结果</td>
    </tr>
    <tr>
      <td>直接输出常量: \${1}</td>
      <td>${1}</td>
    </tr>
    <tr>
      <td>计算加法：\${1.2 + 2.3}</td>
      <td>${1.2 + 2.3}</td>
    </tr>
    <tr>
      <td>计算减法：\${1.2E4 + 1.4}</td>
      <td>${1.2E4 + 1.4}</td>
    </tr>
    <tr>
      <td>计算加法：\${-4 - 2}</td>
      <td>${-4 - 2}</td>
    </tr>
    <tr>
      <td>计算乘法：\${21 * 2}</td>
      <td>${21 * 2}</td>
    </tr>
    <tr>
      <td>计算除法：\${3 / 4}</td>
      <td>${3 / 4}</td>
    </tr>
    <tr>
      <td>计算除法：\${3 div 4}</td>
      <td>${3 div 4}</td>
    </tr>
    <tr>
      <td>计算除法：\${3/0}</td>
      <td>${3/0}</td>
    </tr>
    <tr>
      <td>计算求余：\${10%4}</td>
      <td>${10%4}</td>
    </tr>
    <tr>
      <td>计算求余：\${10 mod 4}</td>
      <td>${10 mod 4}</td>
    </tr>
    <tr>
      <td>计算三目运算符：\${(1==2) ? 3 : 4}</td>
      <td>${(1==2) ? 3 : 4}</td>
    </tr>
  </table>

  <table border="1">
    <tr>
      <td>比较运算符</td>
      <td>计算结果</td>
    </tr>
    <tr>
      <td>\${1 &lt; 2} or \${1 lt 2}</td>
      <td>${1 < 2} or ${1 lt 2}</td>
    </tr>
    <tr>
      <td>\${4.0 &lt;= 3 } or \${4.0 le 3}</td>
      <td>${4.0 <= 3} or ${4.0 le 3}</td>
    </tr>
    <tr>
      <td>\${1 &gt; (4/2)} or \${1 gt (4/2)}</td>
      <td>${1 > (4/2)} or ${1 gt (4/2)}</td>
    </tr>
    <tr>
      <td>\${4.0 &gt;= 3 } or \${4.0 ge 3}</td>
      <td>${4.0 >= 3} or ${4.0 ge 3}</td>
    </tr>
    <tr>
      <td>\${100.0 == 100 } or \${100.0 eq 100}</td>
      <td>${100.0 == 100} or ${100.0 eq 100}</td>
    </tr>
    <tr>
      <td>\${(10*10) != 100} or \${(10*10) ne 100}</td>
      <td>${(10*10) != 100} or ${(10*10) ne 100}</td>
    </tr>
    <tr>
      <td>\${'a' &lt; 'b'}</td>
      <td>${'a' < 'b'}</td>
    </tr>
    <tr>
      <td>\${'a' &gt; 'b'}</td>
      <td>${'a' > 'b'}</td>
    </tr>
    <tr>
      <td>\${'4' &gt; 3}</td>
      <td>${'4' > 3}</td>
    </tr>
  </table>

  <h3>表达式语言 - 内置对象</h3>

  <form action="implicit-objects.jsp" method="post">
    请输入你的姓名： <input type="text" name="name" value="${param['name']}" /> <br/>
    <input type="submit" value="提交" />
  </form>

  <h3>使用自定义函数</h3>
  \${myfunction:reserve("Welcome you!")} : ${myfunction:reserve("Welcome you!")} <br>
  \${myfunction:countChar("Welcome you!")} : ${myfunction:countChar("Welcome you!")}<br>

  <h3>使用 TagFile 自定义标签</h3>
  <% request.setAttribute("ccc", list); %>
  <tagfile:iterator bgColor="#991199" cellColor="119911" title="迭代标签" bean="list" />

  <h3>使用使用异步处理</h3>
  <a href="/async">使用异步处理</a>

  <h3>上传文件</h3>
  <a href="/uploadfile.jsp">上传文件</a>
  </body>

  <h3>使用 Web 模块 - 重构 Servlet Hello 项目</h3>
  1. 将自定义标签相关的代码和配置迁移到 mytags 项目 - 简单的 Java 项目， Servlet Hello 项目 只需要依赖 mytags.jar 包 <br>
  2. 新建 Java工具类项目 - utils 项目 - 简单的 Maven 项目， Servlet Hello 项目 依赖utils.jar 包

  <h3>在线用户</h3>
  <table border="1">
    <%
      Map<String,String> online = (Map<String,String>)application.getAttribute("online");
      for (String sessionId : online.keySet()) {
    %>
    <tr>
      <td><%= sessionId%></td>
      <td><%= online.get(sessionId)%></td>
    </tr>
    <%}%>
  </table>
</html>
