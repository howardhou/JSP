package com.rongzi.tags;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;
import java.io.Writer;
import java.sql.*;

public class QueryTag extends SimpleTagSupport{
    private String driver;
    private String url;
    private String username;
    private String password;
    private String sql;

    public String getDriver() {
        return driver;
    }

    public void setDriver(String driver) {
        this.driver = driver;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSql() {
        return sql;
    }

    public void setSql(String sql) {
        this.sql = sql;
    }

    @Override
    public void doTag() throws JspException, IOException {
        System.out.println("t: query tag");

        Writer out = getJspContext().getOut();

        out.write("<table border='1' bgColor='#9999cc' width='400'>");

        out.write("<tr><td>");
        out.write(driver);
        out.write("</td></tr>");

        out.write("<tr><td>");
        out.write(url);
        out.write("</td></tr>");

        out.write("<tr><td>");
        out.write(username + " / " + password);
        out.write("</td></tr>");

        out.write("<tr><td>");
        out.write(sql);
        out.write("</td></tr>");

        out.write("</table>");

        //查询数据库不应该放在自定义标签中，会被调用3次，导致空指针
        /*
        Connection connection = null;
        Statement statement = null;
        ResultSet rs = null;
        ResultSetMetaData rsmd = null;

        try {
            Class.forName(driver);

            connection = DriverManager.getConnection(url,username,password);

            statement = connection.createStatement();

            rs = statement.executeQuery(sql);

            rsmd = rs.getMetaData();

            int columnCount = rsmd.getColumnCount();

            Writer out = getJspContext().getOut();

            out.write("<table border='1' bgColor='#9999cc' width='400'>");

            while (rs.next()){
                out.write("<tr>");

                for (int i = 1; i <= columnCount; i++){
                    out.write("<td>");
                    out.write(rs.getString(i));
                    out.write("</td>");
                }
                out.write("</tr>");
            }

            out.write("</table>");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new JspException("自定义标签错误" + e.getMessage());
        }
        catch (SQLException e){
            e.printStackTrace();
            throw new JspException("自定义标签错误" + e.getMessage());
        }
        finally {
            try {
                if (rs != null){
                    rs.close();
                }
                if (statement !=null){
                    statement.close();
                }
                if (connection !=null){
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
*/
    }
}
