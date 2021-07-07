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

<link rel="stylesheet" type="text/css" href="css/aboutus.css">
<script type="text/javascript" src="js/loginReg.js"></script>
<title>Home Page</title>
<link rel="preconnect" href="https://fonts.gstatic.com" />
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;700&display=swap"
	rel="stylesheet" />
<link rel="stylesheet" href="./css/style.css" />
<link rel="stylesheet" href="./css/aboutus.css" />
<script type="text/javascript" src="./js/aboutus.js"></script>
</head>
<body>
	<main>
	<img src="/images/logo.png" alt="" />
		<section class="glass">
		
		<div class="dashboard">
			
				<div class="link">
					<h2>ِ
					<a href="/">Home</a>
					</h2>
				</div>

				<div class="user">
					
					<h3>${currentUser.firstname} ${currentUser.lastname}</h3>
					
				</div>
				<div class="links">
					<div class="link">
						<h2>
							<a href="/account/${currentUser.id }">Account</a>
						</h2>
					</div>
				<div class="link">
						<h2>
							<a href="/stations">Stations</a>
						</h2>
					</div>
				
					<div class="link">
						<h2>
							<a href="/">Prices</a>
						</h2>
					</div>
					<div class="link">
						<h2>
							<a href="/aboutus">About us</a>
						</h2>
					</div>
				</div>
				
				<div class="link">
						<h3>
							<form  id="logoutForm" method="POST" action="/logout">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input class="card button" type="submit" value="Logout!" />
    </form>
						</h3>
					</div>
				</div>

				

			<div class="cards1" >
			
				<h1>About us</h1><Br>
				<h3>Our vision</h3>
				<p>Our vision is to create a better everyday life for many people.<br> 
				We aim to make an impact on people's daily life by reducing traffic, promoting <br>fitness and 
				saving people time while making the daily commute fun and healthy. 
				
				</p>
				<h3>Our future plan</h3>
				<p>we are looking forward to distribute our stations in all the Palestinian cities
				to be able to cycle all across Palestine
				 
				<h3>Your health matters!</h3>
				<p>With so many health benifits to riding it is important to make it part of your daily life
				and here is why.</p>
				<p>-Body weight<br>
				Research has shown that regular riding can help regulate your weight and keep your body fit 
				which protects you from nasty disease such as diabetes and helps burn calories fast</p>
				<p>Heart Benifits<br>
				riding is an enjoyable and effective aerobic activity. Daily riding may reduce the risk of 
				life-threatening illnesses such as heart disease, high blood pressure and diabetes.</p>
				<h3>Our team</h3>
				<p>Ahmad Jury</p>
				<p>Dyar Barham</p>
				<p>Lana Theodory</p>
				<p>Mousa Jaafreh</p>
				
				
				

			</div>





		</section>
	</main>
	<div class="circle1"></div>
	<div class="circle2"></div>
	<script>
		</script>
</body>
</html>