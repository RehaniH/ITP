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
 * Servlet implementation class GetSupProServlet
 */
@WebServlet("/GetSupProServlet")
public class GetSupProServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetSupProServlet() {
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
		System.out.println("Get supPro Servlet..........");
		response.setContentType("text/html");
		
		String supProId = request.getParameter("supProId");		
		SupProService supProService = new SupProServiceImpl();
		SupPro supPro = supProService.getSupProByID(supProId);
		
		request.setAttribute("SupPro", supPro );
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views2/UpdateSupPro.jsp");		
		dispatcher.forward(request, response);
	}

}
