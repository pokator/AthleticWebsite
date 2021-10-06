<%-- 
    Document   : calendar
    Created on : Apr 9, 2018, 2:18:43 PM
    Author     : Sourav
    Admin page for the calendar which is opened upon a successful addition.
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
                
        <c:if test="!${valid}">
            <c:redirect url="login.jsp"/>
        </c:if>
        
        <c:choose>
            <c:when test="${checker.getValidation(false)}">
                <jsp:include page="altlogoutheader.jsp"/>
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
        
        <!--Upcoming Games Updates -->
        <div class="adminform">
            
            <h4>Update Successful!</h4>
            <h3 id="playerentry">Add Upcoming Games</h3>
            <h4>Type the opposing team's name, sport, and<br> date, then submit.</h4>
            <h4>Make sure to check your entries!</h4>
            <form action="scheduler" method="POST" class="actuallogin">
                <input type="text" name="team" class="article" placeholder="Opposing Team" required>
                <br><br>
                
                <select name="sport" size="1" required>
                        <option value="Cross-Country">Cross-Country</option>
                        <option value="Football">Football</option>
                        <option value="Men's Basketball">Men's Basketball</option>
                        <option value="Women's Basketball">Women's Basketball</option>
                        <option value="Men's Lacrosse">Men's Lacrosse</option>
                        <option value="Women's Lacrosse">Women's Lacrosse</option>
                        <option value="Men's Soccer">Men's Soccer</option>
                        <option value="Women's Soccer">Women's Soccer</option>
                        <option value="Swimming">Swimming</option>
                        <option value="Tennis">Tennis</option>
                        <option value="Track & Field">Track & Field</option>
                        <option value="Volleyball">Volleyball</option>
                        <option value="Golf">Golf</option>
                </select>    
                <br><br>
                
                <input type="date"  min="2018-01-01" max="3000-12-31" name="date" class="article" required>   
                <br><br>
                
                <input type="submit" value="Add Upcoming Game" class="submit">
            </form>
            
            <h3 id="playerentry"> Delete A Game</h3>
            <h4>Select the opponent, date, and <br>sport to delete a game.</h4>
            
            <form action="scheduleDelete" method="POST">
                <!--Query -->
                <sql:query dataSource = "${snapshot}" var = "output">
                    SELECT * FROM schedule;
                </sql:query>
                    
                <select name="date" size="1" required>
                        <option value="" selected disabled hidden>Game Date</option>
                    <c:forEach var = "row" items = "${output.rows}">
                        <option value="${row.date}"> <c:out value = "${row.date}"/> </option>
                    </c:forEach>
                </select> 
                    <br><br>
                <select name="sport" size="1" required>
                        <option value="" selected disabled hidden>Sport</option>
                    <c:forEach var = "row" items = "${output.rows}">
                        <option value="${row.sport}"> <c:out value = "${row.sport}"/> </option>
                    </c:forEach>
                </select> 
                    <br><br> 
                <select name="team" size="1" required>
                        <option value="" selected disabled hidden>Opponent</option>
                    <c:forEach var = "row" items = "${output.rows}">
                        <option value="${row.team}"> <c:out value = "${row.team}"/> </option>
                    </c:forEach>
                </select> 
                    <br><br>
                <input type="submit" value="Delete Game" class="submit">
            </form>
        </div>
        
    </body>
</html>
