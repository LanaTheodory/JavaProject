<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <link href="css/bootstrap.min.css" rel="stylesheet">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
	





<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css" href="css/loginReg.css">
<script type="text/javascript" src="js/loginReg.js"></script>
<title>Registration Page</title>
</head>
<body>

	<div class="container">
		<div id="formHolder">

		<div class="row">

			<!-- Brand Box -->
			<div class="col-sm-6 brand">
				<a href="#" class="logo">logo<span>.</span></a>

				<div class="heading">
					<h2>Baddaleh</h2>
					<p>baddel with us</p>
				</div>

				<div class="success-msg">
					<p>Great! You are one of our members now</p>
					<a href="#" class="profile">Your Profile</a>
				</div>
			</div>


			<!-- Form Box -->
			<div class="col-sm-6 form">

				<!-- Login Form -->
				<div class="login form-peice switched">
					<form class="login-form"  method="POST"
						action="/login">

						<div class="form-group">
							<label for="username">User name</label> <input type="text"
								id="username" name="username" />
						</div>
						<div class="form-group">
							<label for="password">Password</label> <input type="password"
								id="password" name="password" />
						</div>
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
						<div class="CTA">
							<input type="submit" value="Login!" />
							 <a href="#" class="switch">I'm New</a>
						</div>
					</form>
				</div>
				<!-- End Login Form -->


				<!-- Signup Form -->
				<div class="signup form-peice">


					<form:form class="signup-form" method="POST" action="/registration"
						modelAttribute="user">
						<p>
							<form:errors path="user.*" />
						</p>


						<div class="form-group">
							<form:label path="firstname">First name:</form:label>
							<form:input path="firstname" />
							<span class="error"></span>
						</div>

						<div class="form-group">
							<form:label path="lastname">Last name:</form:label>
							<form:input path="lastname" />
							<span class="error"></span>
						</div>

						<div class="form-group">
							<form:label path="username">User name:</form:label>
							<form:input path="username" />
							<span class="error"></span>
						</div>

						<div class="form-group">
							<form:label path="email">Email</form:label>
							<form:input path="email" type="email" />
							<span class="error"></span>
						</div>

						<div class="form-group">
							<form:label path="age">Age</form:label>
							<form:input path="age" type="number" />
							<span class="error"></span>
						</div>
						<div class="form-group">
							<form:label path="password">Password:</form:label>
							<form:password path="password" />
							<span class="error"></span>
						</div>
						<div class="form-group">
							<form:label path="passwordConfirmation">Password Confirmation:</form:label>
							<form:password path="passwordConfirmation" />
							<span class="error"></span>
						</div>

						<div class="CTA">
							<input type="submit" value="Signup Now" id="submit"> <a
								href="#" class="switch">I have an account</a>
						</div>
					</form:form>
				</div>
				<!-- End Signup Form -->
			</div>
		</div>

		</div>




	</div>
</body>
</html>
