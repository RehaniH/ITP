<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.nlhs.model.CustomerAddress" %>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head><!-- IT18176070: Perera P.R.H -->
<meta charset="ISO-8859-1">
<title>Saved Address</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" >
<script src="bootstrap/js/bootstrap.min.js" ></script>
<script src="bootstrap/js/jquery-3.3.1.slim.min.js" ></script>
<script src="bootstrap/js/popper.min.js" ></script>
</head>
<body>

		<div class="jumbotron" >
			<div class="container">
				<h2 class="display-4" >
					Saved Addresses
				</h2>
			</div>
		</div>

<% CustomerAddress bAddress = new CustomerAddress();
	CustomerAddress dAddress = new CustomerAddress();
	ArrayList<CustomerAddress> list = new ArrayList<>();

	if(request.getAttribute("Address") != null){
		list = (ArrayList)request.getAttribute("Address");
		
		if(!list.isEmpty()){
			
			for(CustomerAddress ad : list){
				boolean isBilling = ad.isBilling();
				boolean isDelivery = ad.isDelivery();
				
				if(isBilling)
					bAddress = ad;
				else
					if(isDelivery)
						dAddress = ad;
			}
			
		
	
	


 %>

<div class="container" style="margin-top:100px; ">
	<form action="DirectAddressServlet" method="post">
	
		<div class="row">
			<div class="col-md-6">
				<% out.println("<h4>Billing Address</h4>"); %>	
			</div>
			<div class="col-md-6">
				<% out.print("<h4>Delivery Address</h4>"); %>	
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-1">
				<% out.println(bAddress.getFname()); %>	
			</div>
			
			<div class="col-md-5">
				<% out.print(bAddress.getLname() + ","); %>	
			</div>
			
			<div class="col-md-1">
				<% out.print(dAddress.getFname()); %>	
			</div>
		
			<div class="col-md-5">
				<% out.print(dAddress.getLname() + ","); %>	
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-6">
				<% out.print(bAddress.getNo() + ", "); %>	
			</div>
			<div class="col-md-6">
				<% out.print(dAddress.getNo() + ", "); %>	
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-6">
				<% out.print(bAddress.getStreet() + ", "); %>	
			</div>
			<div class="col-md-6">
				<% out.print(dAddress.getStreet() + ", "); %>	
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-6">
				<% out.print(bAddress.getCity() + ", "); %>	
			</div>
			<div class="col-md-6">
				<% out.print(dAddress.getCity() + ", "); %>	
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-6">
				<% out.print(bAddress.getDistrict() ); %>	
			</div>
			<div class="col-md-6">
				<% out.print(dAddress.getDistrict() ); %>	
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-6">
				<% out.print(bAddress.getPostalCode()); %>	
			</div>
			<div class="col-md-6">
				<% out.print(dAddress.getPostalCode() ); %>	
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-6">
				<% out.print(bAddress.getTelephone()); %>	
			</div>
			<div class="col-md-6">
				<% out.print(dAddress.getTelephone() ); %>	
			</div>
		</div>
		
		<div class="row">
			<div class="col-md-6">
				<div class="d-flex justify-content-end mb-3">
					<% request.setAttribute("Billing", bAddress); %>
					<% out.print("<input type='submit' value='Edit' name='billing' class='btn btn-success'>"); %>	
				</div>
			</div>
			<div class="col-md-6">
				<div class="d-flex justify-content-end mb-3">
					<% request.setAttribute("Delivery", dAddress); %>
					<% out.print("<input type='submit' value='Edit' name='delivery' class='btn btn-success'>"); %>	
				</div>	
			</div>
		</div>
		
		
	
	
	<% 		}
		} %>
	</form>
	
	<form action="DirectServlet" method="post">
		 	<div >
				<input type="submit" value="Back" class="btn btn-info" style="left:50px;" />
			</div>
		</form>
</div>

</body>
</html>