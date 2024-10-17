<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<jsp:include page="Header.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Content Delete page</title>
<link rel="stylesheet" href="CSS/bootstrap.min.css">
<link rel="stylesheet" href="CSS/form1.css">
</head>
<body>

	<%
	String id = request.getParameter("id");
	String title = request.getParameter("title");
	String contentType = request.getParameter("cType");
	String year = request.getParameter("year");
	String genre = request.getParameter("genre");
	String rating = request.getParameter("rating");
	String description = request.getParameter("description");
	String director = request.getParameter("director");
	%>
	
	
	<div class="container">

		<form action="contentServDelete" method="post" onsubmit="return submissionAlert()">

			<div class="details">
				<h2>Delete Content Details</h2>

				<br>

				<div class="form-group">
					<label>Content ID</label> <input type="text" name="contentId" value="<%=id%>" readonly><br>
				</div>



				<div class="form-group">
					<label>Title</label> <input type="text" 
						name="movieTitle" value="<%=title%>" readonly><br>
				</div>

				<div class="form-group">
					<label>Content Type</label> <select name="contentType">
						<option value="Movie" <%= "Movie".equals(contentType) ? "selected" : "" %>>Movie</option>
						<option value="TV Series" <%= "TV Series".equals(contentType) ? "selected" : "" %>>TV Series</option>
					</select>
				</div>

				<div class="form-group">
					<label>Release Year</label> <input type="text" name="releaseYear" value="<%=year%>" readonly><br>
				</div>

				<div class="form-group">
					<label>Genre</label> <input type="text" name="genre"
						value="<%=genre%>" readonly><br>
				</div>

				<div class="form-group">
					<label>Rating</label> <select name="Rating">

						<option value="1"<%= "1".equals(rating) ? "selected" : "" %>>1</option>
						<option value="2"<%= "2".equals(rating) ? "selected" : "" %>>2</option>
						<option value="3"<%= "3".equals(rating) ? "selected" : "" %>>3</option>
						<option value="4"<%= "4".equals(rating) ? "selected" : "" %>>4</option>
						<option value="5"<%= "5".equals(rating) ? "selected" : "" %>>5</option>
					</select>
				</div>

				<div class="form-group">
					<label>Job Description</label>
					<textarea name="description" rows="3" readonly><%=description%></textarea>
					<br>
				</div>

				<div class="form-group">
					<label>Director</label> <input type="text" name="director" value="<%=director%>" readonly><br>
				</div>

				<div class="form-group">
					<button type="submit" class="btn btn-danger btn-l">Delete</button>
				</div>

			</div>
		</form>
	</div>
	<script>
	//java script function to display an alert
	
	function submissionAlert() {

		alert("Content deleted successfully!");
		return true;
	}
	
	</script>
		

</body>
</html>

<jsp:include page="Footer.jsp" />
