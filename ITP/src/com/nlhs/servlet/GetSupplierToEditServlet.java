package com.nlhs.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nlhs.model.Supplier;
import com.nlhs.service.SupplierServiceImpl;



@WebServlet("/GetSupplierToEditServlet")
public class GetSupplierToEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public GetSupplierToEditServlet() {
    	
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
		System.out.println("Get Supplier To edit Supplier ");
		SupplierServiceImpl supplierservice = new SupplierServiceImpl();
		
		try {
			
		  Supplier supplier = new Supplier();
			
		  supplier.setEmailAddress(request.getParameter("emailAddress"));
		  supplier.setFirstName(request.getParameter("firstName"));
          supplier = supplierservice.getInformation(supplier);
				
				        
          HttpSession session = request.getSession(true);
          session.setAttribute("currentSessionUser",supplier); 
          response.sendRedirect("EditSupplierProfile.jsp"); //logged-in page      		
	
		} 
					
					
			catch (Throwable theException) 	    
			{
			     System.out.println(theException); 
			}
			       
		}
				
	}


