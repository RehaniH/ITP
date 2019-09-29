<%@page import="com.nlhs.service.SupplierServiceImpl"%>
<%@page import="com.nlhs.service.ISupplierServices"%>
<%@page import="com.nlhs.model.Supplier"%>
<%@page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <title>Supplier Profile</title>
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
			<h5>Contact Number : <%=currentUser.getContactNumber()%></h5>
			<h5>Email Address: <%=currentUser.getEmailAddress()%></h5>
			<h5>Address: <%=currentUser.getAddress() %></h5>
		
			<nav id="colorlib-main-menu" role="navigation">
				<ul>
					<li class="colorlib-active"><a href="SupplierProfile.jsp">Home</a></li>
					<li>
					<form method="POST" action="./GetSupplierToEditServlet">
				    <input type="hidden" name="emailAddress" value= "<%=currentUser.getEmailAddress()%>"/>
                    <input type="submit" value= "Edit Profile" class="select-button" /> 
		            </form>
					</li>
					<li>
					<form method="POST" action="Login.jsp">
				    <input type="hidden" name="emailAddress" value= "<%=currentUser.getEmailAddress()%>"/>
                    <input type="submit" value= "Log Out" class="select-button" /> 
		            </form>
					</li>
					<li>
					<form method="POST" action="DeactivateProfile.jsp">
				    <input type="hidden" name="emailAddress" value= "<%=currentUser.getEmailAddress() %>"/>
                    <input type="submit" value= "Deactivate Profile" class="select-button" /> 
		            </form>
					</li>
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
							<h1 class="mb-4"> <%=currentUser.getFirstName()+" " +currentUser.getLastName() %>..</h1>
							<h5 class="mb-4">Company Name *<%=currentUser.getCompanyName()%></h5>
							<h5 class="mb-4">Products Category Supplying *<%=currentUser.getProductCategory()%></h5>
							
						</div>
					</div>
				</div>
			</div>
		
    	<div class="container">
    		<div class="row justify-content-center mb-5 pb-2">
          <div class="col-md-7 heading-section text-center ftco-animate">
            <h2 class="mb-4">For Your Ease</h2>
            <p>You can now check your use your profile page for easier management of your stock.</p>
          </div>
        </div>
    		<div class="row">
    			<div class="col-md-4">
    				<div class="blog-entry ftco-animate">
							<a href="EditSupplierProfile.jsp" class="img img-2" style="background-image: url(images/offers-image.jpg);"></a>
							<div class="text text-2 pt-2 mt-3">
								<span class="category mb-3 d-block"><a href="#">Adding Offers</a></span>
	              <h3 class="mb-4"><a href="#">Offers I Could Give</a></h3>
	              <p class="mb-4">If you need to give offers seasonally or discounts to the products to be supplied. Offers can be add over here.</p>
	             
	            </div>
						</div>
    			</div>
    			<div class="col-md-4">
    				<div class="blog-entry ftco-animate">
							<a href="StockLevelInformation.jsp" class="img img-2" style="background-image: url(images/stocklevel-imag.jpg);"></a>
							<div class="text text-2 pt-2 mt-3">
								<span class="category mb-3 d-block"><a href="StockLevelInformation.jsp">Stock Details</a></span>
	              <h3 class="mb-4"><a href="StockLevelInformation.jsp">Stock Level Up To Date</a></h3>
	              <p class="mb-4">If you need to view the stock level supplied by your company and the remaining stock. Information about the stock will be over here.  </p>
	                  
	             </div>
			    </div>
    			</div>
    			<div class="col-md-4">
    				<div class="blog-entry ftco-animate">
							<a href="#" class="img img-2" style="background-image: url(images/addproducts-image.jpg);"></a>
							<div class="text text-2 pt-2 mt-3">
								<span class="category mb-3 d-block"><a href="#">Adding Products</a></span>
	              <h3 class="mb-4"><a href="#">Adding Supplied Products</a></h3>
	              <p class="mb-4">If you need to add details of the products that you have supplied for the owner to view.You are able to keep records of the supplied products to the company over here.</p>     
	              </div>
	            </div>
			 </div>
			 
    		</div>
  
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