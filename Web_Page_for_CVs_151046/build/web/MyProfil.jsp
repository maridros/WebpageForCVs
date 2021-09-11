<%-- 
    Document   : MyProfil
    Created on : 3 Μαϊ 2017, 1:55:59 πμ
    Author     : Maraki
--%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String U = session.getAttribute("UPass").toString();
    String Pers[] = new String[6];
    String Inter;
    String Hobb;
    String Lang;
    String level;
    String Quo;
    String Quo_d;
    int Quo_id;
    int Pho_id;
    String MyCv;
    String Vid;
    int Vid_id;
    boolean found;
    Class.forName("com.mysql.jdbc.Driver");
    String DB = "jdbc:mysql://localhost:3306/STUDENT_WEBCV_GREEK?user=root&password=maria";
    Connection myConnection = DriverManager.getConnection(DB);
    Statement SMT = myConnection.createStatement();

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Το Προφίλ μου</title>
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
            <h1>ΤΟ ΠΡΟΦΙΛ ΜΟΥ</h1>
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
            <p style="text-align: right; font-size:120%;"><b><a href="Logout.jsp">Αποσύνδεση</a></b></p>
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
                session.setAttribute("UNam", Pers[0]);
                session.setAttribute("USNam", Pers[1]);
                session.setAttribute("UInst", Pers[2]);
                session.setAttribute("UFac", Pers[3]);
                session.setAttribute("UDep", Pers[4]);
            %>

            <br>

            <p style="font-size:140%">Προσωπικά Στοιχεία:</p>

            <p> Όνομα: <%=Pers[0]%></p>
            <p> Επίθετο: <%=Pers[1]%></p>
            <p> Ημερομηνία γέννησης: <%=Pers[5]%></p>

            <br> <INPUT TYPE="BUTTON" VALUE="Τροποποίηση" style="font-size:15px"
                        ONCLICK="window.location.href = 'inPers.jsp'"> <br><br><br><br>

            <p style="font-size:140%">Φοίτηση:</p>

            <p> Ίδρυμα: <%=Pers[2]%></p>
            <p> Σχολή: <%=Pers[3]%></p>
            <p> Τμήμα: <%=Pers[4]%></p>

            <br> <INPUT TYPE="BUTTON" VALUE="Τροποποίηση" style="font-size:15px"
                        ONCLICK="window.location.href = 'inPersInst.jsp'"> <br><br> 

            <hr>
            <h1 id="C2">Βιογραφικό</h1>
            <%
                found = false;
                String sql1 = "select ifnull(cv, 'Δεν έχετε προσθέσει ακόμη βιογραφικό.') from user where uname='" + U + "'";
                ResultSet rs1 = SMT.executeQuery(sql1);
                found = rs1.first();
                MyCv = rs1.getString("ifnull(cv, 'Δεν έχετε προσθέσει ακόμη βιογραφικό.')");
            %>
            <pre><%=MyCv%></pre>

            <br> <INPUT TYPE="BUTTON" VALUE="Τροποποίηση" style="font-size:15px"
                        ONCLICK="window.location.href = 'inCv.jsp'"> <br><br>


            <hr>
            <h1 id="C3">Επιστημονικά Ενδιαφέροντα</h1>
            <%
                String sql2 = "select interest from stud_int where Uname='" + U + "'";
                ResultSet rs2 = SMT.executeQuery(sql2);
                found = rs2.first();
                if (!found) {
                    out.println("Δεν έχετε προσθέσει ακόμη επιστημονικά ενδιαφέροντα.");
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

            <br> <INPUT TYPE="BUTTON" VALUE="Τροποποίηση" style="font-size:15px"
                        ONCLICK="window.location.href = 'inInter.jsp'"> <br><br>


            <hr>
            <h1 id="C4">Ξένες Γλώσσες</h1>
            <%            String sql3 = "select language, level from stud_lang where Uname='" + U + "'";
                ResultSet rs3 = SMT.executeQuery(sql3);
                found = rs3.first();
                if (!found) {
                    out.println("Δεν έχετε προσθέσει ακόμα τις ξένες γλώσσες που γνωρίζετε.");
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

            <br> <INPUT TYPE="BUTTON" VALUE="Τροποποίηση" style="font-size:15px"
                        ONCLICK="window.location.href = 'inLang.jsp'"> <br><br>


            <hr>
            <h1 id="C5">Hobby</h1>
            <%            found = false;
                String sql4 = "select hobby from stud_hob where Uname='" + U + "'";
                ResultSet rs4 = SMT.executeQuery(sql4);
                found = rs4.first();
                if (!found) {
                    out.println("Δεν έχετε προσθέσει ακόμη κανένα hobby.");
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

            <br> <INPUT TYPE="BUTTON" VALUE="Τροποποίηση" style="font-size:15px"
                        ONCLICK="window.location.href = 'inHob.jsp'"> <br><br>


            <hr>
            <h1 id="C6">Απόψεις</h1>
            <%            found = false;
                String sql5 = "select q_id, quote, q_date from stud_quotes where Uname='" + U + "'";
                ResultSet rs5 = SMT.executeQuery(sql5);
                found = rs5.first();
                if (!found) {
                    out.println("Δεν έχετε προσθέσει ακόμη απόψεις.");
            %>
            <br>
            <%
            } else {
                Quo = rs5.getString("quote");
                Quo_d = rs5.getString("q_date");
                Quo_id = rs5.getInt("q_id");
            %>
            <pre><%=Quo%></pre>
            <%=Quo_d%> <INPUT TYPE="BUTTON" VALUE="Διαγραφή" style="font-size:15px; margin-left: 40px"
                   ONCLICK="window.location.href = 'delete_Quote.jsp?q=<%=Quo_id%>'">
            <br>
            <%
                while (rs5.next()) {
                    Quo = rs5.getString("quote");
                    Quo_d = rs5.getString("q_date");
                    Quo_id = rs5.getInt("q_id");
            %>
            <br><pre><%=Quo%></pre>
            <%=Quo_d%> <INPUT TYPE="BUTTON" VALUE="Διαγραφή" style="font-size:15px; margin-left: 40px"
                   ONCLICK="window.location.href = 'delete_Quote.jsp?q=<%=Quo_id%>'">
            <br>
            <%
                    }
                }

            %>

            <br><br> <INPUT TYPE="BUTTON" VALUE="Προσθήκη άποψης" style="font-size:15px"
                            ONCLICK="window.location.href = 'inQuote.jsp'"> <br><br>


            <hr>
            <h1 id="C7">Φωτογραφίες</h1>

            <%            found = false;
                String sql6 = "select p_id from photoes where Uname='" + U + "'";
                ResultSet rs6 = SMT.executeQuery(sql6);
                found = rs6.first();
                if (!found) {
                    out.println("Δεν έχετε προσθέσει ακόμη φωτογραφίες.");
            %>
            <br>
            <%
            } else {
                Pho_id = rs6.getInt("p_id");
            %>
            <img src="displayPhoto.jsp?ph=<%=Pho_id%>" width="600" />
            <INPUT TYPE="BUTTON" VALUE="Διαγραφή" style="font-size:15px; margin-left: 40px"
                   ONCLICK="window.location.href = 'delete_Photo.jsp?ph=<%=Pho_id%>'">
            <br>
            <%
                while (rs6.next()) {
                    Pho_id = rs6.getInt("p_id");
            %>
            <br><img src="displayPhoto.jsp?ph=<%=Pho_id%>" width="600" />
            <INPUT TYPE="BUTTON" VALUE="Διαγραφή" style="font-size:15px; margin-left: 40px"
                   ONCLICK="window.location.href = 'delete_Photo.jsp?ph=<%=Pho_id%>'">
            <br>
            <%
                    }
                }

            %>

            <br><br> <INPUT TYPE="BUTTON" VALUE="Προσθήκη φωτογραφίας" style="font-size:15px"
                        ONCLICK="window.location.href = 'inPhoto.jsp'"> <br><br>


            <hr>
            <h1 id="C8">Βίντεο</h1>
            <%            found = false;
                String sql7 = "select v_id, video from videos where Uname='" + U + "'";
                ResultSet rs7 = SMT.executeQuery(sql7);
                found = rs7.first();
                if (!found) {
                    out.println("Δεν έχετε προσθέσει ακόμη βίντεο.");
            %>
            <br>
            <%
            } else {
                Vid = rs7.getString("video");
                Vid_id = rs7.getInt("v_id");
            %>
            <iframe <%=Vid%>></iframe> <INPUT TYPE="BUTTON" VALUE="Διαγραφή" style="font-size:15px; margin-left: 40px"
                                              ONCLICK="window.location.href = 'delete_Video.jsp?v=<%=Vid_id%>'">
            <br><br><br>
            <%
                while (rs7.next()) {
                    Vid = rs7.getString("video");
                    Vid_id = rs7.getInt("v_id");
            %>
            <iframe <%=Vid%>></iframe> <INPUT TYPE="BUTTON" VALUE="Διαγραφή" style="font-size:15px; margin-left: 40px"
                                              ONCLICK="window.location.href = 'delete_Video.jsp?v=<%=Vid_id%>'">
            <br><br><br>
            <%
                    }
                }

            %>

            <br> <INPUT TYPE="BUTTON" VALUE="Προσθήκη βίντεο" style="font-size:15px"
                        ONCLICK="window.location.href = 'inVideo.jsp'"> <br><br>



            <%            SMT.close();
                myConnection.close();
            %>
        </article>
    </body>
</html>

