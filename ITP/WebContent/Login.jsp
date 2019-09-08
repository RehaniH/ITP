<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>
		<form method="post" action="SupplierProfileServlet">
		
		<table border="0" cellpadding="2" cellspacing="2">
		<tr>
		   <td>Email</td>
		   <td><input type="text" name="emailAddress"/></td>
		   </tr>
		   <tr>
		   <td>Password</td>
		   <td><input type="text" name="password"/></td>
		   </tr>
		   <tr>
		   <td>&nbsp;</td>
		   <td><input type="submit" value= "Login"/></td>
		   </tr>
		</table>		
		</form>
</body>
</html>