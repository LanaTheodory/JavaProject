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

<link rel="stylesheet" type="text/css" href="css/loginReg.css">
<script type="text/javascript" src="js/loginReg.js"></script>
<title>Home Page</title>
<link rel="preconnect" href="https://fonts.gstatic.com" />
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;700&display=swap"
	rel="stylesheet" />
<link rel="stylesheet" href="./css/style.css" />
<link rel="stylesheet" href="./css/home.css" />
<script type="text/javascript" src="./js/home.js"></script>
</head>
<script type="text/javascript">
function initMap() {
	  const myLatLng = { lat: 31.964956, lng: 35.186712 };
	  const map = new google.maps.Map(document.getElementById("map"), {
	    zoom: 13,
	    center: myLatLng,
	  });
	  
	  <c:forEach items="${ stations }" var="s">
	  const conttt${s.id} = "<a href='/instation/${s.id}'>${s.name}</a>";
		const infowindo${s.id} = new google.maps.InfoWindow({
		    content: conttt${s.id},
		  });
		const marke${s.id} =  new google.maps.Marker({
		  	
		    position: { lat: ${s.lat}, lng: ${s.lng} },
		    map,
		    title: "Hello World!",
		  });
		marke${s.id}.addListener("click", () => {
			infowindo${s.id}.open({
		      anchor: marke${s.id},
		      map,
		      shouldFocus: false,
		    });
		  });
	</c:forEach>
	<c:forEach items="${ station }" var="s">
	const contentString${s.id} = "<a href='/instation/${s.id}'>${s.name}</a>";
	const infowindow${s.id} = new google.maps.InfoWindow({
	    content: contentString${s.id},
	  });
	const marker${s.id} =  new google.maps.Marker({
		  	
		    position: { lat: ${s.lat}, lng: ${s.lng} },
		    map,
		    title: "Hello World!",
		    icon: {                             
		    	  url: "http://maps.google.com/mapfiles/ms/icons/blue-dot.png"}
		  });
	  marker${s.id}.addListener("click", () => {
		    infowindow${s.id}.open({
		      anchor: marker${s.id},
		      map,
		      shouldFocus: false,
		    });
		  });
	</c:forEach>
	}</script>
<body>
	<main>
		<section class="glass">
			<div class="dashboard">
				<div class="links">
					<div class="link">
						<h2>
							<a href="/">Home</a>
						</h2>
					</div>
				</div>

				<div class="user">
					<img src="./images/avatar.png" alt="" />
					<h3>${currentUser.username}</h3>
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
				<form id="logoutForm" method="POST" action="/logout">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" /> <input type="submit" value="Logout!" />
				</form>
			</div>
		</section>
	</main>
	<div class="circle1"></div>
	<div class="circle2"></div>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB41DRUbKWJHPxaFjMAwdrzWzbVKartNGg&callback=initMap&libraries=&v=weekly"
		async>
		
		</script>
</body>
</html>