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
import com.nlhs.service.SupplierStatusServices;
import com.nlhs.service.SupplierStatusServiceImpl;


@WebServlet("/GetSupplierServlet")
public class GetSupplierStatusServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
  
    public GetSupplierStatusServlet() {
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
			
    	    System.out.println("Get Supplier Servlet..........");	
			response.setContentType("text/html");
		    
			String supplierID = request.getParameter("supplierID");
			SupplierStatusServices isupplierService = new SupplierStatusServiceImpl();
			
			Supplier supplier = isupplierService.getSupplierbyIDStatus(supplierID);
			request.setAttribute("supplier", supplier);
			
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ListSuppliers.jsp");
			dispatcher.forward(request, response);

			

    }
}
