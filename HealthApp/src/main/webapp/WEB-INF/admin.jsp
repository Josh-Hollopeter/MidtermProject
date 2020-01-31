<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>

<ul>
<c:forEach var="user" items="${ allUser}">
<c:if test="${user.id ne '1' }">
<li>ID:${user.id} Name: ${user.firstName} ${user.lastName} </li>


<c:if test="${user.active }">
<form action="deleteuser.do" >
<input type="hidden" value="${user.id }" name="userid">
	<button type="submit" class="btn btn-outline-primary">Deactivate</button></form>			</c:if>
	
	
	
	
	

<c:if test="${not user.active }"><form action="retriveuser.do" >
<input type="hidden" value="${user.id }" name="userid">
	<button type="submit" class="btn btn-outline-primary">Activate</button></form>					</c:if> 
</c:if>
</c:forEach>



</ul>
<c:if test="${! empty sessionScope.user}">
					<a href="logout.do"> Logout </a>
				</c:if>
<c:if test="${! empty sessionScope.user}">
					<a href="index.do"> Home </a>
				</c:if>


</body>
</html>