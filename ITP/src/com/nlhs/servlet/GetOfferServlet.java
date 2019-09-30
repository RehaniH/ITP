package com.nlhs.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nlhs.model.offer;
import com.nlhs.service.OfferService;
import com.nlhs.service.OfferServiceImpl;

/**
 * Servlet implementation class GetOfferServlet
 */
@WebServlet("/GetOfferServlet")
public class GetOfferServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetOfferServlet() {
        super();
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
		System.out.println("Get offer Servlet..........");
		response.setContentType("text/html");
		
		String offerId = request.getParameter("offerId");
		OfferService offerService = new OfferServiceImpl();
		offer offer = offerService.getOfferByID(offerId);
		System.out.println("Offer Id"+offerId);
		
		request.setAttribute("offer", offer);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views1/updateOffer.jsp");
		
		dispatcher.forward(request, response);
	}

}
