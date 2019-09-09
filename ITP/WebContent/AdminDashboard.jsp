<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Admin Dashboard</title>
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
  <%if(session.getAttribute("UserID") == null){
	  request.getRequestDispatcher("index.jsp").include(request, response);  
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
					<li><a href="homePage.jsp">View home Page</a></li>
					<li><a href="ListSuppliers.jsp">Supplier</a></li>
					<li><a href="#">Sales</a></li>
					<li><a href="Pula_Register.jsp">Delivery Staff Registration</a></li>
					<li><a href="http://localhost:2019/memeChat.html">Chat</a></li>
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
					<li><a href="homePage.jsp">View home Page</a></li>
					<li><a href="ListSuppliers.jsp">Supplier</a></li>
					<li><a href="#">Sales</a></li>
					<li><a href="Pula_Register.jsp">Delivery Staff Registration</a></li>
					<li><a href="http://localhost:2019/memeChat.html">Chat</a></li>
					<li><form action="./LogoutServlet" method="post"><input type="submit" value="logout"></form></li>
				</ul>
				<br>
			</div>
			<br>

			<div class="col-sm-9">
				<div class="well">
					<h4>Dashboard</h4>
					<p><%if(request.getAttribute("AAmessage") == null){%>
						<h3></h3> 
  						<%
 						 } else{
 							 %>
 							<h3><%=request.getAttribute("AAmessage")%></h3> 
 							 <% 
 						 }  
 			 			%>
 			 			
 			 			<%if(session.getAttribute("HPCmessage") == null){%>
						<h3></h3> 
  						<%
 						 }  else{
 							 %>
 							<h3> <%=request.getAttribute("HPCmessage")%></h3> 
 							 <% 
 						 } 
 			 			%>
 			 			
 			 			<%if(session.getAttribute("UAmessage") == null){%>
						<h3></h3> 
  						<%
 						 }  else{
 							 %>
 							<h3> <%=request.getAttribute("UACmessage")%></h3> 
 							 <% 
 						 }
 			 			%>
  						</p>
				</div>
				<div class="row">
					<div class="col-sm-3">
						<div class="well">
							<p>INVENTORY MANAGEMENT</p>
							<a href="inventoryManagement.jsp"><img src="images/storage.png"
								class="img-responsive" style="width: 100%" alt="Image"></a>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="well">
							<p>SUPPLIER MANAGEMENT</p>
							<a href="#"><img src="images/supplier.png"
								class="img-responsive" style="width: 100%" alt="Image"></a>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="well">
							
  								<form action="CustomerManagementServlet" method="post">
 									<input style="background-color:transparent;color: black; padding: 12px 20px;
 								 border: none;
  								cursor: pointer;
  								float: left;"
 									type="submit" value="CUSTOMER MANAGEMENT">
								</form>
  								
  								
							
							
							
							<a href=""><img src="images/crm.png" class="img-responsive"
								style="width: 100%" alt="Image"></a>
						</div>
					</div>
					<div class="col-sm-3">
						<div class="well">
							<p>ORDER AND DELIVERY MANAGEMENT</p>
							<a href="#"><img src="images/orderAndDelivery.png"
								class="img-responsive" style="width: 100%" alt="Image"></a>
							
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-4">
						<div class="well">
							<p>REPORTS MANAGEMENT</p>
							<a href="#"><img src="images/statsandReports.png"
								class="img-responsive" style="width: 100%" alt="Image"></a>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="well">
							<p>FINANCIAL MANAGEMENT</p>
							<a href="ProfitMain.html"><img src="images/accounting.png"
								class="img-responsive" style="width: 100%" alt="Image"></a>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="well">
							<p>HOME SCREEN MANAGEMENT</p>
							<a href="homePageManagement.jsp"><img src="images/home_page_edit.png"
								class="img-responsive" style="width: 100%" alt="Image"></a>
						</div>
					</div>
				</div>
				<div class="row">
					
					<div class="col-sm-4">
						<p>ADD NEW ADMIN</p>
							<a href="addAdminForm.jsp"><img src="images/plus.png"
								class="img-responsive" style="width: 100%" alt="Image"></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	

</body>
</html>