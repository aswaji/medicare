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
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String username = request.getParameter("username");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String BirthDate = request.getParameter("birthdate");
		
		try{
			Connection con = dbCon.getConnection();
			String sql = "insert into users(fname, lname, username, email, password, BirthDate) values(?, ?, ?, ?, ?, ?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, fname);
			ps.setString(2, lname);
			ps.setString(3, username);
			ps.setString(4, email);
			ps.setString(5, password);
			ps.setString(6, BirthDate);
			
			ps.executeUpdate();
			session.setAttribute("msg", "valid");
			response.sendRedirect("register.jsp");
		}catch(Exception e){
			System.out.print(e);
			session.setAttribute("msg", "invalid");
			response.sendRedirect("register.jsp");
		}
	}

}
