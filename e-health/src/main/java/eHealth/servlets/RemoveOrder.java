package eHealth.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.dbCon;
import java.sql.*;

/**
 * Servlet implementation class RemoveOrder
 */
@WebServlet("/RemoveOrder")
public class RemoveOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String orderID = request.getParameter("orderID");
		System.out.print(orderID);
		
		try{
			Connection con = dbCon.getConnection();
			String sql = "delete from orders where order_ID = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, orderID);
			
			int rowCount = ps.executeUpdate();
			if(rowCount > 0) {
				session.setAttribute("msg", "delete");
				response.sendRedirect("cart.jsp");				
			}
		}catch(Exception e){
			System.out.print(e);
			session.setAttribute("msg", "invalid");
			response.sendRedirect("cart.jsp");
		}
	}

}
