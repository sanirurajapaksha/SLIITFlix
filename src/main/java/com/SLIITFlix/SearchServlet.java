package com.SLIITFlix;
import model.*;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String searchTerm = request.getParameter("search");

		List<Content> searchResults = TicketModel.searchContent(searchTerm);

		request.setAttribute("searchResults", searchResults);

		RequestDispatcher dispatcher = request.getRequestDispatcher("SearchResult.jsp");
		dispatcher.forward(request, response);
		
	}

}
