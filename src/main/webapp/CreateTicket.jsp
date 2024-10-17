<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="Header.jsp"/>

<%
    session = request.getSession(false);
    if (session == null || session.getAttribute("user_id") == null) {
        response.sendRedirect("Login.jsp");
        return;
    }
%>

<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <title>Raise a Ticket</title>
    <link rel="stylesheet" type="text/css" href="CSS/createticketstyle.css">
</head>
<body>
    <div class="container">
        <h2>Raise a Support Ticket</h2>
        <form action="CreateTicketServlet" method="post">
        
        	<div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required>
            </div>

            <div class="form-group">
                <label for="subject">Subject:</label>
                <input type="text" id="subject" name="subject" required>
            </div>
            
            
            <div class="form-group">
                <label for="priority">Select Priority:</label>
                <select id="priority" name="priority" required>
                    <option value="low">Low</option>
                    <option value="medium">Medium</option>
                    <option value="high">High</option>
                    <option value="urgent">Urgent</option>
                </select>
            </div>
            
            <div class="form-group">
                <label for="description">Description:</label>
                <textarea id="description" name="description" required></textarea>
            </div>
            
            <input type="hidden" id="uid" name="uid" value="<%= request.getParameter("uid") %>">

            
            <div class="form-group">
                <input type="submit" value="Submit Ticket">
            </div>
        </form>
    </div>
</body>
</html>

<jsp:include page="Footer.jsp" />
