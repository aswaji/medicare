<%@page import="project.dbCon" %>
<%@page import="java.sql.*" %>

<% 
	if(session.getAttribute("email") == null){ 
		response.sendRedirect("login.jsp");
	}

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
	<main>
		<div class="container py-4">
			<h1 class="mb-4 text-secondary text-center">Cart</h1>
			<% if(session.getAttribute("msg") != null){ %>
				<%
	       			if("valid".equals(session.getAttribute("msg"))){
	       		%>
	           		<div class="alert alert-success m-4 text-center">Product Added to Cart Successfully</div>
	       		<%};%>
	       		<%
	       			if("delete".equals(session.getAttribute("msg"))){
	       		%>
	       			<div class="alert alert-danger m-4 text-center">Medicine Removed Successfully</div>
	       		<%} %>
	       		<%
	       			if("invalid".equals(session.getAttribute("msg"))){
	       		%>
	       			<div class="alert alert-danger m-4 text-center">Something went Wrong! Try Again!</div>
	       		<%} %>
	       		<% session.removeAttribute("msg"); %>
       		<% }; %>
			<div class="table-responsive">
	            <table class="table mb-4" id="medicinesTable">
	                <thead>
	                    <tr>
	                        <th class="text-uppercase text-secondary text-xxs font-weight-bolder">Product</th>
	                        <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder">Title</th> 
	                        <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder">Price</th>
	                        <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder">Quantity</th>
	                        <th></th>
	                    </tr>
	                </thead>
	                <tbody >
                
	                			<% 		
	                				int total = 0;
	                				String userID = null;
	                				if(session.getAttribute("userID") != null){
		                				userID = session.getAttribute("userID").toString();	                			
	                				}
  								
  									Connection con = dbCon.getConnection();
  									Statement st = con.createStatement();
  									ResultSet rs = st.executeQuery("select * from orders inner join medicines on orders.medicine_ID = medicines.medicine_ID where user_ID = '" + userID + "'");
  									while(rs.next()){
  										total += (rs.getInt("price") * rs.getInt("quantity"));
  										
  										
	  										
  								%>
  									<tr>
			                            <td>
			                                <img src="<% out.print(rs.getString("image")); %>" width="150px" />
			                            </td>
			                            <td class="text-center align-middle">
			                            	<p><% out.print(rs.getString("title")); %></p>
			                            </td>
			                            
			                            <td class="text-center align-middle">
			                            	<p><% out.print(rs.getString("price")); %>$</p>
			                            </td>
			                            <td class="text-center align-middle">
			                            	<p><% out.print(rs.getString("quantity")); %></p>
			                            </td>
			                            <td class="text-center align-middle">
			                            	<form method="post" action="RemoveOrder">
												<input type="hidden" name="orderID" value="<% out.print(rs.getString("order_ID")); %>"/>			          	                  	
				                            	<input type="submit" class="btn btn-md btn-danger" value="Remove" />
			                            	</form>
			                            </td>
			                        </tr>	                   
  								<% 	}; %>
  								
	                        
	                </tbody>
	            </table>
	        </div>
			<div class="text-left mt-4">
				<% session.setAttribute("total", total); %>
				<h3><b>Total: <% out.print(total); %>$</b></h3>
				<a href="payment.jsp" class="btn btn-md btn-primary">Payment</a>
			</div>
			
			
		</div>
	</main>
	<%@include file='components/footer.jsp' %>
	<script>
		$(document).ready(function () {
			$("#medicinesTable").DataTable({
		    ordering: true,
		  });
	
		  
		  	console.log("Medicines");
			
		});

	</script>
	</body>
</html>