<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link href="css/bootstrap.min.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>






<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css" href="css/stations.css">
<script type="text/javascript" src="js/loginReg.js"></script>
<title>Home Page</title>
<link rel="preconnect" href="https://fonts.gstatic.com" />
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;700&display=swap"
	rel="stylesheet" />
<link rel="stylesheet" href="./css/style.css" />
<link rel="stylesheet" href="./css/stations.css" />
<script type="text/javascript" src="./js/stations.js"></script>
</head>
<body>
	<main>
	<img src="/images/logo.png" alt="" />
		<section class="glass">
		
			<div class="dashboard">
			
				<div class="link">
					<h2>ِHome</h2>
				</div>

				<div class="user">
					
					<h3>Simo Edwin</h3>
					<p>Pro Member</p>
				</div>
				<div class="links">
					<div class="link">
						<h2>ِAccount</h2>
					</div>
					<div class="link">
						<h2>Stations</h2>
					</div>
					<div class="link">
						<h2>Prices</h2>
					</div>
					<div class="link">
						<h2>About us.</h2>
					</div>
				</div>

			</div>


			<div class="cards">
				<c:forEach var="station" items="${stations}">
					<div class="card1">
						<h3>${station.name}</h3>
						<p>${station.location}</p>
						
					</div>
				</c:forEach>
			</div>





		</section>
	</main>
	<div class="circle1"></div>
	<div class="circle2"></div>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB41DRUbKWJHPxaFjMAwdrzWzbVKartNGg&callback=initMap&libraries=&v=weekly"
		async></script>
</body>
</html>