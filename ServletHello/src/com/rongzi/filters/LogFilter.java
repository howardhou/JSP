package com.rongzi.filters;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.logging.LogRecord;

@WebFilter(filterName = "log", urlPatterns = {"/*"})
public class LogFilter implements Filter {

    // FilterConfig 用于访问 Filter 的配置信息
    private FilterConfig config;

    // 用于完成 Filter 的初始化
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.config = filterConfig;
    }

    // 在 Filter销毁之前，完成资源的回收
    @Override
    public void destroy() {
        this.config = null;
    }

    // 实现过滤功能， 是为每个请求和响应增加的额外处理
    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        // -------------- 对用户请求进行预处理 -------------
        // 获取 ServletContext 对象，用于记录日志
        ServletContext context = this.config.getServletContext();
        long before = System.currentTimeMillis();
        System.out.println("开始过滤...");
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        System.out.println("Filter 已经截获到用户的请求地址：" + request.getServletPath());

        // Filter 只是链式处理，请求依然放行到目的地址
        // doFilter 执行之前 就是请求的预处理， 执行之后，就是后处理
        // 如果要检查权限，当权限不足时，可以直接重定向即可
        filterChain.doFilter(servletRequest, servletResponse);

        // -------------- 响应进行后处理 -------------
        long after = System.currentTimeMillis();
        System.out.println("过滤结束");
        System.out.println("请求被定位到" + request.getRequestURI() + " 所花的时间为： " + (after - before));
    }
}
