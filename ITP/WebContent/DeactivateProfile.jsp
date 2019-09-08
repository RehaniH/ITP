<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.nlhs.service.SupplierServiceImpl"%>
<%@page import="com.nlhs.service.ISupplierServices"%>
<%@page import="com.nlhs.model.Supplier"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Deactivate Profile</title>
 <!-- Header Styles -->
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
    
 <!-- Header Styles -->
<style>

p {
  text-indent: 50px;
  text-align: justify;
  letter-spacing: 3px;
}

.select-button {
  border: none;
  outline: 0;
  display: inline-block;
  padding: 8px;
  color: white;
  background-color: #000;
  text-align: center;
  cursor: pointer;
  width: 200px;
}

div.h{

		background-color: lightblue;
		border-color: red green blue yellow;
		margin-bottom:50px;	
}

			
</style>
</head>
<link rel="stylesheet" type = "text/css" href="./SupplierStyle.css"/>

<body>
	     <% 
      	  Supplier supplier = (Supplier) request.getAttribute("supplier");
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
         
	    
   <h3>Hello <%=currentUser.getFirstName()+" " +currentUser.getLastName() %>,  </h3> 
   <br>
   <br>
   <br>
   <p>We are sorry you would like to delete your account. 
   Information about in your profile and any information related to the consumed and stock level of the products sold in our company will be permanently deleted for privacy reason.</p>
   
   <br>
   <br>
   <br>
   <p>To continue please press the button below to permanently deactivate your profile.</p>
 <br>
 <br>
                 
 <br>
 <br>

   <table>
   			
		<tr>
			<td colspan="2">
				<form method="POST" action="DeleteSupplierProfileServlet">
					<input type="hidden" name="emailAddress" value="<%=currentUser.getEmailAddress() %>" /> 
					<input type="submit" value="Delete Profile" class="delete-button"/>
				</form>
					<br><br><br>
			</td>
		</tr>
	</table>
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