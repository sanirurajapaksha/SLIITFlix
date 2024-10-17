package com.review;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/deleteServlet")
public class deleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	//private boolean isTrue;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id=request.getParameter("id");
		
		// Validate id
	    /*if (id == null || id.isEmpty()) {
	        response.getWriter().println("<script>alert('ID is missing or invalid!');window.location.href='getall'</script>");
	        return;
	    }*/

		
		boolean isTrue;
		isTrue =ratingsDBUtil.deletedata(id);
		if(isTrue == true) {
			String alertMessage ="Data Deleted successfully";
			//response.getWriter().println("<script>alert('"+alertMessage+"');"+"window.location.href="getall"</script>"")	}
					response.getWriter().println("<script>alert('"+alertMessage+"');"+"window.location.href='GetAllServlet'</script>");
	}
		else {
			List<rating> ratingDetails=ratingsDBUtil.getById(id);
        	request.setAttribute("ratingDetails", ratingDetails);
        	
        	RequestDispatcher dis2 = request.getRequestDispatcher("Unsuccess.jsp");
        	dis2.forward(request,response);
		}
}
}