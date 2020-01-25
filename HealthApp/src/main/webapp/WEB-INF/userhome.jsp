<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body><a href ="index.do"><input type="button" class ="btn-primary"> Home </a>
<p>${sessionScope.user}</p>
<p>${sessionScope.user.workouts}</p>
<p>${sessionScope.user.guestWorkouts}</p>
<a href ="createupdateuser.do"><input type="button" class ="btn-primary"> Home </a>



</body>
</html>