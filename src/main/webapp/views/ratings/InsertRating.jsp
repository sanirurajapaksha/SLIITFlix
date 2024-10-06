<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        /* General body styling */
        body {
            background-color: #000;
            color: #fff;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
        }

        /* Form container styling */
        form {
            background-color: #222;
            padding: 20px;
            border-radius: 10px;
            max-width: 600px;
            margin: 0 auto;
        }

        /* Label and input styling */
        label {
            display: block;
            margin-bottom: 8px;
            font-size: 16px;
        }

        input[type="text"], input[type="number"], select, textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            background-color: #333;
            border: 1px solid #444;
            color: #fff;
            border-radius: 5px;
        }

        input[type="submit"] {
            background-color: #555;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background-color: #777;
        }

        /* Header styling */
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
    </style>
</head>
<<<<<<< HEAD
<body>                                                                                                                                                                                                                                                                
=======
<body>
 
    <h2>Submit a Review</h2>
    <form action="#" method="POST">
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