function validateAddAdminForm(){

	var letterNumber = /^[0-9a-zA-Z]+$/;
	var letter = /^[a-zA-Z]+$/;
	if(!(document.forms["addAdminfrm"]["a_id"].value.match(letterNumber) ) ) 
	{
		alert("enter a valid admin Id format: A012");
		document.addAdminfrm.a_id.focus();
		return false;
	}
	if((document.forms["addAdminfrm"]["a_id"].value.length) > 4  ) 
	{
		alert("enter a valid admin Id with maximum 4 characters");
		document.addAdminfrm.a_id.focus();
		return false;
	}

	if(!(document.forms["addAdminfrm"]["a_fname"].value.match(letter) ) ) 
	{
		alert("enter a valid fname with alphabatic characters only ");
		document.addAdminfrm.a_fname.focus();
		return false;
	}
	if(!(document.forms["addAdminfrm"]["a_lname"].value.match(letter) ) ) 
	{
		alert("enter a valid fname with alphabatic characters only ");
		document.addAdminfrm.a_lname.focus();
		return false;
	}
	if (isNaN(document.forms["addAdminfrm"]["a_age"].value)) {
		alert("Age should be a number ");
		document.addAdminfrm.a_age.focus();


		return false;
	}

	if (Number(document.forms["addAdminfrm"]["a_age"].value) <=15) {
		alert("Age should be a number greater than 15 ");
		document.addAdminfrm.a_age.focus();


		return false;
	}
	if (isNaN(document.forms["addAdminfrm"]["a_contact"].value)) {
		alert("contact number should be a number with 10 digits");
		document.addAdminfrm.a_contact.focus();

		return false;
	}
	if (document.forms["addAdminfrm"]["a_contact"].value.length != 10) {
		alert("contact should be a number with 10 digits");
		document.addAdminfrm.a_contact.focus();

		return false;
	}
	if (!(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(document.forms["addAdminfrm"]["a_email"].value)))
	{
		alert("You have entered an invalid email address!");
		document.addAdminfrm.a_email.focus();
		return false;
	}
	var passw = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,20}$/;
	
	if(!(document.forms["addAdminfrm"]["a_password"].value.match(passw ))) 
	{ 
	alert("InCorrect,password format: It should contain one uppercase , one lowercase and one numeric with at least 6 values")
	document.addAdminfrm.a_password.focus();
	return false;
	}
	if(document.forms["addAdminfrm"]["a_password"].value != document.forms["addAdminfrm"]["a_password2"].value ) 
	{ 
	alert("InCorrect,password format: It should contain one uppercase , one lowercase and one numeric with at least 6 values")
	document.addAdminfrm.a_password2.focus();
	return false;
	}



	return true;
}
