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
<form method="post" action="../AddExpenseServerlet" >
<h1 align="center">Profit Management</h1>
<h1 align="center">Expense</h1>
<table>
<tr>
<td>Type</td>
<td><input type="text" name="type" placeholder="Electricity"required/></td>
</tr>
<tr>
<td>Value</td>
<td><input type="number" name="value" placeholder="1000.00"required/></td>
</tr>
</table><br><br>
<input type="submit" value="Insert Expense" class="insertE" /><br><br>

</form>

	<form method="post" action="../ListExpenseServerlet">
	<input type="submit" value="View Expense" class="listE"/><br>
	</form>

</body>
</html>