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
		<c:when test="${! empty sessionScope.workout}">
			<ul>
				<li>ID: ${workout.id}</li>
				<li>Title: ${workout.title}</li>
				
				
				<%-- <li>Name: ${workout.calories}</li>
				<li>Grams: ${veg.grams}</li>
				<li>Fat: ${veg.fat}</li>
				<li>Protein: ${veg.protein}</li>
				<li>Carbs: ${veg.carbs}</li>
				<li>Fiber: ${veg.fiber}</li>
				<li>Type: ${veg.type}</li> --%>
			</ul>
		</c:when>
	<c:otherwise>
		<p>No Workout Found</p>
	</c:otherwise>
	</c:choose>
	<c:if test="${! empty workout}">
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