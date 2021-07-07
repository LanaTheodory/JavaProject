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
		<form:form action="/admin/bicycles/new" method="post"
			modelAttribute="newBicycle">
			<input type="hidden" name="_method" value="put">
			<div class="form-group">
				<form:label path="type">Type:</form:label>
				<form:errors path="type"></form:errors>
				<form:input class="form-control" path="type"
					value="${bicycle.type }"></form:input>
			</div>
			<div class="form-group">
				<form:label path="substations">SubStations:</form:label>
				<form:errors path="substations"></form:errors>
				<form:select path="substations">
					<c:forEach items="${sub}" var="r">
						<form:option value="${r}">${r.name}</form:option>
					</c:forEach>
				</form:select>
			</div>
			<button>Update</button>
		</form:form>
	</div>


</body>
</html>