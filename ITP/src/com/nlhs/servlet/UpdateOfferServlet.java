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
 * Servlet implementation class UpdateOfferServlet
 */
@WebServlet("/UpdateOfferServlet")
public class UpdateOfferServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateOfferServlet() {
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
		System.out.println("UpdateOffer servlet...........");
		response.setContentType("text/html");
		
		offer offer = new offer();
		String offerId = request.getParameter("offerId");
		offer.setOfferId(offerId);
		offer.setSupId(request.getParameter("supId"));
		offer.setStart(request.getParameter("start"));
		offer.setExpire(request.getParameter("expire"));
		offer.setCompany(request.getParameter("company"));
		offer.setProduct(request.getParameter("product"));
		offer.setDiscount(request.getParameter("discount"));
		offer.setDescription(request.getParameter("description"));
		
		OfferService offerService = new OfferServiceImpl();
		offerService.updateOffer(offerId, offer);
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views1/listOffer.jsp");
		dispatcher.forward(request, response);
	}

}
