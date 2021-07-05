<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="css/bootstrap.min.css" rel="stylesheet">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css" href="css/loginReg.css">
<script type="text/javascript" src="js/loginReg.js"></script>
<title>Your Account</title>
</head>
<body>
<h1>Welcome, ${currentUser.username}</h1>
<main>
		<section class="glass">
			<div class="dashboard">
				<div class="links">
					<div class="link">
						<h2>
							ِ<a href="/">Home</a>
						</h2>
					</div>
				</div>

				<div class="user">
					<img src="./images/avatar.png" alt="" />
					<h3>Simo Edwin</h3>
					<p>Pro Member</p>
				</div>
				<div class="links">
					<div class="link">
						<h2>
							<a href="/account">Account</a>
						</h2>
					</div>
					<div class="link">
						<h2>
							<a href="/stations">Stations</a>
						</h2>
					</div>
					<div class="link">
						<h2>
							<a href="/prices">Prices</a>
						</h2>
					</div>
					<div class="link">
						<h2>
							<a href="/about">About us</a>
						</h2>
					</div>
				</div>

			</div>
			<div class="games">
				<h1>BADALLAH</h1>
				<h3>Find All Our Stations!</h3>
					<div id="map" class="card"></div>

			</div>
		</section>
		<table>
		<form:label path="rent">Total Rents
		<c:out value="${hezkel.asd }"></c:out>
    		</form:label>
    		
    		<form:label path="rentTime">Total Rent Time
    		<c:out value="${osod}"></c:out>
    		</form:label>
    		
    		<form:label path="name">Bounse Time
    		<%-- <c:out value=""></c:out> --%>
    		</form:label>
		</table>
		</main>

</body>
</html>