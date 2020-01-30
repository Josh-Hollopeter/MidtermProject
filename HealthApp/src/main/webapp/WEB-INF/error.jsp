<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" 
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" 
	crossorigin="anonymous">

<meta charset="UTF-8">
<title>Error</title>
</head>
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
				<form class="form-inline my-2 my-lg-0"
					action="workoutsearchresults.do">
					
					<button class="btn btn-outline-success my-2 my-sm-0" type="submit"
						name="searchterm">Show All Workouts</button>


				</form>
				<form class="form-inline my-2 my-lg-0"
					action="workoutsearchresults.do">
					<input class="form-control mr-sm-2" type="search"
						placeholder="Search Workout" aria-label="Search" name="searchterm">
					<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>

				</form>
						</div>
		</nav>


<body class ="bg-info container">
<h1 class="bg-danger text-white text-center"> OOPS SOMETHING WENT WRONG, IT'S NOT YOU ITS US !</h1>
<div class="form-group text-center bg-info">
 <form action="index.do" class="text-center" >

<button type ="submit" class="text-center btn btn-dark"> Home</button>
</form>
</div>
</body>
</html>

	