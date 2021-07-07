<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="css/bootstrap.min.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>

<!-- <link rel="stylesheet" type="text/css" href="/css/loginReg.css">
 -->
 <link rel="stylesheet" type="text/css" href="/css/style.css">

 <link rel="stylesheet" type="text/css" href="/css/counter.css">


<title>Your Account</title>
</head>
<body>
	
	<main>
<img src="/images/logo.png" alt="" />
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
					<h3>${hezkel.firstname} ${hezkel.lastname}</h3>

				</div>
				<div class="links">
					<div class="link">
						<h2>
							<a href="/account/${hezkel.id }">Account</a>
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


<form  id="logoutForm" method="POST" action="/logout">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input class="card button" type="submit" value="Logout!" />
    </form>


			</div>
			
			<div class="games">
				<div class="status">
						<h1>Welcome ${hezkel.firstname}</h1>

				</div>
			<div class="cards">
			
			
		
			
			<div class="card1"> 
              <div class="card-info">
                <h2>Total number of Rents</h2>
              
               
              </div>
              <h2 class="percentage">${hezkel.total }</h2>
            </div>
            
            
			<div class="card1"> 
              <div class="card-info">
                <h2>Total number of riding minutes</h2>
              
               
              </div>
              <h2 class="percentage">${hezkel.totalmin }</h2>
            </div>
            
            
          
     <%--        <div class="card"> 
              <div class="card-info">
                <h2>Bonus minutes</h2>
                
               
              </div>
             <h2 class="percentage">${hezkel.bonus }</h2>
            </div>
			 --%>
			
			</div>
			
				<div>

				

				</div>
			</section>
			
	</main>
   <div class="circle1"></div>
    <div class="circle2"></div>
</body>
</html>