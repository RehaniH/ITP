<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.nlhs.model.CustomerAddress" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" >
<script src="bootstrap/js/bootstrap.min.js" ></script>
<script src="bootstrap/js/jquery-3.3.1.slim.min.js" ></script>
<script src="bootstrap/js/popper.min.js" ></script>
</head>
<body>

	<div class="jumbotron" >
		<div class="container">
			<h1 class="display-4" >
<%
	CustomerAddress address = new CustomerAddress();

	if(request.getAttribute("Billing") != null){
		 address = (CustomerAddress)request.getAttribute("Billing");
		 out.println("Billing Address");
	}else
		if(request.getAttribute("Delivery") != null){
			address = (CustomerAddress)request.getAttribute("Delivery");
			out.println("Delivery Address");
		}
   
%>
	
				
			</h1>
		</div>
	</div>
	<div class="container">
		<form action="UpdateCusAddressServlet" method="post">
			<div class="row">
				<div class="form-group col-md-3">
					<label for="">Social Status:</label>
					<select name="socialStatus" class="form-control">
						<option>Mr.</option>
						<option>Mrs.</option>
						<option>Ms.</option>
					</select>
				</div>
	
			<div class="form-group col-md-4">	
				<label for="">First name:</label>
				<input name="fname" class="form-control" value="<%=address.getFname() %>" pattern="[A-Za-z]{3,15}"/>
			</div>
	
			<div class="form-group col-md-5">	
				<label for="">Last name:</label>
				<input name="lname" class="form-control" value="<%=address.getLname() %>" pattern="[A-Za-z]{3,15}"/>
			</div>
		</div>
	
		<div class="row">
			<div class="form-group col-md-4">
				<label for="">Address Line 1:</label>
				<input name="no" class="form-control" value="<%=address.getNo() %>" >
			</div>
		
			<div class="form-group col-md-4">
				<label for="">Address  Line 2:</label>
				<input name="street" class="form-control" value="<%=address.getStreet() %>">
			</div>
		
			<div class="form-group col-md-4">
				<label for="">City:</label>
				<input name="city" class="form-control" value="<%=address.getCity() %>">
			</div>	
		</div>	
	
	<div class="row">
		<div class="form-group col-md-4">	
		<label for="">District:</label>
		<input list="district" name="district" class="form-control" value="<%=address.getDistrict() %>">
		<datalist id="district">
			<option value="Ampara">
			<option value="Anuradhapura">
			<option value="Badulla">
			<option value="Batticaloa">
			<option value="Colombo">	
			<option value="Galle">	
			<option value="Gampaha">	
			<option value="Hambantota">	
			<option value="Jaffna">	
			<option value="Kaluthara">	
			<option value="Kandy">	
			<option value="Kegalle">	
			<option value="Kilinochchi">	
			<option value="Kurunegala">	
			<option value="Mannar">	
			<option value="Mathale">	
			<option value="Mathara">	
			<option value="Monaragala">	
			<option value="Mulaithivu">	
			<option value="Nuwara Eliya">	
			<option value="Polonnaruwa">	
			<option value="Puttalum">	
			<option value="Ratnapura">	
			<option value="Trincomalee">	
			<option value="Vavuniya">	
		</datalist>
		</div>
		
		<div class="form-group col-md-4">
			<label for="">Postal Code:</label>
			<input name="postalCode" class="form-control" pattern="[0-9]{5}" value="<%=address.getPostalCode() %>">
		</div>
		
		<div class="form-group col-md-4" >
			<label for="">Telephone Number:</label>
			<input name="telephone" class="form-control" pattern="[0-9]{10}" value="<%=address.getTelephone() %>">
		</div>
		
		</div>
		
		
		<input type="hidden" name="isBilling" value=<%=address.isBilling() %> >
		<input type="hidden" name="isDelivery" value=<%=address.isDelivery() %>>
		
		
		<div class="d-flex justify-content-end mb-3">
			<input type="submit" value="Save" name="customer" class="btn btn-success">
		</div>
		
	
</form>
	
	
	
	</div>



</body>
</html>