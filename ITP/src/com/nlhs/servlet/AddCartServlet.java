package com.nlhs.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nlhs.model.Cart;
import com.nlhs.service.CartServiceImp;

/**
 * Servlet implementation class AddCartServlet
 */
@WebServlet("/AddCartServlet")
public class AddCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddCartServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);

		Cart cart = new Cart();
		System.out.println("I am Inside cart servlet");

		int quantity = Integer.parseInt(request.getParameter("quantity"));
		float eachPrice = Float.parseFloat(request.getParameter("sellingPrice"));

		float pvalue = quantity * eachPrice;
		cart.setCusEmail(request.getParameter("uEmail"));
		cart.setpName(request.getParameter("pName"));
		cart.setItemId(request.getParameter("pId"));
		cart.setpImage(request.getParameter("pImage"));
		cart.setQuantity(quantity);
		cart.setUnitPrice(eachPrice);
		cart.setpValue(pvalue);

		CartServiceImp csi = new CartServiceImp();

		String result = csi.addToCart(cart);

		// request.setAttribute("atcMessage", result);
		// response.sendRedirect("cart.");
		// String referer = request.getHeader("Referer");
		// getServletContext().getRequestDispatcher("/homePage.jsp").forward(request,
		// response);
//		request.getRequestDispatcher("/homePage.jsp").forward(request, response);
//		response.sendRedirect(request.getHeader("Referer"));

//		RequestDispatcher dd = request.getRequestDispatcher("/cart.jsp");
//		dd.forward(request, response);
		request.getRequestDispatcher("homePage.jsp").include(request, response);

	}

}
