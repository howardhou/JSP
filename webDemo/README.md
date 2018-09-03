# webapp

- 将 webapp 项目复制到 Tomcat 的 webapps 目录下就可以运行

- 一个简单的JSP动态页面
	1. JSP本质是servlet, 一个特殊的JAVA类，每个JSP页面都会由servlet容器（Tomcat）生成对应 Servlet 的 java 文件和 classes 文件
	2. Tomcat编译后会生成两个文件：index_jsp.java 和 index_jsp.classes, 路径在：<TOMCAT_HOME>/work/Catalina/localhost/webapp/org/apache/jsp
	3. JSP页面的第一个访问者，比较慢，因为必须等JSP被编译成servlet
	4. JSP的访问者（浏览器），接收到的是HTML界面， 和JAVA无关