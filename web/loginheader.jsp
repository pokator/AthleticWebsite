<%-- 
    Document   : loginheader
    Created on : Apr 3, 2018, 4:18:13 PM
    Author     : Sourav
    Description: Standard Login Header for Website.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <!-- Navbar -->
        <div id="navbar">
            <a href="index.jsp">
                <img src="images/logo.png" alt="logo" class="logo">
                <h2 class="pageheaders">THE VILLAGE SCHOOL ATHLETICS </h2>   
            </a>
            <a href="index.jsp" class="navlinks">
                <h2 id="link"> Home </h2>   
            </a>
            <a href="http://www.nordangliaeducation.com/our-schools/houston/village-school" class="navlinks">
                <h2 id="link">Village Home </h2>   
            </a>
            <div class="dropdown">
                <a class="dropbtn">Sports</a>
                <div class="dropdown-content">
                    <a href="fall.jsp">Fall</a>
                    <a href="winter.jsp">Winter</a>                        
                    <a href="spring.jsp">Spring</a>
                    <a href="calendar.jsp">Calendar</a>
                </div>
            </div>
            <a href="login.jsp" class="navlinks1">
                <h2 id="link1">Login</h2>   
            </a>
        </div>
    </body>
</html>
