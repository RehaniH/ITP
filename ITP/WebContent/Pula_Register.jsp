<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Index</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="bootstrapPulasthi/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="bootstrapPulasthi/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="bootstrapPulasthi/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="bootstrapPulasthi/jquery.min.js"></script>
  <script src="bootstrapPulasthi/popper.min.js"></script>
  <script src="bootstrapPulasthi/bootstrap.min.js"></script>
  <link rel="stylesheet" href="bootstrapPulasthi/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ"
  crossorigin="anonymous">
  <link rel="stylesheet" href="cssPulasthi/register.css">
  
  
 
  
  


</head>

<body>
<div style="font-weight: 500px; font-size: 60px; width: 100%; height:auto; background-color: White;  ">
	<center>
		Delivery Person Personal Details
	</center>
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



      
      
   
<!----------------------------------------------------------------------------------------------------------------------------------->
<div class="container-fuild">
  <div class="row">
  	<div class="col-sm-4"></div>
    <div class="col-sm-8" >

        <form  name="form" class="needs-validation"  novalidate method="post" action="user" >

    <div  name="name" class="col-md-4 mb-3">
      <label for="validationCustom01" style=" color:Black;">Name</label>
      <input type="text" class="form-control" id="validationCustom01" placeholder="Name" maxlength="50" name="name" required>
      <div class="valid-feedback">
        Looks good!
      </div>
      <div class="invalid-feedback">
        You must agree before submitting.
      </div>
    </div>
    
    <div class="col-md-4 mb-3">
      <label for="validationCustom01" style=" color:Black;">Username</label>
      <input type="text" class="form-control" id="validationCustom01" placeholder="lavan2000" maxlength="50" name="uname" required>
      <div class="valid-feedback">
        Looks good!
      </div>
      <div class="invalid-feedback">
        Enter Username.
      </div>
    </div>
    

    <div class="col-md-4 mb-3">
      <label for="validationCustom01" style=" color:Black;">NIC Number</label>
      <input type="text" class="form-control" id="validationCustom01" placeholder="NIC" maxlength="50" name="NIC" required>
      <div class="valid-feedback">
        Looks good!
      </div>
      <div class="invalid-feedback">
        Enter  Name.
      </div>
    </div>
    
    
    <div class="col-md-4 mb-3">
      <label for="validationCustom01" style=" color:Black;">Address</label>
      <input type="text" class="form-control" id="validationCustom01" maxlength="100" placeholder="10", Temple Road , Kollupitiya" name="address" required>
      <div class="valid-feedback">
        Looks good!
      </div>
      <div class="invalid-feedback">
        Enter Address.
      </div>
    </div>
    
    
    
     <div class="col-md-4 mb-3">
      <label for="validationCustom01" style=" color:Black;">Phone Number</label>
      <input type="text" class="form-control" id="validationCustom01" placeholder="0765230456" maxlength="15" name="tele" required>
      <div class="valid-feedback">
        Looks good!
      </div>
      <div class="invalid-feedback">
        Enter Contact Number.
      </div>
    </div>
    
    
   <div class="col-md-4 mb-3">
      <label for="validationCustom01" style=" color:Black;">Licens Number</label>
      <input type="text" class="form-control" id="validationCustom01" placeholder="Licens Number" maxlength="15" name="lnum"  required>
      <div class="valid-feedback">
        Looks good!
      </div>
      <div class="invalid-feedback">
        Enter Licens Number.
      </div>
    </div>

 


     <div class="col-md-4 mb-3">
      <label for="validationCustom01" style=" color:Black;">Vehical Number</label>
      <input type="text" class="form-control" id="validationCustom01" placeholder="ABC-1234" maxlength="15" name="vnum" required>
      <div class="valid-feedback">
        Looks good!
      </div>
      <div class="invalid-feedback">
        Enter Date of Birth.
      </div>
    </div>
    
     <div class="col-md-4 mb-3">
      <label for="validationCustom01" style=" color:Black;">Vehical Model</label>
      <input type="text" class="form-control" id="validationCustom01" placeholder="Vehical Model" maxlength="15" name="vmodel" required>
      <div class="valid-feedback">
        Looks good!
      </div>
      <div class="invalid-feedback">
        Enter Date of Birth.
      </div>
    </div>
    
    
    
     <div class="col-md-4 mb-3">
      <label for="validationCustom01" style=" color:Black;">Password</label>
      <input type="password" class="form-control" id="validationCustom01" placeholder="password" maxlength="50" name="pass" required>
      <div class="valid-feedback">
        Looks good!
      </div>
      <div class="invalid-feedback">
        Enter Password.
      </div>
    </div>


    
        <button class="btn btn-primary" type="submit" name="submit" value="submit"  onClick="return validateform()">Submit form</button>
           
</form>


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