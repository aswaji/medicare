package eHealth.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project.dbCon;

/**
 * Servlet implementation class DeleteProduct
 */
@WebServlet("/DeleteProduct")
public class DeleteProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String medicineID = request.getParameter("medicineID");
		
		try{
			Connection con = dbCon.getConnection();
			String sql = "delete from medicines where medicine_ID = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, medicineID);
			
			int rowCount = ps.executeUpdate();
			if(rowCount > 0) {
				session.setAttribute("msg", "delete");
				response.sendRedirect("admin.jsp");				
			}
		}catch(Exception e){
			System.out.print(e);
			session.setAttribute("msg", "invalid");
			response.sendRedirect("cart.jsp");
		}
	}

}
