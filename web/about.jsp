<%-- 
    Document   : about
    Created on : Mar 10, 2018, 7:35:55 PM
    Author     : Sourav
    Purpose: This page is an about section on the website as a whole.
Imports below:
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<jsp:useBean id="access" class="article.ArticleBean" scope="page"/>  
<%@page import="login.LoginBean"%>
<!DOCTYPE html>
<html>
    <head>
        <!--Heading -->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=5">
        <title>VILLAGE ATHLETICS - ADMIN</title>
        <link rel="stylesheet" type="text/css" href="stylesheet.css">
        <link rel="icon" href="images/logo.png">
        <link href="https://fonts.googleapis.com/css?family=Lato:400,900" rel="stylesheet">
    </head>
    <body>
        <!--NAVBAR -->
        <jsp:useBean id="checker" class="login.LoginBean" scope="session"/>  
        <c:choose>
            <c:when test="${checker.getValidation(false)}">
                <jsp:include page="logoutheader.jsp"/>
            </c:when>

            <c:otherwise>    
                <jsp:include page="loginheader.jsp"/>
            </c:otherwise>
        </c:choose> 
                
        <!-- About the page -->
        <div class="aboutpageblock">
            <h2>About This Website</h2>
            <h3>This webpage was created by Sourav Banerjee to provide users<br>
                with a method by which to view information about the Village<br>
                High School's Athletics. This web application was written <br>
                using 5 languages: HTML for the framework, CSS styling, JSP <br>
                mixing Java and HTML, SQL databases, and JAVA itself. Please <br>
                try out all available features, and thanks for using!
            </h3>
            
            <h6>Icons made by Freepik and Smashicons from FlatIcon.</h6>
        </div>
                
    </body>
</html>
