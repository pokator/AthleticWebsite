<%-- 
    Document   : ccountry
    Created on : Apr 19, 2018, 2:50:35 PM
    Author     : Sourav
    Description: Cross-Country Display Page. Information about the sport and current roster (will have standings).
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
        <title>VILLAGE ATHLETICS - CROSS-COUNTRY</title>
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
        
                
        <!--Connect to DB -->
        <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost:3306/athleticwebsite"
         user = "root"  password = "mysql1"/>
        
        <div class="ccountry">
            <div class="sportintro">
                <img src="http://www.villageschoolathletics.com/sports/xc/2016-17/DSC_1518.jpeg" id="topblock" class="sportimage"/>
                <div id="topblock" class="sportblock">
                    <h2 class="sporttitle">CROSS COUNTRY</h2>
                    <h3 class="sportsubheader">
                        VHS Cross Country has grown into a strong <br>
                        program, full of talented and capable runners.<br>
                        Winners of this year's district meet.
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
                    <!--Query -->

                    <sql:query dataSource = "${snapshot}" var = "output">
                        SELECT * from ccountry;
                    </sql:query>
                    <!--Displaying Query -->

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
    </body>
</html>
