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
<link rel="stylesheet" href="singleworkoutdetails.css">
<meta charset="UTF-8">

<title>Event Details</title>
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
						href="workoutlistallresults.do">Workout History</a></li>

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
						class="col-xl-5 col-lg-6 col-md-8 col-sm-10 mx-auto text-center form p-4 bg-dark opct opacity-30">
						<h1 class="display-4 py-2 text-truncate">Event Info</h1>
						<div class="px-2">
							

								<div class="form-group">
								
                <c:choose>
          		<c:when test="${! empty workout }">
          			<img class="card-img-top" src="${workout.activity.image}"
          				alt="Card image cap">
          				<br>
          			<ul>
          				<li>Host: ${workout.user.firstName} ${workout.user.lastName}</li>
          				<li>Title: ${workout.title}</li>
          				<li>Workout Date: ${workout.workoutDate}</li>
          				<li>Workout Time: ${workout.title}</li>
          				<li>Description: ${workout.description}</li>
          				<li>Post Date: ${workout.postdate}</li>
						


          			</ul>
          				Attendees: <c:forEach var="workoutusers" items="${workout.users}">
          				<ul>
          					<li>${workoutusers.firstName}${workoutusers.lastName}</li>
          				</ul>
          			</c:forEach>



          		</c:when>
          		<c:otherwise>
          			<p>No Workout Found</p>
          		</c:otherwise>
          	</c:choose>
          	<c:if test="${! empty workout}">
    
          		<form action="addguesttoworkout.do">
          			<input type="hidden" name="workout" value="${workout.id}" /> <input
          				type="submit" name="Join" value="Join" />
          		</form>
          	
          	</c:if>

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