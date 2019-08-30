package com.nlhs.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nlhs.model.CustomerAddress;
import com.nlhs.service.CustomerAddressService;

/**
 * Servlet implementation class UpdateCusAddressServlet
 */
@WebServlet("/UpdateCusAddressServlet")
public class UpdateCusAddressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCusAddressServlet() {
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
		
		HttpSession session = request.getSession();
		String userName = (String) session.getAttribute("UserName");
		System.out.println(userName );
		CustomerAddress address = new CustomerAddress();
		CustomerAddressService service = new CustomerAddressService();
		
		String status = request.getParameter("socialStatus");
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String no ,city;
		String street, district;
		
		System.out.println(fname);
		no = request.getParameter("no");
		street = request.getParameter("street");
		city = request.getParameter("city");
		district = request.getParameter("district");
		
		int postalCode = Integer.parseInt(request.getParameter("postalCode"));
		String telephone = request.getParameter("telephone");
		
		boolean isBilling = Boolean.parseBoolean(request.getParameter("isBilling"));
		boolean isDelivery = Boolean.parseBoolean(request.getParameter("isDelivery"));
		
		String customerId = service.getCustomerId(userName);
		address.setCustomerId(customerId);
		address.setBilling(isBilling);
		address.setDelivery(isDelivery);
		address.setSocialStatus(status);
		address.setFname(fname);
		address.setLname(lname);
		address.setNo(no);
		address.setStreet(street);
		address.setCity(city);
		address.setDistrict(district);
		address.setPostalCode(postalCode);
		address.setTelephone(telephone);
		address.setEmail(userName);
		
		service.UpdateAddress(address, userName);
		
		ServletContext servletContext = getServletContext();
		request.setAttribute("customer", "redirect");
		RequestDispatcher dispatcher = servletContext.getRequestDispatcher("/DirectServlet");
		dispatcher.forward(request, response);
	}

}
