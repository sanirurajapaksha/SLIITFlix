package com.review;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import com.review.ratingsDBUtil.ReviewTagValidator;


@WebServlet("/updateServlet")
public class updateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//private String ;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		
        if (session == null || session.getAttribute("user_id") == null) {
        	
            response.sendRedirect("Login.jsp");// replace
            return;
        }
		
		String review_id = request.getParameter("review_id");
		String rating = request.getParameter("rating");
        String review_title = request.getParameter("review_title");
        String recommendation = request.getParameter("recommendation");
        String review_tags = request.getParameter("review_tags");
        String spoiler_alert = request.getParameter("spoiler_alert");
        String review_text = request.getParameter("review_text");
        
        boolean isTrue;
       
        
        isTrue =ratingsDBUtil.updatedata(review_id, rating, review_title, recommendation, review_tags, spoiler_alert, review_text);
       
        	//response.sendRedirect("InsertRating.jsp? error=true&message="+e.getMessage());
        	//response.sendRedirect("InsertRating.jsp?error=true&message=" + e.getMessage());

        	//return;
        
        if(isTrue == true) {
        	List<rating> ratingDetails=ratingsDBUtil.getById(review_id);
        	request.setAttribute("ratingDetails", ratingDetails);
        	String alertMessage="Data Updated Successfully";
        	response.getWriter().println("<script>alert('"+alertMessage+"');window.location.href='GetAllServlet'</script>");
        	
        	
        }else {

        	RequestDispatcher dis2 = request.getRequestDispatcher("Unsuccess.jsp");
        	dis2.forward(request,response);
        }

	}

}
