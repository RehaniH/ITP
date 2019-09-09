<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.nlhs.service.AdminServiceImp"%>
<%@page import="com.nlhs.model.Admin"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/addnewItem.css">
<meta charset="ISO-8859-1">
<title>Edit Admin Profile</title>
<script type="text/javascript" src="js/updateStock.js"></script>
</head>
<body>
  <%Admin admin = new Admin(); %>
  <%if(session.getAttribute("UserID") == null){
	  request.getRequestDispatcher("index.jsp").include(request, response);  
  }else{
	  String id = (String)session.getAttribute("UserID");
	  AdminServiceImp asi = new AdminServiceImp();
	  
	  
	  admin = asi.getAdmin(id);
	 
	  
  } %>
<form  action="./UpdateStocksServlet" name="Ustockfrm" onsubmit="return validateUpdateStockForm()" method="POST"  autocomplete="on">
  <div class="container">
    <h1>Update Stocks </h1>
    <p>Enter new Stocks</p>
    <hr>
    
	<br>
	

    <input type="hidden" placeholder="Enter admin ID" value="<%=admin.getAid()   %>" name="st_aid"  required="required" >
   

	
	
    <label for="email"><b>Product ID</b></label>
    <input type="text" placeholder="Enter product ID" name="st_pid" required="required" >
    
    <label for="email"><b>Product Name</b></label>
    <input type="text" placeholder="Enter product name"   name="st_pname"  >
    
    <label for="email"><b>Supplier ID</b></label>
    <input type="text" placeholder="Enter admin ID"  name="st_sid"  required="required" >

     <br>
   
    <label for="email"><b>New Stock</b></label>
    <input type="text" placeholder="Enter stocks"  name="st_stock"  >
    
    
    

    
    <br>

    
    
    
   
	<button type="submit" class="registerbtn">Update Item</button>
	 </div>
	</form>
</body>
</html>