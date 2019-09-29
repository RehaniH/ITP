
<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE html>
<html lang="en">
  <head>
    <link href="bootstrap/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="bootstrap/js/bootstrap.min.js"></script>
	<link href="css/ProductDetailsPage.css" rel="stylesheet" id="bootstrap-css">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title> Product Detail</title>
    <link href="bootstrap/font-awesome.min.css" rel="stylesheet">
    <link href="bootstrap/ProductDetailsFonts.css" rel="stylesheet">

  </head>

  <body>
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
					
					
					<li><a href="#">Profile</a></li>
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
					
					<li><a href="#">Profile</a></li>
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
	
							<div class="preview-pic tab-content">
						  <div class="tab-pane active" id="pic-1"><img src="productImages/<%=request.getParameter("pimage") %>" /></div>
						  <div class="tab-pane" id="pic-2"><img src="productImages/<%=request.getParameter("pimage") %>" /></div>
						  <div class="tab-pane" id="pic-3"><img src="productImages/<%=request.getParameter("pimage") %>" /></div>
						  <div class="tab-pane" id="pic-4"><img src="productImages/<%=request.getParameter("pimage") %>"/></div>
						  <div class="tab-pane" id="pic-5"><img src="productImages/<%=request.getParameter("pimage") %>" /></div>
						</div>
						<ul class="preview-thumbnail nav nav-tabs">
						  <li class="active"><a data-target="#pic-1" data-toggle="tab"><img src="productImages/<%=request.getParameter("pimage") %>" /></a></li>
						  <li><a data-target="#pic-2" data-toggle="tab"><img src="productImages/<%=request.getParameter("pimage") %>"/></a></li>
						  <li><a data-target="#pic-3" data-toggle="tab"><img src="productImages/<%=request.getParameter("pimage") %>" /></a></li>
						  <li><a data-target="#pic-4" data-toggle="tab"><img src="productImages/<%=request.getParameter("pimage") %>"/></a></li>
						  <li><a data-target="#pic-5" data-toggle="tab"><img src="productImages/<%=request.getParameter("pimage") %>" /></a></li>
						</ul>
						<h3 class="product-title"><%=request.getParameter("product_name") %></h3>
						<div class="rating">
							<div class="stars">
								<span class="fa fa-star checked"></span>
								<span class="fa fa-star checked"></span>
								<span class="fa fa-star checked"></span>
								<span class="fa fa-star"></span>
								<span class="fa fa-star"></span>
							</div>
							<span class="review-no"><strong><%=request.getParameter("product_id") %></strong></span>
						</div>
						<p class="product-description"></p>
						<h3>Product description</h3>
						<h4 class="price">Product Name: <span><%=request.getParameter("product_name") %></span></h4>
						<h4 class="price">Product ID: <span><%=request.getParameter("product_id") %></span></h4>
						<h4 class="price">Product Category: <span><%=request.getParameter("product_category") %></span></h4>
						<h4 class="price">Unit size: <span><%=request.getParameter("product_unitSize") %></span></h4>
						<h4 class="price">current cost price: <span><%=request.getParameter("cost_price") %></span></h4>
						<h4 class="price">current Selling price: <span><%=request.getParameter("selling_price") %></span></h4>
						<h4 class="price">Buffer Stock to be maintained: <span><%=request.getParameter("buffer_stock") %></span></h4>
						<h3>Supplier description</h3>
						<h4 class="price">Supplier Name: <span><%=request.getParameter("supplier_name" ) %></span></h4>
						<h4 class="price">Supplier Contact Number: <span><%=request.getParameter("supplier_contact" ) %></span></h4>
						<h3><%=request.getParameter("product_desc") %></h3>
						
				<div class="action">
							
				<form action="EditProductDetails.jsp" method="POST">
				
				<input type="hidden"  name="product_id" value="<%=request.getParameter("product_id")  %>">
				<input type="hidden"  name="product_name" value="<%=request.getParameter("product_name")%>">
				
				<input type="hidden" name="product_category" value="<%=request.getParameter("product_category") %>">
				<input type="hidden"  name="supplier_name" value="<%=request.getParameter("supplier_name" ) %>" >
				<input type="hidden"  name="supplier_contact" value="<%=request.getParameter("supplier_contact" ) %>">
				<input type="hidden"  name="product_unitSize" value="<%=request.getParameter("product_unitSize") %>" >
				<input type="hidden"  name="cost_price" value="<%=request.getParameter("cost_price") %>" >
				<input type="hidden"  name="selling_price" value="<%=request.getParameter("selling_price") %>" >
				<input type="hidden"  name="buffer_stock" value="<%=request.getParameter("buffer_stock") %>">
				<input type="hidden"  name="product_desc" value="<%=request.getParameter("product_desc") %>" >
				<input type="hidden"  name="pimage" value="<%=request.getParameter("pimage") %>" >
				<input class="add-to-cart btn btn-default" type="submit" value="Edit product"  >
				
				</form>
				
					<form action="./DeleteItemServlet" method="post">
				<%System.out.println("ProductDetails.jsp pid:"+request.getParameter("product_id")); %>
				<input type="hidden"  name="product_id" value="<%=request.getParameter("product_id") %>" >
				<input class="add-to-cart btn btn-default" type="submit" value="Delete Product">
				</form>
				</div>
				</div>

  </body>
</html>
