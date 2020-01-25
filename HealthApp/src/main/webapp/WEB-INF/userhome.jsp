<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<link rel="stylesheet" href="userhome.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<header>
		<nav class="navbar navbar-dark bg-dark">
			<!-- Navbar content -->
		</nav> 
	</header>
	<main></main>
	<footer> </footer>
	<a href="index.do"><input type="button" class="btn-primary">
		Home </a>
	<p>${sessionScope.user}</p>
	<p>${sessionScope.user.workouts}</p>
	<p>${sessionScope.user.guestWorkouts}</p>
	<a href="createupdateuser.do"><input type="button"
		class="btn-primary"> Home </a>



</body>
</html>