<%-- 
    Document   : RegComplete
    Created on : 2 Μαϊ 2017, 10:19:44 πμ
    Author     : Maraki
--%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Εγγραφή</title>
        <style>
            body {
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
            div {
                margin: 20px;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <header>
            <h1>ΝΕΟ ΠΡΟΦΙΛ</h1>
        </header>
        <div>
            <%
                String D = request.getParameter("Department");
                String F = session.getAttribute("Fac").toString();
                String I = session.getAttribute("Inst").toString();
                String x = session.getAttribute("Uname").toString();
                String y = session.getAttribute("Pass").toString();
                String a = session.getAttribute("Name").toString();
                String b = session.getAttribute("SName").toString();
                String ye = session.getAttribute("Year").toString();
                String da = session.getAttribute("Day").toString();
                String mo = session.getAttribute("Month").toString();
                Class.forName("com.mysql.jdbc.Driver");
                String DB = "jdbc:mysql://localhost:3306/STUDENT_WEBCV_GREEK?user=root&password=maria";
                Connection myConnection = DriverManager.getConnection(DB);
                Statement SMT = myConnection.createStatement();

                String sql = "INSERT INTO user(Uname, Upass, Name, Surname, Department, Faculty, Institution, Birthdate) VALUES ('" + x + "', '" + y + "', '" + a + "', '" + b + "', '" + D + "', '" + F + "', '" + I + "', '" + ye + "/" + mo + "/" + da + "')";
                SMT.executeUpdate(sql);
                out.println("Η εγγραφή σας έγινε με επιτυχία! Καλώς ήρθατε " + x + "!");
            %><P></P>
            <a href="index.html">Επιστροφή στην Αρχική Σελίδα για να μπείτε στο Προφίλ σας και να το επεξεργαστείτε</a><%
                SMT.close();
                myConnection.close();
            %>
        </div>
    </body>
</html>
