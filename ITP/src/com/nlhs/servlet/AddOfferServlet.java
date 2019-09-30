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
 * Servlet implementation class AddOfferServlet
 */
@WebServlet("/AddOfferServlet")
public class AddOfferServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddOfferServlet() {
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
		System.out.println("Add Servlet.............");
		offer offer = new offer();
		
		offer.setSupId(request.getParameter("supId"));
		
		//DateFormat df = new SimpleDateFormat("dd/MM/yyyy");
		try {
			offer.setStart(request.getParameter("start"));
			offer.setExpire(request.getParameter("expire"));
			
		} catch (Exception e) {
			System.out.print("error"+e);
			e.printStackTrace();
		}
		offer.setCompany(request.getParameter("company"));
		offer.setProduct(request.getParameter("product"));
		offer.setDiscount(request.getParameter("discount"));
		offer.setDescription(request.getParameter("description"));
		
		
		OfferService offerService = new OfferServiceImpl();
		offerService.addOffer(offer);
		
		request.setAttribute("offer", offer);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views1/listOffer.jsp");
		dispatcher.forward(request, response);
	}

}
