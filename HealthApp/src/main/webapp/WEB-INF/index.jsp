<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
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
		<h1>Health App Home Page</h1>
		<div class="form-group justify-content-center " id="log">
	
		
		<form:form action="login.do" modelAttribute="user" class="justify-content-center">
										<form:input path="username" />
										<form:password path="password" />
										<input type="submit" value="Log In">
									
			<a href ="createupdate.do"><input type="button" value="Create" class ="btn-primary"></a>
			
		</form:form>
		
	
			</div>
	</header>
	<main></main>
	<footer>
		<p>kfdjgjgdf</p>
	</footer>
</body>
</html>