package com.nlhs.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nlhs.model.CustomerAddress;
import com.nlhs.service.CustomerAddressService;

/**
 * Servlet implementation class CustomerSearchServlet
 */
@WebServlet("/CustomerSearchServlet")
public class CustomerSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerSearchServlet() {
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
		String district = request.getParameter("district");
		String cType = request.getParameter("cType");
		System.out.print(district + " " + cType);
		ArrayList list = new ArrayList();
		CustomerAddress address = new CustomerAddress();
		CustomerAddressService service = new CustomerAddressService();
		
		address.setDistrict(district);
		
		list = service.searchCustomer(address);
		request.setAttribute("list", list);
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/customerManagement.jsp");
		dispatcher.forward(request, response);
		
		
	}

}
