<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.nlhs.model.Supplier"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<title>Edit Profile</title>
<link rel="stylesheet" type = "text/css" href="./SupplierStyle.css"/>
<!--TableStyles------------------------------------------->
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
	<!--TableStyles--------------------------------------->
</head>
<body>   

    <h1>Edit Profile</h1>
   
	<%
		Supplier supplier = (Supplier) request.getAttribute("supplier");
	%>

	<form method="POST" action="UpdateSupplierServlet">
		<table>
			<tr>
				<td>Supplier ID</td>
				<td><input type="text" name="supplierID" disabled="disabled"
					value="<%=supplier.getSupplierID() %>" /></td>
			</tr>
			<tr>
				<td>First Name</td>
				<td><input type="text" name="firstName"
					value="<%=supplier.getFirstName()%>" required /></td>
			</tr>
			<tr>
				<td>Last Name</td>
				<td><input type="text" name="lastName"
					value="<%=supplier.getLastName() %>" required/></td>
			</tr>
			<tr>
				<td>Company Name</td>
				<td><input type="text" name="companyName"
					value="<%=supplier.getCompanyName() %>" required/></td>
			</tr>
			<tr>
				<td>Product Category</td>
				<td><input type="text" name="productCategory"
					value="<%=supplier.getProductCategory() %>" required/></td>
			</tr>
			<tr>
				<td>Contact Number</td>
				<td><input type="text" name="contactNumber" value="<%=supplier.getContactNumber() %>" required/></td>
			</tr>
			<tr>
				<td>Email Address</td> 
				<td><input type="text" name="emailAddress" pattern="[^@]+@[^@]+.[a-zA-Z]{2,6}" value="<%=supplier.getEmailAddress() %>"/></td>
			</tr>
			<tr>
				<td>Address</td>
				<td><input type="text" name="address"
					value="<%=supplier.getAddress() %>" required/></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="text" name="password"
					value="<%=supplier.getPassword() %>" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required/></td>
			</tr>
			
		</table>
	</form>

	<table>
		<tr>
			<td colspan="2">
				<form method="POST" action="DeleteSupplierServlet">
					<input type="hidden" name="supplierID" value="<%=supplier.getSupplierID()%>" /> 
					<input type="submit" value="Delete Supplier" class="delete-button"/>
				</form>
			</td>
		</tr>
	</table>
	
</body>
</html>