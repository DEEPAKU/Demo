<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="css/style.css">
<link type="text/css" rel="stylesheet" href="css/add-employee.css">
</head>
<body>

<div id="wrapper">
	<div id="header">
		<h2>Employee online Regestration</h2>
		</div>
</div>
<div id="container">
	<h3>Update Employee</h3>
	<form action="MvcDemo" method="get">
		<input type="hidden" name="command" value="UPDATE"/>
		
		<input type="hidden" name="id" value="${Emp.id}" />

		<table>
			<tbody>
				<tr>
					<td><lable>FirstName</lable></td>
					<td><input type="text" name="firstName" value="${Emp.firstName}" ></td>
				</tr>
				
				<tr>
					<td><lable>lastName</lable></td>
					<td><input type="text" name="lastName" value="${Emp.lastName}"></td>
				</tr>
				
				<tr>
					<td><lable>Email</lable></td>
					<td><input type="text" name="email" value="${Emp.email}"></td>
				</tr>
				
				<tr>
					<td><lable></lable></td>
					<td><input type="submit" value="Save" class="save"></td>
				</tr>
			</tbody>
		</table>
	
	</form>
	
	<div style="clear:both;">
	<p>
		<a href="MvcDemo">Back to list</a>
	</p>
	</div>
	
</div>

</body>
</html>