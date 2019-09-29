<%@page import="comPula.RegisterUser"%>
<!DOCTYPE html>

<html>
<head>

<title>My Profile</title>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="cssPulasthi/css3b.css" >
 <link rel="cssPulasthi/register.css" >
  <link rel="stylesheet" href="bootstrapPulasthi/bootstrap.min.css">
<link rel="stylesheet" href="bootstrapPulasthi/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="bootstrapPulasthi/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="bootstrapPulasthi/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="bootstrapPulasthi/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="bootstrapPulasthi/jquery.min.js"></script>


<script src="bootstrapPulasthi/popper.min.js"></script>


<script src="bootstrapPulasthi/bootstrap.min.js"></script>

<link href="bootstrapPulasthi/icon.css" rel="stylesheet">
<style>
.inputc{
width:500px;
heght:50px;
}
	.butnupdate{
		background-color: blue;
		color: white;
		width: 150px;
		border-radius: 30px;
	}
	.butndelete{
		background-color: red;
		color: white;
		width: 150px;
		border-radius: 30px;
	}
	.form{
		border-radius: 30px;
		width: 100%;
		height: 100%;
		border: 1px solid white;
		padding: 25px;
	}
	.inputc{
	
	}
		body{
		
		background-repeat: no-repeat;
		background-position: center;
		background-size: cover;
	
	}
</style>
</head>
<body>

<nav class="navbar navbar-light bg-light">
  <form class="form-inline" >
   
   <a href="details.jsp"><button class="btn btn-sm btn-outline-secondary" type="button" >Details</button></a>
     <a href="myprofile1.jsp"><button class="btn btn-outline-success" type="button" >My Profile</button></a>
    <a href="history.jsp"><button class="btn btn-sm btn-outline-secondary" type="button">History</button></a>
  </form>
  <form class="form-inline" method="post" action="">
  <button type="button" class="btn btn-outline-dark">Log out</button>
  </form>
</nav>

<body background="Pics/abc.png"   >


<%
RegisterUser ruser= new RegisterUser();
String uid= session.getAttribute("IDD").toString().trim();
//out.print("Dila"+uid);
ruser.setId(uid);
String detail="" ,col[]=null;
detail= ruser.getuserdetails();


try{
	col=detail.split("~");
	
}catch(Exception exception){
	out.print("error"+exception);
}

%>

	
	

	
<script>
function validateForm(){
              var Nameval = document.forms["myforms"]["name"].value;
			  var Unameval = document.forms["myforms"]["uname"].value;
			  var NICval = document.forms["myforms"]["NIC"].value;
			  var Addressval = document.forms["myforms"]["address"].value;
			  var Telephoneval = document.forms["myforms"]["tele"].value;
			  var Lnumval = document.forms["myforms"]["lnum"].value;
			  var Vnumval = document.forms["myforms"]["vnum"].value;
			  var Vmodelval = document.forms["myforms"]["vmodel"].value;
			  var Passwordval = document.forms["myforms"]["pass"].value;
			 
              
			  
			  
			  
			  if (Nameval == ""){
			  alert("Name must be filled out");
			  return false;}
			  
			  
			  
			  else if (Unameval==""){
			  alert("User name must be filled out");
			  return false;}
			  
			  
			  
			  else if (NICval==""){
			  alert("NIC must be filled out");
			  return false;}
			  
			  
			  else if (addressval==""){
			  alert("Address must be filled out");
			  return false;}
			  
			  
			  
			  else if (Telephoneval==""){
			  alert("Telenumber must be filled out");
			  return false;}
			  
			  
			  else if (Lnumval =="" ){
			  alert("Licens number must be filled out");
			  return false;}
			  
			  
			  else if (Vnumval =="" ){
			  alert("Vehical Number must be filled out");
			  return false;}
			  
			  else if (Vmodelval =="" ){
				  alert("Vehical Model must be filled out");
				  return false;}
			  
			  
			  else if (Passwordval =="" ){
			  alert("The Password column cannot be null");
			  return false;}
			  
			  
			  else if (Passwordval != confirmval ){
			  alert("The two passwords you entered does not match");
			  return false;}
			  }
			  
</script>
 


<title> User Account </title>




</head>




<center>
    <h1 class="top" style="color: White;">My Profile</h1>
</center>




<div  class="contaier-fuild">

		<div class="row" style="text-align:center;'">
		<div class="col-md-4"></div>
		
			<div class="col-md-4">
			  <div class="form" style="background-color:rgba(0,0,0,0.8);" >
				<div class="thumbnail">
					<img src="Pics/profpic.jpg" alt="Profile Picture" height="50%" width="50%">
				</div> 
				

				<h2 class="userprof"><font color="White">User Profile</font></h2>
				<h4><font color="White"><%
                                    out.print(col[1]);
                                    
                                    %></font></h4>
				<hr>
	
				<ul class="icons-list">
				
     <form id="myforms" name="myforms"   method="post" action="ChangeUser" style="color: White; width: 100%; ">
        Name:<br /> <input type="text"  name="name" classs="inputc" placeholder="ex@John" value="<%out.print(col[1]);   %>" maxlength="50" />
		<br /><br />
		Username:<br /> <input type="text"  name="uname" classs="inputc" value="<%out.print(col[2]);   %>" placeholder="username" maxlength="50"/>
		<br /><br />
		NIC:<br /> <input type="text" name="NIC" classs="inputc" value="<%out.print(col[3]);   %>" placeholder="97*******V" maxlength="50"/>
		<br /><br />
		Address: <br /><textarea type="text" style="height: 100px; width: 60%;" rows="3" name="address" classs="inputc"  value="" placeholder="ex@BOC Merchant Tower,St Michaels Rd, Colombo" maxlength="100"/><%out.print(col[4].toString());   %></textarea>
		<br /><br />
			Contact Number:<br /> <input type="tel"  classs="inputc" name="tele" placeholder="07* *** ****" pattern="[0-9]{10}" value="<%out.print(col[5]);   %>" required  maxlength="15"/>
		
		<br /><br />
		Licens  Number:<br /> <input type="text"  name="lnum" classs="inputc" value="<%out.print(col[6]);   %>" placeholder="ex@S123456789" maxlength="50"/>
		<br /><br />
		Vehical Number:<br /> <input type="text"  name="vnum" classs="inputc"  value="<%out.print(col[7]);   %>" placeholder="ex@ABC-1234" maxlength="50"/>
		<br /><br />
		Vehical Modle:<br /> <input type="text"  name="vmodel" classs="inputc"  value="<%out.print(col[8]);   %>" placeholder="ex@TATA" maxlength="50"/>
		<br /><br />
		Password:<br /> <input type="password" name="pass"  classs="inputc" value="<% out.print(col[9]);   %>" placeholder="***********" maxlength="50"/>
		<br /><br />
		<input type="checkbox" name="privacy"/> I have read and agree to the privacy policy 
		<br /><br />
		<input  class="butnupdate" type="submit" name="submit" onClick="validateForm()" value="Update">
                <br> <br> <br>
                <input class="butndelete" type="submit" name="submit"  onClick="validateForm()" value="Delete">

		</form>
			 	
	
	


	
                   
				</ul>
				<hr>
			</div>
			<div class="col-md-4"></div>
		</div>
	</div>
</div>                                                            
		</div> 	

</body>
</html>