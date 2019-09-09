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

@WebServlet("/GetIncomeServerlet")
public class GetIncomeServerlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public GetIncomeServerlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
		System.out.println("GetIncome Servlet..........");
		
		response.setContentType("text/html");

 		String iID = request.getParameter("incomeID");
		IncomeService incomeService=new IncomeServiceImpl();
		Income income =incomeService.getIncomeByID(iID);
		
		

		request.setAttribute("income", income);
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("pView.jsp");
		dispatcher.forward(request, response);
		

	}

}
