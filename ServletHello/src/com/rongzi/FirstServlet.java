package com.rongzi;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintStream;

//@WebServlet(name = "firstservlet", urlPatterns = "/firstservlet")
public class FirstServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        //super.service方法要去掉，否则会报错：Method Not Allowed， https://stackoverflow.com/questions/5370633/http-status-405-http-method-get-is-not-supported-by-this-url
//        super.service(req, resp);

        System.out.println("service method is called");

        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=UTF-8");

        String name = req.getParameter("name");
        String gender = req.getParameter("gender");
        String[] color = req.getParameterValues("color");
        String country = req.getParameter("country");

        // Servlet 没有内置对象， 这是理所当然
        // HTML标签必须由页面输出流输出
        PrintStream out = new PrintStream(resp.getOutputStream());
        out.println("<html>");
        out.println("<head>");
        out.println("<title>Servlet 测试</title>");
        out.println("</head>");
        out.println("<body>");

        out.println("你的姓名： " + name + "<br>");
        out.println("你的性别： " + gender + "<br>");
        out.println("你喜欢的颜色： ");
        for (String c:color){
            out.println(c + " ");
        }
        out.println(" <br>");
        out.println("你来自的国家： " + country + "<br>");

        out.println("</body>");
        out.println("</html>");
    }
}
