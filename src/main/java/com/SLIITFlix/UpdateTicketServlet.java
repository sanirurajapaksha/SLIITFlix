package com.SLIITFlix;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/UpdateTicketServlet")
public class UpdateTicketServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		
        if (session == null || session.getAttribute("user_id") == null) {
        	
            response.sendRedirect("Login.jsp");// replace
            return;
        }
		
		
        String ticketID = request.getParameter("tid");
        
		Ticket ticketDataById = TicketModel.GetTicketById(ticketID);
		
		request.setAttribute("ticketDataById", ticketDataById);
		
		if(ticketDataById != null) {
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("UpdateTicket.jsp");
			dispatcher.forward(request, response);
			
		}else {
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("Error.jsp");
			dispatcher.forward(request, response);
		}
		
		
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		
        if (session == null || session.getAttribute("user_id") == null) {
        	
            response.sendRedirect("Login.jsp");// replace
            return;
        }
		
		String status = request.getParameter("status");
		String tid = request.getParameter("tid");
		
		Boolean statusBoolean = TicketModel.UpdateData(status,tid);
		
		if(statusBoolean) {
			
			response.sendRedirect("ReadTicketServlet");
			
		}else {
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("Error.jsp");
			dispatcher.forward(request, response);
			
		}
        
        
	}

}