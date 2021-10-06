<%-- 
    Document   : article
    Created on : Mar 10, 2018, 7:37:31 PM
    Author     : Sourav
    Purpose: Sends the values for an upcoming game entry and redirects the user to the success page.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<jsp:useBean id="access" class="article.ArticleBean" scope="page"/>  
<%@page import="login.LoginBean"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=5">
        <title>VILLAGE ATHLETICS - ADMIN</title>
        <link rel="stylesheet" type="text/css" href="stylesheet.css">
        <link rel="icon" href="images/logo.png">
        <link href="https://fonts.googleapis.com/css?family=Lato:400,900" rel="stylesheet">
    </head>
    <body>
        <c:redirect url="altlacrosse2.jsp"/>
    </body>
</html>
