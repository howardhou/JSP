package com.example.listener;

import javax.servlet.ServletContext;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import java.util.Hashtable;
import java.util.Map;

@WebListener
public class OnlineListener implements HttpSessionListener {

    @Override
    public void sessionCreated(HttpSessionEvent se) {
        HttpSession session = se.getSession();
        ServletContext application = session.getServletContext();

        String sessionid = session.getId();

        if (session.isNew()){

            String user = (String) session.getAttribute("user");

            user = (user == null) ? "游客" : user;

            Map<String, String> online = (Map<String, String>)application.getAttribute("online");
            if (online == null){
                online = new Hashtable<String, String>();
            }
            // 将用户信息放入Map中
            online.put(sessionid, user);
            application.setAttribute("online", online);
        }
    }

    // 当用户与服务器之间session断开时，触发该方法
    @Override
    public void sessionDestroyed(HttpSessionEvent se) {
        HttpSession session = se.getSession();
        ServletContext application = session.getServletContext();

        String sessionId = session.getId();

        Map<String, String> online = (Map<String, String>) application.getAttribute("online");
        if (online != null){
            online.remove(sessionId);
        }
        application.setAttribute("online", online);
    }
}
