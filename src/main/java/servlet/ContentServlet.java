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


@WebServlet("/ContentServlet")
public class ContentServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		
        if (session == null || session.getAttribute("user_id") == null) {
        	
            response.sendRedirect("Login.jsp");// replace
            return;
        }
		
		
		//Get form data
		String title =request.getParameter("movieTitle");
		String contentType = request.getParameter("contentType");
		int releaseYear = Integer.parseInt(request.getParameter("releaseYear"));
		String genre = request.getParameter("Genre");
		int rating = Integer.parseInt(request.getParameter("Rating"));
		String description =request.getParameter("description");
		String director=request.getParameter("Director");
		
		boolean isTrue;
		
		
		isTrue = ContentDBUtil.insertcontent(title, contentType, releaseYear, genre, rating, description, director);
		
		if(isTrue==true) {
			RequestDispatcher dis = request.getRequestDispatcher("contentSuccess.jsp");
			dis.forward(request, response);
			
		}else {
			RequestDispatcher dis2 = request.getRequestDispatcher("contentUnsuccess.jsp");
			dis2.forward(request, response);
		}
	}

}
