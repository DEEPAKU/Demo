<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="funct"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="css/style.css">
<script type="text/javascript">
	function validate(){
		var username = document.getElementById("usname");
		 var pass = document.getElementById("pass");

		 if (username.value.trim() == "") {
             username.style.border="solid 3px red"
              document.getElementById("lbuser").style.visibility="visible";
              return false;
          } else if (pass.value.trim() == "") {
              document.getElementById("lbpass").style.visibility="visible";
              return false;
          } else if (pass.value.trim().length < 3) {
              document.getElementById("lbpass").style.visibility="visible";
              return false;
          } else {
              return true;
          }

      }
	  function setNewImg() {
          document.getElementById("heading2")
              .innerHTML = "I Love you";
      }

      function setOldImg() {
          document.getElementById("heading2")
              .innerHTML = "I Love you More";
      }
</script>
</head>
<body>
<div id="wrapper">
		<div id="header">
			<h2>Employee online </h2>
		</div>
	</div><br>
	<div id="logincontainer">
		<form onsubmit="return validate()"  action="login" method="post">
			UserName : <input id="usname" placeholder="username" type="text" name="firstname">
			<label id="lbuser" style="color:red; visibility: hidden;"> Invlid.Please provide username </label><br><br>
			Password : <input id="pass" type="password" name="pass"><br>
			<label id="lbpass" style="color:red; visibility: hidden;"> Invlid.Please provide password with 3 character </label><br><br>
			<button type="submit" id="btn1">Submit</button><br><br>
		</form>
	</div>
	<img onmouseover="setNewImg()" onmouseout="setOldImg()" src="img/IMG-1.jpg" width="300"/>
</body>
</html>