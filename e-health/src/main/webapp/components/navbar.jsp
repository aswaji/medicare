<nav class="navbar navbar-expand-lg navbar-dark custom-bg">
  <div class="container">
    <a class="navbar-brand fs-3" href="index.jsp">E-Health</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
      <div class="navbar-nav w-100 flex justify-content-between align-items-center text-secondary">
      	<div class="d-flex">
      		 <a class="nav-link mx-2 active" aria-current="page" href="index.jsp">Home</a>
	        <a class="nav-link mx-2" href="medicines.jsp">Medicines</a>
	        <a class="nav-link mx-2" href="cart.jsp">Cart</a>
	        <% if(session.getAttribute("email") != null && "admin@gmail.com".equals(session.getAttribute("email"))){ %>
	        <a href="admin.jsp" class="btn btn-outline-secondary text-white">Admin</a>
	        <% } %>
      	</div>
       
        <div class="nav-login d-flex align-items-center">
			<% if(session.getAttribute("email") != null){ %>
				<span class="mx-2 d-block text-white"><b>Welcome: </b> <% out.print(session.getAttribute("email")); %></span>
	        	<a class="nav-link btn btn-md btn-danger text-white" href="LogoutServlet">Logout</a>
	        <% }else{ %>
				<a class="nav-link mx-2 btn btn-md btn-primary text-white" href="login.jsp">Login</a>
	        	<a class="nav-link btn btn-md btn-secondary text-white" href="register.jsp">Register</a>
			<% } %>
        </div>
       
        
        
        
      </div>
    </div>
  </div>
</nav>