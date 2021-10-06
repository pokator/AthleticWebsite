<%-- 
    Document   : admin
    Created on : Feb 23, 2018, 9:20:59 PM
    Author     : Sourav
    Purpose: Is the admin page for the user to edit and add to different information.
Imports below:
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql" %>
<%@page import="login.LoginBean"%>  
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>

<!DOCTYPE html>
<html>
    <head>
        <!--header-->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=5">
        <title>VILLAGE ATHLETICS - ADMIN</title>
        <link rel="stylesheet" type="text/css" href="stylesheet.css">
        <link rel="icon" href="logo.png">
        <link href="https://fonts.googleapis.com/css?family=Lato:400,900" rel="stylesheet">
    </head>
    <body>
        
        <jsp:useBean id="checker" class="login.LoginBean" scope="session"/>  
        <!--Login validator -->
            <jsp:setProperty name="checker" property="username" param="username"/>
            <jsp:setProperty name="checker" property="password" param="password"/>
            <%
              boolean valid = checker.getValidation(true);
              if(valid){
                                }
              else{
                  response.sendRedirect("altlogin.jsp");
              }
            %>
            <!--navbar-->
                <jsp:include page="logoutheader.jsp"/> 
                <br>
                <br>
             
            <!--Connect to DB -->
            <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
             url = "jdbc:mysql://localhost:3306/athleticwebsite"
             user = "root"  password = "mysql1"/>
        
            <!--Player Entry Form -->
            <div class="adminform">
                <h3 id="playerentry">Player Entry</h3>
                <h4>Enter player number in first box, name in second, <br>and grade in third.</h4>
                <h4>MAKE SURE TO CHECK THE NAMES! ANY INCORRECT <br>ENTRIES WILL MEAN A COMPLETE RESTART OF THE<br> ENTRY PROCESS.</h4>
                <form action="players.jsp" method="POST" class="actuallogin">
                        <!--Choose DB -->
                        <select name="database" size="1" required>
                            <option value="ccountry">Cross-Country</option>
                            <option value="football">Football</option>
                            <option value="mbasketball">Men's Basketball</option>
                            <option value="wbasketball">Women's Basketball</option>
                            <option value="mlacrosse">Men's Lacrosse</option>
                            <option value="wlacrosse">Women's Lacrosse</option>
                            <option value="msoccer">Men's Soccer</option>
                            <option value="wsoccer">Women's Soccer</option>
                            <option value="swimming">Swimming</option>
                            <option value="tennis">Tennis</option>
                            <option value="track">Track and Field</option>
                            <option value="volleyball">Volleyball</option>
                            <option value="golf">Golf</option>
                        </select>               
                        <br>
                        <br>
                        <!-- Values for each row -->
                        <input type="text" name="number1" placeholder="Enter Player Number" value="1001" required>
                        <input type="text" name="name1"  placeholder="Enter Player Name" required>
                        <input type="text" name="grade1"  placeholder="Enter Player Grade" required>                    
                        <br>

                        <input type="text" name="number2" placeholder="Enter Player Number" value="1002">
                        <input type="text" name="name2"  placeholder="Enter Player Name">
                        <input type="text" name="grade2"  placeholder="Enter Player Grade">
                        <br>

                        <input type="text" name="number3" placeholder="Enter Player Number" value="1003">
                        <input type="text" name="name3"  placeholder="Enter Player Name">
                        <input type="text" name="grade3"  placeholder="Enter Player Grade">
                        <br>

                        <input type="text" name="number4" placeholder="Enter Player Number" value="1004">
                        <input type="text" name="name4"  placeholder="Enter Player Name">
                        <input type="text" name="grade4"  placeholder="Enter Player Grade">
                        <br>

                        <input type="text" name="number5" placeholder="Enter Player Number" value="1005">
                        <input type="text" name="name5"  placeholder="Enter Player Name">
                        <input type="text" name="grade5"  placeholder="Enter Player Grade">
                        <br>

                        <input type="text" name="number6" placeholder="Enter Player Number" value="1006">
                        <input type="text" name="name6"  placeholder="Enter Player Name">
                        <input type="text" name="grade6"  placeholder="Enter Player Grade">
                        <br>

                        <input type="text" name="number7" placeholder="Enter Player Number" value="1007">
                        <input type="text" name="name7"  placeholder="Enter Player Name">
                        <input type="text" name="grade7"  placeholder="Enter Player Grade">
                        <br>

                        <input type="text" name="number8" placeholder="Enter Player Number" value="1008">
                        <input type="text" name="name8"  placeholder="Enter Player Name">
                        <input type="text" name="grade8"  placeholder="Enter Player Grade">
                        <br>

                        <input type="text" name="number9" placeholder="Enter Player Number" value="1009">
                        <input type="text" name="name9"  placeholder="Enter Player Name">
                        <input type="text" name="grade9"  placeholder="Enter Player Grade">
                        <br>

                        <input type="text" name="number10" placeholder="Enter Player Number" value="1010">
                        <input type="text" name="name10"  placeholder="Enter Player Name">
                        <input type="text" name="grade10"  placeholder="Enter Player Grade">
                        <br>

                        <input type="text" name="number11" placeholder="Enter Player Number" value="1011">
                        <input type="text" name="name11"  placeholder="Enter Player Name">
                        <input type="text" name="grade11"  placeholder="Enter Player Grade">
                        <br>

                        <input type="text" name="number12" placeholder="Enter Player Number" value="1012">
                        <input type="text" name="name12"  placeholder="Enter Player Name">
                        <input type="text" name="grade12"  placeholder="Enter Player Grade">
                        <br>

                        <input type="text" name="number13" placeholder="Enter Player Number" value="1013">
                        <input type="text" name="name13"  placeholder="Enter Player Name">
                        <input type="text" name="grade13"  placeholder="Enter Player Grade">
                        <br>

                        <input type="text" name="number14" placeholder="Enter Player Number" value="1014">
                        <input type="text" name="name14"  placeholder="Enter Player Name">
                        <input type="text" name="grade14"  placeholder="Enter Player Grade">
                        <br>

                        <input type="text" name="number15" placeholder="Enter Player Number" value="1015">
                        <input type="text" name="name15"  placeholder="Enter Player Name">
                        <input type="text" name="grade15"  placeholder="Enter Player Grade">
                        <br>

                        <input type="text" name="number16" placeholder="Enter Player Number" value="1016">
                        <input type="text" name="name16"  placeholder="Enter Player Name">
                        <input type="text" name="grade16"  placeholder="Enter Player Grade">
                        <br>

                        <input type="text" name="number17" placeholder="Enter Player Number" value="1017">
                        <input type="text" name="name17"  placeholder="Enter Player Name">
                        <input type="text" name="grade17"  placeholder="Enter Player Grade">
                        <br>

                        <input type="text" name="number18" placeholder="Enter Player Number" value="1018">
                        <input type="text" name="name18"  placeholder="Enter Player Name">
                        <input type="text" name="grade18"  placeholder="Enter Player Grade">
                        <br>

                        <input type="text" name="number19" placeholder="Enter Player Number" value="1019">
                        <input type="text" name="name19"  placeholder="Enter Player Name">
                        <input type="text" name="grade19"  placeholder="Enter Player Grade">
                        <br>

                        <input type="text" name="number20" placeholder="Enter Player Number" value="1020">
                        <input type="text" name="name20"  placeholder="Enter Player Name">
                        <input type="text" name="grade20"  placeholder="Enter Player Grade">
                        <br>

                        <input type="text" name="number21" placeholder="Enter Player Number" value="1021">
                        <input type="text" name="name21"  placeholder="Enter Player Name">
                        <input type="text" name="grade21"  placeholder="Enter Player Grade">
                        <br>

                        <input type="text" name="number22" placeholder="Enter Player Number" value="1022">
                        <input type="text" name="name22"  placeholder="Enter Player Name">
                        <input type="text" name="grade22"  placeholder="Enter Player Grade">
                        <br>

                        <input type="text" name="number23" placeholder="Enter Player Number" value="1023">
                        <input type="text" name="name23"  placeholder="Enter Player Name">
                        <input type="text" name="grade23"  placeholder="Enter Player Grade">
                        <br>

                        <input type="text" name="number24" placeholder="Enter Player Number" value="1024">
                        <input type="text" name="name24"  placeholder="Enter Player Name">
                        <input type="text" name="grade24"  placeholder="Enter Player Grade">
                        <br>

                        <input type="text" name="number25" placeholder="Enter Player Number" value="1025">
                        <input type="text" name="name25"  placeholder="Enter Player Name">
                        <input type="text" name="grade25"  placeholder="Enter Player Grade">
                        <br>

                        <input type="text" name="number26" placeholder="Enter Player Number" value="1026">
                        <input type="text" name="name26"  placeholder="Enter Player Name">
                        <input type="text" name="grade26"  placeholder="Enter Player Grade">
                        <br>

                        <input type="text" name="number27" placeholder="Enter Player Number" value="1027">
                        <input type="text" name="name27"  placeholder="Enter Player Name">
                        <input type="text" name="grade27"  placeholder="Enter Player Grade">
                        <br>

                        <input type="text" name="number28" placeholder="Enter Player Number" value="1028">
                        <input type="text" name="name28"  placeholder="Enter Player Name">
                        <input type="text" name="grade28"  placeholder="Enter Player Grade">
                        <br>

                        <input type="text" name="number29" placeholder="Enter Player Number" value="1029">
                        <input type="text" name="name29"  placeholder="Enter Player Name">
                        <input type="text" name="grade29"  placeholder="Enter Player Grade">
                        <br>

                        <input type="text" name="number30" placeholder="Enter Player Number" value="1030">
                        <input type="text" name="name30"  placeholder="Enter Player Name">
                        <input type="text" name="grade30"  placeholder="Enter Player Grade">
                        <br>

                        <input type="text" name="number31" placeholder="Enter Player Number" value="1031">
                        <input type="text" name="name31"  placeholder="Enter Player Name">
                        <input type="text" name="grade31"  placeholder="Enter Player Grade">
                        <br>

                        <input type="text" name="number32" placeholder="Enter Player Number" value="1032">
                        <input type="text" name="name32"  placeholder="Enter Player Name">
                        <input type="text" name="grade32"  placeholder="Enter Player Grade">
                        <br>

                        <input type="text" name="number33" placeholder="Enter Player Number" value="1033">
                        <input type="text" name="name33"  placeholder="Enter Player Name">
                        <input type="text" name="grade33"  placeholder="Enter Player Grade">
                        <br>

                        <input type="text" name="number34" placeholder="Enter Player Number" value="1034">
                        <input type="text" name="name34"  placeholder="Enter Player Name">
                        <input type="text" name="grade34"  placeholder="Enter Player Grade">
                        <br>

                        <input type="text" name="number35" placeholder="Enter Player Number" value="1035">
                        <input type="text" name="name35"  placeholder="Enter Player Name">
                        <input type="text" name="grade35"  placeholder="Enter Player Grade">
                        <br>

                        <input type="text" name="number36" placeholder="Enter Player Number" value="1036">
                        <input type="text" name="name36"  placeholder="Enter Player Name">
                        <input type="text" name="grade36"  placeholder="Enter Player Grade">
                        <br>

                        <input type="text" name="number37" placeholder="Enter Player Number" value="1037">
                        <input type="text" name="name37"  placeholder="Enter Player Name">
                        <input type="text" name="grade37"  placeholder="Enter Player Grade">
                        <br>

                        <input type="text" name="number38" placeholder="Enter Player Number" value="1038">
                        <input type="text" name="name38"  placeholder="Enter Player Name">
                        <input type="text" name="grade38"  placeholder="Enter Player Grade">
                        <br>

                        <input type="text" name="number39" placeholder="Enter Player Number" value="1039">
                        <input type="text" name="name39"  placeholder="Enter Player Name">
                        <input type="text" name="grade39"  placeholder="Enter Player Grade">
                        <br>

                        <input type="text" name="number40" placeholder="Enter Player Number" value="1040">
                        <input type="text" name="name40"  placeholder="Enter Player Name">
                        <input type="text" name="grade40"  placeholder="Enter Player Grade">
                        <br>

                        <input type="text" name="number41" placeholder="Enter Player Number" value="1041">
                        <input type="text" name="name41"  placeholder="Enter Player Name">
                        <input type="text" name="grade41"  placeholder="Enter Player Grade">
                        <br>

                        <br>
                        <input type="submit" value="Add Players" class="submit">
                </form>
            </div>

            <!--Article entry -->
            <!--<div class="adminform">
                <h3 id="playerentry">New News Article</h3>
                <h4>Type the article and date, then submit.</h4>
                <h4>It is recommended to type the article in a document <br>prior to adding it.</h4>
                <form action="article.jsp" method="POST" class="actuallogin">
                    <input type="text" name="title" class="article" placeholder="Title">
                    <br>
                    <br>
                    <textarea name="article" rows="20" cols="70" class="article" placeholder="Article"></textarea>
                    <br>
                    <input type="date" name="date" class="article">   
                    <br>
                    <br>
                    <input type="submit" value="Add Article" class="submit">
                </form>
                <br>
                <br>
                <h3 id="playerentry">Delete News Article</h3>
                <h4>Select the article and date, then submit.</h4>
                <form action="newsDelete" method="POST">
                    <sql:query dataSource = "${snapshot}" var = "output">
                        SELECT * FROM news;
                    </sql:query>

                    <select name="published" size="1">
                        <option value="" selected disabled hidden>Game Date</option>
                        <c:forEach var = "row" items = "${output.rows}">
                            <option value="${row.published}"> <c:out value = "${row.published}"/> </option>
                        </c:forEach>
                    </select> 
                    <br><br>
                    <select name="title" size="1">
                        <option value="" selected disabled hidden>Sport</option>
                        <c:forEach var = "row" items = "${output.rows}">
                            <option value="${row.title}"> <c:out value = "${row.title}"/> </option>
                        </c:forEach>
                    </select> 
                    <br><br> 
                    <br><br>
                    <input type="submit" value="Delete Article" class="submit">
                </form>
                
            </div>
            -->
            
            <!--Upcoming Games entry -->
            <div class="adminform">
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

                    <input type="date"  min="2018-01-01" max="3000-12-31"  name="date" class="article" required>   
                    <br><br>

                    <input type="submit" value="Add Upcoming Game" class="submit">
                </form>
                
                <h3 id="playerentry"> Delete A Game</h3>
            <h4>Select the opponent, date, and <br>sport to delete a game.</h4>
            <h4>To check which games are inserted, go to the Calendar page.</h4>
            
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

            <!--Upcoming Games entry -->
            <div class="standingsForm">
                <h3 id="playerentry">Update Standings and Games</h3>
                <h4>Enter the home team, away team, <br> home score, away score, and the <br> date of the game.</h4>
                <h4>Make sure to check your entries!</h4>
                <form action="standings" method="POST" class="actuallogin">                
                    <select name="sport" size="1" required>          
                        <option value="" selected disabled hidden>Choose Sport</option>
                        <option value="football">Football</option>
                        <option value="msoccer">Men's Soccer</option>
                        <option value="mlacrosse">Men's Lacrosse</option>
                    </select>
                    <br><br>


                    <!--Query -->
                    <sql:query dataSource = "${snapshot}" var = "output">
                        SELECT team FROM footballstandings
                    </sql:query>
                    <input type="date" name="date"  min="2018-01-01" max="3000-12-31" class="article">   
                    <br><br>

                    <select name="homeTeam" size="1" required>
                        <option value="" selected disabled hidden>Home Team</option>
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

                    <input type="number" name="homeScore" placeholder="Home Score" class="article" required>   
                    <input type="number" name="awayScore" placeholder="Away Score" class="article" required>   
                    <br> <br>

                    <input type="submit" value="Update Standings" class="submit">
                </form>
            </div>
    </body>
</html>
