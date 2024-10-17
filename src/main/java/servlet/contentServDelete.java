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


@WebServlet("/contentServDelete")
public class contentServDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		
        if (session == null || session.getAttribute("user_id") == null) {
        	
            response.sendRedirect("Login.jsp");// replace
            return;
        }
		
		String id = request.getParameter("contentId");
		
		boolean isTrue;
		isTrue=ContentDBUtil.deleteContent(id);
		
		if(isTrue==true) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("contentSuccess.jsp");
			dispatcher.forward(request, response);
			
		}
		else {
			RequestDispatcher dispatcher = request.getRequestDispatcher("contentUnsuccess.jsp");
			dispatcher.forward(request, response);
			
		}
	}

}
