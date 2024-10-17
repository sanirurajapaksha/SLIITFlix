<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Footer</title>
	<link rel="stylesheet" type="text/css" href="indexstyle.css">
</head>

<body>

	
	<% String uid = String.valueOf(session.getAttribute("user_id")); %> 

	<footer class="footer">
    	<img src="assets/2.png" alt="Logo" id="logo_footer">
        <p class="footer_p">&copy; 2024 Movie and TV Series Browser. All rights reserved.</p>
        <p class="footer_p"><a href="#">Privacy Policy</a> | <a href="#">Terms of Service</a> | <a href="CreateTicket.jsp?uid=<%= uid %>">Contact Us</a></p>
    </footer>

</body>
</html>