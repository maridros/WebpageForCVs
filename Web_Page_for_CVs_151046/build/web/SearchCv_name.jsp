<%-- 
    Document   : SearchCv_name
    Created on : 17 Μαϊ 2017, 4:27:39 μμ
    Author     : Maraki
--%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    boolean found;
    String Uname;
    String Nam;
    String Sur;
    String Inst;
    int InstNum;
    String Inter;
    int InterNum;
    String nam = request.getParameter("n");
    String sur = request.getParameter("s");
    Class.forName("com.mysql.jdbc.Driver");
    String DB = "jdbc:mysql://localhost:3306/STUDENT_WEBCV_GREEK?user=root&password=maria";
    Connection myConnection = DriverManager.getConnection(DB);
    Statement SMT = myConnection.createStatement();
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Αναζήτηση</title>
        <style>
            body {
                background-color: #e1e1ea;
            }
            header {
                padding: 1em;
                color: white;
                background-color: #004d4d;
                clear: left;
                text-align: center;
            }
            nav {
                margin: 10px;
                float: left;
                width: 600px;
                padding: 1em;
                border: 3px solid #006666;
                border-radius: 25px;
                padding-left: 20px;
                background-color: darkcyan;
                box-shadow: 10px 10px 5px #888888;
            }

            nav ul {

                padding: 10px;
            }

            nav ul a {
                text-decoration: none;
            }

            article {
                margin-top: 10px;
                margin-left: 640px;
                border: 3px solid #006666;
                border-radius: 25px;
                padding: 1em;
                overflow: hidden;
                background-color: #99ddff;
                box-shadow: 10px 10px 5px #888888;
            }
            div {
                background-color: #99ddff;
                padding: 1em;
                border: 3px solid #006666;
                border-radius: 25px;
            }

        </style>
    </head>
    <body>

        <header>
            <h1>Αναζήτηση βιογραφικών</h1>
        </header>

        <nav>
            <ul>
                <li><div><a href="SearchCv.jsp">Βιογραφικά αλφαβητικά</a></div><br><br></li>
                <li><div>Αναζήτηση βιογραφικού με βάση ονοματεπώνυμο<br>
                    <form name="form1" method="get" action="SearchCv_name.jsp" >       
                        Όνομα: <input type="text" name="n"><P></P>
                        Επίθετο: <input type="text" name="s"><P></P>

                        <input type="submit" value="Συνέχεια">
                    </form></div><br><br> 
                    </li>
                <li><div>Αναζήτηση βιογραφικών με βάση το Ίδρυμα φοίτησης<br>
                    <%
                        String sql1 = "select INSTITUTION, count(UNAME) from user group by INSTITUTION";
                        ResultSet rs1 = SMT.executeQuery(sql1);

                        found = rs1.first();
                        if (!found) {
                            out.println("Δεν έχουν προστεθεί βιογραφικά από φοιτητές κανενός Ιδρύματος.");
                    %>
                    <br>
                    <%
                    } else {
                    %>
                    <form action="SearchCv_Inst.jsp">
                        <select name="Institute">
                            <%
                                Inst = rs1.getString("Institution");
                                InstNum = rs1.getInt("count(UNAME)");

                            %>

                            <option value="<%=Inst%>"><%=Inst%> (<%=InstNum%> βιογραφικά)</option>
                            <%
                                while (rs1.next()) {
                                    Inst = rs1.getString("Institution");
                                    InstNum = rs1.getInt("count(UNAME)");

                            %>

                            <option value="<%=Inst%>"><%=Inst%> (<%=InstNum%> βιογραφικά)</option>
                            <% String x = "o";
                                }%>   
                        </select>
                        <br><br>
                        <input type="submit" value="Συνέχεια">

                    </form></div><br><br>
                    <%
                        }
                    %>
                    </li>
                <li><div>Αναζήτηση βιογραφικών με βάση το επιστημονικό ενδιαφέρον<br>
                    <%
                        String sql2 = "select interest, count(UNAME) from stud_int group by interest";
                        ResultSet rs2 = SMT.executeQuery(sql2);

                        found = rs2.first();
                        if (!found) {
                            out.println("Δεν έχουν προστεθεί επιστημονικά ενδιαφέροντα από κανένα φοιτητή.");
                    %>
                    <br>
                    <%
                    } else {
                    %>
                    <form action="SearchCv_Inter.jsp">
                        <select name="Interest">
                            <%
                                Inter = rs2.getString("Interest");
                                InterNum = rs2.getInt("count(UNAME)");

                            %>

                            <option value="<%=Inter%>"><%=Inter%> (<%=InterNum%> βιογραφικά)</option>
                            <%

                                while (rs2.next()) {
                                    Inter = rs2.getString("Interest");
                                    InterNum = rs2.getInt("count(UNAME)");

                            %>

                            <option value="<%=Inter%>"><%=Inter%> (<%=InterNum%> βιογραφικά)</option>
                            <% String x = "o";
                                        }%>   
                        </select>
                        <br><br>
                        <input type="submit" value="Συνέχεια">

                    </form></div><br><br>
                    <%
                        }
                    %>
                </li>
                <li><div><a href="index.html">Επιστροφή στην Αρχική Σελίδα</a></div></li>
            </ul>
        </nav>

        <article>
            <h style="font-size:120%; text-shadow: 1px 1px #006666;"><b>Αποτελέσματα αναζήτησης με βάση ονοματεπώνυμο:</b></h>
            <br><br>

            <%
                String sql = "SELECT uname, name, surname FROM user WHERE name='" + nam + "' and surname='" + sur + "'";
                ResultSet rs = SMT.executeQuery(sql);
                found = rs.first();
                if (!found) {

                    out.println("Ο φοιτητής " + "" + sur + "" + " " + "" + nam + "" + " δεν υπάρχει!");
                } else {
            %>
            <ul>
                <%
                    Uname = rs.getString("uname");
                    Nam = rs.getString("name");
                    Sur = rs.getString("surname");
                %>
                <li><a href="Profil.jsp?U=<%=Uname%>"><%=Sur%> <%=Nam%></a></li>
                    <%
                        while (rs.next()) {
                            Uname = rs.getString("uname");
                            Nam = rs.getString("name");
                            Sur = rs.getString("surname");
                    %>
                <li><a href="Profil.jsp?U=<%=Uname%>"><%=Sur%> <%=Nam%></a></li>
                    <%
                        }%>   
            </ul>
            <%
                }
                SMT.close();
                myConnection.close();
            %>
        </article>
    </body>
</html>
