<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ page import="com.nlhs.service.SupProService" %>
    <%@ page import="com.nlhs.service.SupProServiceImpl" %>
    <%@ page import="java.util.ArrayList"%>
    <%@ page import="com.nlhs.model.SupPro" %>
    <%@ page import="com.nlhs.servlet.GetSupProServlet" %>
    
    					
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

								<meta name="viewport" content="width=device-width, initial-scale=1">
  						        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  						        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 		 				        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
			<style>
			body {
  			background-color: lightGray;
				}
				
				h1 {
 		 		font-size: 40px;
 		 	    font-color: blue;
 		 	    font-style: normal;
 		 	    
					}
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
		
		 <form action="views2/SearchSupPro.jsp"   method="post" class="serch">
						  Search  Here <input type="search" class="sbox" name="id">
						  <input type="submit" class="sbtn" name="submit" value="submit">
						</form>
  		<br>
  		<a href="Sup_Pro_Report.jsp" style="margin-left: 40%;"><button>Generate Report</button></a>
		
		
		<h1>SUPPLIER   PROFILE</h1><br><br>
			<div align="center">
			<div class="container">
	 		<div class="table-responsive">

				<table class="table">
				<thead>
				
                <tr>
                 <th>Supplied Product ID</th>
                <th>Supplier ID</th>
                <th>Supplier Name</th>
                <th>Contact Number</th>
                <th>Company</th>
                <th>Product Type</th>
                <th>Product</th>
                <th>Quantity</th>
                <th>Total Price</th>
                </tr>
                </thead>
                 <tbody>
                <%
                SupProService supProServices = new SupProServiceImpl();
				ArrayList<SupPro> arrayList = supProServices.getSupPro();
			
			for(SupPro supPro : arrayList){
			%>
			 <tr>
				<td> <%=supPro.getSupProId() %> </td>
				<td> <%=supPro.getSid() %> </td>
				<td> <%=supPro.getSname() %> </td>
				<td> <%=supPro.getPhone() %> </td>
				<td> <%=supPro.getCompany() %> </td>
				<td> <%=supPro.getType() %> </td>
				<td> <%=supPro.getProduct() %> </td>
				<td> <%=supPro.getQuantity() %> </td>	
				<td> <%=supPro.getTotalPri() %> </td>		
				<td>
				<form method="post" action="GetSupProServlet">
				<input type="hidden" name="supProId" value="<%=supPro.getSupProId()%>"/>
				 <input type="submit" value= "Select suppied Product" name="select-button"  class="btn btn-info"/>
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