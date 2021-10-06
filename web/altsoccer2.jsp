<%-- 
    Document   : soccer
    Created on : Apr 19, 2018, 11:22:08 AM
    Author     : Sourav
    Description: Alternate Soccer page to manipulate standings and games (if Admin) - triggered on successful update.
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
        <title>VILLAGE ATHLETICS - SOCCER</title>
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
        
        <div class="msoccer">
            <div class="sportintro">
                <img src="images/Soccer2.jpg" id="topblock" class="sportimage"/>
                <div class="sportblock" id="topblock">
                    <h2 class="sporttitle">MEN'S SOCCER</h2>
                    <h3 class="sportsubheader">
                        The VHS Men's Soccer program has been <br>
                        incredibly dominant throughout the years, <br>
                        with numerous victories and several <br>
                        championship wins.
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
                        SELECT * from msoccer;
                    </sql:query>
                    <!-- display db query results. -->    

                    <c:forEach var = "row" items = "${output.rows}">
                        <tr class="tablebody">
                            <td><c:out value = "${row.Pnumber}"/></td>
                        <td><c:out value = "${row.pname}"/></td>
                        <td><c:out value = "${row.grade}"/></td>
                        </tr>
                    </c:forEach>
                </table>        
            </div>
        </div>
        
        <div id="topblock" class="standingsTable">
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
                    SELECT * FROM msoccerstandings ORDER BY win DESC;
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
        
        <div id="topblock" class="standingsTable" class="bottomblock">
            <h1 id='standingheader'>ScoreFeed</h1>
            <!--Query -->
            <sql:query dataSource = "${snapshot}" var = "output">
                SELECT * FROM msoccergames ORDER BY date DESC;
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
        
        <!--Upcoming Games entry -->
        <div id="moveUp" class="bottomblock" >
            <h3 id="playerentry">Update Standings and Games</h3>
            <h4>Enter the home team, away team, <br> home score, away score, and the <br> date of the game.</h4>
            <h4>Make sure to check your entries!</h4>
            <form action="standings" method="POST" class="actuallogin">                
                <select name="sport" size="1" required>                        
                        <option value="msoccer">Men's Soccer</option>
                </select>
                <br><br>
                
                
                <!--Query -->
                <sql:query dataSource = "${snapshot}" var = "output">
                    SELECT team FROM msoccerstandings
                </sql:query>
                <input type="date" name="date"  min="2018-01-01" max="3000-12-31"  class="article" required>   
                <br><br>
                
                <select name="homeTeam" size="1" required>
                    <option value="" selected disabled hidden >Home Team</option>
                    <c:forEach var = "row" items = "${output.rows}">
                        <option value="${row.team}"> <c:out value = "${row.team}"/> </option>
                    </c:forEach>
                </select>
                
                <select name="awayTeam" size="1" required>    
                    <option value="" selected disabled hidden>Away Team</option>
                    <c:forEach var = "row" items = "${output.rows}">
                        <option value="${row.team}"/> <c:out value = "${row.team}"/> </option>
                    </c:forEach>
                </select>
                <br><br>
                
                <input type="number" name="homeScore" placeholder="Home Score" class="article" min="0" required>   
                <input type="number" name="awayScore" placeholder="Away Score" class="article" min="0" required>   
                <br> <br>
                
                <input type="submit" value="Update Standings" class="submit">
            </form>
        </div>
        
        <div class="wsoccer">
            <div class="sportintro">
                <img src="http://www.villageschoolathletics.com/sports/wsoc/2017-18/AM_Vill_vs_NB_VikingCup-37_ad_hoc.jpg?max_width=2000" class="sportimage"/>
                <div class="sportblock">
                    <h2 class="sporttitle">WOMEN'S SOCCER</h2>
                    <h3 class="sportsubheader">
                        The VHS Women's Soccer program has been <br>
                        developing and showing promise, and bringing <br>
                        the pieces together for a remarkable team.
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
                        SELECT * from wsoccer;
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
