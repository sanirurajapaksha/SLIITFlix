<%@page import="com.SLIITFlix.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>

<jsp:include page="Header.jsp" />

<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SLIITFlix - Movie and TV Series Browser</title>
    <link rel="stylesheet" type="text/css" href="indexstyle.css">
    
</head>

<body>

    <form action="SearchServlet" class="search-container" method="post">
    
        <input type="text" id="search-input" name="search" placeholder="Search for movies or TV series...">
    	<button id="search-button">Search</button>
    	
	</form>


    <div class="content">
    
    	<%
	        
	        try {
					        	
	            Connection con = DBConnection.getConnection();
	
	            String sql = "SELECT * FROM content";
	            
	            PreparedStatement prstmt = con.prepareStatement(sql);
	            
	            ResultSet result_set =  prstmt.executeQuery();
	            
	            while(result_set.next()) {
    	
    	%>
        <!-- Sample movie cards -->
        <div class="card" id="<%= result_set.getInt(1) %>">
            <img src="https://picsum.photos/600/400" alt="Movie">
            <h3><%= result_set.getString(2) %></h3>
            <p><%= result_set.getString(7) %></p>
            <h4><%= result_set.getString(5) %></h4>
            <a href="InsertRating.jsp?uid=<%= String.valueOf(session.getAttribute("user_id")) %>&cid=<%= result_set.getInt(1) %>"><button id="rate_button">Rate</button></a>
        </div>

        <%
	            }
	        } catch(Exception e){
	        	System.out.println(e);
	        }
        %>
        
    </div>

</body>
</html>

<jsp:include page="Footer.jsp" />
