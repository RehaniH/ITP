package com.nlhs.servlet;

import java.io.IOException;



import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nlhs.model.Supplier;
import com.nlhs.service.ISupplierServices;
import com.nlhs.service.SupplierServiceImpl;

/**
 * Servlet implementation class GetSupplierServlet
 */
@WebServlet("/GetSupplierServlet")
public class GetSupplierServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
  
    public GetSupplierServlet() {
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
    		//doGet(request, response);
			
    	    System.out.println("Get Supplier Servlet..........");	
			response.setContentType("text/html");
		    
			String supplierID = request.getParameter("supplierID");
			ISupplierServices isupplierService = new SupplierServiceImpl();
			
			Supplier supplier = isupplierService.getSupplierbyID(supplierID);
			request.setAttribute("supplier", supplier);
			
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/EditSupplier.jsp");//updateWorker.jsp
			dispatcher.forward(request, response);

			/*request.setAttribute("supplier", supplier);
			RequestDispatcher dispatcher1 = getServletContext().getRequestDispatcher("/views/updateWorker.jsp");
			dispatcher1.forward(request, response);
		    */

    }
}
