<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="model.*" %>
<%! @SuppressWarnings("unchecked") %>
<jsp:include page="Header.jsp" />


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Search Results</title>
    <link rel="stylesheet" type="text/css" href="CSS/indexstyle.css">
</head>
<body>

<h2 style="display: flex; width: 100%; justify-content: center; align-items: center;">Search Results</h2>

<div class="content">

    <%
        List<Content> searchResults = (List<Content>) request.getAttribute("searchResults");
        
        if (searchResults != null && !searchResults.isEmpty()) {
            for (Content content : searchResults) {
    %>
        <!-- Display the search results in a card format -->
        <div class="card" id="<%= content.getContent_id() %>">
            <img src="https://placehold.co/600x400" alt="Movie">
            <h3><%= content.getTitle() %></h3>
            <p><%= content.getDescription() %></p>
            <h4>Genre: <%= content.getGenre() %></h4>
        </div>
    <%
            }
        } else {
    %>
        <p>No results found for your search.</p>
    <%
        }
    %>
</div>

</body>
</html>

<jsp:include page="Footer.jsp" />
