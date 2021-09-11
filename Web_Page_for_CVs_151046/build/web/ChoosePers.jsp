<%-- 
    Document   : ChoosePers
    Created on : 2 Μαϊ 2017, 11:03:11 πμ
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
                Boolean found;
                String x = request.getParameter("u");
                String y = request.getParameter("p");
                String c = request.getParameter("n");
                String d = request.getParameter("s");
                String da = request.getParameter("d");
                String mo = request.getParameter("m");
                String ye = request.getParameter("y");
                Class.forName("com.mysql.jdbc.Driver");
                String DB = "jdbc:mysql://localhost:3306/STUDENT_WEBCV_GREEK?user=root&password=maria";
                Connection myConnection = DriverManager.getConnection(DB);
                Statement SMT = myConnection.createStatement();
                String sql = "SELECT * FROM user WHERE Uname='" + x + "' ";
                ResultSet rs = SMT.executeQuery(sql);
                found = rs.first();
                if (found) {

                    out.println("ΤΟ ΟΝΟΜΑ ΧΡΗΣΤΗ ΥΠΑΡΧΕΙ ΗΔΗ, ΠΡΟΣΠΑΘΗΣΤΕ ΞΑΝΑ");%><P></P>
            <a href="newuser.jsp">Προσπαθήστε ξανά</a><%
                } else {
                    session.setAttribute("Uname", x);
                    session.setAttribute("Pass", y);
                    session.setAttribute("Name", c);
                    session.setAttribute("SName", d);
                    session.setAttribute("Day", da);
                    session.setAttribute("Month", mo);
                    session.setAttribute("Year", ye);
                    response.sendRedirect("ChooseInst.jsp");

                }
                SMT.close();
                myConnection.close();
            %>
        </div>
    </body>
</html>
