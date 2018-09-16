package com.example.tags;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.DynamicAttributes;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;
import java.util.ArrayList;

public class DynamicTag extends SimpleTagSupport implements DynamicAttributes {

    // 保存每个属性名的集合
    private ArrayList<String> keys = new ArrayList<String>();
    // 保存每个属性值的集合
    private ArrayList<Object> values = new ArrayList<Object>();

    @Override
    public void doTag() throws JspException, IOException {
        JspWriter out = getJspContext().getOut();

        out.println("<ol>");
        for (int i =0; i < keys.size(); i++){
            String key = keys.get(i);
            Object value = values.get(i);
            out.println("<li>" + key + " = " + value + "</li>");
        }
        out.println("</ol>");
    }

    // 动态添加属性名和属性值
    @Override
    public void setDynamicAttribute(String s, String s1, Object o) throws JspException {
        // 添加属性名
        keys.add(s1);
        // 添加属性值
        values.add(o);
    }
}
