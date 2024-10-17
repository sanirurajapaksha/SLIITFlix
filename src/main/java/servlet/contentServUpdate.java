package servlet;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ContentControl.ContentDBUtil;



@WebServlet("/contentServUpdate")
public class contentServUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		HttpSession session = request.getSession(false);
		
        if (session == null || session.getAttribute("user_id") == null) {
        	
            response.sendRedirect("Login.jsp");// replace
            return;
        }
		
		String id=request.getParameter("contentId");
		String title=request.getParameter("movieTitle");
		String contentType=request.getParameter("contentType");
		String releaseYear=request.getParameter("releaseYear");
		String genre=request.getParameter("genre");
		String rating=request.getParameter("rating");
		String description=request.getParameter("description");
		String director=request.getParameter("director");
		
		boolean isTrue;
		
		isTrue=ContentDBUtil.updateContent(id, title, contentType, releaseYear, genre, rating, description, director);
		
		if(isTrue==true) {
			RequestDispatcher dis = request.getRequestDispatcher("contentSuccess.jsp");
			dis.forward(request, response);
		}
		else {
			RequestDispatcher dis = request.getRequestDispatcher("contentUnsuccess.jsp");
			dis.forward(request, response);
		}
		
	}

}
