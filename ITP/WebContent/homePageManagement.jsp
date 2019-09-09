<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link href="bootstrap/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="bootstrap/js/bootstrap.min.js"></script>
	<link href="css/ProductDetailsPage.css" rel="stylesheet" id="bootstrap-css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="bootstrap/font-awesome.min.css" rel="stylesheet">
    <link href="bootstrap/ProductDetailsFonts.css" rel="stylesheet">

<meta charset="ISO-8859-1">
<title>Home Page Management</title>
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
		
			<div class="col-sm-9">
				<div class="well">
				<form action="./HomePageManagementServlet" method="POST" autocomplete="on">
				
				<b>Enter 6 Product IDs to be displayed in the Home Page</b>
				<br>
				<b>Enter product 1 </b>
				<input type="text"  name="product_id1" required="required">
				<br>
				<b>Enter product 2 </b>
				<input type="text"  name="product_id2" required="required">
				<br>
				<b>Enter product 3 </b>
				<input type="text"  name="product_id3" required="required">
				<br>
				<b>Enter product 4 </b>
				<input type="text"  name="product_id4" required="required">
				<br>
				<b>Enter product 5 </b>
				<input type="text"  name="product_id5" required="required">
				<br>
				<b>Enter product 6 </b>
				<input type="text"  name="product_id6" required="required">
				<br>
				
				
			
				<input class="add-to-cart btn btn-default" type="submit" value="Create Home Page"  >
				</form>
						
						</div>
					
						
				<div class="action">
							
			
				
				
				
				</div>
				</div>
</body>
</html>