package com.rongzi.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextAttributeEvent;
import javax.servlet.ServletContextAttributeListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class MyServletContextAttributeListener implements ServletContextAttributeListener{
    // 当程序向 application 范围内添加属性时，触发该方法
    @Override
    public void attributeAdded(ServletContextAttributeEvent event) {
        ServletContext application = event.getServletContext();

        String name = event.getName();
        Object value = event.getValue();

        System.out.println("l: "+ application + " 范围内添加了名为 " + name + " 值为 " +value + " 的属性");
    }

    // 当程序从 application 范围内移除属性时，触发该方法
    @Override
    public void attributeRemoved(ServletContextAttributeEvent event) {

        ServletContext application = event.getServletContext();

        String name = event.getName();
        Object value = event.getValue();

        System.out.println("l: "+ application + " 范围内名为 " + name + " 值为 " +value + " 的属性被删除了");

    }

    // 当 application 范围内的属性被替代时，触发该方法
    @Override
    public void attributeReplaced(ServletContextAttributeEvent event) {
        ServletContext application = event.getServletContext();

        String name = event.getName();
        Object value = event.getValue();

        System.out.println("l: "+ application + " 范围内名为 " + name + " 值为 " +value + " 的属性被替换了");
    }
}
