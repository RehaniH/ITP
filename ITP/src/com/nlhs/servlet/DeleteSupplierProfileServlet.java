package com.nlhs.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.nlhs.model.Supplier;
import com.nlhs.service.ISupplierServices;
import com.nlhs.service.SupplierServiceImpl;


@WebServlet("/DeleteSupplierProfileServlet")
public class DeleteSupplierProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public DeleteSupplierProfileServlet() {
     
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
        System.out.println("Delete profile servlet.........");
	
		response.setContentType("text/html");
        Supplier supplier = new Supplier();
        
		String supplierID = request.getParameter("supplierID");
		String emailAddress =request.getParameter("emailAddress");
		
		supplier.setEmailAddress(request.getParameter("emailAddress"));
		supplier.setSupplierID(request.getParameter("supplierID"));
	
		System.out.println("Inside delete supplier profile "+emailAddress);

		ISupplierServices isupplierService = new SupplierServiceImpl();
		isupplierService.removeSupplierProfile(emailAddress);
        System.out.println("Deleted through Profile");
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/index.jsp");
		dispatcher.forward(request, response);
	}

}
