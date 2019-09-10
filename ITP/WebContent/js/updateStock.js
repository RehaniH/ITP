function validateUpdateStockForm() {
	
	var letterNumber = /^[0-9a-zA-Z]+$/;
	var letter = /^[a-zA-Z]+$/;
	var lettersws= /[^a-bA-B\s]/;
	if(!(document.forms["Ustockfrm"]["st_pid"].value.match(letterNumber) ) ) 
	{
		alert("enter a valid product Id format: P0125");
		document.Ustockfrm.st_pid.focus();
		return false;
	}
	if((document.forms["Ustockfrm"]["st_pid"].value.length) > 8  ) 
	{
		alert("enter a valid product Id with maximum 8 characters");
		document.Ustockfrm.st_pid.focus();
		return false;
	}

	if(!(document.forms["Ustockfrm"]["st_pname"].value.match(lettersws) ) ) 
	{
		alert("enter a valid  product name with alphabatic characters only ");
		document.Ustockfrm.st_pname.focus();
		return false;
	}
	

	if (isNaN(document.forms["Ustockfrm"]["st_stock"].value)) {
		alert("Stock should be a number ");
		document.Ustockfrm.st_stock.focus();
		

		return false;
	}
	
	

	return true;
}
