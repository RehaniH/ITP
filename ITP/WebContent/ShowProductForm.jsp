<%@page import="java.util.HashSet"%>
<%@page import="com.nlhs.model.Item"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="css/addnewItem.css">
<title>Product Details</title>
</head>
<body>
 <center>
 <%if(request.getAttribute("message") != null){%>
		<h3><%=request.getAttribute("message")%></h3> 
  <%
  }  
  %>
  <%if(request.getAttribute("Deletemessage") != null){%>
		<h3><%=request.getAttribute("Deletemessage")%></h3> 
  <%
  }  
  %>
        
        
    </center>
<form  action="./FilterItemServlet" method="POST"  autocomplete="on">
  
  <div class="container">
    <h1> Product detail</h1>
    <p>Please fill item details to filter.</p>
    <hr>
	<br>

    <label for="email"><b>Product Name</b></label><br>
    <input class="mytext" type="text" placeholder="Enter product name" name="product_name" value="NS"  >
   
    <br><br>
    <br>
     <label for="email"><b>Product Category</b></label>
     <br>
     <select id = "p_category" name="p_category"   >
     			<option value = "NC">Not Filtered</option>
               <option value = "Electrical">Electrical</option>
               <option value = "Paints And Brushes">Paints And Brushes</option>
               <option value = "Plumbing">Plumbing</option>
           
      </select>
	<br><br><br>
     <label for="email"><b>Product cost price range</b></label><br>
    <input type="text" class="mytext" placeholder=" >=cost price" name="costPriceR" value=-99  >
   <br><br><br>
    <label for="email"><b>Product selling price range</b></label><br>
    <input class="mytext" type="text" placeholder=" >=selling price" name="sellingPriceR" value=-99  >
    <br><br><br>
    <label for="email"><b>Product  profit range</b></label><br>
    <input class="mytext" type="text" placeholder=" >=profit" name="profitR" value=1  >
    <br><br><br> 
	<button type="submit" class="registerbtn">Filter Item</button>
	</div>
	</form> 
  
	<div>
	<%
	if(session.getAttribute("ItemList")!=null){
		%>
		<h3>Item List</h3>
	
	<br>
	<br>
	  <div align="left">
		<table border="1" cellpadding="12">
		 <caption><h2>List of Items</h2></caption>
		
		  <tr>
                <th>Item ID</th>
                <th>Product Name</th>
                <th>Product Category</th>
                <th>Cost Price</th>
                <th>Selling Price</th>
                <th>View Product</th>
             
              
            </tr>
            
              <%
   					
					HashSet<Item> itemlist=(HashSet) session.getAttribute("ItemList");
					
			
			for(Item item : itemlist){
			%>
			 <tr>
			 	<td> <%=item.getPid()%> </td>
				<td> <%=item.getpName()%> </td>
				<td> <%=item.getCategory() %> </td>
				<td> <%=item.getCostPrice() %> </td>
				<td> <%=item.getSellingPrice() %> </td>
				<td> <form action="ProductDetails.jsp" method="POST">
				
				<input type="hidden"  name="product_id" value="<%= item.getPid()%>" >
				 <input type="hidden"  name="product_name" value="<%= item.getpName()%>" >
				<input type="hidden" name="pimage" value="<%= item.getpImage()%>">
				<input type="hidden" name="product_category" value="<%= item.getCategory()%>">
				<input type="hidden"  name="supplier_name" value="<%= item.getSupplierName()%>" >
				<input type="hidden"  name="supplier_contact" value="<%=item.getSupplierContact()%>">
				<input type="hidden"  name="product_unitSize" value="<%=item.getUnitSize() %>" >
				<input type="hidden"  name="cost_price" value="<%= item.getCostPrice()%>" >
				<input type="hidden"  name="selling_price" value="<%= item.getSellingPrice()%>" >
				<input type="hidden"  name="buffer_stock" value="<%= item.getBufferStock()%>">
				<input type="hidden"  name="product_desc" value="<%= item.getpDesc()%>" >
				
				
				<input type="submit" value="view product"  >
				
				</form>
				 </td>
				
				</tr>			
			<%	
			   }
            %>     
		</table>
		</div>
		
	<%
		
	}%>
	 
	</div>
 

<button style="color: white; text-decoration: none; padding: 15px ;32px text-align: center;" ><a href="inventoryManagement.jsp">Back</a></button>
</body>
</html>