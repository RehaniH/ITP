<%@page import="com.nlhs.service.AdminServiceImp"%>
<%@page import="com.nlhs.model.Admin"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Profile</title>
</head>
<body>

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
					
					<li><a href="AdminProfileView.jsp">Profile</a></li>
					<li><a href="#">Customer</a></li>
					<li><a href="#">Supplier</a></li>
					<li><a href="#">Sales</a></li>
					<li><a href="#">Delivery Staff</a></li>
					<li><a href="#">Chat</a></li>
					<li><form action="./LogoutServlet" method="post"><input type="submit" value="logout"></form></li>
				</ul>
				<br>
			</div>
			<br>
		
			<div class="col-sm-9">
				<div class="well">
	
							<div class="preview-pic tab-content">
						  <div class="tab-pane active" id="pic-1"><img src="profilePics/<%= admin.getProfilePic() %>" /></div>
						  
						</div>
						<ul class="preview-thumbnail nav nav-tabs">
						 
						 
						</ul>
						<h3 class="product-title"><%= admin.getFname()  %></h3>
						<h3 class="product-title"><%= admin.getLname()  %></h3>
						<div class="rating">
							
							<span class="review-no"><strong><%=admin.getAid() %></strong></span>
						</div>
						<p class="product-description"></p>
					
						<h4 class="price">Age: <span><%=admin.getAge() %></span></h4>
						<h4 class="price">Contact Number: <span><%=admin.getContactNumber() %></span></h4>
						<h4 >EMAIL: <span><%=admin.getEmail() %></span></h4>
						<h4 >PASSWORD : <span><%=admin.getPassword() %></span></h4>
						
						
				<div class="action">
							
				<form action="EditAdminProfile.jsp" method="POST">
				
				<input type="hidden"  name="a_id" value="<%=admin.getAid()   %>">
				<input type="hidden"  name="a_fname" value="<%=admin.getFname()%>">
				
				<input type="hidden" name="a_lname" value="<%=admin.getLname() %>">
				<input type="hidden"  name="profile_image"value="<%= admin.getProfilePic()  %>" >
				<input type="hidden"  name="a_age" value="<%=admin.getAge() %>">
				<input type="hidden"  name="a_contact"" value="<%=admin.getContactNumber()%>" >
				<input type="hidden"  name="a_email" value="<%=admin.getEmail() %>" >
				<input type="hidden"  name="a_password" value="<%=admin.getPassword() %>" >
				
				<input class="add-to-cart btn btn-default" type="submit" value="Edit Profile"  >
				
				</form>
				
<!-- 					<form action="./DeleteItemServlet" method="post"> -->
<%-- 				<%System.out.println("ProductDetails.jsp pid:"+request.getParameter("product_id")); %> --%>
<%-- 				<input type="hidden"  name="product_id" value="<%=request.getParameter("product_id") %>" > --%>
<!-- 				<input class="add-to-cart btn btn-default" type="submit" value="Delete Product"> -->
<!-- 				</form> -->
				</div>
				</div>

  </body>
</html>

</body>
</html>