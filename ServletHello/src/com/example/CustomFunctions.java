package com.example;

// 1. 开发函数处理类
// 完全可以使用JDK中的类，只要这个类中包括静态方法
public class CustomFunctions {
    public static String reserve(String text){
        return new StringBuffer(text).reverse().toString();
    }

    public static int countChar(String text){
        return text.length();
    }
}
