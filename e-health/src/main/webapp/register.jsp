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
            			<h3 class="text-white">Login</h3>
            		</div>
            		<% if(session.getAttribute("msg") != null){ %>
						<%
			       			if("valid".equals(session.getAttribute("msg"))){
			       		%>
			           		<div class="alert alert-success m-4 text-center">You have Registerd Successfully <a href="login.jsp">Login</a></div>
			       		<%};%>
			       		<%
			       			if("delete".equals(session.getAttribute("msg"))){
			       		%>
			       			<div class="alert alert-danger m-4 text-center">Product Deleted Successfully</div>
			       		<%} %>
			       		<%
			       			if("invalid".equals(session.getAttribute("msg"))){
			       		%>
			       			<div class="alert alert-danger m-4 text-center">Something went Wrong! Try Again!</div>
			       		<%} %>
			       		<% session.removeAttribute("msg"); %>
		       		<% }; %>
            		
             		<div class="card-body">
              			<form action="RegisterServlet" method="post">
              				<div class="row">
              					<div class="col">
              						<div class="form-group mb-4">
									    <label for="fname">First Name</label>
									    <input type="text" name="fname" class="form-control" id="fname" placeholder="First Name">
									</div>
              					</div>
              					<div class="col">
              						<div class="form-group mb-4">
									    <label for="lname">Last Name</label>
									    <input type="text" name="lname" class="form-control" id="lname" placeholder="Last Name">
									</div>
              					</div>
              				</div>
              				<div class="form-group mb-4">
							    <label for="username">Username</label>
							    <input type="text" name="username" class="form-control" id="username" placeholder="Enter Username">
							</div>
  							<div class="form-group mb-4">
							    <label for="email">Email address</label>
							    <input type="email" name="email" class="form-control" id="email" placeholder="Enter email">
							</div>
					  		<div class="form-group mb-4">
					    		<label for="password">Password</label>
					    		<input type="password" name="password" class="form-control" id="password" placeholder="Password">
					  		</div>
  							<div class="form-group mb-4">
					    		<label for="birthdate">Birth Date</label>
					    		<input type="date" name="birthdate" class="form-control" id="birthdate" placeholder="Birth Date">
					  		</div>
  							<div class="container text-center">
 	 							<button type="submit" class="btn btn-primary custom-bg">Submit</button>
   								<button type="reset" value="clear" class="btn btn-primary custom-bg">Reset</button>
  							</div>
						</form> 
					</div>                       
				</div>
			</div>
		</div>
	</div>
	<%@include file='components/footer.jsp' %>
	</body>
</html>