<%-- 
    Document   : login
    Created on : 2 Μαϊ 2017, 11:57:06 πμ
    Author     : Maraki
--%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Είσοδος</title>
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
            <h1>ΕΙΣΟΔΟΣ ΣΤΟ ΠΡΟΦΙΛ ΜΟΥ</h1>
        </header>
        <p></p>
        <form name="form2" method="post" action="checkLog.jsp" >       
            Όνομα χρήστη: <input type="text" name="y"><p></p>
            Κωδικός: <input type="password" name="k"><P></P>
            <input type="submit" value="ΕΙΣΟΔΟΣ"><p></p>
        </form> 
        <p>ΕΑΝ ΔΕΝ ΕΧΕΤΕ ΗΔΗ ΠΡΟΦΙΛ</p>
        <a href="newuser.jsp">ΕΓΓΡΑΦΕΙΤΕ</a>
    </form> 
</body>
</html>
