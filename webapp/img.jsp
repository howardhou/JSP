<%--
  Created by IntelliJ IDEA.
  User: howard
  Date: 18/9/3
  Time: 23:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="image/jpeg" language="java" %>
<%@ page import="java.awt.image.*,javax.imageio.*,java.io.*,java.awt.*" %>
<%
  BufferedImage image = new BufferedImage(340,160,BufferedImage.TYPE_INT_RGB);
  Graphics g = image.getGraphics();
  g.fillRect(0,0,400,400);
  g.setColor(new Color(255,0,0));
  g.fillArc(20,20,100,100,30,120);
  g.setColor(new Color(0,255,0));
  g.fillArc(20,20,100,100,150,120);
  g.setColor(new Color(0,0,255));
  g.fillArc(20,20,100,100,270,120);
  g.setColor(new Color(0,0,0));
  ImageIO.write(image, "jpg", response.getOutputStream());
%>
