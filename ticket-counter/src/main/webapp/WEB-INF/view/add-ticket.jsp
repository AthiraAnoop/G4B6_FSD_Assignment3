<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<title>CRUD</title>
<link href="<c:url value="${contextPath}/resources/css/bootstrap.min.css"/>" rel="stylesheet">
<script src="<c:url value="${contextPath}/resources/js/jquery-1.11.min.js"/>"></script>
<script src="<c:url value="${contextPath}/resources/js/bootstrap.min.js"/>"></script>
<script src="https://cdn.ckeditor.com/4.16.2/standard/ckeditor.js"></script>
<link rel="stylesheet" href="https://cdn.ckeditor.com/4.16.2/standard/ckeditor.css">
<script>
        // Initialize CKEditor after the form has been loaded
        $(document).ready(function () {
            CKEDITOR.replace('content');
            var currentUri="${currentUri}";
            if(currentUri=="viewForm"){
            	disableFormFileds();
            }
        });
        function disableFormFileds(){
        	$(".form-example input,.form-example textarea").attr("disabled",true);
            $(".form-example button").hide();
        }
    </script>
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
	<div class="container">
		<div class="row justify-content-center align-items-center">
			<div class="col-10 col-md-8 col-lg-6 border border-3"
				style="margin-top: 5%;margin-bottom:10%">
				<!-- Form -->
				
				<form:form class="form-example" action="saveTicket" method="post" modelAttribute="ticket">
					<h3 class="text-center p-3 mb-2 bg-secondary"
						style="background-color: #dfe4e9 ! important">Create Ticket</h3>
					<!-- Input fields -->
					<form:hidden path="id" id="id" />
					<div class="form-group">
						<label for="title">Title</label> 
						<form:input 
							class="form-control title" id="title"
							placeholder="Enter Ticket Title" path="title"/>
					</div>
					<div class="form-group">
						<label for="description">Short Description</label>
						 <form:textarea class="form-control" id="description" path="description"
							rows="3"></form:textarea>
					</div>
					<div class="form-group">
						<label for="editor1">Content</label>
						<form:textarea class="form-control" id="content" path="content" rows="3"></form:textarea>
					</div>
					<form:button class="btn btn-primary">Submit</form:button>
				</form:form>
				<!-- Form end -->
			</div>
		</div>
	</div>
</body>

</html>