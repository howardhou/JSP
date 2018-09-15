<%@ tag pageEncoding="utf-8" import="java.util.List" %>

<%@ attribute name="bgColor"%>
<%@ attribute name="cellColor"%>
<%@ attribute name="title"%>
<%@ attribute name="bean"%>

<table border="1" bgcolor="${bgColor}">
    <tr>
        <td><b>${title}</b></td>
    </tr>
    <%
        List<String> list = (List<String>) request.getAttribute("ccc");
        for (Object item : list) { %>
            <tr>
                <td bgcolor="${cellColor}">
                    <%= item%>
                </td>
            </tr>
        <%}%>
</table>