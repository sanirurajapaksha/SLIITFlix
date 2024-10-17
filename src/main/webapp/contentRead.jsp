<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="Header.jsp" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Details</title>
<link rel="stylesheet" href="CSS/bootstrap.min.css">
</head>
<body>


	<button onclick="location.href='Content.jsp'" class="btn btn-success btn-sm" style="display: inline-block; align-self: flex-end; margin: 20px">Add Content</button>


	<table class="table">
		<thead>
			<tr>
				<th>Content_id</th>
				<th>Title</th>
				<th>Content_type</th>
				<th>Release_year</th>
				<th>Genre</th>
				<th>Ratings</th>
				<th>Description</th>
				<th>Director</th>
				<th>Update</th>
				<th>Delete</th>
			</tr>
		</thead>

		<tbody>
			<c:forEach var="content" items="${allContent}">

				<c:set var="contentId" value="${ content.content_id}" />
				<c:set var="title" value="${ content.title}" />
				<c:set var="contentType" value="${ content.content_type}" />
				<c:set var="releaseYear" value="${ content.release_Year}" />
				<c:set var="genre" value="${ content.genre}" />
				<c:set var="rating" value="${ content.rating}" />
				<c:set var="description" value="${ content.description}" />
				<c:set var="director" value="${ content.director}" />

				<tr>
					<td>${content.content_id }</td>
					<td>${content.title }</td>
					<td>${content.content_type }</td>
					<td>${content.release_Year }</td>
					<td>${content.genre }</td>
					<td>${content.rating }</td>
					<td>${content.description }</td>
					<td>${content.director }</td>

					<td><c:url value="contentUpdate.jsp" var="contUpdate">
							<c:param name="id" value="${contentId }" />
							<c:param name="title" value="${title }" />
							<c:param name="cType" value="${contentType }" />
							<c:param name="year" value="${releaseYear }" />
							<c:param name="genre" value="${genre }" />
							<c:param name="rating" value="${rating }" />
							<c:param name="description" value="${description }" />
							<c:param name="director" value="${director }" />

						</c:url> <a href="${contUpdate}">
							<button class="btn btn-success btn-sm">Update</button>
					</a></td>

					<td><c:url value="contentDelete.jsp" var="contDelete">

							<c:param name="id" value="${contentId }" />
							<c:param name="title" value="${title }" />
							<c:param name="cType" value="${contentType }" />
							<c:param name="year" value="${releaseYear }" />
							<c:param name="genre" value="${genre }" />
							<c:param name="rating" value="${rating }" />
							<c:param name="description" value="${description }" />
							<c:param name="director" value="${director }" />
						</c:url>


							<a href="${contDelete}">
								<button class="btn btn-danger btn-sm">Delete</button>
							</a></td>



				</tr>

			</c:forEach>

		</tbody>

	</table>




</body>
</html>

<jsp:include page="Footer.jsp" />