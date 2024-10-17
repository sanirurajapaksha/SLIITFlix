package com.review;

import java.io.IOException;
//import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.review.ratingsDBUtil.ReviewTagValidator;



@WebServlet("/insertrating")
public class insertrating extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String uid = request.getParameter("uid");
		String cid = request.getParameter("cid");
		String rating = request.getParameter("rating");
        String review_title = request.getParameter("review_title");
        String recommendation = request.getParameter("recommendation");
        String review_tags = request.getParameter("review_tags");
        String spoiler_alert = request.getParameter("spoiler_alert");
        String review_text = request.getParameter("review_text");
      
        boolean isTrue;
        try {
        	
        	ReviewTagValidator.validateReviewTag(review_tags);
        
        	isTrue = ratingsDBUtil.InsertRating(uid, cid, rating, review_title, recommendation,review_tags,spoiler_alert, review_text);
        	
        }catch(InvalidTagStart e) {
        	
        	
        	response.getWriter().println("<script>alert('"+e+"');window.history.back();</script>");

        	return;
        }
        if(isTrue == true) {
        	

        	String alertMessage="Data Inserted Successful";
        	response.getWriter().println("<script>alert('"+alertMessage+"');window.location.href='GetAllServlet'</script>");
        	
        	
        }else {

        	RequestDispatcher dis2 = request.getRequestDispatcher("Unsuccess.jsp");
        	dis2.forward(request,response);
        }

	}

}