<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.nlhs.model.CustomerAddress" %>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Customer Addresses</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" >
<script src="bootstrap/js/bootstrap.min.js" ></script>
<script src="bootstrap/js/jquery-3.3.1.slim.min.js" ></script>
<script src="bootstrap/js/popper.min.js" ></script>
<script>

document.getElementById("add").addEventListener("click", getAddress);

function getAddress(){
	
	var value1 = document.getElementById("fname1").value;
	document.getElementById("fname2").innerHTML = value1;
}


</script>
</head>
<body>

   <div class="jumbotron" >
		<div class="container">
			<h2 class="display-4" >
				My Addresses
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
	
	</div>
	
	
	
	
<!-- #FFFACD Use if needed -->
<div class="container" style="background-color:#ccffcc; padding:20px; margin-bottom: 100px;">
<form action="AddressServlet" method="post" onsubmit="return validateForm()">
	<h4>Billing Address</h4>
	
		
	<div class="row">	
	<div class="form-group col-md-3">
		<label for="sStatus">Social Status:</label>

		<select name="socialStatus" class="form-control" id="sStatus">
			<option>Mr.</option>
			<option>Mrs.</option>
			<option>Ms.</option>
		</select>
	</div>
	
	<div class="form-group col-md-4">
		<label for="">First name:</label>
		<input name="fname" id="fname1" class="form-control" pattern="[A-Za-z]{3,15}" required>
	</div>	
	
	<div class="form-group col-md-5">
		<label for="">Last name:</label>
		<input name="lname" class="form-control" pattern="[A-Za-z]{3,15}" required>
	</div>
	
	</div>
	
	<div class="row">	
	<div class="form-group col-md-4">
		<label for="">Address Line 1:</label>
		<input name="no" class="form-control" required>
	</div>
	
	<div class="form-group col-md-4">
		<label for="">Address  Line 2:</label>
		<input name="street" class="form-control" required>
	</div>
	
	
	
	<div class="form-group col-md-4">	
		<label for="">City:</label>
		<input name="city" class="form-control" required>
	</div>	
	
	</div>	
	
	<div class="row">
	<div class="form-group col-md-4">
		<label for="">District:</label>
		<input list="district" name="district" class="form-control" required>
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
			<input type="number" name="postalCode" class="form-control" pattern="[0-9]{5}" maxlength=5 required/>
			
		</div>
	
		<div class="form-group col-md-4">
			<label for="">Telephone Number:</label>
			<input type="number" name="telephone" class="form-control" pattern="\d*" maxlength="10" required/>
		</div>
		
		</div>
		
		<input type="hidden" name="isBilling" value=true>
		<input type="hidden" name="isDelivery" value=false>

	
		<input type="checkbox" name="same" id="add">Use the same address for shipping

	
	<h4>Delivery Address</h4>
	
	<div class="row">
	<div class="form-group col-md-3">
		<label for="">Social Status:</label>
		<select name="dSocialStatus" class="form-control" required>
			<option>Mr.</option>
			<option>Mrs.</option>
			<option>Ms.</option>
		</select>
	</div>
	<div class="form-group col-md-4">	
		<label for="">First name:</label>
		<input name="dFname" id="fname2" class="form-control" pattern="[A-Za-z]{3,15}" required/>
	</div>
	
	<div class="form-group col-md-5">	
		<label for="">Last name:</label>
		<input name="dLname" class="form-control" pattern="[A-Za-z]{3,15}" required/>
	</div>
	</div>
	
	<div class="row">
	<div class="form-group col-md-4">
		<label for="">Address Line 1:</label>
		<input name="dNo" class="form-control" required/>
	</div>
		
	<div class="form-group col-md-4">
		<label for="">Address  Line 2:</label>
		<input name="dStreet" class="form-control" required/>
	</div>
		
	<div class="form-group col-md-4">
		<label for="">City:</label>
		<input name="dCity" class="form-control" required/>
	</div>	
	</div>	
	
	<div class="row">
	<div class="form-group col-md-4">	
		<label for="">District:</label>
		<input list="district" name="dDistrict" class="form-control" required/>
		<datalist id="ddistrict">
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
			<input type="number" name="dPostalCode" class="form-control"  pattern="[0-9]{5}" maxlength=5 required>
		</div>
		
		<div class="form-group col-md-4" >
			<label for="">Telephone Number:</label>
			<input type="number" name="dTelephone" class="form-control" pattern="\d*" maxlength="10"  required>
		</div>
		
		</div>
		
		
		<input type="hidden" name="dIsBilling" value=false >
		<input type="hidden" name="dIsDelivery" value=true>
		
		
		<div class="d-flex justify-content-end mb-3">
			<input type="submit" value="Save" name="customer" class="btn btn-success">
		</div>
		
	
</form>
</div>
	



</body>
</html>