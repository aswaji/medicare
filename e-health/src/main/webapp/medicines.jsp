<%@page import="project.dbCon" %>
<%@page import="java.sql.*" %>
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
			<h1 class="mb-4 text-secondary text-center">Explore All Medicines</h1>
			<div class="table-responsive">
	            <table class="table mb-4" id="medicinesTable">
	                <thead>
	                    <tr>
	                        <th class="text-uppercase text-secondary text-xxs font-weight-bolder">Product</th>
	                        <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder">Title</th> 
	                        <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder">Description</th>
	                        <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder">Price</th>
	                        <th class="text-center text-uppercase text-secondary text-xxs font-weight-bolder">Category</th>
	                        <th></th>
	                    </tr>
	                </thead>
	                <tbody >
	                
	                		<% 
  									try{
	  									Connection con = dbCon.getConnection();
	  									Statement st = con.createStatement();
	  									ResultSet rs = st.executeQuery("select * from medicines inner join categories on medicines.cat_ID = categories.cat_ID");
	  									while(rs.next()){
	  										
  								%>
  									<tr>
			                            <td>
			                                <img src="<% out.print(rs.getString("image")); %>" width="150px" />
			                            </td>
			                            <td class="text-center align-middle">
			                            	<p><% out.print(rs.getString("title")); %></p>
			                            </td>
			                            <td class="text-center align-middle">
			                            	<p><% out.print(rs.getString("description")); %></p>
			                            </td>
			                            <td class="text-center align-middle">
			                            	<p><% out.print(rs.getString("price")); %></p>
			                            </td>
			                            <td class="text-center align-middle">
			                            	<p><% out.print(rs.getString("cat_title")); %></p>
			                            </td>
			                            <td class="text-center align-middle">
			                            	<form method="post" action="AddCart">
												<input type="hidden" name="medicineID" value="<% out.print(rs.getString("medicine_ID")); %>"/>			          	                  	
				                            	<input type="submit" class="btn btn-md btn-primary" value="Add To Cart" />
			                            	</form>
			                            </td>
			                        </tr>	                   
  								<% 	}; %>
  								<% }catch(Exception e){
  										System.out.print(e);
  									}
	  									
								%>
	                        
	                </tbody>
	            </table>
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