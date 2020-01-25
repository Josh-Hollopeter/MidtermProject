<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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

<title>Account details</title>
</head>
<body>
	<header>
		<h1>Health Together</h1>
		<div class="form-group justify-content-center " >
	
		
									
			<a href ="index.do"><input type="button" class ="btn-primary"></a>
			
		
	
			</div>
	</header>
	<style>
#cover {
	background: #222 url('https://www.honorshaven.com/wp-content/uploads/2017/12/Healing-Tai-Chi.jpg') center
		center no-repeat;
	background-size: cover;
	height: 100%;
	text-align: center;
	display: flex;
	align-items: center;
	position: relative;
}

#cover-caption {
	width: 100%;
	position: relative;
	z-index: 1;
}

/* only used for background overlay not needed for centering */
form:before {
	content: '';
	height: 100%;
	left: 0;
	position: absolute;
	top: 0;
	width: 100%;
	background-color: rgba(0, 0, 0, 0.3);
	z-index: -1;
	border-radius: 10px;
}
</style>
<main>
<body class="bg-info ">
	<section id="cover" class="min-vh-100">
		<div id="cover-caption">
			<div class="container">
				<div class="row text-white">
					<div
						class="col-xl-5 col-lg-6 col-md-8 col-sm-10 mx-auto text-center form p-4">
						<h1 class="display-4 py-2 text-truncate">Music Library</h1>
						<div class="px-2">
<%-- 							<form action="" class="justify-content-center"> --%>
					<%-- <c:if test="${empty sessionScope.user}"> 
 							<div class="form-group">
									<form:form action="login.do" modelAttribute="user" class="justify-content-center">
										Error messages
										<form:input path="userName" />
										<form:password path="password" />
										<input type="submit" value="Log In">
									</form:form>
								</div>
								</c:if> --%>
								<div class="form-group">
									<form:form action="updateCreate.do" method="POST" modelAttribute="user" class ="">
		<c:if test="${sessionScope.user.id == 0 }">
        Username: <input type="text" name="username" value ="password" required  maxlength="255" class="form-control text-center bg-dark text-light"> <br> 
        Password: <input type="number" name="oassword" step =".01" MIN="0" MAX = "1000" value="username" required class="form-control text-center bg-dark text-light" > <br>
        </c:if> 
        First Name: <input type="text" name="firstName" value="${user.firstName }" required class="form-control text-center bg-dark text-light" > <br> 
        Last Name: <input type="text" value="${user.lastName}" name="lastName" required class="form-control text-center bg-dark text-light"> <br>
        Email: <input type="number" name="rating" step=".5" MIN="0" MAX="5" value= "${song.rating}" required class="form-control text-center bg-dark text-light"> <br>
        Album: <input type="text" name="album"  value = "${song.album}" required class="form-control text-center bg-dark text-light"> <br>
        Artist: <input type="text" name="artist"  value = "${song.artist}" required class="form-control text-center bg-dark text-light"> <br>
        <input type="hidden" value="${song.id }" name="id">
        <input type ="hidden" value="${user.id}" name = "userId">
       <input type = "Submit" value ="Submit" class="text-center btn btn-dark">
       
</form>
									</form:form>
									
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
</body>
</html>