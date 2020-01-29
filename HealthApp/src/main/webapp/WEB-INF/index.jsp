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
<link rel="stylesheet" href="mainStyle.css">
<meta charset="UTF-8">

<title>Home Page</title>
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-lg navbar-light bg-light"
			style="display: flex; justify-content: space-between">
			<a class="navbar-brand" href="#">Health Together</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="form-group justify-content-center" id="log"
				style="margin: inherit;">
				<form:form action="login.do" modelAttribute="user"
					class="justify-content-center">
					<c:if
						test="${  empty sessionScope.user || sessionScope.user.id == 0 }">
						<form:input path="username" placeholder="username" />
						<form:password path="password" placeholder="password" />
						<input type="submit" value="Log In">

						<a href="createupdateuser.do"><input type="button"
							value="Create Account" class="btn-primary"></a>
					</c:if>
					<a href="createworkout.do"><input type="button"
						value="Create Workout" class="btn-success"></a>

			<c:if test ="${!empty sessionScope.user && sessionScope.user.id > 0 }">
				<a href="userhome.do"><input type="button" value="${sessionScope.user.firstName}'s Profile"
					class="btn-success"></a></c:if>

				</form:form>

			</div>
		</nav>
	</header>

	<main>
		<div class="card text-white bg-secondary mb-3 text-center"
			style="max-width: 30rem; text-align: center; margin: auto;">
			<div class="card-body">
				<h5 class="card-title">Secondary card title</h5>
				<p class="card-text">Some quick example text to build on the
					card title and make up the bulk of the card's content.</p>
			</div>
		</div>
		<br>
		<div class="card-deck">
			<div class="card" style="background-color: #556B2F;">
				<img class="card-img-top"
					src="https://imgix.bustle.com/uploads/image/2019/2/12/d1dbc79a-dcbe-4c1b-8d37-2ce084e50bdf-shutterstock_721928668.jpg?w=1080&h=600&fit=crop&crop=faces&auto=format&q=70"
					alt="Card image cap">
				<div class="card-body">
					<h5 class="card-title">Boxing</h5>
					<p class="card-text">Sometimes you just want to hit something!
						Boxing is a great way to alleviate that stress in a healthy way.</p>
					<p class="card-text"></p>
				</div>
			</div>
			<div class="card">
				<img class="card-img-top"
					src="https://images.squarespace-cdn.com/content/v1/5c533c61e5f7d1726dd7a727/1553004037371-5VDR1JJN4GWYEKK8UKX7/ke17ZwdGBToddI8pDm48kLkXF2pIyv_F2eUT9F60jBl7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z4YTzHvnKhyp6Da-NYroOW3ZGjoBKy3azqku80C789l0iyqMbMesKd95J-X4EagrgU9L3Sa3U8cogeb0tjXbfawd0urKshkc5MgdBeJmALQKw/IMG_0627.jpg?format=2500w"
					alt="Card image cap">
				<div class="card-body">
					<h5 class="card-title">Yoga</h5>
					<p class="card-text">Yoga as exercise is a physical activity
						consisting mainly of postures,sometimes accompanied by rhythmic
						breathing, and often ending with relaxation or meditation.</p>
					<p class="card-text"></p>
				</div>
			</div>
			<div class="card bg-info">
				<img class="card-img-top"
					src="https://content.active.com/Assets/Active.com+Content+Site+Digital+Assets/Running/Galleries/Worst+Running+Tips/Slide+1.jpg"
					alt="Card image cap">
				<div class="card-body">
					<h5 class="card-title">Running</h5>
					<p class="card-text">Running is an excellent way to strengthen
						the heart and ensure the efficient flow of blood and oxygen
						throughout the body</p>
					<p class="card-text"></p>
				</div>
			</div>
		</div>
		<br>
		<div class="card-deck">
			<div class="card" style="background-color: #556B2F;">
				<img class="card-img-top"
					src="https://cdn.cnn.com/cnnnext/dam/assets/150415172730-weights-super-169.jpg"
					alt="Card image cap">
				<div class="card-body">
					<h5 class="card-title">Weight Lifting</h5>
					<p class="card-text">Running is an excellent way to strengthen
						the heart and ensure the efficient flow of blood and oxygen
						throughout the body. Benefits include improved posture, better
						sleep, gaining bone density, maintaining weight loss</p>
					<p class="card-text"></p>
				</div>
			</div>
			<div class="card">
				<img class="card-img-top"
					src="http://jacksonhole-traveler-production.s3.amazonaws.com/wp-content/uploads/2014/07/1406-laurancerockefellerpreserve-132-1280x853.jpg"
					alt="Card image cap">
				<div class="card-body">
					<h5 class="card-title">Hiking</h5>
					<p class="card-text">Our lives are busier than ever. Nine to
						five jobs, full social calendars and everyday life admin is enough
						to keep us at a permanent level of stress below the surface.</p>
					<p class="card-text"></p>
				</div>
			</div>
			<div class="card bg-info">
				<img class="card-img-top"
					src="https://www.thesnowcentre.com/snowsure/uploads/articles/thumbs/BSM_L2A.jpg"
					alt="Card image cap">
				<div class="card-body">
					<h5 class="card-title">Snowboarding</h5>
					<p class="card-text">Shred it Bro! Snowboarding is a
						recreational activity and Winter Olympic and Paralympic sport that
						involves descending a snow-covered slope while standing on a
						snowboard attached to a rider's feet.</p>
					<p class="card-text"></p>
				</div>
			</div>
		</div>
		<br>
		<div class="card-deck">
			<div class="card" style="background-color: #556B2F;">
				<img class="card-img-top"
					src="https://www.rollerskatedad.com/wp-content/uploads/2019/09/couple-rollerblading-outdoors-1024x681.jpg"
					alt="Card image cap">
				<div class="card-body">
					<h5 class="card-title">Roller Blading</h5>
					<p class="card-text">An extreme sport involving straping
						rollerblades on your feet and doing stunts on urban environment.
						rollerblading is very underground in The United States, only know
						about by rollerbladers skateboards and some bikers.</p>
					<p class="card-text"></p>
				</div>
			</div>
			<div class="card">
				<img class="card-img-top"
					src="https://s3.amazonaws.com/njfamily-images/wp-content/uploads/2019/11/NJF_WEB_IceSkating.jpg"
					alt="Card image cap">
				<div class="card-body">
					<h5 class="card-title">Ice Skating</h5>
					<p class="card-text">Ice skating helps improve your balance
						through fun and positive exercise. Travelling across an incredibly
						slippery surface should quickly train you to stay on your feet.</p>
					<p class="card-text"></p>
				</div>
			</div>
			<div class="card bg-info">
				<img class="card-img-top"
					src="https://www.honorshaven.com/wp-content/uploads/2017/12/Healing-Tai-Chi.jpg"
					alt="Card image cap">
				<div class="card-body">
					<h5 class="card-title">Tai Chi</h5>
					<p class="card-text">Tai chi is a mind-body practice that
						involves a series of slow, flowing exercises that combine
						movement, meditation, and rhythmic breathing.</p>
					<p class="card-text"></p>
				</div>
			</div>
		</div>

	</main>
	<footer>
		<p>Created by Matt Aldrete, George Moore, Josh Hollopeter, Kai Shu</p>
	</footer>
</body>
</html>