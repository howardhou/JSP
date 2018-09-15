package com.example;

import com.example.listener.MyAsyncListener;

import javax.servlet.AsyncContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

@WebServlet(urlPatterns =  "/async", asyncSupported = true)
public class AsyncServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        super.doGet(req, resp);
        resp.setContentType("text/html;charset=utf-8");
        PrintWriter out = resp.getWriter();

        out.println("<title>异步调用</title>");
        out.println("进入 Servlet 的时间： "+ new Date() +"<br>");
        out.flush();

        AsyncContext asyncContext = req.startAsync();
        asyncContext.setTimeout(30*1000);
        asyncContext.start(new AsyncExecutor(asyncContext));

//        为异步调用注册监听器
        asyncContext.addListener(new MyAsyncListener());

        out.println("结束 Servlet 的时间： " + new Date() + "<br>");
        out.flush();
    }
}
