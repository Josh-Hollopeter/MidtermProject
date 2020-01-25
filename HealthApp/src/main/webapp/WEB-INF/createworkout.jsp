<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Your Work Out</title>


</head>
<body>
	<h2>Create Your Own Work out Connect to the community</h2>

	<div>
		Title: <input type="text" path="title"> Activity:
		<selct>
		<option value="Boxing">Boxing</option>
		<option value="Running">Running</option>
		</selct>


		Date: <input type="date" path="workoutDate"> 
		About this workout: <input type="text" path="description"> 
		
		
		
		Location: <button id="myBtn">Open Modal</button>

		<!-- The Modal -->
		<div id="myModal" class="modal">

			<!-- Modal content -->
			<div class="modal-content">
				<span class="close">&times;</span>
				<p>Add a Location</p>
			</div>

		</div>

		<input type="submit" value="Create">
	</div>

</body>
</html>