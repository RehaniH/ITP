<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head><!-- IT18176070: Perera P.R.H -->
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Customer Profile</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" >
<script src="bootstrap/js/bootstrap.min.js" ></script>
<script src="bootstrap/js/jquery-3.3.1.slim.min.js" ></script>
<script src="bootstrap/js/popper.min.js" ></script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" ></script>

<style type="text/css">
	
	
	.fakeimg {
    height: 200px;
    border-radius: 25px;
    margin-bottom: 80px;
    
    
  }
  
  input[type=submit] {
  background-color: transparent;
  color: black;
  padding: 12px 20px;
  border: none;
  cursor: pointer;
  float: center;
}

img{
	margin-top: 30px;
	align:center;
	margin-bottom: 10px;

}

input[type="submit"]{
text-size: 50px;
color: white;
}





</style>
</head>
</head>
<body>
	<div class="jumbotron" >
		<div class="container">
			<h2 class="display-4" >
				My Profile
			</h2>
		</div>
	</div>
	
	<div class="container" style="margin-top:80px; margin-bottom:50px;" class="d-flex justify-content-center">
	
	
	<form action="DirectServlet" method="post">	
		<div class="row">
		
		<!-- Column 1 of 1st Row -->	
			<div class="col-md-3">
				<div class="fakeimg" style="background: #009688;">
					<div class="media">
						<img alt="details of customer" class="mx-auto d-block"
							src="images/details.jpg" height="80px" width="80px">
						
					</div>
					
					<div class="d-flex justify-content-center">
						<input type="submit" name="cInfo" value="My Information">
					</div>
				</div>
			</div>
			
			<!-- Column 2 of 1st Row -->	
			<div class="col-md-3">
				<div class="fakeimg" style="background: #000080;">
					<div class="media">
						<img alt="details of customer" class="mx-auto d-block"
							src="images/address.jpeg" height="80px" width="80px">
					</div>
					
					<div class="d-flex justify-content-center">
						<input type="submit" name="customer" value="Addresses">
					</div>
				
				</div>
			</div>
			
			<!-- Column 3 of 1st Row -->	
			<div class="col-md-3">
				<div class="fakeimg" style="background: #ff0bc0;">
					<div class="media">
						<img alt="details of customer" class="mx-auto d-block"
							src="images/history.jpeg" height="80px" width="80px">
					</div>
					<div class="d-flex justify-content-center">
						<input type="submit" name="orderHistory" value="Order History">
					</div>
				
				</div>
			</div>
			
			<div class="col-md-3">
			<img alt="details of customer" class="mx-auto d-block"
							src="productImages/brilliantWhite.jpg" >
			</div>
			
		</div>
		
		
		<!-- Here in each row a navigation through the profile is displayed-->
			
		<div class="row">
		
		<!-- Column 1 of 2nd Row -->
			<div class="col-md-3">
				<div class="fakeimg" style="background: #FFA500;">
					<div class="media">
						<img alt="details of customer" class="mx-auto d-block"
							src="images/creditSlips.jpeg" height="80px" width="80px">
					</div>
					
					<div class="d-flex justify-content-center">
						<input type="submit" name="creditSlips" value="Credit Slips">
					</div>
				
				
				</div>
			</div>
			
			<!-- Column 2 of 2nd Row -->
			<div class="col-md-3">
				<div class="fakeimg" style="background: #00CED1;">
					<div class="media">
						<img alt="details of customer" class="mx-auto d-block"
							src="images/settings.jpeg" height="80px" width="80px">
					</div>
					<div class="d-flex justify-content-center">
						<input type="submit" name="settings" value="Settings">
					</div>
				
				
				</div>
			</div>
			
			<!-- Column 3 of 2nd Row -->
			<div class="col-md-3" >
				<div class="fakeimg" style="background: #191970;">
					<div class="media">
						<img alt="details of customer" class="mx-auto d-block"
							src="images/orderHistory.jpeg" height="80px" width="80px">
					</div>
					<div class="d-flex justify-content-center" >
						<input type="submit" name="cTerms" value="Terms and Conditions">
					</div>
				
				
				</div>
			</div>
			
			
			<div class="col-md-3" >
				<div class="d-flex justify-content-center" >
					<a href="homePage.jsp" style="align:center; text-size:25px; text-decoration:none;">Continue Shopping</a>
				</div>
			</div>
			
		
		
		</div>
		
		</form>
		
		<div class="d-flex justify-content-end mb-3">
			<a href="http://localhost:2019/memeChat.html"><button  class="btn btn-success">Chat</button></a>
		</div>
		<div class="col-md-3" >
		<div class="d-flex justify-content-center" >
					<a href="index.jsp" style="text-size:25px; text-decoration:none;"><button class="btn btn-info">Logout
			</button></a>
		</div>	
		</div>
	</div>
	
	<jsp:include page="/footer.jsp"></jsp:include>

</body>
</html>