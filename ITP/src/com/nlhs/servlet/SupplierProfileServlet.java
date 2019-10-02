package com.nlhs.servlet;
/**
 * 
 * @author S.A.L.Witharana
 * IT18068856
 *
 */
import java.io.IOException;


import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nlhs.model.Supplier;
import com.nlhs.service.SupplierServiceImpl;

@WebServlet("/SupplierProfileServlet")
public class SupplierProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public SupplierProfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}
	 
		
	    
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Supplier supplier = new Supplier();
			supplier.setEmailAddress(request.getParameter("emailAddress"));
		    supplier.setPassword(request.getParameter("password"));
		    
		    
				supplier = SupplierServiceImpl.login(supplier);
				 if (supplier.isValid())
			     {
				        
			          HttpSession session = request.getSession(true);	    
			          session.setAttribute("currentSessionUser",supplier);
			          session.setAttribute("suppID", supplier.getSupplierID());
			          response.sendRedirect("SupplierProfile.jsp"); //logged-in page      		
			     }
				        
			     else 
			          response.sendRedirect("index.jsp"); //error page 
			} 
					
					
			catch (Throwable theException) 	    
			{
			     System.out.println(theException); 
			}
			       
		}
		
		
		
		
	}


