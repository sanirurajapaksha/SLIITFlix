package userPackage;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import userPackage.DBConnection;

public class UserController {
	//connect database
	private static boolean isSuccess;
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;
	
	//insert data function
	public static boolean insertData(String username, String email, String password, String contactNum) {
		boolean isSuccess = false;
		
		try {
			
			//database connection call
			con = DBConnection.getConnection();
			stmt = con.createStatement();
			
			//sql query 
			String sql = "INSERT INTO User (user_id, username, email, password, contactNum) VALUES (0, '"+username+"', '"+email+"', '"+password+"', '"+contactNum+"') ";
			//to auto-increment the user_id 0 given
			
			//check database connection
			int rs = stmt.executeUpdate(sql);
			if (rs > 0) {
				isSuccess = true;
			} else {
				isSuccess = false;
			}
				
		} catch (Exception e) {
				e.printStackTrace();
		}
			return isSuccess;
			
		}
}
