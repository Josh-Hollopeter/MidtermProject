<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Workouts</title>
</head>
<body>
<h2>All Available Workouts</h2>
	
<c:forEach var="workout" items="${workout}">
		<li>
		<a href="workoutbyid.do?id=${workout.id}">${workout.title}</a>
		</li>
</c:forEach>
		
	<form action="index.do" method="GET">
		<input type="submit" value="Home" />
	</form>
</body>
</html>