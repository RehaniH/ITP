package com.nlhs.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nlhs.model.Supplier;
import com.nlhs.service.SupplierStatusServiceImpl;
import com.nlhs.service.SupplierStatusServices;

@WebServlet("/DenySupplierServerlet")
public class DenySupplierServerlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  public DenySupplierServerlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	doGet(request, response);
	System.out.println("Deny Supplier servlet.....");
	
	response.setContentType("text/html");

	Supplier supplier = new Supplier();
	
	String supplierID = request.getParameter("supplierID");	
	supplier.setSupplierID(supplierID);
	supplier.setStatus("Deny");
	
	SupplierStatusServices supplierService = new SupplierStatusServiceImpl();
	supplierService.statusSupplier(supplierID, supplier);

	RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ListSuppliers.jsp");
	dispatcher.forward(request, response);

	}

}
