<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Your Work Out</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">

<link rel="stylesheet" href="newWorkout.css">
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
				<!-- 
					<a href="workoutlistallresults.do"><input type="button" value="Show All Workouts"
					class="btn-success"></a> -->
			</div>
		</nav>
	</header>
	<main >
		<section id="cover" class="min-vh-100">
			<div id="cover-caption">
				<div class="container">
					<div class="row text-white">
						<div
							class="col-xl-5 col-lg-6 col-md-8 col-sm-10 mx-auto text-center form p-4">
<!-- 							<h1 class="display-4 py-2 text-truncate">Account Info</h1>
 -->							<div class="px-2"> 



								<div class="form-group">
	<h2>Edit Your Workout</h2>



		
		 	
			<p>Original Location: ${workout.location.name} </p>
		<c:if test="${!empty location }"> 
			<p>New Location: ${location.name}</p> 
		</c:if>
		

		<button id="myBtn" data-toggle="modal" data-target="#myModal1">Pick
			a Location</button>

		<!-- The Modal -->
		<div id="myModal1" class="modal">

			<!-- Modal content -->
				<div class="model-dialog">
				<div class="modal-content">
				<div class="modal-header">
										</div>
				<div class="modal-body">
				<span class="close" data-dismiss="modal"> &times; </span>

				<c:forEach var="l" items="${locations}">
					<a href="updatelocation.do?id=${ l.id}&woid=${workout.id}">${l.name}
					</a><br>

				</c:forEach>
				<a href="updatelocation.do?id=${ workout.location.id}&woid=${workout.id}">${workout.location.name}</a>
				
				</div>
			</div>
		</div>
	</div>

<form action="updateworkout.do">
		<br>
		<div class ="input-form">
			Title: <input name="title" type="text" value ="${workout.title}" ><br>
			
		<input type="hidden" value="${workout.location.id}" name="locationid">
		<input type="hidden" value="${workout.id}" name ="workoutid">
			
			Activity: <select name="activityparam">
				<option value="Boxing">Boxing</option>
				<option value="Yoga">Yoga</option>
				<option value="Weight Lifting">Weight Lift</option>
				<option value="Hiking">Hiking</option>
				<option value="Snowboarding">Snow Boarding</option>
				<option value="Roller Blading">Roller Blading</option>
				<option value="Ice Skating">Ice Skating</option>
				<option value="Tai Chi">Tai Chi</option>
				<option value="Running">Running</option>
				<option value="${workout.activity.title}" selected >${workout.activity.title}</option>


			</select><br>
			
			Date: <input name="workoutdate" type="date" path="workout date" value ="${workout.workoutDate }"><br>

			Description: <input type="text" name="description"
				value="${workout.description}">

		</div>

		<br><input type="submit" value="Submit">
	</form ><br><br>
<!-- 		<button id="myBtn" data-toggle="modal" data-target="#myModal">Add
			a Location</button>

		The Modal
		<div id="myModal" class="modal">

			Modal content
			<div class="modal-content">
<form action="newLocation.do">
		

				<span class="close">&times;</span> Name: <input name="name"
					type="text" placeholder="Your wonderfull workout" name="street"><br>
				Street: <input type="text" placeholder="123 abc street"
					name="street"><br> City: <input type="text"
					placeholder="Denver" name="city"> State: <select
					name="state">
					<option value="CO">CO</option>
					<option value="AL">AL</option>
					<option value="AK">AK</option>
					<option value="AZ">AZ</option>
					<option value="AR">AR</option>
					<option value="CA">CA</option>
					<option value="CT">CT</option>
					<option value="DE">DE</option>
					<option value="FL">FL</option>
					<option value="GA">GA</option>
					<option value="HI">HI</option>
					<option value="ID">ID</option>
					<option value="IL">IL</option>
					<option value="IN">IN</option>
					<option value="IA">IA</option>
					<option value="KS">KS</option>
					<option value="KY">KY</option>
					<option value="LA">LA</option>
					<option value="ME">ME</option>
					<option value="MA">MA</option>
					<option value="MI">MI</option>
					<option value="MN">MN</option>
					<option value="MS">MS</option>
					<option value="MO">MO</option>
					<option value="MT">MT</option>
					<option value="NE">NE</option>
					<option value="NV">NV</option>
					<option value="NH">NH</option>
					<option value="NJ">NJ</option>
					<option value="NM">NM</option>
					<option value="NY">NY</option>
					<option value="NC">NC</option>
					<option value="ND">ND</option>
					<option value="OH">OH</option>
					<option value="OK">OK</option>
					<option value="OR">OR</option>
					<option value="PA">PA</option>
					<option value="RI">RI</option>
					<option value="SC">SC</option>
					<option value="SD">SD</option>
					<option value="TN">TN</option>
					<option value="TX">TX</option>
					<option value="UT">UT</option>
					<option value="VT">VT</option>
					<option value="WA">WA</option>
					<option value="WV">WV</option>
					<option value="WI">WI</option>
					<option value="WY">WY</option>
					<option value="DC">DC</option>
					<option value="MH">DC</option>

				</select> Zip: <input type="number" placeholder="80121" name="zip"><br>
				<input type="submit" value="Submit" >
			
			</form>
			</div>
			<div class="form-group"></div>


		</div> -->
						</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		</main> 
		<footer>
		<p>Created by Matt Aldrete, George Moore, Josh Hollopeter, Kai Shu</p>
	</footer>
		<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<script>
		$(document).ready(function() {
			$('[data-toggle="popover"]').popover();
		});
	</script>
	<script>   $('#submit').click( function () {
$('#myModal').modal('hide');     }); </script>
</body>

</html>