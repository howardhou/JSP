package com.example;

import java.sql.*;

//就是把访问数据库的代码封装起来的类： https://blog.csdn.net/whycmpx/article/details/78901875
//Model 或 JavaBean 或 Dao
public class DbDao {
    private Connection connection;
    private String driver;
    private String url;
    private String username;
    private String password;

    public DbDao(String driver, String url, String username, String password){
        this.driver = driver;
        this.url = url;
        this.username = username;
        this.password = password;
    }

    public void setDriver(String driver) {
        this.driver = driver;
    }

    public String getDriver() {
        return driver;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getUrl() {
        return url;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUsername() {
        return username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPassword() {
        return password;
    }

    public Connection getConnection() throws Exception {
        if (connection ==null){
            Class.forName(this.driver);
            connection = DriverManager.getConnection(url, username, password);
        }

        return connection;
    }

    public boolean insert(String sql, Object... args) throws Exception {
        PreparedStatement preparedStatement = getConnection().prepareStatement(sql);
        for (int i=0; i< args.length; i++){
            preparedStatement.setObject(i+1, args[i]);
        }
        if (preparedStatement.executeUpdate() != 1){
            return false;
        }
        else {
            return true;
        }
    }

    public ResultSet query(String sql, Object... args) throws Exception{
        PreparedStatement preparedStatement = getConnection().prepareStatement(sql);
        for (int i=0; i< args.length; i++){
            preparedStatement.setObject(i+1, args[i]);
        }

        return preparedStatement.executeQuery();
    }

    public void modify(String sql, Object... args) throws  Exception{
        PreparedStatement preparedStatement = getConnection().prepareStatement(sql);
        for (int i=0; i< args.length; i++){
            preparedStatement.setObject(i+1, args[i]);
        }

        preparedStatement.executeUpdate();
        preparedStatement.close();
    }

    public void closeConn() throws Exception{
        if (connection != null && !connection.isClosed()){
            connection.close();
        }
    }
}
