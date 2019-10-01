package com.nlhs.servlet;
/**
 * 
 * @author IT18176070 P.R.H Perera
 *
 */
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nlhs.model.CustomerAddress;
import com.nlhs.service.CustomerAddressService;

/**
 * Servlet implementation class UpdateAddressServlet
 */
@WebServlet("/DirectAddressServlet")
public class DirectAddressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DirectAddressServlet() {
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
		
		doGet(request, response);
		RequestDispatcher dispatcher;
		
		/** 
		 * Set session attribute
		 */
		HttpSession session = request.getSession();
		String userName = (String) session.getAttribute("UserName");
		
		ArrayList<CustomerAddress> list = new ArrayList<>();
		CustomerAddressService service = new CustomerAddressService();
		CustomerAddress bAddress = new CustomerAddress();
		CustomerAddress dAddress = new CustomerAddress();
		list = service.getDetails(userName);
		
		if(!list.isEmpty()) {
			for(CustomerAddress ad : list) {
				if(ad.isBilling() == true)
					bAddress = ad;
				else if(ad.isDelivery() == true)
					dAddress = ad;
						
			}
		}
		
		
		if(request.getParameter("billing") != null) {
			request.setAttribute("Billing", bAddress);
			dispatcher = getServletContext().getRequestDispatcher("/updateAddress.jsp");
			dispatcher.forward(request, response);
		}else 
			if(request.getParameter("delivery") != null) {
				request.setAttribute("Delivery", dAddress);
				dispatcher = getServletContext().getRequestDispatcher("/updateAddress.jsp");
				dispatcher.forward(request, response);
			}else
				System.out.println("NUll");
	}

}
