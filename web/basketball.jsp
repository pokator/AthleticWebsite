<%-- 
    Document   : basketball
    Created on : Apr 19, 2018, 11:20:54 AM
    Author     : Sourav
    Description: Basketball Display Page. Information about the sport and current roster (will have standings).
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
        <title>VILLAGE ATHLETICS - BASKETBALL</title>
        <link rel="stylesheet" type="text/css" href="stylesheet.css">
        <link rel="icon" href="images/logo.png">
        <link href="https://fonts.googleapis.com/css?family=Lato:400,900" rel="stylesheet">
    </head>
    <body>
        <jsp:useBean id="checker" class="login.LoginBean" scope="session"/>  
        <c:choose>
            <c:when test="${checker.getValidation(false)}">
                <jsp:include page="logoutheader.jsp"/>
            </c:when>

            <c:otherwise>    
                <jsp:include page="loginheader.jsp"/>
                    
            </c:otherwise>
        </c:choose>  
         
         <!--Connect to db-->
        <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost:3306/athleticwebsite"
         user = "root"  password = "mysql1"/>
        
        <div class="mbasketball">
            <div class="sportintro">
                <img src="http://www.villageschoolathletics.com/sports/mbkb/2015-16/IMG_8263.jpg?max_width=2000" id="topblock" class="sportimage"/>
                <div id="topblock" class="sportblock">
                    <h2 class="sporttitle">MEN'S BASKETBALL</h2>
                    <h3 class="sportsubheader">
                        VHS Basketball has been at the top of <br>
                        competition for several years now, and <br>
                        is a strong, capable team.
                    </h3>
                </div>   
            </div>
            <div>

            </div>
            <div class="table">
                <h2 class="recent">Current Roster</h2>
                <table class="actualtable" border="1">
                    <tr class="tableheader">
                       <th>Number</th>
                       <th>Name</th>
                       <th>Grade</th>
                    </tr>
                    <sql:query dataSource = "${snapshot}" var = "output">
                        SELECT * from mbasketball;
                    </sql:query>
                    <!-- display db query results. -->    
                    <c:forEach var = "row" items = "${output.rows}">
                       <tr class="tablebody">
                          <td><c:out value = "${row.number}"/></td>
                          <td><c:out value = "${row.pname}"/></td>
                          <td><c:out value = "${row.grade}"/></td>
                       </tr>
                    </c:forEach>
                 </table>        
            </div>
        </div>
        <div class="wbasketball">
            <div class="sportintro">
                <img src="images/Basketball3.JPG" class="sportimage"/>
                <div class="sportblock">
                    <h2 class="sporttitle">WOMEN'S BASKETBALL</h2>
                    <h3 class="sportsubheader">
                        VHS Women's Basketball has been performing<br>
                        phenomenally, showing good promise into the<br>
                        future.
                    </h3>
                </div>   
            </div>
            <div>

            </div>
            <div class="table">
                <h2 class="recent">Current Roster</h2>
                <table class="actualtable" border="1">
                    <tr class="tableheader">
                       <th>Number</th>
                       <th>Name</th>
                       <th>Grade</th>
                    </tr>

                    <sql:query dataSource = "${snapshot}" var = "output">
                        SELECT * from wbasketball;
                    </sql:query>
                    <!-- display db query results. -->    

                    <c:forEach var = "row" items = "${output.rows}">
                       <tr class="tablebody">
                          <td><c:out value = "${row.pnumber}"/></td>
                          <td><c:out value = "${row.pname}"/></td>
                          <td><c:out value = "${row.grade}"/></td>
                       </tr>
                    </c:forEach>
                 </table>        
            </div>
        </div>
    </body>
</html>
