<%-- 
    Document   : Profil
    Created on : 16 Μαϊ 2017, 7:24:50 μμ
    Author     : Maraki
--%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String U = request.getParameter("U");
    String Pers[] = new String[6];
    String Inter;
    String Hobb;
    String Lang;
    String level;
    String Quo;
    String Quo_d;
    int Pho_id;
    String MyCv;
    String Vid;
    boolean found;
    Class.forName("com.mysql.jdbc.Driver");
    String DB = "jdbc:mysql://localhost:3306/STUDENT_WEBCV_GREEK?user=root&password=maria";
    Connection myConnection = DriverManager.getConnection(DB);
    Statement SMT = myConnection.createStatement();

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Προφίλ</title>
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
                float: left;
                width: 200px;
                margin: 0;
                padding: 1em;
                position: fixed;
            }

            nav ul {
                padding: 0;
            }

            nav ul a {
                text-decoration: none;
            }

            article {
                margin-left: 210px;
                border-left: 1px solid gray;
                padding: 1em;
                overflow: hidden;
            }


            table, th, td {
                border: 1px solid black;
                border-collapse: collapse;
            }
            th, td {
                padding: 5px;
                text-align: left;
            }
        </style>
    </head>
    <body>
        <header>
            <h1>Προφίλ</h1>
        </header>

        <nav>
            <ul>
                <li><a href="#C1">Γενικές Πληροφορίες</a></li>
                <li><a href="#C2">Βιογραφικό</a></li>
                <li><a href="#C3">Επιστημονικά Ενδιαφέροντα</a></li>
                <li><a href="#C4">Ξένες Γλώσσες</a></li>
                <li><a href="#C5">Hobby</a></li>
                <li><a href="#C6">Απόψεις</a></li>
                <li><a href="#C7">Φωτογραφίες</a></li>
                <li><a href="#C8">Βίντεο</a></li>   
            </ul>
        </nav>

        <article>
            <h1 id="C1">Γενικές Πληροφορίες</h1>
            <%            String sql = "SELECT * FROM user WHERE Uname='" + U + "'";
                ResultSet rs = SMT.executeQuery(sql);

                while (rs.next()) {
                    Pers[0] = rs.getString("Name");
                    Pers[1] = rs.getString("Surname");
                    Pers[2] = rs.getString("Institution");
                    Pers[3] = rs.getString("Faculty");
                    Pers[4] = rs.getString("Department");
                    Pers[5] = rs.getString("Birthdate");
                }
            %>

            <br>

            <p style="font-size:140%">Προσωπικά Στοιχεία:</p>

            <p> Όνομα: <%=Pers[0]%></p>
            <p> Επίθετο: <%=Pers[1]%></p>
            <p> Ημερομηνία γέννησης: <%=Pers[5]%></p>

            <br>

            <p style="font-size:140%">Φοίτηση:</p>

            <p> Ίδρυμα: <%=Pers[2]%></p>
            <p> Σχολή: <%=Pers[3]%></p>
            <p> Τμήμα: <%=Pers[4]%></p>

            <br><br> 

            <hr>
            <h1 id="C2">Βιογραφικό</h1>
            <%
                found = false;
                String sql1 = "select ifnull(cv, 'Δεν έχει καταχωρηθεί βιογραφικό.') from user where uname='" + U + "'";
                ResultSet rs1 = SMT.executeQuery(sql1);
                found = rs1.first();
                MyCv = rs1.getString("ifnull(cv, 'Δεν έχει καταχωρηθεί βιογραφικό.')");
            %>
            <pre><%=MyCv%></pre>

            <br><br>


            <hr>
            <h1 id="C3">Επιστημονικά Ενδιαφέροντα</h1>
            <%
                String sql2 = "select interest from stud_int where Uname='" + U + "'";
                ResultSet rs2 = SMT.executeQuery(sql2);
                found = rs2.first();
                if (!found) {
                    out.println("Δεν έχουν καταχωρηθεί επιστημονικά ενδιαφέροντα.");
            %>
            <br>
            <%
            } else {
                Inter = rs2.getString("Interest");
            %>
            <%=Inter%><br>
            <%
                while (rs2.next()) {
                    Inter = rs2.getString("Interest");
            %>
            <%=Inter%><br>
            <%
                    }
                }

            %>

            <br><br>


            <hr>
            <h1 id="C4">Ξένες Γλώσσες</h1>
            <%            String sql3 = "select language, level from stud_lang where Uname='" + U + "'";
                ResultSet rs3 = SMT.executeQuery(sql3);
                found = rs3.first();
                if (!found) {
                    out.println("Δεν έχουν καταχωρηθεί ξένες γλώσσες.");
            %>
            <br>
            <%
            } else {
            %>
            <table>
                <tr>
                    <th>Γλώσσα</th>
                    <th>Επίπεδο</th>
                </tr>
                <%
                    Lang = rs3.getString("Language");
                    level = rs3.getString("Level");
                %>
                <tr>
                    <td><%=Lang%></td>
                    <td><%=level%></td>
                </tr>
                <%
                    while (rs3.next()) {
                %>
                <%
                    Lang = rs3.getString("Language");
                    level = rs3.getString("Level");
                %>
                <tr>
                    <td><%=Lang%></td>
                    <td><%=level%></td>
                </tr>
                <%
                    }
                %>
            </table>
            <%
                }

            %>

            <br><br>


            <hr>
            <h1 id="C5">Hobby</h1>
            <%            found = false;
                String sql4 = "select hobby from stud_hob where Uname='" + U + "'";
                ResultSet rs4 = SMT.executeQuery(sql4);
                found = rs4.first();
                if (!found) {
                    out.println("Δεν έχει καταχωρηθεί κανένα hobby.");
            %>
            <br>
            <%
            } else {
                Hobb = rs4.getString("hobby");
            %>
            <%=Hobb%><br>
            <%
                while (rs4.next()) {
                    Hobb = rs4.getString("hobby");
            %>
            <%=Hobb%><br>
            <%
                    }
                }

            %>

            <br><br>


            <hr>
            <h1 id="C6">Απόψεις</h1>
            <%            found = false;
                String sql5 = "select quote, q_date from stud_quotes where Uname='" + U + "'";
                ResultSet rs5 = SMT.executeQuery(sql5);
                found = rs5.first();
                if (!found) {
                    out.println("Δεν έχουν καταχωρηθεί απόψεις.");
            %>
            <br>
            <%
            } else {
                Quo = rs5.getString("quote");
                Quo_d = rs5.getString("q_date");
            %>
            <pre><%=Quo%></pre>
            <%=Quo_d%><br>
            <%
                while (rs5.next()) {
                    Quo = rs5.getString("quote");
                    Quo_d = rs5.getString("q_date");
            %>
            <br><pre><%=Quo%></pre>
            <%=Quo_d%><br>
            <%
                    }
                }

            %>

            <br><br>


            <hr>
            <h1 id="C7">Φωτογραφίες</h1>
            <%            found = false;
                String sql6 = "select p_id from photoes where Uname='" + U + "'";
                ResultSet rs6 = SMT.executeQuery(sql6);
                found = rs6.first();
                if (!found) {
                    out.println("Δεν υπάρχουν φωτογραφίες.");
            %>
            <br>
            <%
            } else {
                Pho_id = rs6.getInt("p_id");
            %>
            <img src="displayPhoto.jsp?ph=<%=Pho_id%>" width="600" />
            <br>
            <%
                while (rs6.next()) {
                    Pho_id = rs6.getInt("p_id");
            %>
            <br><img src="displayPhoto.jsp?ph=<%=Pho_id%>" width="600" />
            <br>
            <%
                    }
                }

            %>
            
            <br><br>


            <hr>
            <h1 id="C8">Βίντεο</h1>
            <%            found = false;
                String sql7 = "select video from videos where Uname='" + U + "'";
                ResultSet rs7 = SMT.executeQuery(sql7);
                found = rs7.first();
                if (!found) {
                    out.println("Δεν υπάρχουν βίντεο.");
            %>
            <br>
            <%
            } else {
                Vid = rs7.getString("video");
            %>
            <iframe <%=Vid%>></iframe><br>
                <%
                    while (rs7.next()) {
                        Vid = rs7.getString("video");
                %>
            <iframe <%=Vid%>></iframe><br>
                <%
                        }
                    }

                %>

            <br><br>



            <%            SMT.close();
                myConnection.close();
            %>
        </article>
    </body>
</html>

