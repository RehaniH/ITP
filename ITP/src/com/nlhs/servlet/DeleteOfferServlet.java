package com.nlhs.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nlhs.service.OfferService;
import com.nlhs.service.OfferServiceImpl;

/**
 * Servlet implementation class DeleteOfferServlet
 */
@WebServlet("/DeleteOfferServlet")
public class DeleteOfferServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteOfferServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		System.out.println("Delete servlet...........");
		response.setContentType("text/html");
		
		
		String offerId = request.getParameter("offerId");
		System.out.println(offerId);
		OfferService offerService = new OfferServiceImpl();
		offerService.removeOffer(offerId);
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views1/listOffer.jsp");
		dispatcher.forward(request, response);
		
	}

}
