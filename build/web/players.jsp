<%-- 
    Document   : players
    Created on : Mar 10, 2018, 11:21:35 AM
    Author     : Sourav
    Purpose: This page deletes from and updates the database of players.
Imports below:
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@page import="login.LoginBean"%>  
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=5">
        <title>VILLAGE ATHLETICS - ADMIN</title>
        <link rel="stylesheet" type="text/css" href="stylesheet.css">
        <link rel="icon" href="images/logo.png">
        <link href="https://fonts.googleapis.com/css?family=Lato:400,900" rel="stylesheet">
    </head>
    <body>
        <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost:3306/athleticwebsite"
         user = "root"  password = "mysql1"/>
        
        <!--Delete old player set -->
        <sql:update dataSource = "${snapshot}" var = "output">
            DELETE FROM <%=(String) request.getParameter("database")%>;
        </sql:update>
        <!--Add new players -->
        <sql:update dataSource = "${snapshot}" var = "output">
            INSERT INTO <%=(String) request.getParameter("database")%> VALUES (?, ?, ?), (?, ?, ?), (?, ?, ?), (?, ?, ?), (?, ?, ?), (?, ?, ?), (?, ?, ?), (?, ?, ?), (?, ?, ?), (?, ?, ?), (?, ?, ?), (?, ?, ?), (?, ?, ?), (?, ?, ?), (?, ?, ?), (?, ?, ?), (?, ?, ?), (?, ?, ?), (?, ?, ?), (?, ?, ?), (?, ?, ?), (?, ?, ?), (?, ?, ?), (?, ?, ?), (?, ?, ?), (?, ?, ?), (?, ?, ?), (?, ?, ?), (?, ?, ?), (?, ?, ?), (?, ?, ?), (?, ?, ?), (?, ?, ?), (?, ?, ?), (?, ?, ?), (?, ?, ?), (?, ?, ?), (?, ?, ?), (?, ?, ?), (?, ?, ?), (?, ?, ?);
            
            <sql:param value="${param.number1}"/>
            <sql:param value="${param.name1}"/>
            <sql:param value="${param.grade1}"/>
            
            <sql:param value="${param.number2}"/>
            <sql:param value="${param.name2}"/>
            <sql:param value="${param.grade2}"/>
            
            <sql:param value="${param.number3}"/>
            <sql:param value="${param.name3}"/>
            <sql:param value="${param.grade3}"/>
            
            <sql:param value="${param.number4}"/>
            <sql:param value="${param.name4}"/>
            <sql:param value="${param.grade4}"/>
            
            <sql:param value="${param.number5}"/>
            <sql:param value="${param.name5}"/>
            <sql:param value="${param.grade5}"/>
            
            <sql:param value="${param.number6}"/>
            <sql:param value="${param.name6}"/>
            <sql:param value="${param.grade6}"/>
            
            <sql:param value="${param.number7}"/>
            <sql:param value="${param.name7}"/>
            <sql:param value="${param.grade7}"/>
            
            <sql:param value="${param.number8}"/>
            <sql:param value="${param.name8}"/>
            <sql:param value="${param.grade8}"/>
            
            <sql:param value="${param.number9}"/>
            <sql:param value="${param.name9}"/>
            <sql:param value="${param.grade9}"/>
            
            <sql:param value="${param.number10}"/>
            <sql:param value="${param.name10}"/>
            <sql:param value="${param.grade10}"/>
            
            <sql:param value="${param.number11}"/>
            <sql:param value="${param.name11}"/>
            <sql:param value="${param.grade11}"/>
            
            <sql:param value="${param.number12}"/>
            <sql:param value="${param.name12}"/>
            <sql:param value="${param.grade12}"/>
            
            <sql:param value="${param.number13}"/>
            <sql:param value="${param.name13}"/>
            <sql:param value="${param.grade13}"/>
            
            <sql:param value="${param.number14}"/>
            <sql:param value="${param.name14}"/>
            <sql:param value="${param.grade14}"/>
            
            <sql:param value="${param.number15}"/>
            <sql:param value="${param.name15}"/>
            <sql:param value="${param.grade15}"/>
            
            <sql:param value="${param.number16}"/>
            <sql:param value="${param.name16}"/>
            <sql:param value="${param.grade16}"/>
            
            <sql:param value="${param.number17}"/>
            <sql:param value="${param.name17}"/>
            <sql:param value="${param.grade17}"/>
            
            <sql:param value="${param.number18}"/>
            <sql:param value="${param.name18}"/>
            <sql:param value="${param.grade18}"/>
            
            <sql:param value="${param.number19}"/>
            <sql:param value="${param.name19}"/>
            <sql:param value="${param.grade19}"/>
            
            <sql:param value="${param.number20}"/>
            <sql:param value="${param.name20}"/>
            <sql:param value="${param.grade20}"/>
            
            <sql:param value="${param.number21}"/>
            <sql:param value="${param.name21}"/>
            <sql:param value="${param.grade21}"/>
            
            <sql:param value="${param.number22}"/>
            <sql:param value="${param.name22}"/>
            <sql:param value="${param.grade22}"/>
            
            <sql:param value="${param.number23}"/>
            <sql:param value="${param.name23}"/>
            <sql:param value="${param.grade23}"/>
            
            <sql:param value="${param.number24}"/>
            <sql:param value="${param.name24}"/>
            <sql:param value="${param.grade24}"/>
            
            <sql:param value="${param.number25}"/>
            <sql:param value="${param.name25}"/>
            <sql:param value="${param.grade25}"/>
            
            <sql:param value="${param.number26}"/>
            <sql:param value="${param.name26}"/>
            <sql:param value="${param.grade26}"/>
            
            <sql:param value="${param.number27}"/>
            <sql:param value="${param.name27}"/>
            <sql:param value="${param.grade27}"/>
            
            <sql:param value="${param.number28}"/>
            <sql:param value="${param.name28}"/>
            <sql:param value="${param.grade28}"/>
            
            <sql:param value="${param.number29}"/>
            <sql:param value="${param.name29}"/>
            <sql:param value="${param.grade29}"/>
            
            <sql:param value="${param.number30}"/>
            <sql:param value="${param.name30}"/>
            <sql:param value="${param.grade30}"/>
            
            <sql:param value="${param.number31}"/>
            <sql:param value="${param.name31}"/>
            <sql:param value="${param.grade31}"/>
            
            <sql:param value="${param.number32}"/>
            <sql:param value="${param.name32}"/>
            <sql:param value="${param.grade32}"/>
            
            <sql:param value="${param.number33}"/>
            <sql:param value="${param.name33}"/>
            <sql:param value="${param.grade33}"/>   
            
            <sql:param value="${param.number34}"/>
            <sql:param value="${param.name34}"/>
            <sql:param value="${param.grade34}"/>   
            
            <sql:param value="${param.number35}"/>
            <sql:param value="${param.name35}"/>
            <sql:param value="${param.grade35}"/>   
            
            <sql:param value="${param.number36}"/>
            <sql:param value="${param.name36}"/>
            <sql:param value="${param.grade36}"/>   
            
            <sql:param value="${param.number37}"/>
            <sql:param value="${param.name37}"/>
            <sql:param value="${param.grade37}"/>   
            
            <sql:param value="${param.number38}"/>
            <sql:param value="${param.name38}"/>
            <sql:param value="${param.grade38}"/>   
            
            <sql:param value="${param.number39}"/>
            <sql:param value="${param.name39}"/>
            <sql:param value="${param.grade39}"/>   
            
            <sql:param value="${param.number40}"/>
            <sql:param value="${param.name40}"/>
            <sql:param value="${param.grade40}"/> 
            
            <sql:param value="${param.number41}"/>
            <sql:param value="${param.name41}"/>
            <sql:param value="${param.grade41}"/>   
        </sql:update>
            
        <!--remove extra values -->
        <sql:update dataSource = "${snapshot}" var = "output">
            DELETE FROM <%=(String) request.getParameter("database")%> WHERE pname='';
        </sql:update>
            
        <c:redirect url="altadmin.jsp"/>
    </body>
</html>
