<%-- 
    Document   : inPhotoSubmit
    Created on : 20 Μαϊ 2017, 9:18:38 μμ
    Author     : Maraki
--%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@page import="java.sql.*" %>
<%@ page import="java.io.*"%>
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
            String p = request.getParameter("photo");
            Class.forName("com.mysql.jdbc.Driver");
            String DB = "jdbc:mysql://localhost:3306/STUDENT_WEBCV_GREEK?user=root&password=maria";
            Connection myConnection = DriverManager.getConnection(DB);
            FileInputStream fis;
            File image = new File(p);
            PreparedStatement SMT = myConnection.prepareStatement("insert into photoes(uname,photo)" + "values(?,?)");
            
            SMT.setString(1,U);
            
            fis = new FileInputStream(image);

            SMT.setBinaryStream(2, (InputStream) fis, (int) (image.length()));

            int s = SMT.executeUpdate();

            if (s > 0) {

        %>

        <font color="Black">

            <% out.println("Η φωτογραφία σας αποθηκεύτηκε με επιτυχία!"); %>

            </font>
            <P></P>
        <a href="MyProfil.jsp">Επιστροφή στο Προφίλ μου</a>

        <%

            } else {

                out.println("Σφάλμα! Η αποθήκευση της φωτογραφίας ήταν ανεπιτυχής.");

            }

            myConnection.close();
            SMT.close();

        %>
    </body>
</html>