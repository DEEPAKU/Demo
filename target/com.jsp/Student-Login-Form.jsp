<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="Student-response.jsp">
		First Name : <input type="text" name="firstname">
		<br><br>
		Second Name: <input type="text" name="secondname">
		<br><br>
		Country : <select  name="country">
					<option>USA</option>
					<option>INDIA</option>
					<option>LONDON</option>
					<option>Turkey</option>
		
		</select>
		<br><br>
		
		Faviroute Programing language using Radio
		
		<input type="radio" name="faviroute" value="java"> java
		
		<input type="radio" name="faviroute" value="php"> php
		
		<input type="radio" name="faviroute" value="C#"> C#
		
		<input type="radio" name="faviroute" value="Ruby"> Ruby
		
		<br><br>
		
		Faviroute Programing language using checkbox multiple value
		
		<input type="checkbox" name="faviroutecheck" value="java"> java
		
		<input type="checkbox" name="faviroutecheck" value="php"> php
		
		<input type="checkbox" name="faviroutecheck" value="C#"> C#
		
		<input type="checkbox" name="faviroutecheck" value="Ruby"> Ruby
		
		<br><br>
		<!-- to do,list-->
		Student work: <input type="text" name="theItem">
		
		Submit: <input type="submit" name="submit">
</form>
</body>
</html>