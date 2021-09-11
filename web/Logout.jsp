<%-- 
    Document   : Logout
    Created on : 25 Μαϊ 2017, 10:02:26 μμ
    Author     : Maraki
--%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            session.invalidate();
            response.sendRedirect("index.html");
        %> 
    </body>
</html>
