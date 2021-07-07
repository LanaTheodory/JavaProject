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
		<a href="/admin/substation/new/${station.id}"><button
				class="btn btn-success">Add New</button></a>
		<table class="table">
			<thead class="table-dark">
				<tr>
					<td>Name</td>
					<td>Bicycle Id(if there is one)</td>
					<td>station</td>
					<td>Actions</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ substations }" var="e">
					<tr>
						<td>${e.name}</td>
						<td>${e.bicycle.id}</td>
						<td>${e.station.name}</td>
						<td><a href="/admin/substation/edit/${e.id}"><button
									class="btn btn-warning">edit</button></a> <a
							href="/admin/substation/delete/${ station.id}/${e.id}"><button
									class="btn btn-danger">delete</button></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>


</body>
</html>