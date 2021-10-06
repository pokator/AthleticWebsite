<%-- 
    Document   : winter
    Created on : Feb 19, 2018, 11:54:46 AM
    Author     : Sourav
    Purpose: This page lists the multiple winter sports available with links to check each one out.
Imports below:
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@page import="login.LoginBean"%>  
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=5">
        <title>VILLAGE ATHLETICS - WINTER SPORTS</title>
        <link rel="stylesheet" type="text/css" href="stylesheet.css">
        <link rel="icon" href="images/logo.png">
        <link href="https://fonts.googleapis.com/css?family=Lato:400,900" rel="stylesheet">
    </head>
    <body>
        <jsp:useBean id="checker" class="login.LoginBean" scope="session"/>  
        <c:choose>
            <c:when test="${checker.getValidation(false)}">
                <jsp:include page="altlogoutheader.jsp"/>
            </c:when>

            <c:otherwise>    
                <jsp:include page="altloginheader.jsp"/>
                    
            </c:otherwise>
        </c:choose>  
         
        <div class="winter">
            <div id="topblock" class="introblock">
                <h1 id="title">WINTER SPORTS</h1>
                <h2 id="subheader">Winter Sports include Basketball, Soccer, and Swimming.<br> Details are in the links.</h2>
            </div>
            
            <a href="soccer.jsp" class="sportlinkblock">
                <div class="sportlink">
                    <img src="images/SoccerLink.png" class="sporticon">
                </div>
            </a>
            
            <a href="basketball.jsp">
                <div class="sportlink">
                    <img src="images/BasketballLink.png" class="sporticon">
                </div>
            </a>
            
            <a href="swimming.jsp">
                <div id="bottomblock" class="sportlink">
                    <img src="images/SwimmingLink.png" class="sporticon">
                </div>
            </a>
        </div>        
    </body>
</html>
