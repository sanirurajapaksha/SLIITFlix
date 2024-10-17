<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="Header.jsp" />


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ticket Management</title>
    <link rel="stylesheet" type="text/css" href="CSS/readticketstyle.css">
</head>

<body>
    <h2 style="text-align:center;">Ticket Management</h2>
    
    <table>
        <tr>
            <th>Ticket ID</th>
            <th>User ID</th>
            <th>Name</th>
            <th>Subject</th>
            <th>Description</th>
            <th>Status</th>
            <th>Priority</th>
            <th>Created Date</th>
            <th>Actions</th>
        </tr>
        
        <c:forEach var="ticket" items="${AllTickets}">
        
                    <tr>
                        <td>${ticket.tid}</td>
                        <td>${ticket.uid}</td>
                        <td>${ticket.name}</td>
                        <td>${ticket.subject}</td>
                        <td>${ticket.description}</td>
                        <td>${ticket.status}</td>
                        <td>${ticket.priority}</td>
                        <td>${ticket.date}</td>
                        <td>
                            <form action="UpdateTicketServlet" method="get" style="display:inline;">
                                <input type="hidden" name="tid" value="${ticket.tid}">
                                <button type="submit">Update</button>
                            </form>
                            <form action="DeleteTicketServlet" method="post" style="display:inline;">
                                <input type="hidden" name="tid" value="${ticket.tid}">
                                <button type="submit" onclick="return confirm('Are you sure you want to delete this ticket?');">Delete</button>
                            </form>
                        </td>
                    </tr>
        
        </c:forEach>
        
    </table>
    
</body>
</html>
<jsp:include page="Footer.jsp" />