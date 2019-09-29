<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Index</title>
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<!-- <script src="bootstrapPulasthi/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> -->
<!-- <script src="bootstrapPulasthi/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script> -->
<!-- <script src="bootstrapPulasthi/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script> -->
<!-- <script src="bootstrapPulasthi/jquery.min.js"></script> -->
<!--   <script src="bootstrapPulasthi/popper.min.js"></script> -->
<!--   <script src="bootstrapPulasthi/bootstrap.min.js"></script> -->
<!--   <link rel="stylesheet" href="bootstrapPulasthi/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" -->
<!--   crossorigin="anonymous"> -->
<!--   <link rel="stylesheet" href="cssPulasthi/register.css"> -->
  
  <style>
  .btn btn-primary{
	padding-left:200px;
  }
  .box{
	width: 100%;
	height: 100%;
	padding: 10px;
	border: 2px solid white;
	border-radius: 30px;
	padding-left: 50px;
	background-color: rgba(0,0,0,0.8);
	padding-top: 30px;
	padding-bottom: 30px;
}
  	body{

		background-repeat: no-repeat;
		background-position: center;
		background-size: cover;
	
	}
	.form-control{
	width: 85%;
	}
  </style>
 
  
  


</head>

<body>
<body background="Pics/abc.png">
<div style="font-weight: 500px; font-size: 60px; width: 100%; height:auto; background-color: Black;  ">
	<center><font color="White">
		Delivery Person Personal Details
	</font></center>
<center>
	<%
	try{
		if(request.getParameter("me")!=null){
			out.print(request.getParameter("me"));
		}
		
		
	}catch(Exception exception){
		
	}
	
	
	%>
	</center>

</div>



      
      <br>
   
<!----------------------------------------------------------------------------------------------------------------------------------->
<div class="container-fuild">
  <div class="row">
  	<div class="col-sm-4"></div>
    <div class="col-sm-4" >
<div class="box">
        <form  name="form" class="needs-validation "  novalidate method="post" action="user" >

    
      <label for="validationCustom01"><font color="white">Name</font></label>
      <input type="text" class="form-control" id="validationCustom01" placeholder="Name" maxlength="50" name="name" required>
      <div class="valid-feedback">
        Looks good!
      </div>
      <div class="invalid-feedback">
        You must agree before submitting.
      </div>

    <br> 
   
      <label for="validationCustom01"><font color="white">Username</font></label>
      <input type="email" class="form-control" id="validationCustom01" placeholder="lavan2000" maxlength="50" name="uname" required>
      <div class="valid-feedback">
        Looks good!
      </div>
      <div class="invalid-feedback">
        Enter Username.
      </div>


    <br> 

 
      <label for="validationCustom01"><font color="white">NIC Number</font></label>
      <input type="text" class="form-control" id="validationCustom01" placeholder="NIC" maxlength="13" name="NIC" required>
      <div class="valid-feedback">
        Looks good!
      </div>
      <div class="invalid-feedback">
        Enter  Name.
      </div>
   
    <br> 
    
   
      <label for="validationCustom01" ><font color="white">Address</font></label>
      <input type="text" class="form-control" id="validationCustom01" maxlength="100" placeholder="10", Temple Road , Kollupitiya" name="address" required>
      <div class="valid-feedback">
        Looks good!
      </div>
      <div class="invalid-feedback">
        Enter Address.
      </div>

    <br> 
    
    
    
      <label for="validationCustom01" ><font color="white">Phone Number</font></label>
      <input type="text" class="form-control" id="validationCustom01" placeholder="0765230456" maxlength="10" name="tele" pattern="\d*"  required>
      <div class="valid-feedback">
        Looks good!
      </div>
      <div class="invalid-feedback">
        Enter Contact Number.
      </div>
 
    <br> 
    
   
      <label for="validationCustom01" ><font color="white">License Number</font></label>
      <input type="text" class="form-control" id="validationCustom01" placeholder="Licens Number" maxlength="15" name="lnum"  required>
      <div class="valid-feedback">
        Looks good!
      </div>
      <div class="invalid-feedback">
        Enter Licens Number.
      </div>
 

 <br> 



      <label for="validationCustom01" ><font color="white">Vehical Number</font></label>
      <input type="text" class="form-control" id="validationCustom01" placeholder="ABC1234" maxlength="7" name="vnum" required>
      <div class="valid-feedback">
        Looks good!
      </div>
      <div class="invalid-feedback">
        Enter Vehical Number.
      </div>

    <br> 
    
      <label for="validationCustom01" ><font color="white">Vehical Model</font></label>
      <input type="text" class="form-control" id="validationCustom01" placeholder="Vehical Model" maxlength="15" name="vmodel" required>
      <div class="valid-feedback">
        Looks good!
      </div>
      <div class="invalid-feedback">
        Enter Vehical Model.
      </div>

    
    <br> 
    
     
      <label for="validationCustom01" ><font color="white">Password</font></label>
      <input type="password" class="form-control" id="validationCustom01" placeholder="password" maxlength="50" name="pass" required>
      <div class="valid-feedback">
        Looks good!
      </div>
      <div class="invalid-feedback">
        Enter Password.
      </div>
 <br> <br> 


    
        <button class="btn btn-primary" style="margin-left:25%; " type="submit" name="submit" value="submit"  onClick="return validateform()">Submit form</button>
           
</form>

</div>
</div>
<br><br><br>

<script>

function validateform(){  
	var name=document.form.name.value;  
	var password=document.form.pass.value;  
	  
	if (name==null || name==""){  
	  alert("Name can't be blank");  
	  return false;  
	}else if(password.length<6){  
	  alert("Password must be at least 6 characters long.");  
	  return false;  
	  }
	
	}  

 

(function() {
  'use strict';
  window.addEventListener('load', function() {
	  
	 
    
    var forms = document.getElementsByClassName('needs-validation');
    
    var validation = Array.prototype.filter.call(forms, function(form) {
      form.addEventListener('submit', function(event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
        alert("Registration Sucssesful"); 
      }, false);
    });
  }, false);
  
})();
</script>





</body>
</html>