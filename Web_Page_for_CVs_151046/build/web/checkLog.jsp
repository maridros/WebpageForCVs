<%-- 
    Document   : checkLog
    Created on : 3 Μαϊ 2017, 2:03:33 πμ
    Author     : Maraki
--%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Είσοδος</title>
        <style>
            body {
                text-align: center;
                margin:0;
                background-color: #e1e1ea;
            }
            header {
                padding: 1em;
                color: white;
                background-color: #004d4d;
                clear: left;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <header>
            <h1>ΕΙΣΟΔΟΣ ΣΤΟ ΠΡΟΦΙΛ ΜΟΥ</h1>
        </header>
        <p></p>
        <%
            Boolean found;
            String x = request.getParameter("y");
            String p = request.getParameter("k");
            Class.forName("com.mysql.jdbc.Driver");
            String DB = "jdbc:mysql://localhost:3306/STUDENT_WEBCV_GREEK?user=root&password=maria";
            Connection myConnection = DriverManager.getConnection(DB);
            Statement SMT = myConnection.createStatement();
            String sql = "SELECT * FROM user WHERE Uname='" + x + "'AND Upass='" + p + "' ";
            ResultSet rs = SMT.executeQuery(sql);
            found = rs.first();
            if (found) {
                session.setAttribute("UPass", x);
                response.sendRedirect("MyProfil.jsp");
            } else {
                out.println("Η ΕΙΣΟΔΟΣ ΑΠΕΤΥΧΕ!");%><P></P>
        <a href="login.jsp">Προσπαθήστε ξανά</a><%
            }
            SMT.close();
            myConnection.close();
        %>
    </body>
</html>