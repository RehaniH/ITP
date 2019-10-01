<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.nlhs.model.Orders" %>
<%@ page import="com.nlhs.model.OrderDetails" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Receipt </title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" >
<script src="bootstrap/js/bootstrap.min.js" ></script>
<script src="bootstrap/js/jquery-3.3.1.slim.min.js" ></script>
<script src="bootstrap/js/popper.min.js" ></script>
</head>
<body>

<div class="jumbotron" >
		<div class="container">
			<h1 class="display-4" >
				Receipt
			</h1>
		</div>
	</div>
	<div class="container">	

<%
	
	if(request.getAttribute("Details") != null){
		
		ArrayList<OrderDetails> orderDetails = (ArrayList)request.getAttribute("Details");
			
		for(OrderDetails details : orderDetails){
			
			
			 %>
			 
			 
				<div class="row">
					<div class="col-md-8">
						
							<label>Order ID : </label>
							<%=details.getOrderId() %>
						
					</div>
					<div class="col-md-4">
						
							<label>Order Date : </label>
							<%=details.getOrderDate() %>
						
					</div>
				</div>
				<hr/>
				
				<form>
						<div class="row">
							
								<div class="form-group col-md-2" >
									<label>Item ID :</label>
									
								</div>
								
					
								<div class="form-group col-md-3">
									<label>Product Name</label>
									
					
								</div>
					
								<div class="form-group col-md-2">
									<label>Quantity</label>
									
								</div>
								
								<div class="form-group col-md-2">
									<label>Unit Price</label>
									
								</div>
					
								<div class="form-group col-md-3">
									<label>Value</label>
									
								</div>
					
						</div>
				
				</form>
				
			<%
			
			
		

			if(request.getAttribute("Reciept") != null){
				
				ArrayList<Orders> orders = (ArrayList)request.getAttribute("Reciept");
				
				
		%>
		
			
					
					<%
					
						for(Orders or : orders){
							
							
							%>
							
							
					
					<form>
						<div class="row">
							
								<div class="form-group col-md-2" >
									
									<input type="text"  class="form-control" value="<%=or.getItemId() %>" readOnly>
								</div>
								
					
								<div class="form-group col-md-3">
									
									<input type="text"  class="form-control"  value="<%=or.getpName() %>" readOnly>
					
								</div>
					
								<div class="form-group col-md-2">
									
									<input type="number"  class="form-control"  value="<%=or.getQuantity() %>" readOnly>
								</div>
								
								<div class="form-group col-md-2">
									
									<input type="number"  class="form-control" value="<%=or.getUnitPrice() %>" readOnly>
								</div>
					
								<div class="form-group col-md-3">
									

									<input type="number"  class="form-control" value="<%=or.getpValue() %>" readOnly>
								</div>
					
						</div>
				
				
		
		
			
		<%
						}
				}
			
			
			%>
			
					<hr/>
				</form>
				<div class="row">
					<div class="col-md-7">
						
					</div>
					<div class="col-md-2">
						
							<label>Total : </label>
					</div>
					<div class="col-md-2">
						<div class="float-right">		
							<%=details.getAmount()%>
						</div>
					</div>
				</div>	
				
				<div class="row">
					<div class="col-md-7"></div>
					<div class="col-md-2">
						
							<label>Delivery Charges : </label>
								
						
					</div>
					
					<div class="col-md-2">
						<div class="float-right">
							<%=details.getDeliveryCharges()%>
						</div>	
					</div>
				</div>
				
				<div class="row">	
					<div class="col-md-7"></div>
					<div class="col-md-2">
						
							<label>Grand Total : </label>
							
						
					</div>
					<div class="col-md-2">
						<div class="float-right">
							<%=details.getGrandTotal() %>
						</div>	
					</div>
				</div>
				
				
			</div>
			
			
			
			
			<%
			
				
		}
		
	}
%>

</body>
</html>