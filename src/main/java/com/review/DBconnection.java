package com.review;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconnection {
	
	private static String url="jdbc:mysql://localhost:3306/sliitflixdb?autoReconnect=true&useSSL=false";
	private static String user="root";
	private static String password="Ishowspeed6969";
	private static Connection con;
	
	static Connection getConnection () {
	try{
		
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection(url,user,password);
		
	}catch (Exception e) {
		System.out.println("Database not Connnect !");
	}
	return con;
	
}
}