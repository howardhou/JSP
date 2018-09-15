package com.example;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;

@WebServlet(name = "uploadfile", urlPatterns = "/upload")
// 处理文件上传的Servlet 要添加此注解
@MultipartConfig
public class UploadFileServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        super.service(req, resp);
        resp.setContentType("text/html;charset=utf-8");
        PrintWriter out = resp.getWriter();

        String fileName = req.getParameter("name");
        Part part = req.getPart("file");

        out.println("上传文件的类型为： " +part.getContentType() + "<br>");
        out.println("上传文件的大小为： " +part.getSize() + "<br>");
        // 获取该文件上传域的 Header Name
        Collection<String> headerNames = part.getHeaderNames();
        for (String headerName : headerNames) {
            out.println(headerName + "----> " +part.getHeader(headerName) +"<br>");
        }

        // 将文件写入到服务器
        part.write(getServletContext().getRealPath("/uploadFiles") + "/" + fileName);
    }

    @Override
    public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
        super.service(req,res);
    }
}
