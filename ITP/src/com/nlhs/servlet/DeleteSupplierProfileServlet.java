package com.nlhs.servlet;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nlhs.service.ISupplierServices;
import com.nlhs.service.SupplierServiceImpl;

/**
 * Servlet implementation class DeleteSupplierProfileServlet
 */
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

		String supplierID = request.getParameter("supplierID");			
		System.out.println("Inside delete supplier profile "+supplierID);

		ISupplierServices isupplierService = new SupplierServiceImpl();
		isupplierService.removeSupplier(supplierID);
        System.out.println("Deleted through Profile");
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Login.jsp");//Make this login page(Direct to home page)
		dispatcher.forward(request, response);
	}

}
