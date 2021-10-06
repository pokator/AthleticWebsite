<%-- 
    Document   : lacrosse
    Created on : Apr 19, 2018, 2:58:32 PM
    Author     : Sourav
    Description: Lacrosse Display Page. Information about the sport and current roster and standings.
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
        <title>VILLAGE ATHLETICS - LACROSSE</title>
        <link rel="stylesheet" type="text/css" href="stylesheet.css">
        <link rel="icon" href="images/logo.png">
        <link href="https://fonts.googleapis.com/css?family=Lato:400,900" rel="stylesheet">
    </head>
    <body>
        <jsp:useBean id="checker" class="login.LoginBean" scope="session"/>  
        <c:choose>
            <c:when test="${checker.getValidation(false)}">
                <c:redirect url="altlacrosse.jsp"/>
            </c:when>

            <c:otherwise>    
                <jsp:include page="loginheader.jsp"/>
                    
            </c:otherwise>
        </c:choose> 
        <!-- Connect to DB. -->    

        <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost:3306/athleticwebsite"
         user = "root"  password = "mysql1"/>
        
        <div class="mlacrosse">
            <div class="sportintro">
                <img src="images/Lacrosse2.jpg" id="topblock" class="sportimage"/>
                <div id="topblock" class="sportblock">
                    <h2 class="sporttitle">MEN'S LACROSSE</h2>
                    <h3 class="sportsubheader">
                        VHS Men's Lacrosse has been a popular <br>
                        program at the school, attracting many talented<br>
                        individuals to compete for a growing team.
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
                        SELECT * from mlacrosse;
                    </sql:query>
                    <!-- Display DB query results -->        
                    <c:forEach var = "row" items = "${output.rows}">
                        <tr class="tablebody">
                            <td><c:out value = "${row.pnumber}"/></td>
                        <td><c:out value = "${row.pname}"/></td>
                        <td><c:out value = "${row.pgrade}"/></td>
                        </tr>
                    </c:forEach>
                </table>        
            </div>
        </div>

        <div id="topblock" class="standingsTableDisplay">
            <h1 id='standingheader'>Current Standings</h1>
            <table class="actualtable" border="1">
                <tr class="tableheader">
                    <th>Team</th>
                    <th>Wins</th>
                    <th>Draws</th>
                    <th>Losses</th>
                </tr>
                <!--Query -->
                <sql:query dataSource = "${snapshot}" var = "output">
                    SELECT * FROM mlacrossestandings ORDER BY win DESC;
                </sql:query>

                <!--Displaying Query -->
                <c:forEach var = "row" items = "${output.rows}">
                    <tr class="tablebody">
                        <td><c:out value = "${row.team}"/></td>
                        <td><c:out value = "${row.win}"/></td>
                        <td><c:out value = "${row.draw}"/></td>
                        <td><c:out value = "${row.loss}"/></td>
                    </tr>
                </c:forEach>
            </table> 
        </div>
        
        <div id="topblock" class="scorefeedDisplay" class="bottomblock">
            <h1 id='standingheader'>ScoreFeed</h1>
            <!--Query -->
            <sql:query dataSource = "${snapshot}" var = "output">
                SELECT * FROM mlacrossegames ORDER BY date DESC;
            </sql:query>

            <!--Displaying Query -->
            <c:forEach var = "row" items = "${output.rows}">
                <div class="scoreDisplay">
                    <h2 class=""><c:out value = "${row.date}"/></h2>
                    
                    <div class="teams">
                        <div class="homeTeam">
                            <h2><c:out value = "${row.home}"/></h2>  
                        </div>
                        <div class="awayTeam">
                            <h2><c:out value = "${row.away}"/></h2>
                        </div>
                    </div>
                    <br>
                    <br>
                    <div class="scores">
                        <div class="homeScore">
                            <h1><c:out value = "${row.homeScore}"/></h1>
                        </div>
                        <div class="awayScore">
                            <h1><c:out value = "${row.awayScore}"/></h1>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        
        <div class="wlacrosse">
            <div class="sportintro">
                <img src="http://www.villageschoolathletics.com/sports/wlax/2017-18/b871cabd-b9ab-42eb-b9a9-dc3a1e1601b6_ad_hoc.jpg?max_width=2000" class="sportimage"/>
                <div class="sportblock">
                    <h2 class="sporttitle">WOMEN'S LACROSSE</h2>
                    <h3 class="sportsubheader">
                        The VHS Women's Lacrosse program has been <br>
                        developing throughout the years, with potential<br>
                        for greatness in the near future.
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
                        SELECT * from wlacrosse;
                    </sql:query>
                    <!-- Display DB query results -->        
                    <c:forEach var = "row" items = "${output.rows}">
                        <tr class="tablebody">
                            <td><c:out value = "${row.pnumber}"/></td>
                        <td><c:out value = "${row.pname}"/></td>
                        <td><c:out value = "${row.pgrade}"/></td>
                        </tr>
                    </c:forEach>
                </table>        
            </div>
        </div>
    </body>
</html>
