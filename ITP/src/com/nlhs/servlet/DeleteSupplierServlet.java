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
 * 
 * @author S.A.L.Witharana
 * IT18068856
 *
 */

@WebServlet("/DeleteSupplierServlet")
public class DeleteSupplierServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteSupplierServlet() {
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
	
				response.setContentType("text/html");

				String supplierID = request.getParameter("supplierID");			
				

				ISupplierServices isupplierService = new SupplierServiceImpl();
				isupplierService.removeSupplier(supplierID);

				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ListSuppliers.jsp");
				dispatcher.forward(request, response);
	}

}
