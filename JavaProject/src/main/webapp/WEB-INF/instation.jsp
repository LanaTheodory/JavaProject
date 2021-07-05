<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Glass Website</title>
<link rel="preconnect" href="https://fonts.gstatic.com" />
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;700&display=swap"
	rel="stylesheet" />
<link rel="stylesheet" href="/css/style.css" />

</head>
<body>
	<main>


		<section class="glass">
			<div class="dashboard">
				<div class="user">
					<img src="http://2.bp.blogspot.com/-RLPqSSiEDNY/UsSyBeZrykI/AAAAAAAAAjU/JPAJdz--kvg/s320/bike.gif" alt="baddel" width="150px" />
					
					<h3>${user.firstname} ${user.lastname}</h3>

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
				<div class="status">
					<h1>${station.name} station</h1>

				</div>



				<div class="cards">
					<c:choose>
						<c:when test="${ user.bicycle == null}">

							<h3>Available bikes</h3>
							<c:forEach items="${station.substations}" var="substation">
								<c:choose>
									<c:when test="${ substation.bicycle.id 
									!= null }">

										<div class="card">
											<div class="card-info">
												<h2>Bike number: ${substation.bicycle.id}</h2>

												<div class="progress"></div>
											</div>
											<form:form action="/rent/instation/${station.id}"
												method="POST" modelAttribute="bike">

												<form:hidden path="id" value="${substation.bicycle.id}" />
												<form:hidden path="users" value="${user.id}" />
												<form:hidden path="substations" value="${substation.id}" />
												<button class="button">rent</button>
											</form:form>
										</div>
									</c:when>
								</c:choose>
							</c:forEach>
						</c:when>


						<c:otherwise>
							<%-- <c:choose>
								<c:when test="${ user.bicycle.id != null }"> --%>
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
														<button class="button">return bike</button>
													</form:form>
											</div>
									
											</c:when>
										</c:choose> 
									</c:forEach>


<%-- 
								</c:when>

							</c:choose> --%>
						</c:otherwise>

					</c:choose>


				</div>
		</section>
	</main>
	<div class="circle1">					<img src="http://2.bp.blogspot.com/-RLPqSSiEDNY/UsSyBeZrykI/AAAAAAAAAjU/JPAJdz--kvg/s320/bike.gif" alt="baddel" />
	</div>
	<div class="circle2">					<img src="http://2.bp.blogspot.com/-RLPqSSiEDNY/UsSyBeZrykI/AAAAAAAAAjU/JPAJdz--kvg/s320/bike.gif" alt="baddel" />
	</div>
</body>
</html>