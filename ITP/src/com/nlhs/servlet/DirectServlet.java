package com.nlhs.servlet;

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
//import com.nlhs.service.OrderDetailsService;

/**
 * Servlet implementation class DirectServlet
 */
@WebServlet("/DirectServlet")
public class DirectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DirectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at do get method: ").append(request.getContextPath());
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
		
		/**
		 * Set session variable from login
		 */
		 HttpSession session = request.getSession(); 
		 session.setAttribute("UserName",  "sashaparanwithana@gmail.com");
		 
		
		ArrayList<CustomerAddress> list = new ArrayList<>();
		CustomerAddressService service = new CustomerAddressService();
		
		/**
		 * Get details from already existing session variable
		 */
		
		String userName = (String) session.getAttribute("UserName");
		
		if(service.getDetails(userName ) != null) {
			list = service.getDetails(userName );
			
			for(CustomerAddress as: list) {
				System.out.println("Inside servlet " + as.getFname());
			}
			request.setAttribute("Address", list);
		}else
			System.out.println("Nothing returned.");
			
		//Direct to customer addresses of a certain customer
		if(request.getParameter("customer") != null) {
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/CustomerAddresses.jsp");
			dispatcher.forward(request, response);
			
		}else //Direct to the profile page of a certain customer
			if(request.getParameter("orderHistory") != null){
				ArrayList order = new ArrayList();
				//OrderDetailsService serv = new OrderDetailsService();
				String cus = service.getCustomerId(userName);
				
			/*
			 * if(serv.getOrderDetails(cus) != null) { order = serv.getOrderDetails(cus);
			 * 
			 * }
			 */
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/OrderHistory.jsp");
			dispatcher.forward(request, response);
			
		}else //Direct to the update details of a certain customer
			if((request.getParameter("cInfo") != null) || (request.getAttribute("cInfo") != null)){
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/updateDetails.jsp");
			dispatcher.forward(request, response);
			
		}else //Direct to the credit slips obtained by a certain customer
			if(request.getParameter("creditSlips") != null){
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/profile.jsp");
			dispatcher.forward(request, response);
			
		}else //Direct to the settings page of the customer
			if(request.getParameter("settings") != null){
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/settings.jsp");
			dispatcher.forward(request, response);
			
		}else //Direct to the terms and conditions page to review the terms in using the website
			if(request.getParameter("cTerms") != null){
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/termsAndConditions.jsp");
			dispatcher.forward(request, response);
		}
			
		
	}

}
