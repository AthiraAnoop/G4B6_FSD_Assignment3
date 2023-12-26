<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.time.LocalDateTime"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<%
String contextPath = request.getContextPath();
System.out.println(contextPath);
%>
<title>CRUD</title>
<link
	href="<c:url value="${contextPath}/resources/css/bootstrap.min.css"/>"
	rel="stylesheet">
<script
	src="<c:url value="${contextPath}/resources/js/jquery-1.11.min.js"/>"></script>
<script
	src="<c:url value="${contextPath}/resources/js/bootstrap.min.js"/>"></script>
</head>

<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="#">Ticket Tracker Application</a>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="lists">Tickets
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="showForm">New
						Ticket</a></li>
			</ul>
		</div>
	</nav>
	<div class="col-md-offset-1 col-md-10">
		<div class="ml-5">
			<h3>List of Tickets</h3>
			<form:form  method="post" action="searchTicket" style="margin-bottom:0px !important" modelAttribute="searchTicket">
				<div class="input-group" style="margin-bottom:0px !important">
					<input class="form-control title" id="title"
						placeholder="Enter Ticket Title" name="title" />
					<div class="input-group-append">
						<button class="btn btn-primary" type="submit">Search</button>
					</div>
				</div>
			</form:form>
			<table class="table table-striped table-bordered">
				<thead class="thead-dark">
					<tr>
						<th scope="col">#</th>
						<th scope="col">Ticket Title</th>
						<th scope="col">Ticket Short Description</th>
						<th scope="col">Ticket Created on</th>
						<th scope="col">Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="tempTicket" items="${ticketlists}"
						varStatus="loopStatus">
						<c:url var="viewLink" value="/viewForm">
							<c:param name="ticketId" value="${tempTicket.id}" />
						</c:url>
						<c:url var="updateLink" value="/updateForm">
							<c:param name="ticketId" value="${tempTicket.id}" />
						</c:url>
						<c:url var="deleteLink" value="/deleteForm">
							<c:param name="ticketId" value="${tempTicket.id}" />
						</c:url>
						<tr>
							<td>${loopStatus.index + 1}</td>
							<td>${tempTicket.title}</td>
							<td>${tempTicket.description}</td>
							<td><jsp:useBean id="now" class="java.util.Date" /> <fmt:formatDate
									value="${tempTicket.createdon}" pattern="yyyy-MM-dd"
									var="formattedDate" /> ${formattedDate}</td>
							<td><a href="${updateLink}" class="btn btn-primary btn-sm">Edit</a>
								<span style="margin-right: 5px;"></span> <a href="${deleteLink}"
								class="btn btn-sm btn-danger"
								onclick="if(!(confirm('Are you sure want to delete?'))) return false">Delete</a>
								<span style="margin-right: 5px;"></span> <a
								class="btn btn-sm btn-info" href="${viewLink}">View</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>

	</div>
</body>
</html>
