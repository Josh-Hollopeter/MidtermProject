<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Workout Details</title>
</head>
<body>
<c:choose>
		<c:when test="${! empty workout}">
			<ul>
				<li>Host: ${workout.user.firstName} ${workout.user.lastName}</li>
				<li>Title: ${workout.title}</li>
				<li>Description: ${workout.description}</li>
				<li>Workout Date: ${workout.workoutDate}</li>
				<li>Posted On: ${workout.postdate}</li>
				<li>Location: ${workout.location.name}</li>
				<li>Activity: ${workout.activity.title}</li>
				<li>Users: ${workout.users}</li>
				
			</ul>
		</c:when>
	<c:otherwise>
		<p>No Workout Found</p>
	</c:otherwise>
	</c:choose>
	
	<c:if test="${ empty sessionScope.user }">
		<form action="joinworkout.do" method="GET">
			<input type="submit" value="Join" />
		</form>
	</c:if>
	
	<form action="index.do" method="GET">
		<input type="submit" value="Home" />
	</form>
	

</body>
</html>