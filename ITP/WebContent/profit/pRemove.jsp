<%@page import ="com.nlhs.model.Income" %>
<%@page import ="com.nlhs.model.Expense" %>
<%@page import ="java.util.ArrayList" %>
<%@page import ="com.nlhs.service.IncomeService" %>
<%@page import ="com.nlhs.service.ExpenseService" %>
<%@page import ="com.nlhs.service.IncomeServiceImpl" %>
<%@page import ="com.nlhs.service.ExpenseServiceImpl" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New Lanka</title>

<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

<style>
    table {
    border-collapse: collapse;
    border-spacing: 0;
    width: 100%;
    border: 1px solid #ddd;
    }

    th, td {
      text-align: left;
      padding: 8px;
    }

    tr:nth-child(even){background-color: #f2f2f2}
  </style>
</head>
<body>

<div>
	<h2 align="center">INCOME</h2>
<table>

		<tr>
			<th>ID</th>
			<th>Type</th>
			<th>Value</th>
			<th>Remove</th>
		</tr>
		
		<%
		IncomeService incomeService = new IncomeServiceImpl();
		ArrayList<Income> arrayList=incomeService.getIncome();
		
			for(Income income:arrayList){
		%>
		
		<tr>
			<td><%=income.getIncomeID() %></td>
			<td><%=income.getType() %></td>
			<td><%=income.getValue() %></td>
			
			<td> 
				<form method="post" action="../DeleteIncomeServerlet">
					<input type="hidden" name="incomeID"
						value="<%=income.getIncomeID()%>" /> <input type="submit"
						value="Delete Income" class="delete-button"/>
				</form>
			</td>
		</tr>
		<%
		}
			%>
		
	</table>
	</div>
			
	<br><br>
<div>	
<h2 align="center">EXPENSE</h2>
<table>

		<tr>
			<th>ID</th>
			<th>Type</th>
			<th>Value</th>
			<th>Remove</th>
		</tr>
		
		<%
		ExpenseService expenseService = new ExpenseServiceImpl();
		ArrayList<Expense> expense1=expenseService.getExpense();
		
			for(Expense expense:expense1){
		%>
		
		<tr>
			<td><%=expense.getExpenseID() %></td>
			<td><%=expense.getType() %></td>
			<td><%=expense.getValue() %></td>
			
			<td> 
				<form method="post" action="../DeleteExpenseServerlet">
					<input type="hidden" name="expenseID"
						value="<%=expense.getExpenseID()%>" /> <input type="submit"
						value="Delete Expense" class="delete-button"/>
				</form>
			</td>
		</tr>
		<%
		}
			%>	
	</table>
	</div><br>
	
	<a href="pIncome.jsp">Add New Income</a><br><br>
<a href="pExpense.jsp">Add New Expense</a>
		


</body>
</html>