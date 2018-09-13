package com.rongzi;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
//位于 JRE下面的 rt.jar包中，属于JDK里面的内容
import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Date;

//只配置loadOnStartup属性，不能生效 ： https://blog.csdn.net/middle544291353/article/details/54645404
//@WebServlet(loadOnStartup = 1)
//添加 urlPatterns 属性，才能生效
//@WebServlet(loadOnStartup = 1, urlPatterns = "/timerservlet")
public class TimerServlet extends HttpServlet {

    @Override
    public void init() throws ServletException {
        super.init();

        System.out.println("s: call init method of TimerServlet");

        ActionListener listener = new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                System.out.println("s: " + new Date());
            }
        };

        Timer timer = new Timer(10000, listener);

        timer.start();
    }
}
