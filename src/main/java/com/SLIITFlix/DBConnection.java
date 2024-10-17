package com.SLIITFlix;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	
	public static Connection getConnection() {
		
		String url = "jdbc:mysql://localhost:3306/sliitflixdb?autoReconnect=true&useSSL=false";
        String user = "root";
        String password = "Ishowspeed6969";
        Connection con = null;
        
		
		try {
			
	        Class.forName("com.mysql.jdbc.Driver");
	        
            con = DriverManager.getConnection(url, user, password);
	        
		} catch (Exception e) {
			System.out.println("Error connecting to DB: " + e);
		}
		
		return con;
		
	}

}
