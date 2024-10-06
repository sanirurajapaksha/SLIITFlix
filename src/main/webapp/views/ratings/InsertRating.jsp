<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<<<<<<< HEAD
<body>                                                                                                                                                                                                                                                                
=======
<body>
 
    <h2>Submit a Review</h2>
    <form action="submit_review.php" method="POST">
        <!-- Rating (range 1 to 5) -->
        <label for="rating">Rating (1-5):</label>
        <input type="number" id="rating" name="rating" min="1" max="5" required><br><br>

        <!-- Review Title -->
        <label for="review_title">Review Title:</label>
        <input type="text" id="review_title" name="review_title" maxlength="100" required><br><br>

        <!-- Recommendation (Yes/No) -->
        <label for="recommendation">Would you recommend it? (Yes/No):</label>
        <select id="recommendation" name="recommendation" required>
            <option value="Yes">Yes</option>
            <option value="No">No</option>
        </select><br><br>

        <!-- Review Tags (Comma-separated tags) -->
        <label for="review_tags">Review Tags (Comma separated, e.g., action, drama):</label>
        <input type="text" id="review_tags" name="review_tags" required><br><br>

        <!-- Spoiler Alert (Yes/No) -->
        <label for="spoiler_alert">Contains Spoilers? (Yes/No):</label>
        <select id="spoiler_alert" name="spoiler_alert" required>
            <option value="1">Yes</option>
            <option value="0">No</option>
        </select><br><br>

        <!-- Review Text -->
        <label for="review_text">Review Text:</label><br>
        <textarea id="review_text" name="review_text" rows="5" cols="50" required></textarea><br><br>

        <!-- Submit Button -->
        <input type="submit" name="submit" value="Submit Review">
    </form>

  

>>>>>>> branch 'master' of https://github.com/sanirurajapaksha/SLIITFlix.git

</body>
</html>