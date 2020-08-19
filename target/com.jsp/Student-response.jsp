<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page isELIgnored="false" %>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Registration Form</title>
</head>
<body>
<jsp:include page="my-header.html"/><br><br>
<%-- Request user agent<%=request.getHeader("User-agent") %>  --%><br><br>


<div style="padding-left:20px">

The student is confirmed: <br><br>

Firstname: ${param.firstname} Last name: ${param.secondname}  <br><br>

<!-- Writing cookies for Country -->

<%
		String country=request.getParameter("country");
		Cookie cookies=new Cookie("myapp.country",country);
		cookies.setMaxAge(60*60*24*365);
		response.addCookie(cookies);
%>
The student country is: ${param.country}  <br><br>

Faviourte langaugae of this student is: ${param.faviroute}  <br><br>

<!--display of multiple list value using checkbox-->
Faviroute Programing language using checkbox multiple value <br><br>


<ul>
<%
	String[] langs=request.getParameterValues("faviroutecheck");
	if(langs!=null){
	for(String values: langs){
		out.println("<li>"+values+"</li>");
	}
	}
%>
</ul>  <br><br>


<br>

<%
	//get the todo lidt items from session
	List<String> items= (List<String>)session.getAttribute("myToDolist");
	//if item not exit create one
	if(items==null){
		items=new ArrayList<String>();
		session.setAttribute("myToDolist", items);
	}
	// if data is add from data
	String theitem=request.getParameter("theItem");
	
	boolean isItemNotEmpty = theitem != null && theitem.trim().length() > 0;
	boolean isItemNotDuplicate = theitem != null && !items.contains(theitem.trim());
	
	if(isItemNotEmpty && isItemNotDuplicate){
		items.add(theitem.trim());
		response.sendRedirect("Student-response.jsp");
	}
%>

<!-- Display items -->
<hr>
<b>To Do list</b>
<ol>
	<% for(String valueiem:items){
			out.println("<li>"+valueiem+"</li>");
			
		} 
	%>
</ol>

</div>
<jsp:include page="my-fotter.jsp"></jsp:include>
</body>
</html>