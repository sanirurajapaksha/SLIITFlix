<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="Header.jsp"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Review</title>
<style>
		
		#body{
			
			flex-direction:column;
			display: flex;
			align-items: center;
			justify-content: center;
			
		}
	
		form {
		    background-color: #f2f2f2; /* Ash background */
		    padding: 50px;
		    border-radius: 10px;
		    width: 50%;
		    margin: 50px;
		    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
		    font-family: Arial, sans-serif;
		}
		
		label {
		    font-size: 16px;
		    color: #333; /* Dark ash text */
		    font-weight: bold;
		}
		
		input[type="text"], input[type="number"], select, textarea {
		    width: 100%;
		    padding: 10px;
		    margin: 10px 0 20px;
		    border: 1px solid #ccc;
		    border-radius: 5px;
		    background-color: #fff; /* White background for input */
		    color: #333; /* Ash text */
		    font-size: 14px;
		}
		
		input[type="text"][readonly] {
		    background-color: #e6e6e6; /* Lighter ash for read-only fields */
		}
		
		textarea {
		    resize: none;
		}
		
		input[type="submit"] {
		    background-color: #333; /* Dark ash for button */
		    color: white; /* White text */
		    border: none;
		    padding: 10px 20px;
		    border-radius: 5px;
		    font-size: 16px;
		    cursor: pointer;
		    transition: background-color 0.3s ease;
		}
		
		input[type="submit"]:hover {
		    background-color: #555; /* Slightly lighter ash on hover */
		}
		
		input, select, textarea {
		    transition: border-color 0.3s ease;
		}
		
		input:focus, select:focus, textarea:focus {
		    border-color: #888; /* Darker ash on focus */
		    outline: none;
		}
		 h2 {
            text-align: center;
        }
  
</style>
</head>
<body>
	<div id="body">
		<h2>Update Reviews</h2>
		<%
		String review_id = request.getParameter("review_id");
		String rating = request.getParameter("rating");
		String review_title = request.getParameter("review_title");
		String recommendation = request.getParameter("recommendation");
		String review_tags = request.getParameter("review_tags");
		String spoiler_alert = request.getParameter("spoiler_alert");
		String review_text = request.getParameter("review_text");
		
		%>
		<form action="updateServlet" method="POST">
		        <!-- Rating (range 1 to 5) -->
		        <label for="review_id">Review ID:</label>
		        <input type="text" id="review_id" name="review_id" value="<%=review_id%>"readonly><br><br>
		        <label for="rating">Rating (1-5):</label>
		        <input type="number" id="rating" name="rating" min="1" max="5" value="<%=rating%>" required><br><br>
		
		        <!-- Review Title -->
		        <label for="review_title">Review Title:</label>
		        <input type="text" id="review_title" name="review_title" maxlength="100"value="<%=review_title%>" required><br><br>
		
		        <!-- Recommendation (Yes/No) -->
		        <label for="recommendation">Would you recommend it? (Yes/No):</label>
		        <select id="recommendation" name="recommendation" value="<%=recommendation%>"required>
		            <option value="Yes">Yes</option>
		            <option value="No">No</option>
		        </select><br><br>
		
		        <!-- Review Tags (Comma-separated tags) -->
		        <label for="review_tags">Review Tags (Comma separated, e.g., #action, #drama):</label>
		        <input type="text" id="review_tags" name="review_tags" value="<%=review_tags%>" required><br><br>
		
		        <!-- Spoiler Alert (Yes/No) -->
		        <label for="spoiler_alert">Contains Spoilers? (Yes/No):</label>
		        <select id="spoiler_alert" name="spoiler_alert" value="<%=spoiler_alert%>" required>
		            <option value="1">Yes</option>
		            <option value="0">No</option>
		        </select><br><br>
		
		        <!-- Review Text -->
		        <label for="review_text">Review Text:</label><br>
		        <textarea id="review_text" name="review_text" rows="5" cols="50" required><%=review_text%></textarea><br><br>
		
		        <!-- Submit Button -->
		        <input type="submit" name="submit" value="Submit Review">
		    </form>
	</div>
    
</body>
</html>

<jsp:include page="Footer.jsp"/>