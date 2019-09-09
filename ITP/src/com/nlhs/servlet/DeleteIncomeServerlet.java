package com.nlhs.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nlhs.service.IncomeService;
import com.nlhs.service.IncomeServiceImpl;


@WebServlet("/DeleteIncomeServerlet")
public class DeleteIncomeServerlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public DeleteIncomeServerlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		System.out.println("Delete servlet.........");
		
		response.setContentType("text/html");

		String incomeID = request.getParameter("incomeID");			
		
		IncomeService incomeService = new IncomeServiceImpl();
		incomeService.removeIncome(incomeID);

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/profit/pView.jsp");
		dispatcher.forward(request, response);

	}

}
