<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
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
    background: #FFA500;
    margin-bottom: 100px;
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
	
	<div class="container" style="margin-top:80px" class="d-flex justify-content-center">
	
	
	<form action="DirectServlet" method="post">	
		<div class="row">
		
		<!-- Column 1 of 1st Row -->	
			<div class="col-md-3">
				<div class="fakeimg">
					<div class="media">
						<img alt="details of customer" class="mx-auto d-block"
							src="images/details.jpg" height="60px" width="60px">
						
					</div>
					
					<div class="d-flex justify-content-center">
						<input type="submit" name="cInfo" value="My Information">
					</div>
				</div>
			</div>
			
			<!-- Column 2 of 1st Row -->	
			<div class="col-md-3">
				<div class="fakeimg">
					<div class="media">
						<img alt="details of customer" class="mx-auto d-block"
							src="images/address.jpeg" height="60px" width="60px">
					</div>
					
					<div class="d-flex justify-content-center">
						<input type="submit" name="customer" value="Addresses">
					</div>
				
				</div>
			</div>
			
			<!-- Column 3 of 1st Row -->	
			<div class="col-md-3">
				<div class="fakeimg">
					<div class="media">
						<img alt="details of customer" class="mx-auto d-block"
							src="images/history.jpeg" height="60px" width="60px">
					</div>
					<div class="d-flex justify-content-center">
						<input type="submit" name="orderHistory" value="Order History">
					</div>
				
				</div>
			</div>
			
			
		</div>
		
		
		<!-- Here in each row a navigation through the profile is displayed-->
			
		<div class="row">
		
		<!-- Column 1 of 2nd Row -->
			<div class="col-md-3">
				<div class="fakeimg">
					<div class="media">
						<img alt="details of customer" class="mx-auto d-block"
							src="images/creditSlips.jpeg" height="60px" width="60px">
					</div>
					
					<div class="d-flex justify-content-center">
						<input type="submit" name="creditSlips" value="Credit Slips">
					</div>
				
				
				</div>
			</div>
			
			<!-- Column 2 of 2nd Row -->
			<div class="col-md-3">
				<div class="fakeimg">
					<div class="media">
						<img alt="details of customer" class="mx-auto d-block"
							src="images/settings.jpeg" height="60px" width="60px">
					</div>
					<div class="d-flex justify-content-center">
						<input type="submit" name="settings" value="Settings">
					</div>
				
				
				</div>
			</div>
			
			<!-- Column 3 of 2nd Row -->
			<div class="col-md-3">
				<div class="fakeimg">
					<div class="media">
						<img alt="details of customer" class="mx-auto d-block"
							src="images/orderHistory.jpeg" height="60px" width="60px">
					</div>
					<div class="d-flex justify-content-center">
						<input type="submit" name="cTerms" value="Terms and Conditions">
					</div>
				
				
				</div>
			</div>
			
		
		
		</div>
		
		</form>
		
		<div class="d-flex justify-content-end mb-3">
				<input type="button" value="Chat" class="btn btn-success" name=""/>
			</div>
	</div>

</body>
</html>