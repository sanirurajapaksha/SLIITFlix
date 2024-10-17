package userPackage;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	//storing variables values of the database to connect the database
	private static String url = "jdbc:mysql://localhost:3306/sliitflixdb?autoReconnect=true&useSSL=false"; //give database name
	private static String user = "root";
	private static String pass = "Ishowspeed6969";
	
	private static Connection con;
	
	//error handling in a try catch statement
	public static Connection getConnection() {
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection(url, user, pass); //DriveManager class
			
		} catch (Exception e) {
			System.out.println("Database not Connected!"); //displayed on terminal
		}
		return con;
	}

}
