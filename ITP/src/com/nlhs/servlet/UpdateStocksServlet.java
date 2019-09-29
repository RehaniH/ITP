package com.nlhs.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nlhs.model.Stocks;
import com.nlhs.service.StocksServiceImp;

/**
 * Servlet implementation class UpdateStocksServlet
 */
@WebServlet("/UpdateStocksServlet")
public class UpdateStocksServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateStocksServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Stocks st = new Stocks();

		st.setPid(request.getParameter("st_pid"));
		st.setPname(request.getParameter("st_pname"));
		st.setSid(request.getParameter("st_sid"));
		st.setStocks(Integer.parseInt(request.getParameter("st_stock")));
		st.setAid(request.getParameter("st_aid"));
		Date d = new Date();
		System.out.println(d.toString());
		String[] date = d.toString().split(" ");
		st.setuDate(date[0] + " " + date[1] + " " + date[2] + " " + date[5]);

		StocksServiceImp ssi = new StocksServiceImp();

		String StockUpdatemessage = ssi.updateStocks(st);
		request.setAttribute("SUmessage", StockUpdatemessage);
		getServletContext().getRequestDispatcher("/inventoryManagement.jsp").forward(request, response);

	}

}
