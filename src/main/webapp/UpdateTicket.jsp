<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="Header.jsp" />


<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <title>Update Ticket</title>
    <link rel="stylesheet" type="text/css" href="CSS/createticketstyle.css">
    
</head>

<body>
    <div class="container">
        <h2>Update Support Ticket</h2>
        <form action="UpdateTicketServlet" method="post">
        
        	<div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" value="${ticketDataById.name}" disabled="disabled">
            </div>

            <div class="form-group">
                <label for="subject">Subject:</label>
                <input type="text" id="subject" name="subject" value="${ticketDataById.subject}" disabled="disabled">
            </div>
            
            
            <div class="form-group">
                <label for="priority">Priority:</label>
                <select id="priority" name="priority" disabled="disabled">
                    <option value="${ticketDataById.priority}">${ticketDataById.priority}</option>
                </select>
            </div>
            
            <div class="form-group">
                <label for="description">Description:</label>
                <textarea id="description" name="description" disabled="disabled">${ticketDataById.description}</textarea>
            </div>
            
            
            <div class="form-group">
                <label for="priority">Change Status: Current Status - ${ticketDataById.status}</label>
                <select id="priority" name="status" required>
                    <option value="open">Open</option>
                    <option value="in progress">In Progress</option>
                    <option value="resolved">Resolved</option>
                    <option value="closed">Closed</option>
                    <option value="pending">Pending</option>
                    <option value="on hold">On Hold</option>
                    <option value="cancelled">Cancelled</option>
                </select>
            </div>
            
            <input type="hidden" id="uid" name="tid" value="<%= request.getParameter("tid") %>">

            <div class="form-group">
                <input type="submit" value="Update Ticket">
            </div>
        </form>
    </div>
</body>
</html>

<jsp:include page="Footer.jsp" />