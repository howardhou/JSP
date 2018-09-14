package com.example.tags;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;
import java.util.Collection;

public class IteratorTag extends SimpleTagSupport {

    // 指定需要被被迭代的集合
    private String collection;

    // 指定迭代集合元素
    private String item;

    public String getCollection() {
        return collection;
    }

    public void setCollection(String collection) {
        this.collection = collection;
    }

    public String getItem() {
        return item;
    }

    public void setItem(String item) {
        this.item = item;
    }

    @Override
    public void doTag() throws JspException, IOException {

        // 获得属性名为collection 的集合
        Collection itemList = (Collection) getJspContext().getAttribute(collection);

        for (Object s : itemList) {
            // 将集合元素设置到 page
            getJspContext().setAttribute(item, s);
            // getJspBody() 返回自定义标签的标签体 ，JSPFragment 对象
            // invoke（）输出标签体的内容
            getJspBody().invoke(null);
        }
    }
}
