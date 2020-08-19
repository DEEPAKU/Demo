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
			<a class="active" href="logout">Logout</a> 
			<a href="#contact">Contact</a> 
			<a href="#about">About</a>
		</div>
	</div>
	<div id="wrapper">
		<div id="header">
			<h2>Employee online Regestration</h2>
		</div>
	</div>
	<div style="clear: both;">
	<!-- param name is EL langauage -->
	<h2>Welcome ${param.firstname}</h2>
		<a>You have logged in.</a>
		<p>
			<a href="MvcDemo">Back to list</a>
		</p>
	</div>
</body>
</html>
