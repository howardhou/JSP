package com.rongzi.filters;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName = "authority", urlPatterns = "/*",initParams = {
        @WebInitParam(name = "encoding", value = "UTF-8"),
        @WebInitParam(name = "loginPage", value = "/login.jsp"),
        @WebInitParam(name = "login", value = "/login")
})
public class AuthorityFilter implements Filter {
    //获取配置信息
    private FilterConfig config;
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.config = filterConfig;
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        // 获取配置信息
        String encoding = config.getInitParameter("encoding");
        String loginPage = config.getInitParameter("loginPage");
        String login = config.getInitParameter("login");

        System.out.println("AuthorityFilter 开始过滤...");

        servletRequest.setCharacterEncoding(encoding);
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        // 获取Session
        HttpSession session = request.getSession(true);
        // 获取客户请求的页面
        String requestPath = request.getServletPath();

        System.out.println("AuthorityFilter session = " + session.getAttribute("name"));

        if (session.getAttribute("name") == null && !requestPath.endsWith(loginPage) && !requestPath.endsWith(login)){
            request.setAttribute("error", "您还没有登录");
            // forward 到登录页面
            request.getRequestDispatcher(loginPage).forward(servletRequest, servletResponse);
        }
        else {
            // 放行请求
            filterChain.doFilter(servletRequest, servletResponse);
        }
    }

    @Override
    public void destroy() {
        this.config = null;
    }
}
