
<!DOCTYPE html>
<html>
<head>
<title>Registration</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
function hideURLbar(){ window.scrollTo(0,1); } </script>

<link href="css/Supplierstyle.css" rel="stylesheet" type="text/css" media="all">
<link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all">

<link href='//fonts.googleapis.com/css?family=Lato:400,100,100italic,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'><link href='//fonts.googleapis.com/css?family=Raleway+Dots' rel='stylesheet' type='text/css'>
</head>
<body>
<!--header-->
	<div class="header-w3l">
		<h1>Flat Sign Up Form</h1>
	</div>
<!--//header-->
<!--main-->
<div class="main-agileits">
	<h2 class="sub-head">Sign Up</h2>
		<div class="sub-main">	
			<form action="#" method="post">
				<h3>Registration Form</h3>
					<div class="form-group">
						<div class="form-wrapper">
							<label for="">First Name</label>
					<input type="text" class="form-control" name="firstName" maxlength = "15" required/>

						</div>
						<div class="form-wrapper">
							<label for="">Last Name</label>
							<input type="text" class="form-control" name="lastName" value = "" maxlength = "20"  required/>
						</div>
					</div>
					<div class="form-wrapper">
						<label for="">Company Name</label> <input type="text" class="form-control" name="companyName" maxlength = "20" required/>
					</div>
					<div class="select-list" >
						<label for="">Product Category</label>
						<select name="productCategory" class="form-control">
				          <option value="Electricals" class="form-control" >Electrical</option>
				  		  <option value="Plumbing"  class="form-control">Plumbing</option>
				  	      <option value="Paint"  class="form-control">Paint</option>
				          </select>
					</div>
					<div class="form-wrapper">
						<label for="">Contact Number</label>
						<input type="number" name="contactNumber" class="form-control" size="50" maxlength = "30" required/>
					</div>
					<div class="form-wrapper">
						<label for="">Email Address</label>
						<input type="email" name="emailAddress" class="form-control" size="50" required pattern="[^@]+@[^@]+.[a-zA-Z]{2,6}"/>
					</div>
					<div class="form-wrapper">
						<label for="">Address</label>
						<input type="text" name="address" class="form-control" size="50" maxlength = "60" required/>
					</div>
					<div class="form-wrapper">
						<label for="">Password</label>
						<input type="password" name="password" class="form-control" size="50" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" required/>
					</div>
					<div class="form-checkbox">
					<label class="container">
					<p>By signing up, you agree to the <a href="#" class="text">Term of Service</a></p>
					  	<input type="checkbox" name="agree" id="agree">
					  	<span class="checkmark"></span>
					</label>
				</div>
					<br>
					<input type="submit" value="Register" class="register-button" /> 
					<br>
					<br>
					<input type="reset" value="Reset" class="reset-button"/>
			</form>
		</div>
		<div class="clear"></div>
</div>
<!--//main-->


</body>
</html>