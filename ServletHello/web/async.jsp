<%--
  Created by IntelliJ IDEA.
  User: howard
  Date: 18/9/15
  Time: 22:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="mytag" uri="http://www.rongzi.com/mytaglib" %>

${requestScope.books} <br>

<%
    out.println("业务调用结束时间： "+ new java.util.Date());
//    此处会抛出异常：原因可能是处于dispatched异步状态下的request调用asyncComplete()是无效的
//    https://www.tuicool.com/articles/yEVVRj
    AsyncContext asyncContext = request.getAsyncContext();
    asyncContext.complete();
%>