<%-- 
    Document   : logout
    Created on : Feb 27, 2018, 3:31:11 PM
    Author     : Sourav
    Purpose: Logs out the user.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page import="login.LoginBean"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>VILLAGE ATHLETICS - LOGOUT</title>
    </head>
    <body>
        <jsp:useBean id="checker" class="login.LoginBean">  
            <jsp:setProperty name="checker" property="validation" value="false"/>
        </jsp:useBean>
        <% 
            session.invalidate();
        %>
        <c:redirect url="index.jsp"/>
    </body>
</html>
