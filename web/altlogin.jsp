<%-- 
    Document   : altlogin
    Created on : Feb 24, 2018, 10:15:56 AM
    Author     : Sourav
    Purpose    : This page is an alternate login if an administrator's login fails.
Imports below:
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@page import="login.LoginBean"%>  

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=5">
        <title>VILLAGE ATHLETICS - LOGIN</title>
        <link rel="stylesheet" type="text/css" href="stylesheet.css">
        <link rel="icon" href="images/logo.png">
        <link href="https://fonts.googleapis.com/css?family=Lato:400,900" rel="stylesheet">
    </head>
    <body>
        <jsp:useBean id="checker" class="login.LoginBean"/>  
        <c:choose>
            <c:when test="${checker.getValidation(false)}">
                <jsp:include page="altlogoutheader.jsp"/>
            </c:when>

            <c:otherwise>    
                <jsp:include page="loginheader.jsp"/>
            </c:otherwise>
        </c:choose>
        
        <!-- Login form -->
        <div id="login">
            <img src="images/logo.png" alt="logo" id="logo">
            <h6 id="signin">SIGN IN</h6>
            <form action="admin.jsp" id="form" method="POST">
                <p class="logintitles">
                    Username<br>
                    <input type="text" name="username" placeholder="Enter Username" class="entry" required>
                </p>                
                <p class="logintitles">
                    Password<br>
                    <input type="password" name="password"  placeholder="Enter Password" class="entry" required>
                    <br>
                    <br>
                    <input type="submit" value="Login" class="submit">
                </p>
                
                <p id="invalid">
                    Username:<br> admin <br>Password: <br>root <br><br>
                    
                    Please check your entries!
                </p>
                
           </form>
            
            <form action="altlogin.jsp">
                <input type="submit" value="Show Login Info" class="submit">
            </form>
        </div>

    </body>
</html>
