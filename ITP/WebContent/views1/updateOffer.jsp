<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "com.nlhs.model.offer" %>
  
    
<!DOCTYPE html>
<html>
<head>

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
  							border-color: green green green green;
  							margin-bottom: 100px;
  							border-width: 30px 30px 30px 30px;
								} 
           				</style>
 		    
 		   
 		    
<meta charset="ISO-8859-1">
<title>New Lanka Hardware Store</title>
</head>
<body>
		<%
		//offer o = (offer) request.getAttribute("offer");
	%>
	<%!
	offer o;
	%>
	<% 
	o= (offer)request.getAttribute("offer");
	%>
			<div  class="three">
			<div  align="center"  class="container"   >
			
			<form method="POST" action="UpdateOfferServlet" class="h,center">
		<table>
			<tr>
				<td><label for="offerId">Offer ID</label></td>
				<td><input type="text" name="offerId" disabled="disabled" style="margin-left: 10px;"
					value="<%=o.getOfferId()  %>" /></td>
			</tr>
			<tr>
				<td><label for="supId">Supplier ID</label></td>
				<td><input type="text" name="supId" style="margin-left: 10px;"
					value="<%=o.getSupId()   %>" /></td>
			</tr>
			<tr>
				<td><label for="sdate">Start Date</label></td>
				<td><input type="text" name="start"  style="margin-left: 10px;"
					value="<%=o.getStart()    %>" /></td>
			</tr>
			<tr>
				<td><label for="expire">Expiration Date</label></td>
				<td><input type="text" name="expire" style="margin-left: 10px;"
				value="<%=o.getExpire()%>" /> </td>
			</tr>
			<tr>
				<td><label for="company">Company</label></td>
				<td><input type="text" name="company"   style="margin-left: 10px;"
				 value="<%=o.getCompany()%>" /></td>
			</tr>
			<tr>
				<td><label for="product">Product</label></td>
				<td><input type="text" name="product"  style="margin-left: 10px;"
					value="<%=o.getProduct()  %>" /></td>
			</tr>
			<tr>
				<td><label for="discount">Discount</label></td>
				<td><input type="text" name="discount"  style="margin-left: 10px;"
					value="<%=o.getDiscount()  %>" /></td>
			</tr>
			<tr>
				<td><label for="description">Description</label></td>
				<td><input type="text" name="description"  style="margin-left: 10px; "
					value="<%=o.getDescription()  %>" /></td>
			</tr>
					
			<tr>
				<td colspan="2"><input type="hidden" name="offerId"
					value="<%=o.getOfferId() %>" /> <input type="submit"
					value="Update offer" name="update-button" class="btn btn-primary" id="up"  style = "margin-left: 30px; margin-top: -5px; margin-bottom:-20px" /></td>
			</tr>
		</table>
		
			
	</form>
		
			
	<table>
		<tr>
			<td colspan="2">
				<form method="POST" action="DeleteOfferServlet" >
					<input type="hidden" name="offerId"	value="<%=o.getOfferId()%>" style="margin-bottom:-20px;"/> 
					<div align="center">
					<input type="submit" value="Delete offer" name="delete-button" class="btn btn-danger"  style = "margin-left: 150px; margin-top: -45px; margin-bottom:-20px " />
					</div>
				</form>
				
					
			</td>
		</tr>
	</table>
			</div>
				</div>
				<br><br><br>



</body>
</html>