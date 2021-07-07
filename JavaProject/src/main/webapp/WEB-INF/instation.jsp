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
<link rel="stylesheet" href="/css/style.css" />
<link rel="stylesheet" href="./css/home.css" />
<script type="text/javascript" src="./js/home.js"></script>
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
					
					<h3>${user.firstname} ${user.lastname}</h3>
					
				</div>
				<div class="links">
					<div class="link">
						<h2>
							<a href="/account/${user.id }">Account</a>
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

			<div class="games">
				<div class="status">
					<h1>${station.name} station</h1>

				</div>



				<div class="cards">
					<c:choose>
						<c:when test="${ user.getBicycle() == null}">

							<h3>Available bikes</h3>
							<!--  ADD IF STATEMENT IF THERE ARE NO BIKES -->
							<c:forEach items="${station.substations}" var="substation">
								<c:choose>
									<c:when test="${ substation.bicycle.id 
									!= null }">

										<div class="card">
											<div class="card-info">
												<h2>Bike number: ${substation.bicycle.id}</h2>


											</div>
											<form:form action="/rent/instation/${station.id}"
												method="POST" modelAttribute="bike">

												<form:hidden path="id" value=" ${substation.bicycle.id}" />
												<form:hidden path="users" value="${user.id}" />
												<form:hidden path="substations" value="${substation.id}" />
												<button class="button "><h2>Rent</h2></button>

											</form:form>
										</div>
									</c:when>
								</c:choose>
							</c:forEach>
						</c:when>


						<c:otherwise>
							<%--  <c:choose>
								<c:when test="${ user.bicycle.id != null }">  --%>
							<h3>Empty spaces to return your bike</h3>

							<c:forEach items="${station.substations}" var="substation">
								<c:choose>
									<c:when test="${ substation.bicycle == null }">

										<div class="card">
											<div class="card-info">
												<h2>${substation.name}</h2>

												<div class="progress"></div>
											</div>
											<form:form action="/return/instation/${station.id}"
												method="POST" modelAttribute="bike1">

												<form:hidden path="id" value="${user.bicycle.id}" />
												<form:hidden path="users" value="${user.id}" />
												<form:hidden path="substations" value="${substation.id}" />
												<button class="button ">return bike</button>
											</form:form>
										</div>

									</c:when>
								</c:choose>
							<!--TO FIX!!!!!!!!!!!!!!  -->
									<c:choose>
										<c:when test="${station.substations.size() == 0 }">
											<h2>Currently There are no empty spaces to park your
												bike in ${station.name} station</h2>
											<p>you can search for other stations close to your
												location</p>
										</c:when>
									</c:choose>
							
							</c:forEach>



							<%-- 	</c:when>

							</c:choose>  --%>
						</c:otherwise>

					</c:choose>


				</div>
		</section>
	</main>
	<div class="circle1"></div>
	<div class="circle2"></div>
</body>
</html>