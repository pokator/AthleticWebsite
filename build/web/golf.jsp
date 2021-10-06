<%-- 
    Document   : golf
    Created on : Apr 19, 2018, 2:58:25 PM
    Author     : Sourav
    Description: Golf Display Page. Information about the sport and current roster (will have standings).
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
        <title>VILLAGE ATHLETICS - GOLF</title>
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
        <!-- Connect to DB. -->    

        <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost:3306/athleticwebsite"
         user = "root"  password = "mysql1"/>      
        
        <div class="golf">
            <div class="sportintro">
                <img src="http://www.villageschoolathletics.com/sports/golf/2017-18/Image-1_-3-_ad_hoc.jpg" id="topblock" class="sportimage"/>
                <div id="topblock" class="sportblock">
                    <h2 class="sporttitle">GOLF</h2>
                    <h3 class="sportsubheader">
                        VHS Golf is a popular sport at the school. <br>
                        It is a competitive team, with potential <br>
                        towards the future.
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
                        SELECT * from golf;
                    </sql:query>
                    <!-- Display DB query results -->    

                    <c:forEach var = "row" items = "${output.rows}">
                        <tr class="tablebody">
                            <td><c:out value = "${row.pnumber}"/></td>
                        <td><c:out value = "${row.Pname}"/></td>
                        <td><c:out value = "${row.grade}"/></td>
                        </tr>
                    </c:forEach>
                </table>        
            </div>
        </div>
    </body>
</html>
