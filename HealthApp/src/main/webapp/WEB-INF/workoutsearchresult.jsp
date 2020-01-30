<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<link rel="stylesheet" href="workoutsearch.css">
<meta charset="UTF-8">
<title>Workout Details</title>
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<a class="navbar-brand" href="index.do">Health Together</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
	<c:if test="${! empty sessionScope.user.firstName}">
					<li class="nav-item active"><a class="nav-link"
						href="userhome.do"> ${sessionScope.user.firstName}'s Profile<span class="sr-only"></span></a></li>
				</c:if>
					<li class="nav-item"><a class="nav-link"
						href="createupdateuser.do">Update Account</a></li>
					<li class="nav-item dropdown"><a class="nav-link"
						href="createworkout.do"> Create Workout </a></li>
					<li class="nav-item dropdown"><a class="nav-link"
						href="finishedworkout.do">Workout History</a></li>
				<c:if test="${! empty sessionScope.user.firstName}">
					<li class="nav-item dropdown"><a class="nav-link"
						href="logout.do"> Logout </a></li>
				</c:if>
				</ul>
				
					<a href="userhome.do"><input type="button" value="${sessionScope.user.firstName}'s Profile"
					class="btn-success"></a>
			</div>
		</nav>
	</header>

	<main style="min-height: 100vh;">
		<c:if test="${!empty workouts}">

			<div class="card text-white bg-secondary mb-3 text-center"
				style="max-width: 30rem; text-align: center; margin: auto;">
				<div class="card-body">
					<h5 class="card-title">Workout List</h5>
					<!-- 				<p class="card-text"></p>
 -->
				</div>
			</div>

		</c:if>
		<c:choose>
			<c:when test="${!empty workouts}">
			<<div class="card-columns">
					<c:forEach var="myworkout" items="${workouts}">
						<c:if test="${myworkout.active}">
						<c:if test="${myworkout.title ne 'D0NTEVER$HOW' }">
 					<div class="card" style="width: 18rem;">
							<img class="card-img-top" src="${myworkout.activity.image}"
								alt="Card image cap">
							<div class="card-body">
								<h5 class="card-title">${myworkout.title}</h5>
								<p class="card-text">
								<table>
									<tr>
										<td><strong>Host:</strong> ${myworkout.user.firstName}
											${myworkout.user.lastName}</td>
									</tr>
									<tr>
										<td><strong>Date:</strong> ${myworkout.workoutDate}</td>
									</tr>
									<tr>
										<td><strong>Workout Name:</strong>
											${myworkout.location.name}</td>
									</tr>
									<tr>
										<td><strong>Description:</strong>
											${myworkout.description}</td>
									</tr>
								</table>
								<a href="workoutbyid.do?id=${myworkout.id}">Details</a>
							</div>
						</div>
						</c:if>
						</c:if>
 					</c:forEach>
					</div>
			</c:when>
			<c:otherwise>
				<p>No Workout Found</p>
			</c:otherwise>
		</c:choose>
	</main>
	<footer>
		<p>Created by Matt Aldrete, George Moore, Josh Hollopeter, Kai Shu</p>
	</footer>

	<c:if test="${ empty sessionScope.user }">
		<form action="joinworkout.do" method="GET">
			<input type="submit" value="Join" />
		</form>
	</c:if>




</body>
</html>