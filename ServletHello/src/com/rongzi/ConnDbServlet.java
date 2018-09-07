package com.rongzi;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
//import com.mysql.jdbc.Driver;

/*
@WebServlet(name = "connDbServlet", urlPatterns = "/conndb", initParams ={
        @WebInitParam(value = "com.mysql.jdbc.Driver",name = "driver"),
        @WebInitParam(value = "jdbc:mysql://localhost:3306/testdb", name = "url"),
        @WebInitParam(name = "username", value = "root"),
        @WebInitParam(name = "password", value = "123456"),
        @WebInitParam(name = "sql", value = "SELECT * FROM user")
//        @WebInitParam(value = "jdbc:mysql://10.40.3.16:3306/bugzilla", name = "url"),
//        @WebInitParam(name = "username", value = "MYSQL"),
//        @WebInitParam(name = "password", value = "sa!@#456"),
//        @WebInitParam(name = "sql", value = "SELECT * FROM products")
})
*/
public class ConnDbServlet extends HttpServlet {

    @Override
    public void init() throws ServletException {
        super.init();
    }

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try {
            // 3种获取 Servlet 配置参数的方法都是一样的
//            String driver = getInitParameter("driver");
//            String url = getInitParameter("url");
//
//            String username = this.getInitParameter("username");
//            String password = this.getInitParameter("password");
//
//            ServletConfig config = getServletConfig();
//            String sql_sentence = config.getInitParameter("sql");

            // 获取 Application 范围内的配置参数 ： https://blog.csdn.net/yakson/article/details/9203231
            String driver = getServletContext().getInitParameter("driver");
            String url = getServletContext().getInitParameter("url");
            String username = getServletContext().getInitParameter("username");
            String password = getServletContext().getInitParameter("password");
            String sql_sentence = getServletContext().getInitParameter("sql");

            Class.forName(driver);

            Connection connection = DriverManager.getConnection(url, username, password);
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql_sentence);
            resp.setContentType("text/html;charSet=utf-8");
            PrintStream out = new PrintStream(resp.getOutputStream());
            out.println("<table bgcolor=\"#9999dd\" border=1 >");

            while (resultSet.next()){
                out.println("<tr>");
                out.println("<td>"+ resultSet.getString(1) +"</td>");
                out.println("<td>"+ resultSet.getString(2) +"</td>");
                out.println("<td>"+ resultSet.getString(3) +"</td>");
                out.println("</tr>");
            }
            out.println("</table>");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
