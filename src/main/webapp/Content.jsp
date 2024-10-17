<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="Header.jsp" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Submit Content</title>
<link rel="stylesheet" href="CSS/form1.css">
</head>
<body>

	
	<div class="container">
	<form action="ContentServlet" method="post" onsubmit="return vForm()">

        <div class="details">
		<h2>Submit Content Details</h2>
		
		<br> 
		
		<div class="form-group">
		<label>Title</label> 
		<input type="text" name="movieTitle" placeholder="Enter the Movie title" required><br>
		</div>
			
		<div class="form-group">
		<label>Content Type</label>
        <select name="contentType">
             <option value="Movie">Movie</option>
             <option value="TV Series">TV Series</option>
        </select>
        </div>
        
        <div class="form-group">
        <label>Release Year</label>
        <input type="text" name="releaseYear" placeholder="Enter the Release Year" 
              required pattern="\d{4}" title="Please enter a 4-digit year" required><br>
		</div>
		
		<div class="form-group">
		<label>Genre</label>
        <input type="text" name="Genre" placeholder="Enter the Genre" required><br>
        </div>
        
        <div class="form-group">
        <label>Rating</label>
        <select name="Rating">
             <option value="0">1 to 5</option>
             <option value="1">1</option>
             <option value="2">2</option>
             <option value="3">3</option>  
             <option value="4">4</option>
             <option value="5">5</option>                    
        </select>
        </div>
       
        <div class="form-group">
        <label>Job Description</label>
        <textarea name="description" placeholder="Enter the description" rows="3"></textarea><br>
		</div>
		
		<div class="form-group">
		<label>Director</label>
        <input type="text" name="Director" placeholder="Enter the director's name" required><br>
        </div>

        <div class="form-group">
        <button type="submit">Submit</button>
        </div>

    </div>
	</form>
</div>

	<script>	
	function vForm() {
	    const releaseYear = document.getElementById("releaseYear").value;
	    if (releaseYear.length !== 4 || isNaN(releaseYear)) {
	        alert("Please enter a valid 4-digit Year.");
	        return false; 
	    }
	    
	   	return true;
	}
	
	//java script function to display an alert
	function submissionAlert() {

		alert("Content submitted successfully!");
		return true;
	}
	
	
	
	</script>



</body>
</html>

<jsp:include page="Footer.jsp" />