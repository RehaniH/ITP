<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<%  %>
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
<form  enctype="multipart/form-data" action="./AddItemServlet " name="frm" onsubmit="return validateForm() " method="POST"  autocomplete="on">
  <div class="container">
    <h1>Insert New Product</h1>
    <p>Please fill item details.</p>
    <hr>
    
	<br>
    <label for="email"><b>Product ID</b></label><br>
    <input type="text" placeholder="Enter Product ID" name="product_id" required="required" ><br>

    <label for="email"><b>Product Name</b></label><br><br>
    <input type="text" placeholder="Enter product name" name="product_name" required="required" ><br>

    <label><b>Product Image</b></label><br>
    <input type = "file" name = "product_image" size = "50" required="required" />
     <hr>
     <br>
    <label for="email"><b>Product Category</b></label><br>
   <input type="radio" name="product_category" value="Paints And Brushes" required="required" > Paints And Brushes<br>
   <input type="radio" name="product_category" value="Electrical" required="required"> Electrical<br>
   <input type="radio" name="product_category" value="Plumbing"required="required" >Plumbing
    <hr>
	<br>
    <label for="email"><b>Supplier Name</b></label><br><br>
    <input type="text" placeholder="Enter Supplier Name" name="supplier_name"  required="required">
    
    <br>
    <label for="email"><b>Supplier Contact</b></label><br>
    <input type="text" placeholder="Enter Supplier Contact" name="supplier_contact" required="required" >
    <br>
    <label for="email"><b>Unit size</b></label><br>
    <input type="text" placeholder="Unit Size" name="product_unitSize" required="required" >
     <br>
    <label for="email"><b>Cost price</b></label><br>
    <input type="text" placeholder="Enter Cost price" name="cost_price"  required="required">
    
    <br>
    <label for="email"><b>Selling price</b></label><br>
    <input type="text" placeholder="Enter Selling price" name="selling_price" required="required" >
     
    <br>
    <label for="email"><b>Buffer Stock</b></label><br>
    <input type="text" placeholder="Enter Buffer Stock" name="buffer_stock" required="required" >
    
    <br>
    <label for="email"><b>Item Description</b></label><br>
    <input type="text" placeholder="Enter Item Description" name="product_desc" required="required" >
    <br>
    
    
   
	<input type="submit" class="registerbtn" value="Add Item" >
	 </div>
	</form>
	</div>
	</div>


 
		
					
						
				<div class="action">
										
			
				
				
				
				</div>
				</div>
</body>



</html>