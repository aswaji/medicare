<%@page import="project.dbCon" %>
<%@page import="java.sql.*" %>

<% 
	if(session.getAttribute("total") == null){
		response.sendRedirect("cart.jsp");
	};

%>


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
            			<h3 class="text-white">Payment</h3>
            		</div>
            		
						
            		
             		<div class="card-body">
              			<form action="Payment" method="post">

       						<div class="form-group mb-4">
							    <label for=title>Card Name</label>
							    <input type="text" name="cardName" class="form-control" id="title" placeholder="Card Name" required />
							</div>
							<div class="row">
								<div class="col-6 form-group mb-4">
								    <label for="no">Card Number*</label>
								    <input type="number" name="cardNo" class="form-control" id="no" placeholder="Card Number" required />
								</div>
								<div class="col-3 form-group mb-4">
								    <label for="expiry">Expiry*</label>
								    <input type="number" name="expiry" class="form-control" id="expiry" placeholder="Expiry" required />
								</div>
								<div class="col-3 form-group mb-4">
								    <label for="cvv">Card Number*</label>
								    <input type="number" name="cvv" class="form-control" id="cvv" placeholder="CVV" required />
								</div>
							</div>
       						<div class="form-group mb-4">
							    <label for="address">Street Address*</label>
							    <input type="text" name="address" class="form-control" id="address" placeholder="Street Address" required />
							</div>
							<div class="row">
								<div class="col form-group mb-4">
								    <label for="city">City*</label>
								   	<input type="text" id="city" name="city" class="form-control" placehodler="City" required/>
								</div>
	  							
						  		<div class="col form-group mb-4">
						    		<label for="zip">Zip Code*</label>
						    		<input type="number" name="zip" class="form-control" id="zip" placeholder="Zip Code" required />
						  		</div>
							</div>
              				
					  		
  							
  							
  							<div class="container text-center">
 	 							<button type="submit" class="btn btn-primary custom-bg">pay <% out.print(session.getAttribute("total")); %>$</button>
  							</div>
						</form> 
					</div>                       
				</div>
			</div>
		</div>
	</div>
	<%@include file='../components/footer.jsp' %>
	</body>
</html>