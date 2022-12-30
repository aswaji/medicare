package eHealth.servlets;

import project.dbCon;
import java.sql.*;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		HttpSession session = request.getSession();

		
		
		if("admin@gmail.com".equals(email) && "admin".equals(password)){
			session.setAttribute("email", email);
			response.sendRedirect("admin.jsp");
		}
		else{
			int z =0;
			try{
				Connection con = dbCon.getConnection();
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery("select * from users where email='" + email + "' and password='" + password + "'");
				while(rs.next()){
					z = 1;
					session.setAttribute("email", email);
					session.setAttribute("userID", rs.getString("user_ID"));
					response.sendRedirect("index.jsp");
				}
				
				if(z == 0){
					response.sendRedirect("login.jsp?msg=notexist");
				}
				
			}catch(Exception e){
				System.out.print(e);
				response.sendRedirect("login.jsp?msg=invalid");
			}
		}
	}

}
