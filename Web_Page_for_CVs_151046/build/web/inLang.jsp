<%-- 
    Document   : inLang
    Created on : 11 Μαϊ 2017, 6:44:32 μμ
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
            <h2>Επιλέξτε τις ξένες γλώσσες που γνωρίζετε και το αντίστοιχο επίπεδο γνώσης τους:</h2>
            <br><br>
            <%
                String Lang;
                String Lev;
                Class.forName("com.mysql.jdbc.Driver");
                String DB = "jdbc:mysql://localhost:3306/STUDENT_WEBCV_GREEK?user=root&password=maria";
                Connection myConnection = DriverManager.getConnection(DB);
                Statement SMT = myConnection.createStatement();
                Statement SMT1 = myConnection.createStatement();
                String sql = "select * from languages";
                String sql1 = "select * from levels";
                ResultSet rs = SMT.executeQuery(sql);
                ResultSet rs1;
            %>
            <form action="inLangSubmit.jsp">
                <%
                    while (rs.next()) {
                        Lang = rs.getString("Language");

                %>

                <input type="checkbox" name="Language" value="<%=Lang%>"><%=Lang%> <br>Επίπεδο:
                <%
                    rs1 = SMT1.executeQuery(sql1);
                    while (rs1.next()) {
                        Lev = rs1.getString("level");
                %>
                <input type="radio" name="<%=Lang%>" value="<%=Lev%>"> <%=Lev%> 
                <%
                    }
                %>
                <br>
                <% String x = "o";
            }%>   
                <br><br><br>
                <input type="submit" value="Υποβολή">

            </form>
            <%
                SMT.close();
                SMT1.close();
                myConnection.close();
            %>
        </div>
    </body>
</html>
