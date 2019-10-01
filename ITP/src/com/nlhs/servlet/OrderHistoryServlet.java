package com.nlhs.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nlhs.model.Orders;
import com.nlhs.service.OrderDetailsService;
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
		OrderDetailsService dservice = new OrderDetailsService();
		if(request.getParameter("View") != null) {
			
			if(request.getParameter("id") != null) {
				
				String orderId = request.getParameter("id");
				ArrayList dList = dservice.getOrderDetailById(orderId);
				list = service.getOrderById(orderId);
				
				request.setAttribute("Reciept", list);
				request.setAttribute("Details", dList);
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/HistoryReciept.jsp");
				dispatcher.forward(request, response);
				
				
			}
		}else if(request.getParameter("delete") != null) {
				if(request.getParameter("id") != null) {
				
					String orderId = request.getParameter("id");
					int status = dservice.deleteRecord(orderId);
					if(status == 0) {
						PrintWriter out = response.getWriter();
						out.println("<script type=\"text/javascript\">");
						out.println("alert('Order cannot be deleted since not in delivered state');");
						 out.println("location='profile.jsp';");
						 out.println("</script>");
					}else {
						service.deleteOrderReceipt(orderId);
						PrintWriter out = response.getWriter();
						out.println("<script type=\"text/javascript\">");
						out.println("alert('Order deleted');");
						 out.println("location='profile.jsp';");
						 out.println("</script>");
						
					}
						
				}
		}
		
		
	}

}
