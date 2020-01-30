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
<link rel="stylesheet" href="createupdateuser.css">
<meta charset="UTF-8">

<title>Account details</title>
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
					<li class="nav-item active"><a class="nav-link"
						href="userhome.do"> ${sessionScope.user.firstName}'s Profile<span class="sr-only"></span></a></li>
					<li class="nav-item"><a class="nav-link"
						href="createupdateuser.do">Update Account</a></li>
					<li class="nav-item dropdown"><a class="nav-link"
						href="createworkout.do"> Create Workout </a></li>
					<li class="nav-item dropdown"><a class="nav-link"
						href="wcreateworkout.do">Workout History</a></li>

					<li class="nav-item dropdown"><a class="nav-link"
						href="logout.do"> Logout </a></li>


				</ul>
				<form class="form-inline my-2 my-lg-0"
					action="workoutsearchresults.do">
					<input class="form-control mr-sm-2" type="search"
						placeholder="Search Workout" aria-label="Search" name="searchterm">

					<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>

				</form>
				<!-- 
					<a href="workoutlistallresults.do"><input type="button" value="Show All Workouts"
					class="btn-success"></a> -->
			</div>
		</nav>
	</header>
<body class="bg-info ">

	<section id="cover" class="min-vh-100">
		<div id="cover-caption">
			<div class="container">
				<div class="row text-white">
					<div
						class="col-xl-5 col-lg-6 col-md-8 col-sm-10 mx-auto text-center form p-4">
						<h1 class="display-4 py-2 text-truncate">Account Info</h1>
						<div class="px-2">
							

								<div class="form-group">
								
									<form:form action="updateuserinfo.do" method="POST" modelAttribute="user" class ="">
		<c:if test="${empty sessionScope.user ||sessionScope.user.id == 0 }">
        Username: <input type="text" name="username" value ="${sessionScope.user.username}" required  maxlength="255" class="form-control text-center bg-dark text-light"> <br> 
      </c:if>
        Password: <input type="password" name="password"  value="${sessionScope.user.password}" required class="form-control text-center bg-dark text-light" > <br>
        First Name: <input type="text" name="firstName" value="${sessionScope.user.firstName }" required class="form-control text-center bg-dark text-light" > <br> 
        Last Name: <input type="text" value="${sessionScope.user.lastName}" name="lastName" required class="form-control text-center bg-dark text-light"> <br>
        Email: <input type="text" name="email"  value = "${sessionScope.user.email}" required class="form-control text-center bg-dark text-light"> <br>
        Birth Date: <input type="date" name="userDate"  value= "${sessionScope.user.birthDate}" required class="form-control text-center bg-dark text-light"> <br>
     
        <input type ="hidden" value="${sessionScope.user.id}" name = "userId">
       <input type = "Submit" value ="Submit" class="text-center btn btn-dark">

								</form:form>
       
       


							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

</body>
<footer>
	<p>Created by Matt Aldrete, George Moore, Josh Hollopeter, Kai Shu</p>
</footer>
</body>
</html>