package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ContentControl.ContentDBUtil;
import model.Content;


@WebServlet("/contentServRead")
public class contentServRead extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		
        if (session == null || session.getAttribute("user_id") == null) {
        	
            response.sendRedirect("Login.jsp");// replace
            return;
        }
		
		ContentDBUtil Cl=new ContentDBUtil();
		
		List<Content>content = Cl.getAllContent();
	    request.setAttribute("allContent", content);
	    
	    RequestDispatcher dispatcher=request.getRequestDispatcher("contentRead.jsp");
		dispatcher.forward(request, response);
	}

}
