<%-- 
    Document   : displayPhoto
    Created on : 20 Μαϊ 2017, 9:32:36 μμ
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
    </head>
    <body>
    <%
            int phot = Integer.parseInt(request.getParameter("ph"));
            Class.forName("com.mysql.jdbc.Driver");
            String DB = "jdbc:mysql://localhost:3306/STUDENT_WEBCV_GREEK?user=root&password=maria";
            Connection myConnection = DriverManager.getConnection(DB);
            
            Blob image = null;
            byte[] imgData = null;
            
            Statement SMT = myConnection.createStatement();
            ResultSet rs = SMT.executeQuery("select photo from photoes where p_id = "+phot+"");
            
            while(rs.next()){
                image = rs.getBlob(1);
                imgData = image.getBytes(1, (int)image.length());
            }
            
            response.setContentType("image");
            
            OutputStream o = response.getOutputStream();
            
            o.write(imgData);
            
            o.flush();
            
            o.close();
            

            SMT.close();
            myConnection.close();

        %>
    </body>
</html>
