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
 * Servlet implementation class AddProduct
 */
@WebServlet("/AddProduct")
public class AddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String title = request.getParameter("title");
		String image = request.getParameter("url");
		String description = request.getParameter("desc");
		String price = request.getParameter("price");
		String quantity = request.getParameter("quantity");
		String category = request.getParameter("category");
		
		try{
			Connection con = dbCon.getConnection();
			String sql = "insert into medicines(title, image, description, price, quantity, cat_ID) values(?, ?, ?, ?, ?, ?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, title);
			ps.setString(2, image);
			ps.setString(3, description);
			ps.setString(4, price);
			ps.setString(5, quantity);
			ps.setString(6, category);
			
			ps.executeUpdate();
			session.setAttribute("msg", "valid");
			response.sendRedirect("addMedicine.jsp");
		}catch(Exception e){
			System.out.print(e);
			session.setAttribute("msg", "invalid");
			response.sendRedirect("addMedicine.jsp");
		}
	}

}
