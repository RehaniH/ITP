package com.nlhs.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nlhs.model.Item;
import com.nlhs.service.ItemsServiceImp;

/**
 * Servlet implementation class FilterItemServlet
 */
@WebServlet("/FilterItemServlet")
public class FilterItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FilterItemServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String name = request.getParameter("product_name");
		String category = request.getParameter("p_category");
		int cprice = Integer.parseInt(request.getParameter("costPriceR"));
		int sprice = Integer.parseInt(request.getParameter("sellingPriceR"));
		int profit = Integer.parseInt(request.getParameter("profitR"));

		ItemsServiceImp isi = new ItemsServiceImp();
		HashSet<Item> Itemlist = new HashSet<Item>();
		try {
			System.out.println(name);
			Itemlist = isi.filterItems(name, category, cprice, sprice, profit);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		HttpSession s = request.getSession();
		s.setAttribute("ItemList", Itemlist);
		request.setAttribute("ItemList", Itemlist);
		getServletContext().getRequestDispatcher("/ShowProductForm.jsp").forward(request, response);

	}

}
