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
<form method="post" action="../AddIncomeServerlet">
<h1 align="center">PROFIT MANAGEMENT</h1><br>
<h1 align="center">INCOME</h1>
<table>
<tr>
<td>Type</td>
<td><input type="text" placeholder="Sales" name="type"required/></td>
</tr>
<tr>
<td>Value</td>
<td><input type="number" placeholder="1000.00" name="value"required/></td>
</tr>
</table><br><br>
<input type="submit" value="Insert Income" class="insertI"/><br><br>
</form>

	<form method="post" action="../ListIncomeServerlet">
	<input type="submit" value="List all" class="listI"/><br>
	</form>


</body>
</html>