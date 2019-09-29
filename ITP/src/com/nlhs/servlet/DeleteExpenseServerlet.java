package com.nlhs.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nlhs.service.ExpenseService;
import com.nlhs.service.ExpenseServiceImpl;



@WebServlet("/DeleteExpenseServerlet")
public class DeleteExpenseServerlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public DeleteExpenseServerlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
		System.out.println("Delete servlet.........");
		
		response.setContentType("text/html");

		String expenseID = request.getParameter("expenseID");			
		
		ExpenseService expenseService = new ExpenseServiceImpl();
		expenseService.removeExpense(expenseID);

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/profit/viewExpense.jsp");
		dispatcher.forward(request, response);

		
	}

}
