package com.nlhs.servlet;



import java.io.IOException;



import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.nlhs.service.SupProService;
import com.nlhs.service.SupProServiceImpl;

/**
 * Servlet implementation class DeleteSupProServlet
 */
@WebServlet("/DeleteSupProServlet")
public class DeleteSupProServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteSupProServlet() {
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
		
		System.out.println("Delete Servlet..........");
		response.setContentType("text/html");
		
		String supProId = request.getParameter("supProId");
		
		SupProService supProService = new SupProServiceImpl();
		supProService.removeSupPro(supProId);
		
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/views2/listSupPro.jsp");
		
		dispatcher.forward(request, response);
	}

}
