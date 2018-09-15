<%--
  Created by IntelliJ IDEA.
  User: howard
  Date: 18/9/16
  Time: 00:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>上传文件</title>
</head>
<body>
<%--enctype="multipart/form-data" 意思是可以用来上传文件--%>
<form method="post" action="upload" enctype="multipart/form-data">
    文件名：<input type="text" name="name" id="name" /><br>
    选择文件：<input type="file" id="file" name="file"/><br>
    <input type="submit" value="上传"/>
</form>
</body>
</html>
