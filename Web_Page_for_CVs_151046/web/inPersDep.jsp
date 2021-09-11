<%-- 
    Document   : inPersDep
    Created on : 3 Μαϊ 2017, 7:04:02 μμ
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
                margin: 10px;
            }
        </style>
    </head>
    <body>
        <header>
            <h1>ΕΠΕΞΕΡΓΑΣΙΑ ΠΡΟΦΙΛ</h1>
        </header>
        <div>
            <h2>Επιλέξτε Τμήμα Φοίτησης:</h2>
            <br><br>
            <%
                String Dep;
                String F = request.getParameter("Facult");
                String I = session.getAttribute("Inst").toString();
                Class.forName("com.mysql.jdbc.Driver");
                String DB = "jdbc:mysql://localhost:3306/STUDENT_WEBCV_GREEK?user=root&password=maria";
                Connection myConnection = DriverManager.getConnection(DB);
                Statement SMT = myConnection.createStatement();
                String sql = "select department from departments where INSTITUTION='" + I + "' and FACULTY='" + F + "';";
                ResultSet rs = SMT.executeQuery(sql);
            %>
            <form action="inPersInstSubmit.jsp">
                <select name="Department">
                    <%
                        while (rs.next()) {
                            Dep = rs.getString("Department");

                    %>

                    <option value="<%=Dep%>"><%=Dep%></option>
                    <% String x = "o";
                }%>   
                </select>
                <br><br><br>
                <input type="submit" value="Τέλος">

            </form>
            <%
                session.setAttribute("Fac", F);
                SMT.close();
                myConnection.close();
            %>
        </div>
    </body>
</html>
