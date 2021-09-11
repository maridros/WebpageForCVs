<%-- 
    Document   : inVideo
    Created on : 19 Μαϊ 2017, 10:14:56 μμ
    Author     : Maraki
--%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Επεξεργασία Προφίλ</title>
        <style>
            textarea {
                width: 800px;
                height: 100%;
            }
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
        <h2>Προσθέστε τον κώδικα ενσωμάτωσης του βίντεο από το youtube:</h2>
        <form action="inVideoSubmit.jsp">
            <textarea name="vid"></textarea>
            <br>
            <input type="submit" value="Υποβολή">
        </form><br><br>
    </body>
</html>