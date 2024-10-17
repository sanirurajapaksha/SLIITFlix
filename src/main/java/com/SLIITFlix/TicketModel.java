package com.SLIITFlix;
import model.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


public class TicketModel {
	
	
	public static List<Content> searchContent(String searchTerm) {
		
		List<Content> searchResults = new ArrayList<>();
		
		try {
			
			Connection conn = DBConnection.getConnection();
			
			String sql = "SELECT * FROM content WHERE title LIKE ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + searchTerm + "%");

			ResultSet rs = pstmt.executeQuery();
			
			while (rs.next()) {
				
				int cid = rs.getInt("content_id");
				String title = rs.getString("title");
				String content_type = rs.getString("content_type");
				int release_year = Integer.parseInt(rs.getString("release_year"));
				String genre = rs.getString("genre");
				int rating = rs.getInt("rating");
				String description = rs.getString("description");
				String director = rs.getString("director");
				
				Content content = new Content(cid, title,content_type, release_year, genre, rating, description, director);
				
				searchResults.add(content);
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}
		
		return searchResults;
	}
	
	
	public static boolean InsertData(String uid, String name, String subject, String priority, String description) {
		
		boolean isQuerySuccess = false;
		
		try {
			
			Connection con = DBConnection.getConnection();
			
			String sql = "INSERT INTO ticket (user_id, name, subject, description, status, priority, created_date) " +
		             "VALUES (?, ?, ?, ?, 'open', ?, NOW())";
			
			PreparedStatement pstmt = con.prepareStatement(sql);
			
			
			pstmt.setInt(1, Integer.parseInt(uid));
			pstmt.setString(2, name);
			pstmt.setString(3, subject);
			pstmt.setString(4, description);
			pstmt.setString(5, priority);
			
			
			int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
            	
                System.out.println("Insert successful");
                
                isQuerySuccess = true;
                
            } else {
            	
                System.out.println("Insert failed");
                
            }

			
		} catch (SQLException e) {
	
			System.out.println("Error while inserting data to db: " + e);
		}
		
		return isQuerySuccess;
		
	}
	
	
	public static List <Ticket> GetData() {
		
		ArrayList<Ticket> ticket = new ArrayList<Ticket>();
		
		try {
			
			Connection con = DBConnection.getConnection();
			
			String sql_query = "SELECT * FROM ticket";
			
			Statement statement = con.createStatement();
			
			ResultSet result =  statement.executeQuery(sql_query);
			
			while(result.next()) {
				
				String tid = Integer.toString(result.getInt(1));
				String uid = Integer.toString(result.getInt(2));
				String name = result.getString(3);
				String subject = result.getString(4);
				String description = result.getString(5);
				String status = result.getString(6);
				String priority = result.getString(7);
				String date = result.getString(8);
				
				Ticket ticket_model = new Ticket(tid, uid, name, subject, description, status, priority, date);
				
				ticket.add(ticket_model);
				
			}
			
		} catch (Exception e) {
			
			System.out.println("Error Getting All data: " + e);
			
		}
		
		return ticket;
	}
	
	
	
	public static Ticket GetTicketById(String tid) {
		
		Ticket ticket = null;
		
		 try {
			
			 Connection conn = DBConnection.getConnection();
			 
			 String sql = "SELECT * FROM ticket WHERE ticket_id = ?";
			 
			 PreparedStatement preparedStatement = conn.prepareStatement(sql);
			 
			 preparedStatement.setString(1, tid);
			 
			 
			 ResultSet rs = preparedStatement.executeQuery();
			 
			 
			 if (rs.next()) {
				 
				  String ticketId = Integer.toString(rs.getInt(1));
				  String userId = Integer.toString(rs.getInt(2));
				  String name = rs.getString(3);
				  String subject = rs.getString(4);
				  String description = rs.getString(5);
				  String status = rs.getString(6);
				  String priority = rs.getString(7);
				  String createdDate = rs.getString(8);
				  
				  ticket = new Ticket(ticketId, userId, name, subject, description, status, priority, createdDate);
				  
			}
			 
		} catch (Exception e) {
			
			System.out.println("Error Getting Data by ID: " + e);
			
		}
		 
		return ticket;

	}

	
	public static boolean UpdateData(String status, String tid) {
		
		boolean isQuerySuccess = false;
		
		try {
			
			Connection conn = DBConnection.getConnection();
			
			String sql = "UPDATE ticket SET status = ? WHERE ticket_id = ?";
			
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, status);
	        pstmt.setInt(2, Integer.parseInt(tid));
			
	        int rowsAffected = pstmt.executeUpdate();
	        
	        if(rowsAffected > 0) {
	        	
	        	isQuerySuccess = true;
	        	
	        }
	        
		} catch (Exception e) {
			
			System.out.println("Error updating data: " + e);
			e.printStackTrace();
			
		}
		
		return isQuerySuccess;
		
	}

	
	public static boolean DeleteData(String tid) {
		
		boolean isQuerySuccess = false;
		
		try {
			
			Connection conn = DBConnection.getConnection();
			
			String sql = "DELETE FROM ticket WHERE ticket_id = ?";
			
			PreparedStatement statement = conn.prepareStatement(sql);
			
			statement.setString(1, tid);
			
			int rowsAffected = statement.executeUpdate();
			
			if(rowsAffected > 0) {
				
				isQuerySuccess = true;
				
			}
			
		} catch (Exception e) {
			
			System.out.println("Error deleting data: " + e);
			
		}
		
		return isQuerySuccess;
		
	}
	
	
}