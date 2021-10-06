<%-- 
    Document   : index
    Created on : Feb 16, 2018, 10:57:49 AM
    Author     : Sourav
    Purpose: Homepage of the athetlic application website.
Imports below:
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<jsp:useBean id="access" class="home.HomepageBean" scope="page"/>  
<%@page import="login.LoginBean"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"/>
        <title>VILLAGE ATHLETICS - HOME</title>
        <link rel="stylesheet" type="text/css" href="stylesheet.css">
        <link rel="icon" href="images/logo.png">
        <link href="https://fonts.googleapis.com/css?family=Lato:400,900" rel="stylesheet">
    </head>
    <body>
        <!--navbar -->
        <jsp:useBean id="checker" class="login.LoginBean" scope="session"/>  
        <div>
            <c:choose>
                <c:when test="${checker.getValidation(false)}">
                    <jsp:include page="logoutheader.jsp"/>
                </c:when>

                <c:otherwise>    
                    <jsp:include page="loginheader.jsp"/>

                </c:otherwise>
            </c:choose>
        </div>   
        
        <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost:3306/athleticwebsite"
         user = "root"  password = "mysql1"/>
        
        <sql:query dataSource = "${snapshot}" var = "output">
            SELECT * FROM news ORDER BY published DESC;
        </sql:query>
        <!-- Homepage image and description -->
        <div>
            <div>
                <img src="images/Football2.jpg" alt="image" id="homeimage">            
            </div>
            <div class="block">
                <h1 id="title">VIKING ATHLETICS</h1>
                <h2 id="subheader">A CULTURE OF CHAMPIONS.</h2>
            </div>
            
            <div class="secondblock">
                <h2>Recent Stories</h2>
            </div>
            <!--Accessing DB for news stories-->
            <c:forEach var = "row" items = "${output.rows}">
                <div id="infobox0" class="newsbox">
                    <h2 class="newsheader"><c:out value = "${row.title}"/></h2>
                    <h3 class="newsdate"><c:out value = "${row.published}"/></h3>
                    <p class="newsbody"><c:out value= "${row.story}"/></p>
                </div>
            </c:forEach>
            <div class="aboutblock">
                <a href="about.jsp" class="about"><h2>About This Website</h2></a>
            </div>
                
            <div class="whitespace"></div>
        </div>
    </body>
</html>
