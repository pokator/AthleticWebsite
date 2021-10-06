<%-- 
    Document   : fall
    Created on : Feb 19, 2018, 11:52:09 AM
    Author     : Sourav
    Purpose: This page lists the multiple fall sports available with links to check each one out.
    Imports below:
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@page import="login.LoginBean"%>  
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>

<!DOCTYPE html>
<html>
    <head>
        <!--Header -->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=5">
        <link rel="stylesheet" type="text/css" href="stylesheet.css">
        <title>VILLAGE ATHLETICS - FALL SPORTS</title>
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
        
                
        <!--Connect to DB -->
        <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost:3306/athleticwebsite"
         user = "root"  password = "mysql1"/>
                
        
                
        <!--Display all the different sports -->        
        <div class="fall">
            <div id="topblock" class="introblock">
                <h1 id="title">FALL SPORTS</h1>
                <h2 id="subheader">Fall Sports include Football, Volleyball, and Cross-Country.<br> Details are in the links.</h2>
            </div>
            
            <a href="football.jsp">
                <div class="sportlink">
                    <img src="images/FootballLink.png" class="sporticon">
                </div>
            </a>
            
            <a href="volleyball.jsp">
                <div class="sportlink">
                    <img src="images/VolleyballLink.png" class="sporticon">
                </div>
            </a>
            
            <a href="ccountry.jsp">
                <div id="bottomblock" class="sportlink">
                    <img src="images/CCountryLink.png" class="sporticon">
                </div>
            </a>
            
        </div>
    </body>
</html>
