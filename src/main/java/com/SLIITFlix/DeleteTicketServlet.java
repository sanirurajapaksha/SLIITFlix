package com.SLIITFlix;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/DeleteTicketServlet")
public class DeleteTicketServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		
        if (session == null || session.getAttribute("user_id") == null) {
        	
            response.sendRedirect("Login.jsp");// replace
            return;
        }
		
		String tid = request.getParameter("tid");
		
		boolean deleteStatus = TicketModel.DeleteData(tid);
		
		if(deleteStatus) {
			
			response.sendRedirect("ReadTicketServlet");
			
		} else {
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("Error.jsp");
			dispatcher.forward(request, response);
			
		}
	}

}
