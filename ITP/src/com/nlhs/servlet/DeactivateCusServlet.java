package com.nlhs.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nlhs.model.Customer;
import com.nlhs.model.Deactivated;
import com.nlhs.service.CustomerAddressService;
import com.nlhs.service.CustomerService;
import com.nlhs.service.DeactivatedCusService;

/**
 * Servlet implementation class DeactivateCusServlet
 */
@WebServlet("/DeactivateCusServlet")
public class DeactivateCusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeactivateCusServlet() {
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
		Customer customer = new Customer();
		CustomerService service = new CustomerService();
		CustomerAddressService adServ = new CustomerAddressService();
		Deactivated dcus = new Deactivated();
		DeactivatedCusService dserv = new DeactivatedCusService();
		String email = request.getParameter("user");
		String password1 = request.getParameter("pass1");
		String password2 = request.getParameter("pass2");
		String reason = request.getParameter("reason");
		boolean result = service.comparePassword(password1, password2);
		
		if(result) {
			customer.setEmail(email);
			customer.setPassword(password1);
			dcus.setEmail(email);
			dcus.setReason(reason);
			
			int status = service.deactivateAccount(customer);
			
			if(status == 0) {
				request.setAttribute("Status", status);
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/settings.jsp");
				dispatcher.forward(request, response);
			}else {
				dserv.insertDeactivated(dcus);
				adServ.deleteAddressDetails(email);
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/index.jsp");
				dispatcher.forward(request, response);
			}
			
		}else {
			System.out.print("Couldnt deactivate account");
			request.setAttribute("Results", result);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/settings.jsp");
			dispatcher.forward(request, response);
		}
		
		
	}

}
