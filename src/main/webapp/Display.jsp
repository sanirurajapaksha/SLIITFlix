<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="Header.jsp"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Review Table</title>
 <style>
	 #body {
	    font-family: Arial, sans-serif;
	    padding: 20px;
	}
	
	h2 {
	    text-align: center;
	    color: white;
	}
	
	table {
		color:black;
	    width: 100%;
	    border-collapse: collapse;
	    margin: 20px 0;
	    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
	    background-color: white;
	}
	
	th, td {
	    padding: 12px 15px;
	    text-align: left;
	}
	
	th {
	    background-color: #333;
	    color: white;
	    font-weight: bold;
	}
	
	td {
	    border-bottom: 1px solid #ddd;
	}
	
	tr:nth-child(even) {
	    background-color: #f2f2f2;
	}
	
	tr:hover {
	    background-color: #f1f1f1;
	}
	
	button {
	    padding: 8px 16px;
	    border: none;
	    background-color: #333;
	    color: white;
	    cursor: pointer;
	    border-radius: 4px;
	}
	
	button:hover {
	    background-color: #45a049;
	}
	
	form {
	    display: inline-block;
	    margin: 0;
	}
	
	a {
	    text-decoration: none;
	}
	
	a button {
	    background-color: #B2BEB5;
	}
	
	a button:hover {
	    background-color: #e69500;
	}
	
	#searchInput {
            width: 300px;
            padding: 10px;
            margin-bottom: 20px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            display: block;
            margin-left: auto;
            margin-right: auto;
            width: 90%;
        }
 
 </style>
</head>
<body>
	<div id="body">
		<h2>Reviews</h2>
		<input type="text" id="searchInput" placeholder="Search...">
		<table>
		<tr>
		     <th>review_id</th>
		     <th>content_id</th>
		     <th>user_id</th>
		     <th>rating</th>
		     <th>review_title</th>
		     <th>recommendation</th>
		     <th>review_tags</th>
		     <th>spoiler_alert</th>
		     <th>review_text</th>
		     <th>review_date</th>
		      <th>Action<th>
		      
		</tr>
		<c:forEach var="ratings" items="${allratings}">
		<tr>
		     <td>${ratings.review_id }</td>
		     <td>${ratings.content_id}</td>
		     <td>${ratings.user_id }</td>
		     <td>${ratings.rating }</td>
		     <td>${ratings.review_title }</td>
		     <td>${ratings.recommendation}</td>
		     <td>${ratings.review_tags }</td>
		     <td>${ratings.spoiler_alert }</td>
		     <td>${ratings.review_text }</td>
		     <td>${ratings.review_date }</td>
		     <td>
		        <a href="update.jsp?review_id=${ratings.review_id}&content_id=${rating.content_id}&user_id=${rating.user_id}&rating=${rating.rating}&review_title=${rating.review_title}&recommendation=${rating.recommendation}&review_tags=${rating.review_tags}&spoiler_alert=${rating.spoiler_alert}&review_text=${rating.review_text}&user_id=${rating.user_id}">
		             <button>Update</button>
		        </a>
		        
		        <form action="deleteServlet" method="post">
		       		<input type="hidden" name="id" value="${ratings.review_id}"/>
		    
		        	<button>Delete</button>
		        </form>
		      </td>  
		 </tr>
		 </c:forEach>    
		</table>
		<script>
		function filterTable() {
		    var input, filter, table, tr, td, i, txtValue;
		    input = document.getElementById("searchInput");
		    filter = input.value.toUpperCase();
		    table = document.querySelector("table");
		    tr = table.getElementsByTagName("tr");
		
		    for (i = 1; i < tr.length; i++) { // Start from 1 to skip the header row
		        tr[i].style.display = "none"; // Hide all rows initially
		        td = tr[i].getElementsByTagName("td");
		        for (var j = 0; j < td.length; j++) {
		            if (td[j]) {
		                txtValue = td[j].textContent || td[j].innerText;
		                if (txtValue.toUpperCase().indexOf(filter) > -1) {
		                    tr[i].style.display = "";
		                    break;
		                }
		            }
		        }
		    }
		}
		
		// Add the event listener to the search input field outside the function
		document.getElementById("searchInput").addEventListener("input", filterTable);
		</script>
	</div>

</body>
</html>

<jsp:include page="Footer.jsp"/>