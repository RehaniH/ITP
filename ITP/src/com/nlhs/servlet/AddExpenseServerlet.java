package com.nlhs.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nlhs.model.Expense;
import com.nlhs.service.ExpenseService;
import com.nlhs.service.ExpenseServiceImpl;



@WebServlet("/AddExpenseServerlet")
public class AddExpenseServerlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public AddExpenseServerlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		System.out.println("Add Servlet...........");
		
		Expense expense = new Expense();
		
		expense.setType(request.getParameter("type"));
		expense.setValue(request.getParameter("value"));
		
		
		
		ExpenseService expenseService = new ExpenseServiceImpl();
		expenseService.addExpense(expense);
		
		request.setAttribute("expense", expense);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/profit/pView.jsp");
		dispatcher.forward(request, response);

	}

}
