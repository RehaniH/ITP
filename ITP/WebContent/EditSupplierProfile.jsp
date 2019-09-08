<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.nlhs.model.Supplier"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Profile</title>
<link rel="stylesheet" type = "text/css" href="./SupplierStyle.css"/>
<!--TableStyles------------------------------------------->
  <style>
    table {
    border-collapse: collapse;
    border-spacing: 0;
    width: 100%;
    border: 1px solid #ddd;
    }

    th, td {
      text-align: left;
      padding: 8px;
    }

    tr:nth-child(even){background-color: #f2f2f2}
  </style>
	<!--TableStyles--------------------------------------->
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,700" rel="stylesheet">
    <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">
    <link rel="stylesheet" href="css/aos.css">
    <link rel="stylesheet" href="css/ionicons.min.css">
    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/jquery.timepicker.css">
    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/icomoon.css">
    <link rel="stylesheet" href="css/Supplierprofilestyle.css">
</head>
<body>   

        <% 
          Supplier currentUser  = new Supplier();
          currentUser  = (Supplier)session.getAttribute("currentSessionUser");%>
	    
	<div id="colorlib-page">
		<a href="#" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
		<aside id="colorlib-aside" role="complementary" class="js-fullheight text-center">
			<h1 id="colorlib-logo"><a href="SupplierProfile.jsp"><%=currentUser.getFirstName()%> <span>.</span></a></h1>
			<h6>Contact Number: <%=currentUser.getContactNumber()%></h6>
			<h6>Email Address: <%=currentUser.getEmailAddress()%></h6>
			<h6>Address: <%=currentUser.getAddress() %></h6>
			<nav id="colorlib-main-menu" role="navigation">
				<br>
				<ul>
					<li class="colorlib-active"><a href="SupplierProfile.jsp">Home</a></li>
			        <br>
					<li><a href="">Contact Us</a></li>
				</ul>
			</nav>
		</aside> <!-- END COLORLIB-ASIDE -->
       <div id="colorlib-main">
			<div class="hero-wrap js-fullheight" style="background-image: url(images/bg_1.jpg);" data-stellar-background-ratio="0.5">
				<div class="overlay"></div>
				<div class="js-fullheight d-flex justify-content-center align-items-center">
					<div class="col-md-8 text text-center">
						<div class="img mb-4" style="background-image: url(images/author.jpg);"></div>
						<div class="desc">
							<h2 class="subheading">Hello</h2>
							<h1 class="mb-4"> <%=currentUser.getFirstName()+" " +currentUser.getLastName() %></h1>	
							<h4>Feel free to make changes to your profile.</h4>	
						</div>
					</div>
				</div>
			</div>
      <div class="container">
	
	<form method="POST" action="UpdateSupplierProfileServlet" >
		<table>
			
			<tr>
				<td>First Name</td>
				<td><input type="text" name="firstName"
					value="<%=currentUser.getFirstName()%>" maxlength = "15" required/></td>
			</tr>
			<tr>
				<td>Last Name</td>
				<td><input type="text" name="lastName"
					value="<%=currentUser.getLastName() %>" maxlength = "15" required/></td>
			</tr>
			<tr>
				<td>Company Name</td>
				<td><input type="text" name="companyName"
					value="<%=currentUser.getCompanyName() %>" maxlength = "30" required/></td>
			</tr>
			<tr>
				<td>Product Category</td>
				<td><select name="productCategory" class="form-control"  >
				          <option value="Electricals" class="form-control" >Electrical</option>
				  		  <option value="Plumbing"  class="form-control">Plumbing</option>
				  	      <option value="Paint"  class="form-control">Paint</option>
				          </select></td>
					
			</tr>
			<tr>
				<td>Contact Number</td>
				<td><input type="number" name="contactNumber"
					value="<%=currentUser.getContactNumber() %>" maxlength = "15" required/></td>
			</tr>
			<tr>
				<td>Email Address</td> 
				<td><input type="email" name="emailAddress"
					value="<%=currentUser.getEmailAddress() %>" maxlength = "35" required/></td>
			</tr>
			<tr>
				<td>Address</td>
				<td><input type="text" name="address"
					value="<%=currentUser.getAddress() %>" maxlength = "45" required/></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="password" name="password"
					value="<%=currentUser.getPassword() %>" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required/></td>
			</tr>
			<tr></tr>
			<tr>
				<td colspan="2"><input type="hidden" name="supplierID"
					value="<%=currentUser.getSupplierID()%>" /> <input type="submit"
					value="Edit Profile" class="update-button"/></td>
			</tr>
		</table>
	</form>
	</div>
	</div>
	</div>
	 <script src="js/jquery.min.js"></script>
  <script src="js/jquery-migrate-3.0.1.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/jquery.easing.1.3.js"></script>
  <script src="js/jquery.waypoints.min.js"></script>
  <script src="js/jquery.stellar.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/aos.js"></script>
  <script src="js/jquery.animateNumber.min.js"></script>
  <script src="js/bootstrap-datepicker.js"></script>
  <script src="js/jquery.timepicker.min.js"></script>
  <script src="js/scrollax.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="js/google-map.js"></script>
  <script src="js/main.js"></script>
</body>
</html>