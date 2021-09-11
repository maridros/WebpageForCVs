<%-- 
    Document   : inHobSubmit
    Created on : 3 Μαϊ 2017, 11:56:34 μμ
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
            String sql;
            String sql1;
            String select[] = request.getParameterValues("Hobby");
            Class.forName("com.mysql.jdbc.Driver");
            String DB = "jdbc:mysql://localhost:3306/STUDENT_WEBCV_GREEK?user=root&password=maria";
            Connection myConnection = DriverManager.getConnection(DB);
            Statement SMT = myConnection.createStatement();

            sql = "delete from stud_hob where Uname='" + U + "'";
            SMT.executeUpdate(sql);

            if (select != null && select.length != 0) {
                for (int i = 0; i < select.length; i++) {
                    sql1 = "insert into stud_hob(Uname, Hobby) values ('" + U + "', '" + select[i] + "')";
                    SMT.executeUpdate(sql1);
                }

            }
            out.println("Τα hobby σας ενημερώθηκαν με επιτυχία!");
        %>
        <P></P>
        <a href="MyProfil.jsp">Επιστροφή στο Προφίλ μου</a>
        <%
            SMT.close();
            myConnection.close();
        %>
    </body>
</html>
