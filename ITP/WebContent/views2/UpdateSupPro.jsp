<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="com.nlhs.service.SupProService" %>
    <%@ page import="com.nlhs.service.SupProServiceImpl" %>
    <%@ page import="java.util.ArrayList"%>
    <%@ page import="com.nlhs.model.SupPro" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

						<meta name="viewport" content="width=device-width, initial-scale=1">
  		                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  		                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 		                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
 		                
 		                 <style> 
						input[type=text] {
 			 			width: 100%;
		     			padding: 12px 20px;
             			margin: 8px 0;
  			 			box-sizing: border-box;
             			border: none;
             			background-color: #3CBC8D;
            			color: white;
           				 }
           				 
           				 div.three {
  							border-style:solid;
  							border-color: red green blue yellow;
  							margin-bottom: 50px;
  							border-width: 30px 30px 30px 30px;
								} 
           				</style>
 		    
 		  

<title>Insert title here</title>
</head>
<body>

					<%
					//SupPro supPro = (SupPro) request.getAttribute("supPro");
	%> 
	
		<%!
		 SupPro supPro;
	%>
	<% 
	supPro= (SupPro)request.getAttribute("SupPro");
	%>
			<div  class="three">
			<div  align="center"  class="container" >

			<form method="post" action="UpdateSupProServlet" >
		<table>
			<tr>
				<td><label for="supProId" >Supplied Product Id</label></td>
				<td><input type="text" name="supProId" disabled="disabled"  style="margin-left: 10px;" 
				value="<%=supPro.getSupProId() %>" /></td>
			</tr>
			<tr>
				<td><label for="sid" >Supplier ID</label></td>
				<td><input type="text" name="sid" style="margin-left: 10px;"
					value="<%=supPro.getSid() %>" /></td>
			</tr>
			<tr>
				<td><label for="sname" >Supplier Name</label></td>
				<td><input type="text" name="sname" style="margin-left: 10px;"
					value="<%=supPro.getSname()%>" /></td>
			</tr>
			<tr>
				<td><label for="phone">Contact Number</label></td>
				<td><input type="text" name="phone" style="margin-left: 10px;"
					value="<%=supPro.getPhone()  %>" /></td>
			</tr>
			<tr>
				<td><label for="company">Company</label></td>
				<td><input type="text" name="company"  style="margin-left: 10px;"
					value="<%=supPro.getCompany() %>" /></td>
			</tr>
			<tr>
				<td><label for="type">Product Type</label></td>
				<td><input type="text" name="type"  style="margin-left: 10px;"
					value="<%=supPro.getType() %>" /></td>
			</tr>
			<tr>
				<td><label for="product">Product</label></td>
				<td><input type="text" name="product"  style="margin-left: 10px;"
					value="<%=supPro.getProduct() %>" /></td>
			</tr>
			<tr>
				<td><label for="quantity">Quantity</label></td>
				<td><input type="text" name="quantity"  style="margin-left: 10px;"
					value="<%=supPro.getQuantity() %>" /></td>
			</tr>
			<tr>
				<td><label for="totalPri">Total Price</label></td>
				<td><input type="text" name="totalPri"  style="margin-left: 10px;"
					value="<%=supPro.getTotalPri() %>" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="hidden" name="supProId"
					value="<%=supPro.getSupProId() %>" />
				 <input type="submit" value="Update supplied product" name="update-button" class="btn btn-success" style = "margin-left: 10px; margin-top: 50px;" /></td>
			</tr>
		</table>
	</form>
					
	<table>
		<tr>
			<td colspan="2">
				<form method="post" action="DeleteSupProServlet" >
					<input type="hidden" name="supProId" value="<%=supPro.getSupProId()%>"  style="margin-bottom:-20px;"/>
					 <input type="submit" value="Delete supplied product" name="delete-button"  class="btn btn-warning" style = "margin-left: 100px; margin-top: -55px;"/>
				</form>
						
				
			</td>
		</tr>
	</table>
	
				
					
				</div>
				</div>
				<br><br><br>


</body>
</html>