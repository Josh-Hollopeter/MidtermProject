<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Your Work Out</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

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
		 About this Workout: <input type="text" path="description">

	</div>


	Location:<!-- Trigger/Open The Modal -->
<button id="myBtn">Add a Location</button>

<!-- The Modal -->
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <span class="close">&times;</span>
    <form>
   Name: <input type="text" placeholder="Your wonderfull workout" name="street" ><br>
   Street: <input type="text"  placeholder="123 abc street" name="street"><br>
   City: <input type="text" placeholder="Denver">
   State: <select>
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


</select>

   
   Zip: <input type="number" placeholder="80121"><br>
   
  
 	 <div class="form-group">
      <label for="inputlg">Description:</label>

 	<input type="text" name="description" placeholder="describe your activity" class="form-control input-lg" id="inputlg"><br>
    
    <input type="submit" value="Submit">
    </div>
    </form>
  </div>

	<div class="container">
</body>
</html>