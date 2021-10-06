<%-- 
    Document   : calendar
    Created on : Apr 9, 2018, 2:18:43 PM
    Author     : Sourav
    Description: Calendar page with information on upcoming games. 
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
        <title>VILLAGE ATHLETICS - CALENDAR</title>
        <link rel="stylesheet" type="text/css" href="stylesheet.css">
        <link rel="icon" href="images/logo.png">
        <link href="https://fonts.googleapis.com/css?family=Lato:400,900" rel="stylesheet">
    </head>
    <body>
        <jsp:useBean id="checker" class="login.LoginBean" scope="session"/>  
        
               
        <c:choose>
            <c:when test="${checker.getValidation(false)}">
                <c:redirect url="altcalendar.jsp"/>
            </c:when>

            <c:otherwise>    
                <jsp:include page="altloginheader.jsp"/>

            </c:otherwise>
        </c:choose>
        
        <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost:3306/athleticwebsite"
         user = "root"  password = "mysql1"/>
        
        <h1 id='scheduleheader'>Game Schedule</h1>
        
        <div id="topblock" class="calendar">
            <table class="actualtable" border="1">
                <tr class="tableheader">
                    <th>Opposing Team</th>
                    <th>Sport</th>
                    <th>Date</th>
                </tr>
                <!--Query -->
                <sql:query dataSource = "${snapshot}" var = "output">
                    SELECT * FROM schedule ORDER BY date DESC;
                </sql:query>

                <!--Displaying Query -->
                <c:forEach var = "row" items = "${output.rows}">
                    <tr class="tablebody">
                        <td><c:out value = "${row.team}"/></td>
                    <td><c:out value = "${row.sport}"/></td>
                    <td><c:out value = "${row.date}"/></td>
                    </tr>
                </c:forEach>
            </table> 
        </div>
        
        <div>
            <img src="images/Basketball4.JPG" class="calendarimage"/>
        </div>
        
    </body>
</html>
