package com.example;

//需要对 User.java 进行编译，才能对Web起作用: `javac User.java`
public class User {

    private int userid;
    private String name;
    private String sex;

    public User(){
        super();
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    @Override
    public String toString() {
        return "User [userid="+userid+", name="+name+", sex="+sex+"]";
    }
}
