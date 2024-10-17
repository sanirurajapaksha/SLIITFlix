<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<jsp:include page="Header.jsp" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Success page</title>
<link rel="stylesheet" href="CSS/form1.css">
</head>
<body>

	<h1>Success</h1>

	<form action="contentServRead" method="get">
		<button type="submit">Show Details</button>
	</form>

</body>
</html>

<jsp:include page="Footer.jsp" />