package com.rongzi.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

//@WebListener
public class GetDbConnListener implements ServletContextListener{

    // 在应用启动时触发： 实现打开数据库连接
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext application = sce.getServletContext();
        String driver = application.getInitParameter("driver");
        String url = application.getInitParameter("url");
        String username = application.getInitParameter("username");
        String password = application.getInitParameter("password");

        try {
            Class.forName(driver);

            Connection connection = DriverManager.getConnection(url, username, password);

            application.setAttribute("connection", connection);

            System.out.println("success to contextInitialized to init mysql connection...");

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Listener 中获取数据库连接出现" + e.getMessage());
        }
    }

    // 在应用关闭时触发： 实现关闭数据库连接
    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        ServletContext application = sce.getServletContext();
        Connection connection = (Connection) application.getAttribute("connection");

        System.out.println("success to call contextDestroyed...");

        if (connection != null){
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
