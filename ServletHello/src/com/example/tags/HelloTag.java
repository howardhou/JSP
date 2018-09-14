package com.example.tags;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;
import java.util.Date;

public class HelloTag extends SimpleTagSupport {
    @Override
    public void doTag() throws JspException, IOException {
//        super.doTag();
        System.out.println("t: htllo tag");
        getJspContext().getOut().write("Hello World " + new Date());
    }
}
