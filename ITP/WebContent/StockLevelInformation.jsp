<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.nlhs.model.Supplier"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>StockProfile</title>
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
			<h5>Contact Number: <%=currentUser.getContactNumber()%></h5>
			<h5>Email Address: <%=currentUser.getEmailAddress()%></h5>
			<h5>Address: <%=currentUser.getAddress() %></h5>
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
							<h5 class="subheading">Hello</h5>
							<h1 class="mb-4"> <%=currentUser.getFirstName()+" " +currentUser.getLastName() %></h1>	
							<h4>Changes of your the supplied stock level are over here.</h4>
						</div>
					</div>
				</div>
			</div>
   <!-- The stock level information should be here -->
           <div align="center" class="product-sales-area mg-tb-30">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                        <div class="product-sales-chart">
                            <div class="portlet-title">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                        <div class="caption pro-sl-hd">
                                            <span class="caption-subject text-uppercase"><b>Product Category Sales</b></span>
                                        </div>
                                    </div>
                                </div>
                            </div>                           
                            <div id="morris-area-chart" style="height: 356px;"></div>
                        </div>
                    </div>
                    
                    </div>
                </div>
            </div>
        
	<!-- Stock -->
	
	<!-- Tables to see the stock level of the supplier product category -->
	<div class="container">
	
	<form method="POST" action="" >
		<table>
			
			<tr>
				<td>First Name</td>
				<td><input type="text" name="firstName"
					value="<%=currentUser.getFirstName()%>" maxlength = "15" disabled/></td>
			</tr>
			<tr>
				<td>Last Name</td>
				<td><input type="text" name="lastName"
					value="<%=currentUser.getLastName() %>" maxlength = "15" disabled/></td>
			</tr>
			<tr>
				<td>Company Name</td>
				<td><input type="text" name="companyName"
					value="<%=currentUser.getCompanyName() %>" maxlength = "30" disabled/></td>
			</tr>
			<tr>
				<td>Product Category</td>
				<td><select name="productCategory" class="form-control" disabled >
				          <option value="Electricals" class="form-control" >Electrical</option>
				  		  <option value="Plumbing"  class="form-control">Plumbing</option>
				  	      <option value="Paint"  class="form-control">Paint</option>
				         </select></td>
			</tr>
			<tr>
				<td>Contact Number</td>
				<td><input type="number" name="contactNumber"
					value="<%=currentUser.getContactNumber() %>" maxlength = "15" disabled/></td>
			</tr>
			<tr>
				<td>Email Address</td> 
				<td><input type="email" name="emailAddress"
					value="<%=currentUser.getEmailAddress() %>" maxlength = "35" disabled/></td>
			</tr>
			<tr>
				<td>Address</td>
				<td><input type="text" name="address"
					value="<%=currentUser.getAddress() %>" maxlength = "45" disabled/></td>
			</tr>
			<tr></tr>
		</table>
	</form>
	<form  action="StockLevelReport.jsp">	
				 <input type="submit" value= "Remaining Stocks" class="select-button" /> 
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
  
  <!-- jquery
		============================================ -->
    <script src="js/vendor/jquery-1.11.3.min.js"></script>
    <!-- bootstrap JS
		============================================ -->
    <script src="js/bootstrap.min.js"></script>
    <!-- wow JS
		============================================ -->
    <script src="js/wow.min.js"></script>
    <!-- price-slider JS
		============================================ -->
    <script src="js/jquery-price-slider.js"></script>
    <!-- meanmenu JS
		============================================ -->
    <script src="js/jquery.meanmenu.js"></script>
    <!-- owl.carousel JS
		============================================ -->
    <script src="js/owl.carousel.min.js"></script>
    <!-- sticky JS
		============================================ -->
    <script src="js/jquery.sticky.js"></script>
    <!-- scrollUp JS
		============================================ -->
    <script src="js/jquery.scrollUp.min.js"></script>
    <!-- mCustomScrollbar JS
		============================================ -->
    <script src="js/scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="js/scrollbar/mCustomScrollbar-active.js"></script>
    <!-- metisMenu JS
		============================================ -->
    <script src="js/metisMenu/metisMenu.min.js"></script>
    <script src="js/metisMenu/metisMenu-active.js"></script>
    <!-- morrisjs JS
		============================================ -->
    <script src="js/morrisjs/raphael-min.js"></script>
    <script src="js/morrisjs/morris.js"></script>
    <script src="js/morrisjs/morris-active.js"></script>
    <!-- morrisjs JS
		============================================ -->
    <script src="js/sparkline/jquery.sparkline.min.js"></script>
    <script src="js/sparkline/jquery.charts-sparkline.js"></script>
    
    <!-- plugins JS
		============================================ -->
    <script src="js/plugins.js"></script>
    <!-- main JS
		============================================ -->
    <script src="js/main.js"></script>
</body>
</html>