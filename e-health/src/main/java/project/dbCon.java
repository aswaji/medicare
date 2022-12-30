package project;

import java.sql.*;
public class dbCon {
	public static Connection getConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/e-health","root","");
			System.out.print("connected");
			return con;
		}catch(Exception e) {
			System.out.print(e);
			return null;
		}
	}
	
}
