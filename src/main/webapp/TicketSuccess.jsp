<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="Header.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Success!</title>
</head>
<body>

	<div style="align-self: center; align-items: center; justify-content: center; display: flex; flex-direction: column; height: 100%;">
		<h1>Data Entered Successfully!</h1>
		<a href="ReadTicketServlet">
			<button style="width: 200px; height:50px; background-color: #4CAF50; color: white; border: none; border-radius:20px ; cursor: pointer; font-size: 1em;">Ticket Management</button>
		</a>
	</div>

</body>
</html>

<jsp:include page="Footer.jsp" />
