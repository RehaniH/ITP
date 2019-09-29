package com.nlhs.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nlhs.model.Income;
import com.nlhs.service.IncomeService;
import com.nlhs.service.IncomeServiceImpl;


@WebServlet("/AddIncomeServerlet")
public class AddIncomeServerlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddIncomeServerlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		System.out.println("Add Income...........");
		
		Income income = new Income();
		income.setDate(request.getParameter("date"));
		income.setType(request.getParameter("type"));
		income.setValue(request.getParameter("value"));
		
		
		
		IncomeService incomeService = new IncomeServiceImpl();
		incomeService.addIncome(income);
		
		request.setAttribute("income", income);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/profit/viewIncome.jsp");
		dispatcher.forward(request, response);
	}

}
