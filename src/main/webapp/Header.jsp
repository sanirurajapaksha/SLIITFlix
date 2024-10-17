<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="indexstyle.css">
</head>

<body>
	<div class="navbar">
        <a href="/SLIITFlixSaniru">
        	<img src="assets/2.png" alt="Logo" id="logo">
        </a>
        
        
        
        <div class="LoginLogout">
        
        <a href="contentServRead">Content Management</a>
        <a href="GetAllServlet">Review Management</a>
        
        	
	        <%
	            String name = (String)session.getAttribute("username");
	        	String uid = String.valueOf(session.getAttribute("user_id"));

	            if (name != null) {
	            %>
	                <a href="profile.jsp" style="color: #4CAF50; margin-right: 1em;">🍿 Welcome, <%= name %></a>
	                <a href="logout.jsp" id="loginbuttons" class="button">Logout</a>
	            <%
	            } else {
	            %>
	                <a href="Login.jsp" id="loginbuttons" class="button">Login</a>
	                <a href="Register.jsp" id="loginbuttons" class="button">Register</a>
	            <%
	            }
	         %>
         </div>
    </div>
</body>
</html>