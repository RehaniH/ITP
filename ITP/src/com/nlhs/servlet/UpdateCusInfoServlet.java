package com.nlhs.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nlhs.model.Customer;
import com.nlhs.service.CustomerService;

/**
 * Servlet implementation class UpdateCusInfoServlet
 */
@WebServlet("/UpdateCusInfoServlet")
public class UpdateCusInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCusInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
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
		//Get information from the session variable
		HttpSession session = request.getSession(); 
		String userName = (String) session.getAttribute("UserName");
		
		Customer customer = new Customer();
		CustomerService service = new CustomerService();
		
		if(request.getParameter("Passwords") != null) {
			//get form information
			String email = request.getParameter("user");
			String oldPass = request.getParameter("old");
			String newPass= request.getParameter("new");
			
			
			
			
			System.out.println(email);
			System.out.println(oldPass);
			
			customer.setEmail(email);
			customer.setPassword(oldPass);
			
			boolean res = service.passwordCheck(customer);
			
			if(res == true) {
				System.out.println("Successful");
				customer.setEmail(email);
				customer.setPassword(newPass);
				service.changePassword(customer);
			}else
				System.out.println("Unsuccessful");
		}else
			if(request.getParameter("Names") != null) {
				String fName = request.getParameter("fName");
				String lName = request.getParameter("lName");
				System.out.println(lName);
				System.out.println(fName);
				customer.setEmail(userName);
				customer.setFirstName(fName);
				customer.setLastName(lName);
				
				int result = service.changeDetails(customer);
				
				if(result > 0) {
					
					System.out.println("Successful");
				}else
					System.out.println("Unsuccessful");
				
			}
		
			
		ServletContext servletContext = getServletContext();
		request.setAttribute("cInfo", "redirect");
		RequestDispatcher dispatcher = servletContext.getRequestDispatcher("/DirectServlet");
		dispatcher.forward(request, response);
		
		
		

	}

}
