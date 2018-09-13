package com.rongzi.listener;

import javax.servlet.*;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpServletRequest;

@WebListener
public class RequestListener implements ServletRequestListener, ServletRequestAttributeListener {

    // 当用户请求到达、被初始化时触发该方法
    @Override
    public void requestInitialized(ServletRequestEvent sre) {
        HttpServletRequest request = (HttpServletRequest) sre.getServletRequest();
        System.out.println("l: ----- 发向 " + request.getRequestURI() + "请求被初始化 -----");
    }

    // 当用户请求结束、被销毁时触发该方法
    @Override
    public void requestDestroyed(ServletRequestEvent sre) {
        HttpServletRequest request = (HttpServletRequest) sre.getServletRequest();
        System.out.println("l: ----- 发向 " + request.getRequestURI() + "请求被销毁 -----");
    }

    @Override
    public void attributeAdded(ServletRequestAttributeEvent srae) {
        ServletRequest request = srae.getServletRequest();

        String name = srae.getName();
        Object value = srae.getValue();

        System.out.println("l: "+ request + " 范围内添加了名为 " + name + " 值为 " +value + " 的属性");
    }

    @Override
    public void attributeRemoved(ServletRequestAttributeEvent srae) {
        ServletRequest request = srae.getServletRequest();

        String name = srae.getName();
        Object value = srae.getValue();

        System.out.println("l: "+ request + " 范围内名为 " + name + " 值为 " +value + " 的属性被删除了");
    }

    @Override
    public void attributeReplaced(ServletRequestAttributeEvent srae) {
        ServletRequest request = srae.getServletRequest();

        String name = srae.getName();
        Object value = srae.getValue();

        System.out.println("l: "+ request + " 范围内名为 " + name + " 值为 " +value + " 的属性被替换了");
    }
}
