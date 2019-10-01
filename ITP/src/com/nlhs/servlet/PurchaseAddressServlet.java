package com.nlhs.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nlhs.model.Cart;
import com.nlhs.model.CustomerAddress;
import com.nlhs.model.OrderDetails;
import com.nlhs.model.Orders;
import com.nlhs.service.CartServiceImp;
import com.nlhs.service.CustomerAddressService;
import com.nlhs.service.OrderDetailsService;
import com.nlhs.service.OrderService;

/**
 * Servlet implementation class PurchaseAddressServlet
 */
@WebServlet("/PurchaseAddressServlet")
public class PurchaseAddressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PurchaseAddressServlet() {
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
		
		HttpSession session = request.getSession();
		String userName = (String) session.getAttribute("UserName");
		
		CustomerAddress purchase = new  CustomerAddress();
		CustomerAddressService service = new CustomerAddressService();
		
		Cart cart = new Cart();
		CartServiceImp cartImpl = new CartServiceImp();
		
		OrderDetails details = new OrderDetails();
		OrderDetailsService detailService = new OrderDetailsService();
		
		
		OrderService orderService = new OrderService();
	
		String social = request.getParameter("social"); 
		String fname = request.getParameter("fname"); 
		String lname = request.getParameter("lname"); 
		String dNo = request.getParameter("no"); 
		String dStreet = request.getParameter("street"); 
		String dCity = request.getParameter("city"); 
		String dDistrict = request.getParameter("district"); 
		String email = request.getParameter("email");
		try {
			int dPostalCode = Integer.parseInt(request.getParameter("postal")); 
			String dtelephone = request.getParameter("tele"); 
			boolean dIsBilling = false;
			boolean dIsDelivery = true;
			
			purchase.setSocialStatus(social);
			purchase.setFname(fname);
			purchase.setLname(lname);
			purchase.setNo(dNo);
			purchase.setStreet(dStreet);
			purchase.setCity(dCity);
			purchase.setDistrict(dDistrict);
			purchase.setTelephone(dtelephone);
			purchase.setPostalCode(dPostalCode);
			purchase.setBilling(dIsBilling);
			purchase.setDelivery(dIsDelivery);
			purchase.setEmail(userName);
			
			if(service.getExistance(userName)) 
				service.UpdateAddress(purchase, userName);
			else
				service.addAddress(purchase, userName);
			
			float deliveryCharges = 400f;
				
			Date orderDate = new java.sql.Date(Calendar.getInstance().getTime().getTime());
			details.setEmail(userName);
			details.setOrderDate((java.sql.Date) orderDate);
			details.setOrderStatus("ordered.");
			details.setPaymentStatus("pending");
			details.setAmount(cartImpl.getCartTotal(userName));
			details.setDeliveryCharges(deliveryCharges);
			float grand = details.getAmount() + deliveryCharges;
			details.setGrandTotal(grand);
			String id = detailService.addOrderDetails(details);
			
			ArrayList<Cart> list = cartImpl.getCart(userName);
			Orders order;
			ArrayList<Orders> orderList = new ArrayList();
			
			for(Cart o: list) {
				
				order = new Orders();
				order.setOrderId(id);
				order.setEmail(userName);
				order.setItemId(o.getItemId());
				order.setpName(o.getpName());
				order.setpValue(o.getpValue());
				order.setQuantity(o.getQuantity());
				order.setUnitPrice(o.getUnitPrice());
				orderList.add(order);
			}
			
			for(Orders ordered: orderList) {
				orderService.addOrder(ordered);//adding the order from the cart to order table
			}
			
			
			cartImpl.removeCart(userName);
			
			
			
			
		}catch(NumberFormatException e) {
			System.out.print("Number format exection occured");
			e.getMessage();
			e.printStackTrace();
		}
		
		//request.setAttribute("customer", "redirect");
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/paymentgateway.jsp");
		dispatcher.forward(request, response);
	}

}
