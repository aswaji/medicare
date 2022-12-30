<%@page import="project.dbCon" %>
<%@page import="java.sql.*" %>

<% 
	if(session.getAttribute("email") == null || !"admin@gmail.com".equals(session.getAttribute("email"))){ 
		response.sendRedirect("index.jsp");
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
	
	
	<div class="container">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card mt-3">
					<div class="card-header text-center custom-bg">
            			<h3 class="text-white">Add New Medicine</h3>
            		</div>
            		<% if(session.getAttribute("msg") != null){ %>
						<%
			       			if("valid".equals(session.getAttribute("msg"))){
			       		%>
			           		<div class="alert alert-success m-4 text-center">Medicine Added uccessfully</div>
			       		<%};%>
			       		<%
			       			if("invalid".equals(session.getAttribute("msg"))){
			       		%>
			       			<div class="alert alert-danger m-4 text-center">Something went Wrong! Try Again!</div>
			       		<%} %>
			       		<% session.removeAttribute("msg"); %>
		       		<% }; %>
            		
             		<div class="card-body">
              			<form action="AddProduct" method="post">

       						<div class="form-group mb-4">
							    <label for=title>Medicine Title</label>
							    <input type="text" name="title" class="form-control" id="title" placeholder="Medicine Title">
							</div>
       						<div class="form-group mb-4">
							    <label for="url">Image URL</label>
							    <input type="text" name="url" class="form-control" id="url" placeholder="Image URL">
							</div>
              				<div class="form-group mb-4">
							    <label for="desc">Medicine Description</label>
							   	<textarea id="desc" name="desc" class="form-control" placehodler="Medicine Description"></textarea>
							</div>
  							
					  		<div class="form-group mb-4">
					    		<label for="quantity">Quantity</label>
					    		<input type="number" name="quantity" class="form-control" id="quantity" placeholder="Quantity">
					  		</div>
					  		<div class="form-group mb-4">
					    		<label for="price">Price</label>
					    		<input type="number" name="price" class="form-control" id="price" placeholder="Price">
					  		</div>
  							<select class="select-group mb-4" name="category">
  								<% 
  									try{
	  									Connection con = dbCon.getConnection();
	  									Statement st = con.createStatement();
	  									ResultSet rs = st.executeQuery("select * from categories");
	  									while(rs.next()){
  								%>
  									<option value="<% out.print(rs.getString("cat_ID")); %>"><% out.print(rs.getString("cat_title")); %></option>
  								<% 	}; %>
  								<% }catch(Exception e){
  										System.out.print(e);
  									}
	  									
								%>
  							</select>
  							
  							
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
	<%@include file='../components/footer.jsp' %>
	</body>
</html>