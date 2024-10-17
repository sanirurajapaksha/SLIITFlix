<%@page import="com.SLIITFlix.DBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ page import="java.sql.Connection"%>
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
            String[] imageList = {
    				"https://dnm.nflximg.net/api/v6/Qs00mKCpRvrkl3HZAN5KwEL1kpE/AAAABR871v8B_5W4-2bL3zy0-l1jI1d_kDdYwjnAQXO84kUMxrrbFDunGwXrJN1H_TbQ3qqap3HbzIMjw8HyQuWDGhfgHarGKPtE6JfLZ-awelcRb_ipCja19iEU7yNWXTtp7yvN.jpg?r=347",
    				"https://dnm.nflximg.net/api/v6/Qs00mKCpRvrkl3HZAN5KwEL1kpE/AAAABRbvVtieijHhXFiI0CUjGQ9PlVKzslRpdqfVmJLZJs0eJt5pL7sTogCyeIwKDkyWebLB99PFt5I1xzMaHP12rSrCRrKJsk-iSluf0m8qCgaRiRqUEeZB3TqZUV-nWwDwKf7o.jpg?r=87c",
    				"https://dnm.nflximg.net/api/v6/E8vDc_W8CLv7-yMQu8KMEC7Rrr8/AAAABWWUX7IEVu5DfxDND9-a6EFUJloSZFcDJB-oIblnHgF0Au7qkcpmweQZf2hdV-cpSId1o5gQv72D4q8TYjDiOPvrRDa6YIX5Aup9.jpg?r=afe",
    				"https://dnm.nflximg.net/api/v6/E8vDc_W8CLv7-yMQu8KMEC7Rrr8/AAAABfPrkVMb9XNR6vGInbEuuunjYhclhZmZfQntj6cC3ZuGoVqzz-eZ11s7voM7QIHz2PD7Ww5cYfsOBE4zz-hUs_r6mxjh46YxqRZ6.jpg?r=7c6",
    				"https://dnm.nflximg.net/api/v6/E8vDc_W8CLv7-yMQu8KMEC7Rrr8/AAAABWGdxWQ4QtgPrF5dFNs91jtp184Y7dUWDn0zAGWPGPO2hDV9riEx1ZsFVhx1YRn-qFhwohZSaQpTMO73Yf4yjn2caFz2F1z8pyQj.jpg?r=909",
    				"https://dnm.nflximg.net/api/v6/E8vDc_W8CLv7-yMQu8KMEC7Rrr8/AAAABWySmHJziOsXcoE4-MACmIT0fKNt8IY6puaZmWiq5kZvK513QA06LMK4FYL71terfrgUJygTlYqWeR6R56EmaE0t-a9AMj8ZTvsK.jpg?r=7b2",
    				"https://dnm.nflximg.net/api/v6/E8vDc_W8CLv7-yMQu8KMEC7Rrr8/AAAABWySmHJziOsXcoE4-MACmIT0fKNt8IY6puaZmWiq5kZvK513QA06LMK4FYL71terfrgUJygTlYqWeR6R56EmaE0t-a9AMj8ZTvsK.jpg?r=7b2",
    				"https://dnm.nflximg.net/api/v6/E8vDc_W8CLv7-yMQu8KMEC7Rrr8/AAAABZ_YfNDXbKc6TVH4lRZvFfujNeeC-uRtWsGcZ-1xc6BGvkri9-oLyPiStVzGHY4OHKcbfKWV9QCeUhcvJXXCkWe49eX3nMkP5UAN.jpg?r=3e0",
    				"https://dnm.nflximg.net/api/v6/E8vDc_W8CLv7-yMQu8KMEC7Rrr8/AAAABXenOpKRwUeWfkm79Vboljl_yfD0fyxXzEMA00GCwK7uDQbHdjGpros4qa74ojGKFmwNmvobE6c-BbTfI20oe7wIDBNdYwkfU048.jpg?r=878",
    				"https://dnm.nflximg.net/api/v6/E8vDc_W8CLv7-yMQu8KMEC7Rrr8/AAAABS7BK2DBV9MzsWUVGfchXjE27CKxstSW_HGLEIFML8D0bdA10ylWCTedyLXTenfcYL9ym-bX1Kii2ynvg4nImrSSXhDFdBeNp67m.jpg?r=48c"
    		};
            
            try {
                Connection con = DBConnection.getConnection();
                String sql = "SELECT * FROM content";
                PreparedStatement prstmt = con.prepareStatement(sql);
                ResultSet result_set = prstmt.executeQuery();

                int i = 0; // Index for iterating through the imageList

                while (result_set.next()) {
                    if (i >= imageList.length) {
                        i = 0; // Reset index if we exceed the length of imageList
                    }
        %>

        <!-- Movie card displaying the content details dynamically -->
        <div class="card" id="<%= result_set.getInt(1) %>">
            <img src="<%= imageList[i] %>" alt="Movie Image">
            <h3><%= result_set.getString(2) %></h3> <!-- Movie title -->
            <p><%= result_set.getString(7) %></p> <!-- Movie description -->
            <h4><%= result_set.getString(5) %></h4> <!-- Additional details, e.g. release year -->
            <a href="InsertRating.jsp?uid=<%= String.valueOf(session.getAttribute("user_id")) %>&cid=<%= result_set.getInt(1) %>">
                <button id="rate_button">Rate</button>
            </a>
        </div>

        <%
                    i++; // Increment the imageList index for the next card
                }
            } catch (Exception e) {
                System.out.println(e);
            }
        %>
        
    </div>

</body>
</html>

<jsp:include page="Footer.jsp" />
