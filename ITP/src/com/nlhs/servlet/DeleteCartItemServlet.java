package com.nlhs.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nlhs.service.CartServiceImp;

/**
 * Servlet implementation class DeleteCartItemServlet
 */
@WebServlet("/DeleteCartItemServlet")
public class DeleteCartItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteCartItemServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		CartServiceImp csi = new CartServiceImp();

		String message = csi.DeleteCartItem(request.getParameter("product_id"));

		request.setAttribute("RCPmessage", message);

		HttpSession s = request.getSession();
		s.setAttribute("RCPmessage", message);
		getServletContext().getRequestDispatcher("/cart.jsp").forward(request, response);

	}

}
