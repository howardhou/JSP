package com.example;

import javax.servlet.AsyncContext;
import javax.servlet.ServletRequest;
import java.util.ArrayList;
import java.util.List;

public class AsyncExecutor implements Runnable {

    private AsyncContext asyncContext = null;

    public AsyncExecutor(AsyncContext asyncContext){
        this.asyncContext = asyncContext;
    }

    @Override
    public void run() {
        try {
            Thread.sleep(5*1000);

            ServletRequest request = asyncContext.getRequest();
            List<String> books = new ArrayList<String>();
            books.add("明朝那些事");
            books.add("三体");
            books.add("青云志");

            request.setAttribute("books", books);
            asyncContext.dispatch("/async.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
