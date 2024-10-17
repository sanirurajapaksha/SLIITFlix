package com.SLIITFlix;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/ReadTicketServlet")
public class ReadTicketServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		
        if (session == null || session.getAttribute("user_id") == null) {
        	
            response.sendRedirect("Login.jsp");// replace
            return;
        }
		
		List <Ticket> AllTickets = TicketModel.GetData();
		
		request.setAttribute("AllTickets", AllTickets);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("ReadTicket.jsp");
		dispatcher.forward(request, response);
		
	}



}
