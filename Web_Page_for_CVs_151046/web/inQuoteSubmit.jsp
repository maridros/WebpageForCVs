<%-- 
    Document   : inQuoteSubmit
    Created on : 16 Μαϊ 2017, 2:13:16 μμ
    Author     : Maraki
--%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Επεξεργασία Προφίλ</title>
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
            <h1>ΕΠΕΞΕΡΓΑΣΙΑ ΠΡΟΦΙΛ</h1>
        </header>
        <p></p>
        <%
            String U = session.getAttribute("UPass").toString();
            String t = request.getParameter("quote");
            Class.forName("com.mysql.jdbc.Driver");
            String DB = "jdbc:mysql://localhost:3306/STUDENT_WEBCV_GREEK?user=root&password=maria";
            Connection myConnection = DriverManager.getConnection(DB);
            Statement SMT = myConnection.createStatement();

            String sql = "insert into stud_quotes(uname, quote) values ('" + U + "', '" + t + "')";

            SMT.executeUpdate(sql);
            out.println("Η άποψή σας αποθηκεύτηκε με επιτυχία!");
        %>
        <P></P>
        <a href="MyProfil.jsp">Επιστροφή στο Προφίλ μου</a>
        <%
            SMT.close();
            myConnection.close();
        %>
    </body>
</html>