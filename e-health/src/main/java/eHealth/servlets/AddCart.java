package eHealth.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;
import project.dbCon;

/**
 * Servlet implementation class AddCart
 */
@WebServlet("/AddCart")
public class AddCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		
		if(session.getAttribute("email") == null) {
			response.sendRedirect("login.jsp");
		}else {
			String userID = session.getAttribute("userID").toString();
			String medicineID = request.getParameter("medicineID");
			try{
				Connection con = dbCon.getConnection();
				String sql = "insert into orders(user_ID, medicine_ID) values(?, ?)";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, userID);
				ps.setString(2, medicineID);
				
				
				ps.executeUpdate();
				session.setAttribute("msg", "valid");
				response.sendRedirect("cart.jsp");
			}catch(Exception e){
				System.out.print(e);
				session.setAttribute("msg", "invalid");
				response.sendRedirect("cart.jsp");
			}
			
			
		}
		
	}

}
