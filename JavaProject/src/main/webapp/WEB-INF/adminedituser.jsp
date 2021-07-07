<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/admin.css" />
</head>
<body>

	<div class="sidebar">
		<a class="active" href="/admin">Home</a> <a href="/admin/users">All
			Users</a> <a href="/admin/bicycles">All Bicycles</a> <a
			href="/admin/stations">All Stations</a>
		<form id="logoutForm" method="POST" action="/logout">
			<input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" /> <input type="submit" value="Logout!"
				class="btn btn-danger" />
		</form>
	</div>
	<div class="content">
		<form:form action="/admin/user/edit/${ user.id }" method="post"
			modelAttribute="editUser">
			<input type="hidden" name="_method" value="put">
			<div class="form-group">
				<form:label path="firstname">Firstname:</form:label>
				<form:errors path="firstname"></form:errors>
				<form:input class="form-control" path="firstname"
					value="${user.firstname }"></form:input>
			</div>
			<div class="form-group">
				<form:label path="lastname">Lastname:</form:label>
				<form:errors path="lastname"></form:errors>
				<form:input class="form-control" path="lastname"
					value="${user.lastname }"></form:input>
			</div>
			<div class="form-group">
				<form:label path="username">Username:</form:label>
				<form:errors path="username"></form:errors>
				<form:input class="form-control" path="username" value="${user.username }"></form:input>
			</div>
			<div class="form-group">
				<form:label path="email">Email:</form:label>
				<form:errors path="email"></form:errors>
				<form:input class="form-control" path="email" value="${user.email }"></form:input>
			</div>

			<div class="form-group">
				<form:label path="age">Age:</form:label>
				<form:errors path="age"></form:errors>
				<form:input class="form-control" path="age" value="${user.age }"></form:input>
			</div>
			<div class="form-group">
				<form:label path="roles">Roles:</form:label>
				<form:errors path="roles"></form:errors>
				<form:select path="roles">
					<c:forEach  items="${roll}" var="r">
						<form:option value="${r}">${r.name}</form:option>
					</c:forEach>
				</form:select>
			</div>
			<button>Update</button>
		</form:form>
	</div>


</body>
</html>