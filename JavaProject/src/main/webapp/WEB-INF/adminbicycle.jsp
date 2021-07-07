<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin page</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="/css/admin.css" />
</head>
<body>

	<div class="sidebar">
  <a class="active" href="/admin">Home</a>
  <a href="/admin/users">All Users</a>
  <a href="/admin/bicycles">All Bicycles</a>
  <a href="/admin/stations">All Stations</a>
   <form id="logoutForm" method="POST" action="/logout">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input type="submit" value="Logout!" class="btn btn-danger" />
    </form>
</div>
<div class="content">
<a href="/admin/bicycles/new"><button
				class="btn btn-success">Add New</button></a>
<table class="table">
  <thead class="table-dark">
    <tr>
    <td>Type</td>
    <td>SubStation</td>
    <td>User(if taken)</td>
    <td>Actions</td>
    </tr>
  </thead>
  <tbody>
    <c:forEach items="${ users }" var="e">
			<tr>
				<td>${e.type}</td>
				<td>${e.substation.name}</td>
				<td>${e.user}</td>

				<td><a href="/admin/bicycles/edit/${e.id}"><button class="btn btn-warning">edit</button></a>  <a href="/admin/bicycle/delete/${e.id}"><button class="btn btn-danger">delete</button></a> </td>
			</tr>
		</c:forEach>
  </tbody>
</table>
</div>


</body>
</html>