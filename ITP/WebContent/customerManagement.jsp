<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.nlhs.model.CustomerAddress" %>
<%@page import="com.nlhs.model.Deactivated" %>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Customer Management</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" >
<link rel="stylesheet" href="bootstrap/sidenav.css" >
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="bootstrap/js/bootstrap.min.js" ></script>
<script src="bootstrap/js/jquery-3.3.1.slim.min.js" ></script>
<script src="bootstrap/js/popper.min.js" ></script>
<style type="text/css">

.search-container button:hover {
  background: #ccc;
}




.search-container button {
 
  padding: 6px 10px;
  margin-top: 8px;
  margin-right: 16px;
  background: #ddd;
  font-size: 17px;
  border: none;
  cursor: pointer;
}


   input[type=text] {
    border: 1px solid #ccc;  
  }
  
  
</style>

</head>
<body>

	<div class="sidenav">
		  <a href="#about">About</a>
		  <a href="#services">Services</a>
		  <a href="#clients">Clients</a>
		  <a href="#contact">Contact</a>
	</div>

	<div class="main">
	<div class="jumbotron" >
		<div class="container">
			<h2 class="display-4" >
				Customer Management
			</h2>
		</div>
	</div>
	<% String number = "0";
		
		if(request.getAttribute("Number") != null){
			number = (String)request.getAttribute("Number");
			
		}
	%>
	
	<div class="container" style="margin-bottom:100px;">
		
		<div class="form-group">
			<label>Number of registered Customers : </label>
			<%=number %>
		</div>
		
		<label>Search By :</label>
		
		<form action="CustomerSearchServlet" method="post">
		<div class="row">
			<div class="form-group col-md-4">
			
				<label for="">District :</label>
				<input list="district" name="district" class="form-control">
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
				<label for="">Customer :</label>
				<select name="cType" class="form-control">
					<option value="all">All</option>
					<option value="best">Best</option>
					<option value="deactivated">Deactivated</option>
				</select>
			</div>
			
			<input type="hidden" name="num" value="<%=number %>">
			
			
				<div class="form-group col-md-4">
					<label for="">Name :</label>
					<input name="search" type="text" class="form-control" placeholder="Search..." />
					<button type="submit"><i class="fa fa-search"></i></button>
				</div>
				
				
				
			
		
		</div><!-- End of first row -->
		
		<div class="row">
			<div class="form-group col-md-4">
				<label for=""></label>
				<button type="submit" class="btn btn-info">
	      		<span class="glyphicon glyphicon-search"></span> Search
	   			</button>
			</div>
		</div>
		
		</form>
		

      
      
	</div>
	
	
	
	<% 
		
		
		
	
	%>
	
	
	<div class="container" style="margin-bottom:30px;">
		<table class="table table-striped table-bordered">
			<%
			ArrayList<CustomerAddress> list = new ArrayList<>();
			if(request.getAttribute("list") != null){
				list = (ArrayList)request.getAttribute("list");
			
			
			
			if(!list.isEmpty()){
				
				out.print("<thead>");
					out.print("<tr>");
						out.print("<th>" + "Customer ID"+ "</th>");
						out.print("<th>" + "Email"+ "</th>");
						out.print("<th>" + "First Name"+ "</th>");
						out.print("<th>" + "Last Name"+ "</th>");
					out.print("</tr>");
				out.print("</thead>");
				
				for(CustomerAddress ad: list){
					out.print("<tbody>");
					out.print("<tr>");
						out.print("<td>" + ad.getCustomerId()+ "</td>");
						out.print("<td>" + ad.getEmail()+ "</td>");
						out.print("<td>" + ad.getFname()+ "</td>");
						out.print("<td>" + ad.getLname() + "</td>");
					out.print("</tr>");
					out.print("</tbody>");
				}
				
				
				}
		
		}else if(request.getAttribute("deactive")!= null){
			Deactivated cus = new Deactivated();
			ArrayList<Deactivated> dlist= new ArrayList<>();
			dlist =(ArrayList)request.getAttribute("deactive");
			String reason;
			out.print("<thead>");
			out.print("<tr>");
				
				out.print("<th>" + "Email"+ "</th>");
				out.print("<th>" + "Reason for Leaving"+ "</th>");
			out.print("</tr>");
		out.print("</thead>");
		
		for(Deactivated ad: dlist){
			out.print("<tbody>");
			out.print("<tr>");
				out.print("<td>" + ad.getEmail()+ "</td>");
				
				reason = ad.getReason();
				if(reason.equalsIgnoreCase("fProducts"))
					reason = "Faulty Products";
				else if(reason.equalsIgnoreCase("dislike"))
					reason = "Dislike the online store";
				else if(reason.equalsIgnoreCase("usability"))
					reason = "No future use";
				else if(reason.equalsIgnoreCase("site"))
					reason = "Poor User Experience";
				else if(reason.equalsIgnoreCase("shipments"))
					reason = "Problems in shipments";
				else 
					reason = "Not mentioned";
			out.print("<td>" + reason+ "</td>");	
			out.print("</tr>");
			out.print("</tbody>");
		}
		
		
		
		
			%>
			
		
		
		</table>
	</div>
	<div class="container" style="margin-bottom:30px; ">
	<% out.print("<h5>" + "Statistics" + "</h5>"); %>
	<table class="table table-bordered">
	<%
	
		ArrayList<Deactivated> reasons = new ArrayList<>();
	
		if(request.getAttribute("Reason") != null){
			reasons = (ArrayList)request.getAttribute("Reason");
			
			out.print("<thead>");
			out.print("<tr>");
				
				out.print("<th>" + "Reasons"+ "</th>");
				out.print("<th>" + "No of customers"+ "</th>");
			out.print("</tr>");
		out.print("</thead>");
		
		for(Deactivated num: reasons){
			out.print("<tbody>");
			out.print("<tr>");
				
				
				reason = num.getReason();
				if(reason.equalsIgnoreCase("fProducts"))
					reason = "Faulty Products";
				else if(reason.equalsIgnoreCase("dislike"))
					reason = "Dislike the online store";
				else if(reason.equalsIgnoreCase("usability"))
					reason = "No future use";
				else if(reason.equalsIgnoreCase("site"))
					reason = "Poor User Experience";
				else if(reason.equalsIgnoreCase("shipments"))
					reason = "Problems in shipments";
				
			out.print("<td>" + reason+ "</td>");	
			out.print("<td>" + num.getEmail() + "</td>");
			out.print("</tr>");
			out.print("</tbody>");
		}
		
		
		
		
		}//end second if
	
		}else if(request.getAttribute("foundResult") != null){
			list = (ArrayList)request.getAttribute("foundResult");
			
			
			
			if(!list.isEmpty()){
				
				out.print("<thead>");
					out.print("<tr>");
						out.print("<th>" + "Customer ID"+ "</th>");
						out.print("<th>" + "Email"+ "</th>");
						out.print("<th>" + "First Name"+ "</th>");
						out.print("<th>" + "Last Name"+ "</th>");
						out.print("<th>" + "Address "+ "</th>");
						out.print("<th>" + "Postal Code"+ "</th>");
						out.print("<th>" + "Telephone"+ "</th>");
						
					out.print("</tr>");
				out.print("</thead>");
				
				for(CustomerAddress ad: list){
					out.print("<tbody>");
					out.print("<tr>");
						out.print("<td>" + ad.getCustomerId()+ "</td>");
						out.print("<td>" + ad.getEmail()+ "</td>");
						out.print("<td>" + ad.getFname()+ "</td>");
						out.print("<td>" + ad.getLname() + "</td>");
						out.print("<td>" + ad.getNo() + ", " + ad.getStreet()+ ", " + ad.getCity() + ", "
						+ "</td>");
						out.print("<td>" + ad.getPostalCode()+ "</td>");
						out.print("<td>" + ad.getTelephone() + "</td>");
					out.print("</tr>");
					out.print("</tbody>");
				}
				
				
				}
		
			
			
		}else{
			out.print("No results found.");
		
		}
	%>
	
	</table>
	</div>
	</div>

</body>
</html>