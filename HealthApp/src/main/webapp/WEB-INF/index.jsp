<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
	<nav class= "navbar navbar-light" style="background-color: #2F4F4F;">
		<h1>Health Together</h1>
		<div class="form-group justify-content-center " id="log">
			<form:form action="login.do" modelAttribute="user"
				class="justify-content-center">
	<c:if test="${  empty sessionScope.user || sessionScope.user.id == 0 }">
				<form:input path="username" placeholder="username" />
				<form:password path="password" placeholder="password" />
				<input type="submit" value="Log In">

				<a href="createupdateuser.do"><input type="button" value="Create"
					class="btn-primary"></a>
					</c:if>
				<a href="createworkout.do"><input type="button" value="Create Workout"
					class="btn-success"></a>

			<c:if test ="${!empty sessionScope.user && sessionScope.user.id > 0 }">
				<a href="userhome.do"><input type="button" value="${sessionScope.user.firstName}'s Profile"
					class="btn-success"></a>
					</c:if>


			</form:form>

		</div>
</nav>
	</header>

	<main>
		<div class="card text-white bg-secondary mb-3 text-center"
			style="max-width: 30rem; text-align: center; margin:  auto;">
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
					<p class="card-text">This is a longer card with supporting text
						below as a natural lead-in to additional content. This content is
						a little bit longer.</p>
					<p class="card-text"></p>
				</div>
			</div>
			<div class="card">
				<img class="card-img-top"
					src="https://images.squarespace-cdn.com/content/v1/5c533c61e5f7d1726dd7a727/1553004037371-5VDR1JJN4GWYEKK8UKX7/ke17ZwdGBToddI8pDm48kLkXF2pIyv_F2eUT9F60jBl7gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z4YTzHvnKhyp6Da-NYroOW3ZGjoBKy3azqku80C789l0iyqMbMesKd95J-X4EagrgU9L3Sa3U8cogeb0tjXbfawd0urKshkc5MgdBeJmALQKw/IMG_0627.jpg?format=2500w"
					alt="Card image cap">
				<div class="card-body">
					<h5 class="card-title">Yoga</h5>
					<p class="card-text">This card has supporting text below as a
						natural lead-in to additional content.</p>
					<p class="card-text"></p>
				</div>
			</div>
			<div class="card bg-info">
				<img class="card-img-top"
					src="https://content.active.com/Assets/Active.com+Content+Site+Digital+Assets/Running/Galleries/Worst+Running+Tips/Slide+1.jpg"
					alt="Card image cap">
				<div class="card-body">
					<h5 class="card-title">Running</h5>
					<p class="card-text">This is a wider card with supporting text
						below as a natural lead-in to additional content. This card has
						even longer content than the first to show </p>
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
					<p class="card-text">This is a longer card with supporting text
						below as a natural lead-in to additional content. This content is
						a little bit longer.</p>
					<p class="card-text"></p>
				</div>
			</div>
			<div class="card">
				<img class="card-img-top"
					src="http://jacksonhole-traveler-production.s3.amazonaws.com/wp-content/uploads/2014/07/1406-laurancerockefellerpreserve-132-1280x853.jpg"
					alt="Card image cap">
				<div class="card-body">
					<h5 class="card-title">Hiking</h5>
					<p class="card-text">This card has supporting text below as a
						natural lead-in to additional content.</p>
					<p class="card-text">
					</p>
				</div>
			</div>
			<div class="card bg-info">
				<img class="card-img-top"
					src="https://www.thesnowcentre.com/snowsure/uploads/articles/thumbs/BSM_L2A.jpg"
					alt="Card image cap">
				<div class="card-body">
					<h5 class="card-title">Snowboarding</h5>
					<p class="card-text">This is a wider card with supporting text
						below as a natural lead-in to additional content. This card has
						even longer content than the first to show that equal height
						action.</p>
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
					<p class="card-text">This is a longer card with supporting text
						below as a natural lead-in to additional content. This content is
						a little bit longer.</p>
					<p class="card-text"></p>
				</div>
			</div>
			<div class="card">
				<img class="card-img-top"
					src="https://s3.amazonaws.com/njfamily-images/wp-content/uploads/2019/11/NJF_WEB_IceSkating.jpg"
					alt="Card image cap">
				<div class="card-body">
					<h5 class="card-title">Ice Skating</h5>
					<p class="card-text">This card has supporting text below as a
						natural lead-in to additional content.</p>
					<p class="card-text"></p>
				</div>
			</div>
			<div class="card bg-info">
				<img class="card-img-top"
					src="https://www.honorshaven.com/wp-content/uploads/2017/12/Healing-Tai-Chi.jpg"
					alt="Card image cap">
				<div class="card-body">
					<h5 class="card-title">Tai Chi</h5>
					<p class="card-text">This is a wider card with supporting text
						below as a natural lead-in to additional content. This card has
						even longer content than the first to show that equal height
						action.</p>
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