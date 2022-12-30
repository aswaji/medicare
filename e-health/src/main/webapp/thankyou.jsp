<%@page import="project.dbCon" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<%@include file='components/head.jsp' %>
<title>Home</title>
</head>
<body>
	<%@include file='components/navbar.jsp' %>
	<div class="container">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card mt-3">
					<div class="card-header text-center custom-bg">
            			<h3 class="text-white">Thank You</h3>
            		</div>
            		
             		<div class="card-body">
              			<h4 class="alert alert-success text-center m-4">Your Order Has been placed successfully</h4>
					</div>                       
				</div>
			</div>
		</div>
	</div>
	
	
	<%@include file='components/footer.jsp' %>
	</body>
</html>