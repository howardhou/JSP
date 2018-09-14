package com.example;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.ResultSet;

//Servlet 作为 Controller
@WebServlet(name = "loginservlet", urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        System.out.println("call service mothod of LoginServlet");

        String errMsg = "";

        //Servlet 本身并不输出响应到客户端，因此必须将请求转发
        RequestDispatcher rd;
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        DbDao db = new DbDao("com.mysql.jdbc.Driver", "jdbc:mysql://localhost:3306/testdb", "root", "123456");

        try {
            ResultSet rs = db.query("select password FROM testdb.user where name = ?" , username);

            if (rs.next()){
                if(rs.getString("password").equals(password)){
                    HttpSession session = req.getSession(true);
                    session.setAttribute("name", username);
                    rd = req.getRequestDispatcher("/welcome.jsp");
                    rd.forward(req, resp);
                }
                else {
                    errMsg += "您的用户名或密码不正确，请重新输入";
                }
            }
            else {
                errMsg += "您的用户名不存在，请先注册";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        if (errMsg != null && !errMsg.equals("")){
            rd = req.getRequestDispatcher("/login.jsp");
            req.setAttribute("error", errMsg);
            rd.forward(req,resp);
        }
    }
}
