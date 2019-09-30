package com.nlhs.servlet;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nlhs.model.Orders;
import com.nlhs.service.OrderService;

/**
 * Servlet implementation class OrderHistoryServlet
 */
@WebServlet("/OrderHistoryServlet")
public class OrderHistoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderHistoryServlet() {
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
		
		ArrayList list = new ArrayList();
		Orders or = new Orders();
		OrderService  service  = new OrderService();
		if(request.getParameter("Details") != null) {
			
			if(request.getParameter("id") != null) {
				list = service.getOrderById(request.getParameter("id"));
				request.setAttribute("Reciept", list);
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/HistoryReciept.jsp");
				dispatcher.forward(request, response);
				System.out.println("Here I am 3");
				
			}
		}else if(request.getParameter("Delete") != null) {
			
		}
		
		
	}

}
