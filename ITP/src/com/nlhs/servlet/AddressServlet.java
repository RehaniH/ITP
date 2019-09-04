package com.nlhs.servlet;

import java.io.IOException;

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
 * Servlet implementation class AddressServlet
 */
@WebServlet("/AddressServlet")
public class AddressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddressServlet() {
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
		
		CustomerAddress address = new CustomerAddress();
		CustomerAddressService service = new CustomerAddressService();
		
		String status = request.getParameter("socialStatus");
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String no ,city;
		String street, district;
		
		
		no = request.getParameter("no");
		street = request.getParameter("street");
		city = request.getParameter("city");
		district = request.getParameter("district");
		
		try {
			
			
			int postalCode = Integer.parseInt(request.getParameter("postalCode"));
			
			String telephone = request.getParameter("telephone");
			boolean isBilling = Boolean.parseBoolean(request.getParameter("isBilling"));
			boolean isDelivery = Boolean.parseBoolean(request.getParameter("isDelivery"));
		
		
			
		
			
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
		
			service.addAddress(address, userName);
		
		}catch(NumberFormatException e) {
			System.out.println("Enter valid information.");
		}
		CustomerAddress delivery = new  CustomerAddress();
		String dSocialStatus = request.getParameter("dSocialStatus"); 
		String dFname = request.getParameter("dFname"); 
		String dLname = request.getParameter("dLname"); 
		String dNo = request.getParameter("dNo"); 
		String dStreet = request.getParameter("dStreet"); 
		String dCity = request.getParameter("dCity"); 
		String dDistrict = request.getParameter("dDistrict"); 
		try {
			int dPostalCode = Integer.parseInt(request.getParameter("dPostalCode")); 
			String dtelephone = request.getParameter("dTelephone"); 
			boolean dIsBilling = Boolean.parseBoolean(request.getParameter("dIsDelivery"));
			boolean dIsDelivery = Boolean.parseBoolean(request.getParameter("dIsBilling"));
			
			delivery.setSocialStatus(dSocialStatus);
			delivery.setFname(dFname);
			delivery.setLname(dLname);
			delivery.setNo(dNo);
			delivery.setStreet(dStreet);
			delivery.setCity(dCity);
			delivery.setDistrict(dDistrict);
			delivery.setTelephone(dtelephone);
			delivery.setPostalCode(dPostalCode);
			delivery.setBilling(false);//dIsBilling
			delivery.setDelivery(true);//dIsDelivery
			delivery.setEmail(userName);
			
			service.addAddress(delivery, userName);
			
		}catch(NumberFormatException e) {
			System.out.print("Number format exection occured");
			e.getMessage();
			e.printStackTrace();
		}
		
		request.setAttribute("customer", "redirect");
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/DirectServlet");
		dispatcher.forward(request, response);
	}

}
