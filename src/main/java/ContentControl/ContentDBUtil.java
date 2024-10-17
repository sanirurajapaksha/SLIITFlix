package ContentControl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.Statement;

import model.Content;

public class ContentDBUtil {
	
	
	static String url = "jdbc:mysql://localhost:3306/sliitflixdb?autoReconnect=true&useSSL=false";
	static String user = "root";
	static String pass = "Ishowspeed6969";

	public static Connection getConnection() throws SQLException {

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		return DriverManager.getConnection(url, user, pass);
	}

	// Insert Content
	public static boolean insertcontent(String title, String contentType, int releaseYear, String genre, int rating,
			String description, String director) {

		boolean isSucess = false;

		// database connection
		String url = "jdbc:mysql://localhost:3306/sliitflixdb?autoReconnect=true&useSSL=false";
		String user = "root";
		String pass = "Ishowspeed6969";

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url, user, pass);
			Statement stmt = (Statement) con.createStatement();

			// Insert query which insert data to the database table
			String sql = "insert into content values (0,'" + title + "','" + contentType + "','" + releaseYear + "','"
					+ genre + "','" + rating + "','" + description + "','" + director + "')";
			int rs = stmt.executeUpdate(sql);

			if (rs > 0) {
				isSucess = true;
			} else {
				isSucess = false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return isSucess;
	}

	// Get by Id
	public static List<Content> getContentDetails(String contentId) {

		int convertedId = Integer.parseInt(contentId);

		ArrayList<Content> contentList = new ArrayList<>();

		try {

			// Database connection
			Connection con = DBConnect.getConnection();
			Statement stmt = (Statement) con.createStatement();

			// query
			String sql = "select * from content where content_id='" + convertedId + "'";
			ResultSet rs = stmt.executeQuery(sql);

			while (rs.next()) {
				int content_id = rs.getInt(1);
				String title = rs.getString(2);
				String content_type = rs.getString(3);
				int release_Year = rs.getInt(4);
				String genre = rs.getString(5);
				int rating = rs.getInt(6);
				String description = rs.getString(7);
				String director = rs.getString(8);

				Content c = new Content(content_id, title, content_type, release_Year, genre, rating, description,
						director);
				contentList.add(c);
			}
		}

		catch (Exception e) {
			e.printStackTrace();
		}

		// return content as an array list
		return contentList;

	}

	// Get all content to display data stored in the database
	public List<Content> getAllContent() {

		ArrayList<Content> allContent = new ArrayList<>();

		try {

			// database connection
			Connection con = DBConnect.getConnection();
			Statement stmt = (Statement) con.createStatement();

			String sql = "select* from content";
			ResultSet rs = stmt.executeQuery(sql);

			while (rs.next()) {
				int content_id = rs.getInt(1);
				String title = rs.getString(2);
				String content_type = rs.getString(3);
				int release_Year = rs.getInt(4);
				String genre = rs.getString(5);
				int rating = rs.getInt(6);
				String description = rs.getString(7);
				String director = rs.getString(8);

				Content c = new Content(content_id, title, content_type, release_Year, genre, rating, description,
						director);
				allContent.add(c);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return allContent;
	}

	// Update data
	public static boolean updateContent(String id,String title,String contentType,String releaseYear,String genre,String rating,String description,String director) {
		
		boolean isSuccess = false;
		
		try {
			//database connection
			Connection con = DBConnect.getConnection();
			Statement stmt = (Statement) con.createStatement();
			
			//update query
			String sql ="update content set title='"+title+"',content_type='"+contentType+"',release_Year='"+releaseYear+"',genre='"+genre+"',rating='"+rating+"',description='"+description+"',director='"+director+"'" 
					+"where content_id='"+id+"'";
			
			int rs = stmt.executeUpdate(sql);
			
			if(rs>0) {
				isSuccess=true;
			}
			else {
				isSuccess=false;
			}
			
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return isSuccess;
	}
	
	//Delete content
	public static boolean deleteContent(String id) {
		int convertedId=Integer.parseInt(id);
		
		boolean isSuccess = false;
		
		try {
			//Data base connection
			Connection con = DBConnect.getConnection();
			Statement stmt = (Statement) con.createStatement();
			
			//delete query
			String sql = "delete from content where content_id='"+convertedId+"'";
			int rs =stmt.executeUpdate(sql);
			
			if(rs>0) {
				isSuccess=true;
			}
			else {
				isSuccess=false;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return isSuccess;
	}

	

}
