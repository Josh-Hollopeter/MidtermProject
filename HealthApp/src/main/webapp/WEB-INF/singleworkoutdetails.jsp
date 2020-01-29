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
				<img class="card-img-top"
					src="${workout.user.photo}"
					alt="Card image cap">
			<ul>
				<li>Host: ${workout.user.firstName} ${workout.user.lastName}</li>
				<li>Title: ${workout.title}</li>
			</ul>
				Attendees: <c:forEach var = "workoutusers" items = "${workout.users}"><ul><li>${workoutusers.firstName} ${workoutusers.lastName}</li></ul></c:forEach>
	
			
			
		</c:when>
	<c:otherwise>
		<p>No Workout Found</p>
	</c:otherwise>
	</c:choose>
	<c:if test="${! empty workout}">
	<form action="addguesttoworkout.do">
		<input type="hidden" name="workout" value="${workoutusers.id}" /> 
		<input type="submit" name="Join" value="Join" />
	</form>
	<form action="edit.do" method="POST">
		<input type="hidden" name="vid" value="${workout.id}" /> 
		<input type="submit" name="Edit" value="Edit" />
	</form>
	<form action="delete.do">
		<input type="hidden" name="vid" value="${workout.id}" /> 
		<input type="submit" name="Delete" value="Delete" />
	</form>
	</c:if>

</body>
</html>