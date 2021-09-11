<%-- 
    Document   : ChooseInst
    Created on : 2 Μαϊ 2017, 1:52:27 πμ
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
                margin-left: 10px;
            }
        </style>
    </head>
    <body>
        <header>
            <h1>ΝΕΟ ΠΡΟΦΙΛ</h1>
        </header>
        <div>
            <h2>Επιλέξτε Ίδρυμα Φοίτησης:</h2>
            <br><br>
            <%
                String Inst;
                Class.forName("com.mysql.jdbc.Driver");
                String DB = "jdbc:mysql://localhost:3306/STUDENT_WEBCV_GREEK?user=root&password=maria";
                Connection myConnection = DriverManager.getConnection(DB);
                Statement SMT = myConnection.createStatement();
                String sql = "select distinct(INSTITUTION) from departments";
                ResultSet rs = SMT.executeQuery(sql);
            %>
            <form action="ChooseFac.jsp">
                <select name="Institute">
                    <%
                        while (rs.next()) {
                            Inst = rs.getString("Institution");

                    %>

                    <option value="<%=Inst%>"><%=Inst%></option>
                    <% String x = "o";
                }%>   
                </select>
                <br><br><br>
                <input type="submit" value="Συνέχεια">

            </form>
            <%
                SMT.close();
                myConnection.close();
            %>
        </div>
    </body>
</html>
