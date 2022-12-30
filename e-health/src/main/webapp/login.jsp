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
            		<%
            			String msg = request.getParameter("msg");
            			if("notexist".equals(msg)){
            		%>
            		<div class="alert alert-danger m-2">Email or Password in incorrect</div>
            		<%} %>
            		<%
            			if("invalid".equals(msg)){
            		%>
            		<div class="alert alert-danger">Something went Wrong! Try Again!</div>
            		<%} %>
             		<div class="card-body">
              			<form action="LoginServlet" method="post"> 
  							<div class="form-group mb-4">
							    <label for="email">Email address</label>
							    <input type="email" name="email" class="form-control" id="email" placeholder="Enter email">
							</div>
					  		<div class="form-group mb-4">
					    		<label for="password">Password</label>
					    		<input type="password" name="password" class="form-control" id="password" placeholder="Password">
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