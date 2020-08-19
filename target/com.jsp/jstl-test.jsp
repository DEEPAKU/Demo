<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page isELIgnored="false" %>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "funct" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
		<c:set var="data" value="helloworld"></c:set>
		
lenghth of value:<b>${data}</b>: ${funct:length(data)}
<br><br>

uppercase of value:<b>${data}</b>: ${funct:toUpperCase(data)}


<c:set var="country" value="india,singapore,usa,australia"/>
<h1>split demo</h1>
<c:set var="countrys" value="${funct:split(country,',')}"/>

<c:forEach var="temcity" items="${ countrys}">
	${temcity}<br>
</c:forEach>


<h2>join demo</h2>

<c:forEach var="joindemo" items="${funct:join(countrys,'*')}">
	${joindemo}<br>
</c:forEach>
</body>
</html>