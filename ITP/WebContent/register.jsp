<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css" >
<script src="bootstrap/js/bootstrap.min.js" ></script>
<script src="bootstrap/js/jquery-3.3.1.slim.min.js" ></script>
<script src="bootstrap/js/popper.min.js" ></script>
<script type="text/javascript">
	function regVal(){
		var eml = document.getElementById("inputEmail");
		var password1 = document.getElementById("pass1");
		
		if(!(eml.checkValidity()||password1.checkValidity)){
			document.getElementById("emailD").innerHTML = "Enter email address";
			document.getElementById("pass1").innerHTML = "Enter valid password";
			return false;
		}
		
			
	}


</script>
</head>

<body>

	<div class="jumbotron" >
		<div class="container">
			<h2 class="display-4" >
				Register
			</h2>
			<h3 class="text-secondary"><small>-Register to order online</small></h3>
		</div>
	</div>
	
	<div class="container-fluid">
		<form action="RegisterServlet" method="post" onsubmit="return regVal()">

			<div class="form-group row">
				<label class="col-sm-1 col-form-label">email:</label>
				<div class="col-sm-4">
					<input type="email"  class="form-control" name="email" id="inputEmail" required>
					<div id="emailD" style="color:red;"></div>
				</div>
			</div>
			
			<div class="form-group row">
			<label class="col-sm-1 col-form-label">password:</label>
			<div class="col-sm-4">
				<input type="password" class="form-control" name="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
				id="pass1" required>
				<div id="pass1" style="color:red;"></div>
			</div>
			</div>
			
			<div class="form-group form-check">
      			<label class="form-check-label">
        		<input class="form-check-input" type="checkbox" name="remember" required> I agree and have read the 
        		<a href="termsAndConditions.jsp">terms and conditions</a> in using the website.
        		<div class="valid-feedback">Valid.</div>
        		<div class="invalid-feedback">Check this checkbox to continue.</div>
      </label>
    </div>
    	<div class="d-flex justify-content-end mb-3">
			<input type="submit" class="btn btn-success" value="Register">
		</div>
		</form>

	</div>
</body>
</html>