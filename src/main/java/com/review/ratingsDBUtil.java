package com.review;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;
//import com.review.InvalidTagStart;


public class ratingsDBUtil {

    private static Connection con;
	private static Statement stmt;
	private static ResultSet rs;
	private static boolean isSuccess;
	
	public static boolean InsertRating(String uid, String cid, String rating, String review_title, String recommendation, String review_tags, String spoiler_alert, String review_text) {
        boolean isSuccess = false;

        String url = "jdbc:mysql://localhost:3306/sliitflixdb?autoReconnect=true&useSSL=false";
        String user = "root";
        String password = "Ishowspeed6969";
        
        try {

	        try {
	        	// Validate review_tags starts with #
	        	ReviewTagValidator.validateReviewTag(review_tags);
	        }catch(InvalidTagStart e) {
	        	e.printStackTrace();
	        	return false;
	        }
            System.out.println("Trying to connect to the DB");
            
            

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, user, password);

            String sql = "INSERT INTO review (content_id, user_id, rating, review_title, recommendation, review_tags, spoiler_alert, review_text, review_date) " +
                         "VALUES (?, ?, ?, ?, ?, ?, ?, ?, NOW())";

            PreparedStatement pstmt = con.prepareStatement(sql);

            pstmt.setInt(1, Integer.parseInt(cid));
            pstmt.setInt(2, Integer.parseInt(uid));
            pstmt.setInt(3, Integer.parseInt(rating));
            pstmt.setString(4, review_title);
            pstmt.setString(5, recommendation);
            pstmt.setString(6, review_tags);
            pstmt.setString(7, spoiler_alert);
            pstmt.setString(8, review_text);

            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("Insert successful");
                isSuccess = true;
            } else {
                System.out.println("Insert failed");
            }
        
        } catch (Exception e) {
            System.out.println("Error: " + e);
            e.printStackTrace();
        }
        System.out.println(isSuccess + ": Insert success status");

        return isSuccess;
    }
	
    public static List<rating> getById (String id){
    	
    	int convertedID = Integer.parseInt(id);
    	ArrayList <rating> ratings = new ArrayList<>();
    	//if (id != null && !id.isEmpty()) {	
    	try {
    		//DB connection
    	   con = DBconnection.getConnection();
    		stmt = con.createStatement();
    		//Query
    		String sql="select * from review where review_id '" +convertedID+"'";
    		 rs = stmt.executeQuery(sql);
    		
    		while(rs.next()) {
    			int review_id=rs.getInt(1);
    			int content_id=rs.getInt(2);
    			int user_id=rs.getInt(3);
    			String rating=rs.getString(4);
    			String review_title=rs.getString(5);
    		    String recommendation=rs.getString(6);
    			String review_tags=rs.getString(7);
    			String spoiler_alert=rs.getString(8);
    			String review_text=rs.getString(9);
    			String review_date=rs.getString(10);
    			
    			rating rate=new rating(review_id,content_id,user_id,rating,review_title,recommendation,review_tags,spoiler_alert,review_text,review_date);
    			ratings.add(rate);
    			
    		}
    		
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	
    	return ratings;
    	
    }	
    
    //Get All Data
    	public static List<rating> getAllratings(){
    		ArrayList <rating> ratingss = new ArrayList<>();
    		try {
        		//DB connection
        		 con = DBconnection.getConnection();
        	    stmt = con.createStatement();
        		//Query
        		String sql="select * from review";
        		 rs = stmt.executeQuery(sql);
        		
        		while(rs.next()) {
        			int review_id=rs.getInt(1);
        			int content_id=rs.getInt(2);
        			int user_id=rs.getInt(3);
        			String rating=rs.getString(4);
        			String review_title=rs.getString(5);
        		    String recommendation=rs.getString(6);
        			String review_tags=rs.getString(7);
        			String spoiler_alert=rs.getString(8);
        			String review_text=rs.getString(9);
        			String review_date=rs.getString(10);
        			
        			rating rate=new rating(review_id,content_id,user_id,rating,review_title,recommendation,review_tags,spoiler_alert,review_text,review_date);
        			ratingss.add(rate);
        			
        		}
        		
        	}catch(Exception e) {
        		e.printStackTrace();
        	}
        	
        	return ratingss;
        	
    	}	
    	
    	//Update data
        	
    		public static boolean updatedata(String review_id,String rating,String review_title,String recommendation,String review_tags,String spoiler_alert,String review_text) {
    			try {
    				//DB Connection
    				 con = DBconnection.getConnection();
    	        	 stmt = con.createStatement();
    	        	 
    	        	 
    	        	 //sql query
    	        	 
    	        	// String sql="update review set review_id='"+review_id+",content_id='"+content_id+",user_id='"
    	        	 String sql = "UPDATE review SET " +
    	                     "rating = '" + rating + "', " +
    	                     "review_title = '" + review_title + "', " +
    	                     "recommendation = '" + recommendation + "', " +
    	                     "review_tags = '" + review_tags + "', " +
    	                     "spoiler_alert = '" + spoiler_alert + "', " +
    	                     "review_text = '" + review_text + "' " + 
    	                     "WHERE review_id = '" + review_id + "'";


    	        	 
    	        	 int rs = stmt.executeUpdate(sql);
    	        	 if(rs > 0) {
    	        		 isSuccess =true;
    	        	 }
    	        	 else {
    	        		 isSuccess=false;
    	        	 }

    			}catch(Exception e) {
    				e.printStackTrace();
    			}
    			return isSuccess;
    		}
    			
    		
    		//Delete data
    		public static boolean deletedata(String id) {
    		try{
    			
    			int convertedID=Integer.parseInt(id);
    			
				try{	
    				//DB Connection
	   				 con = DBconnection.getConnection();
	   	        	 stmt = con.createStatement();
	   	        	 
	   	        	 String sql="delete from review where review_id ='"+convertedID+"'";
	   	        	 
	   	        	 int rs = stmt.executeUpdate(sql);
		        	 if(rs > 0) {
		        		 isSuccess =true;
		        	 }
		        	 else {
		        		 isSuccess=false;
		        	 }
    				
    			}catch(Exception e) {
    				e.printStackTrace();
    			}
    		}catch (NumberFormatException e) {
    	        System.out.println("Invalid ID format: " + e.getMessage());
    	    }
    		return isSuccess;
    	}
    		
    		public class  ReviewTagValidator{
    			public static void validateReviewTag(String review_tags)throws InvalidTagStart{
    				if (!review_tags.startsWith("#")) {
    	            	
    					throw new InvalidTagStart(String.format("Review tag must start with hash"));

    					//throw new InvalidTagStart("Review tag must start with '#'");
    	            	 
    	            }
    				
    			}
    		}
    		
}
    	
    

