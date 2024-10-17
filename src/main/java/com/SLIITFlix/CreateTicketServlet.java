package com.SLIITFlix;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/CreateTicketServlet")
public class CreateTicketServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uid = request.getParameter("uid");
		String name = request.getParameter("name");
		String subject = request.getParameter("subject");
		String priority = request.getParameter("priority");
		String description = request.getParameter("description");
		
		boolean ticket = TicketModel.InsertData(uid,name,subject,priority,description);
		
		if (ticket) {
			
			RequestDispatcher dispatcher1 = request.getRequestDispatcher("TicketSuccess.jsp");
			dispatcher1.forward(request, response);
			
		} else {
			
			RequestDispatcher dispatcher2 = request.getRequestDispatcher("TicketFailed.jsp");
			dispatcher2.forward(request, response);

		}
		
	}

}
