<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.nlhs.service.AdminServiceImp"%>
<%@page import="com.nlhs.model.Admin"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<link rel="stylesheet" href="css/addnewItem.css">
<link href="bootstrap/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="bootstrap/js/bootstrap.min.js"></script>
	<link href="css/ProductDetailsPage.css" rel="stylesheet" id="bootstrap-css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="bootstrap/font-awesome.min.css" rel="stylesheet">
    <link href="bootstrap/ProductDetailsFonts.css" rel="stylesheet">

<title>Add New Product</title>
<script type="text/javascript" src="js/insertItem.js"></script>


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
	<nav class="navbar navbar-inverse visible-xs">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Logo</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">Dashboard</a></li>
					
					
					<li><a href="AdminProfileView.jsp">Profile</a></li>
					<li><a href="#">Customer</a></li>
					<li><a href="#">Supplier</a></li>
					<li><a href="#">Sales</a></li>
					<li><a href="#">Delivery Staff</a></li>
					<li><a href="#">Chat</a></li>
					<li><form action="./LogoutServlet" method="post"><input type="submit" value="logout"></form></li>
				</ul>
			</div>
		</div>
	</nav>
		<div class="container-fluid">
		<div class="row content">
			<div class="col-sm-3 sidenav hidden-xs">
				<h2>NLHS ADMIN</h2>
				<ul class="nav nav-pills nav-stacked">
					<li class="active"><a href="AdminDashboard.jsp">Dashboard</a></li>
					
					<li><a href="AdminProfileView.jsp">Profile</a></li>
					<li><a href="#">Customer</a></li>
					<li><a href="#">Supplier</a></li>
					<li><a href="#">Sales</a></li>
					<li><a href="#">Delivery Staff</a></li>
					<li><a href="#">Chat</a></li>
					<li><form><input type="submit" value="logout"></form></li>
				</ul>
				<br>
			</div>
			<br>
		${requestScope.message}	
		<div class="col-sm-9">
				<div class="well">
<form  action="./UpdateStocksServlet" name="Ustockfrm" onsubmit="return validateUpdateStockForm()" method="POST"  autocomplete="on">
  <div class="container">
    <h1>Update Stocks </h1>
    <p>Enter new Stocks</p>
    <hr>
    
	<br>
	

    <input type="hidden" placeholder="Enter admin ID" value="<%=admin.getAid()   %>" name="st_aid"  required="required" >
   

	
	
    <label for="email"><b>Product ID</b></label><br>
    <input type="text" placeholder="Enter product ID" name="st_pid" required="required" >
    <br>
    <label for="email"><b>Product Name</b></label><br>
    <input type="text" placeholder="Enter product name"   name="st_pname"  ><br>
    
    <label for="email"><b>Supplier ID</b></label><br>
    <input type="text" placeholder="Enter admin ID"  name="st_sid"  required="required" ><br>

     <br>
   
    <label for="email"><b>New Stock</b></label><br>
    <input type="text" placeholder="Enter stocks"  name="st_stock"  ><br>
    
    
    

    
    <br>

    
    
    
   
	<button type="submit" class="registerbtn">Update Item</button>
	 </div>
	</form>
	</div>
	</div>


 
		
					
						
				<div class="action">
										
			
				
				
				
				</div>
				</div>
</body>



</html>