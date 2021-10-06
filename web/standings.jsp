z<%-- 
    Document   : standings
    Created on : Apr 9, 2018, 2:22:22 PM
    Author     : Sourav
    Description: This program
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<jsp:useBean id="access" class="home.HomepageBean" scope="page"/>  
<%@page import="login.LoginBean"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"/>
        <title>VILLAGE ATHLETICS - CALENDAR</title>
        <link rel="stylesheet" type="text/css" href="stylesheet.css">
        <link rel="icon" href="images/logo.png">
        <link href="https://fonts.googleapis.com/css?family=Lato:400,900" rel="stylesheet">
    </head>
    <body>
        <jsp:useBean id="checker" class="login.LoginBean" scope="session"/>  
        <div style="background-color: #333123">
            <c:choose>
                <c:when test="${checker.getValidation(false)}">
                    <jsp:include page="logoutheader.jsp"/>
                </c:when>

                <c:otherwise>    
                    <jsp:include page="loginheader.jsp"/>

                </c:otherwise>
            </c:choose>
            
        <div class="standings">
            <table class="actualtable" border="1">
                <tr class="tableheader">
                    <th>Number</th>
                    <th>Name</th>
                    <th>Grade</th>
                </tr>
                <!--Query -->
                <sql:query dataSource = "${snapshot}" var = "output">
                    SELECT * from football;
                </sql:query>

                <!--Displaying Query -->
                <c:forEach var = "row" items = "${output.rows}">
                    <tr class="tablebody">
                        <td><c:out value = "${row.number}"/></td>
                    <td><c:out value = "${row.Pname}"/></td>
                    <td><c:out value = "${row.grade}"/></td>
                    </tr>
                </c:forEach>
            </table> 
        </div>
            
        </div>  
    </body>
</html>
