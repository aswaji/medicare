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
	 <main class="home">
      <div class="home-text">
      	<div>
	      	<h1>Medicare capstone </h1>
	      	<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>
	      	<a href="medicines.jsp" class="btn btn-primary">Order Medicine</a>      	
      	</div>
      </div>
      <div class="panel-container">
        <img src="img/home.svg" />
      </div>
    </main>
	
	
	<%@include file='components/footer.jsp' %>
	</body>
</html>