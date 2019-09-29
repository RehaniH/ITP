package com.nlhs.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nlhs.service.ItemsServiceImp;

/**
 * Servlet implementation class HomePageManagementServlet
 */
@WebServlet("/ElectricalPageManagementServlet")
public class ElectricalPageManagementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ElectricalPageManagementServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String product1 = request.getParameter("product_id1");
		String product2 = request.getParameter("product_id2");
		String product3 = request.getParameter("product_id3");
		String product4 = request.getParameter("product_id4");
		String product5 = request.getParameter("product_id5");
		String product6 = request.getParameter("product_id6");

		ItemsServiceImp isi = new ItemsServiceImp();

		String message = isi.ElectricalPageItems(product1, product2, product3, product4, product5, product6);

		request.setAttribute("HPCmessage", message);

		HttpSession s = request.getSession();
		s.setAttribute("HPCmessage", message);
		getServletContext().getRequestDispatcher("/AdminDashboard.jsp").forward(request, response);

	}

}
