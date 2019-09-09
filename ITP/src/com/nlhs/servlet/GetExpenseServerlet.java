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


@WebServlet("/GetExpenseServerlet")
public class GetExpenseServerlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GetExpenseServerlet() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
		System.out.println("GetIncome Servlet..........");
		
		response.setContentType("text/html");

 		String eID = request.getParameter("expenseID");
		ExpenseService expenseService=new ExpenseServiceImpl();
		Expense expense =expenseService.getExpenseByID(eID);
		
		

		request.setAttribute("expense", expense);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("pView.jsp");
		dispatcher.forward(request, response);

	}

}
