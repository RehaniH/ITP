package com.nlhs.servlet;
/**
 * 
 * @author S.A.L.Witharana
 * IT18068856
 *
 */
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


@WebServlet("/UpdateSupplierServlet")
public class UpdateSupplierServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public UpdateSupplierServlet() {
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

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
		
		System.out.println("Supplier Update");
				
				response.setContentType("text/html");
                
				Supplier supplier = new Supplier();
				String supplierID = request.getParameter("supplierID");	
				supplier.setSupplierID(supplierID);
				supplier.setFirstName(request.getParameter("firstName"));
				supplier.setLastName(request.getParameter("lastName"));
				supplier.setCompanyName(request.getParameter("companyName"));
				supplier.setProductCategory(request.getParameter("productCategory"));
                supplier.setContactNumber(request.getParameter("contactNumber"));
				supplier.setEmailAddress(request.getParameter("emailAddress"));
				supplier.setAddress(request.getParameter("address"));
				supplier.setPassword(request.getParameter("password"));
			
				ISupplierServices supplierService = new SupplierServiceImpl();
				supplierService.updateSupplier(supplierID, supplier);

				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ListSuppliers.jsp");
				dispatcher.forward(request, response);
	}

}
