<%@page import="com.util.Employee"%>
<%@page import="java.util.List"%>
<%@page import="com.jsp.JspDemo"%>
<%@ page isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="funct"%>
<html>
<style>
</style>
<head>
<link type="text/css" rel="stylesheet" href="css/style.css">
</head>
<body>
	<div class="header">
		<div class="header-right">
			<a class="active" href="Student-Login-Form.jsp">Login here</a> <a
				href="#contact">Contact</a> <a href="#about">About</a>
		</div>
		<h2>Welcome Employee</h2>
	</div>
	<div id="wrapper">
		<div id="header">
			<h2>Employee online Regestration</h2>
		</div>
	</div>
	<div id="container">
		<!-- Add button -->
		<input type="button" value="Add Employee"
			onclick="window.location.href='add-employee.jsp';return false;"
			class="add-student-button" />
		<%-- 		<%
		List<Employee> listemploy= (List<Employee>)request.getAttribute("Student_list");			
		
		%> --%>
		<h2>Student Demo</h2>
		<table border="1">

			<tr>
				<th>FirstName</th>
				<th>LastName</th>
				<th>Email</th>
				<th>Action</th>
			</tr>

			<%-- 	<%for(Employee empl: listemploy) {%>
			<tr>
				<td><%=empl.getFirstName() %></td>
				<td><%=empl.getLastName() %></td>
				<td><%=empl.getEmail() %></td>
			</tr>

			<%} %> --%>
			
			
			<c:forEach var="temstudent" items="${Student_list}">
			
			<!-- Set up fro link for update -->
			
				<c:url var="tempLink" value="MvcDemo">
					<c:param name="command" value="LOAD"/>
					<c:param name="id" value="${temstudent.id}"/>
				</c:url>
			<!-- Set up fro link for Delete -->		
				<c:url var="deleteLink" value="MvcDemo">
					<c:param name="command" value="DELETE"/>
					<c:param name="id" value="${temstudent.id}"/>
				</c:url>
				
				<tr>
					<td>${temstudent.firstName}</td>
					<td>${temstudent.lastName}</td>
					<td>${temstudent.email}</td>
					<td>
					<a href="${tempLink}">Update</a>
					<a href="${deleteLink}" onclick="if(!(confirm('Are you sure wanted to delete'))) return false">Delete</a>
					</td>
				</tr>
			</c:forEach>

		</table>

	</div>
</body>
</html>
