<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="bootstrap/bootstrap.min.css">
<script src="bootstrap/jquery.min.js"></script>
<script src="bootstrap/bootstrap.min.js"></script>
<style>
/* Set height of the grid so .sidenav can be 100% (adjust as needed) */
.row.content {
	height: 550px
}

/* Set gray background color and 100% height */
.sidenav {
	background-color: #f1f1f1;
	height: 100%;
}

/* On small screens, set height to 'auto' for the grid */
@media screen and (max-width: 767px) {
	.row.content {
		height: auto;
	}
}
</style>
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
					
					
					<li><a href="AdminProfileView.jsp">Profile</a></li>
					<li><a href="homePage.jsp">View home Page</a></li>
					<li><a href="ListSuppliers.jsp">Supplier</a></li>
					<li><a href="#">Sales</a></li>
					<li><a href="Pula_Register.jsp">Delivery Staff Registration</a></li>
					<li><a href="memeChat.html">Chat</a></li>
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
					<li><a href="homePage.jsp">View Home Page</a></li>
					<li><a href="ListSuppliers.jsp">Supplier</a></li>
					<li><a href="#">Sales</a></li>
					<li><a href="Pula_Register.jsp">Delivery Staff</a></li>
					<li><a href="memeChat.html">Chat</a></li>
					<li><form action="./LogoutServlet" method="post"><input type="submit" value="logout"></form></li>
				</ul>
				<br>
			</div>
			<br>

			<div class="col-sm-9">
				<div class="well">
					<h4>INVENTORY MANAGEMENT</h4>
					<p> ${requestScope.message} </p>
					<p> ${requestScope.SUmessage} </p>
				</div>
				<div class="row">
					<div class="col-sm-3">
						<div class="well">
							<p>INSERT NEW PRODUCT</p>
							<a href="insertNewProduc.jsp"><img src="images/Insert_Product.png"
								class="img-responsive" style="width: 100%" alt="Image"></a>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="well">
							<p>PRODUCT DETAILS</p>
							<a href="ShowProductForm.jsp"><img src="images/producDetails.png"
								class="img-responsive" style="width: 100%" alt="Image"></a>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="well">
							<p>AUDIT TABLE</p>
							<a href="auditStocks.jsp"><img src="images/audit.png" class="img-responsive"
								style="width: 100%" alt="Image"></a>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="well">
							<p>UPDATE STOCKS</p>
							<a href="updateStocks.jsp"><img src="images/stocks_update.png"
								class="img-responsive" style="width: 100%" alt="Image"></a>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-4">
						<div class="well">
							<p>LOW STOCKS PRODUCTS</p>
							<a href="#"><img src="images/low_stocks.png"
								class="img-responsive" style="width: 100%" alt="Image"></a>
						</div>
					</div>
				
				</div>
				
				</div>
			</div>
		</div>
	

</body>
</html>