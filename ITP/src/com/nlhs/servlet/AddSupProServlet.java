package com.nlhs.servlet;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nlhs.model.SupPro;
import com.nlhs.service.SupProService;
import com.nlhs.service.SupProServiceImpl;

/**
 * Servlet implementation class AddSupProServlet
 */
@WebServlet("/AddSupProServlet")
public class AddSupProServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddSupProServlet() {
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
		
		System.out.println("Add Servlet.............");
		
		SupPro supPro = new SupPro();
		
		supPro.setSupProId(request.getParameter("supProId"));
		supPro.setSid(request.getParameter("sid"));
		supPro.setSname(request.getParameter("sname"));
		supPro.setPhone(request.getParameter("phone"));
		supPro.setCompany(request.getParameter("company"));
		supPro.setType(request.getParameter("type"));
		supPro.setProduct(request.getParameter("product"));
		supPro.setQuantity(request.getParameter("quantity"));
		supPro.setTotalPri(request.getParameter("totalPri"));
		
		SupProService supProService = new SupProServiceImpl();
		supProService.addSupPro(supPro);
		
		request.setAttribute("SupPro", supPro);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views2/listSupPro.jsp");
		dispatcher.forward(request, response);
	}

}
