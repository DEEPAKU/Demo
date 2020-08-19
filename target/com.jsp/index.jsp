<%@page import="com.util.Employee"%>
<%@page import="java.util.List"%>
<%@page import="com.jsp.JspDemo"%>
<%@ page isELIgnored="false" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "funct" %>
<html>
<style>

</style>
<head>
<link type="text/css" rel="stylesheet" href="css/style.css">
</head>
<body>
	<div class="header">
		<div class="header-right">
			<a class="active" href="Student-Login-Form.jsp">Login here</a>
			 <a href="#contact">Contact</a>
    		<a href="#about">About</a>
		</div>
		<h2>Welcome Student</h2>
		<%=new String("Heloo world").toUpperCase()%><br>

		<%
			for (int i = 0; i < 5; i++) {

				out.println("<br/>i value is =" + i);
			}
		%><br>

		<%!String makeitlower(String str) {
		return str.toLowerCase();
	}%>
		Lower case "HELLO WORLD"
		<%=makeitlower("HELLO WORLD")%>
		<br>
		<br> Lets have some code:
		<%=JspDemo.makecode("HELOO")%><br>
		<br>
<%
		List<Employee> listemploy= (List<Employee>)request.getAttribute("Student_list");			
		
%>
 		<h2>Student Demo</h2>
		<table border="1">
		
			<tr>
				<th>FirstName</th>
				<th>LastName</th>
				<th>Email</th>
			</tr>
			
			<%for(Employee empl: listemploy) {%>
					<tr>
				<td><%=empl.getFirstName() %></td>
				<td><%=empl.getLastName() %></td>
				<td><%=empl.getEmail() %></td>
			</tr>
			
			<%} %>
		<%-- <c:forEach var="temstudent" items="${studentslist}">
			<tr>
				<td>${temstudent.firstName}</td>
				<td>${temstudent.lastName}</td>
				<td>${temstudent.email}</td>
			</tr>
		</c:forEach> --%>
			
		</table>
		
	</div>
</body>
</html>
