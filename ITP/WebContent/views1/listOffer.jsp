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
        
 
        <style type="text/css">
        
        .sbox{
					border: 1px solid black;
					border-radius: 30px;
					background: transparent;
					color: black;
					padding:5px;
					padding-left: 10px;
					
					}
					.sbox{
					border: 1px solid black;
					border-radius: 30px;
					background: transparent;
					color: black;
					padding:5px;
					padding-left: 10px;
					
					}
					.sbtn{
					border: 1px solid white;
					border-radius: 30px;
					background:#48bd48;
					color: white;
					width:100px;
					padding:5px;
				
					}
					.serch{
					margin-left: 30%;
					margin-top: 50px;
					}
        </style>
        
<title>New Lanka Hardware store</title>
</head>
<body>

						  <form action="views1/SearchOffer.jsp" class="serch"  method="post">
						  Search  Here <input type="search" name="id" class="sbox">
						  <input type="submit" name="submit"  class="sbtn" value="submit">
						</form><br>
  
  						<a href="OfferReport.jsp" style="margin-left: 40%;"><button>Generate Report</button></a>


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
                <th>Discount</th>
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
				<td> <%=off.getDiscount() %> </td>
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