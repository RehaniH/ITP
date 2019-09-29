<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.nlhs.service.OfferService" %>
    <%@ page import="com.nlhs.service.OfferServiceImpl" %>
    <%@ page import="java.util.ArrayList"%>
    <%@ page import="com.nlhs.model.offer" %>
    <%@ page import="com.nlhs.servlet.GetOfferServlet" %>
<!DOCTYPE html>
<html>
<head>
		
		<meta name="viewport" content="width=device-width, initial-scale=1">
  		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 		 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

		<meta charset="utf-8">
  	<!--<meta name="viewport" content="width=device-width, initial-scale=1">
  		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 	    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>	  -->	
        <meta charset="ISO-8859-1">
        
        
<title>New Lanka Hardware store</title>
</head>
<body>
	<div align="center">
	<div class="container">
	 <div class="table-responsive">
			<table  class="table">
			<thead>
                <tr>
                 <th>Offer ID</th>
                <th>Supplier ID</th>
                <th>Start Date</th>
                <th>Expiration Date</th>
                <th>Company</th>
                <th>Product</th>
                <th>Description</th>
                
                </tr>
                 </thead>
                 <tbody>
                <%
            OfferService offerServices = new OfferServiceImpl();
			ArrayList<offer> arrayList = offerServices.getOffers();
			
			for(offer off : arrayList){
			%>
			 <tr>
				<td> <%=off.getOfferId() %> </td>
				<td> <%=off.getSupId() %> </td>
				<td> <%=off.getStart() %> </td>
				<td> <%=off.getExpire() %> </td>
				<td> <%=off.getCompany() %> </td>
				<td> <%=off.getProduct() %> </td>
				<td> <%=off.getDescription() %> </td>	
				<td>
				<form method="POST" action="GetOfferServlet">
				<input type="hidden" name="offerId" value="<%=off.getOfferId()%>"/>
			<!--  <div class="container">-->	
				 <input type="submit" value= "Select Offer" name="select-button" class="btn btn-warning"/>
			    
				 </form>
				 </td>	
				</tr>			
				<%	
			   }
            %>
			
			</tbody>
			
              </table>
			</div>
	 </div>
	</div>

</body>
</html>