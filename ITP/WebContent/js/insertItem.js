function validateForm() {
	
	var letterNumber = /^[0-9a-zA-Z]+$/;
	var letter = /^[a-zA-Z]+$/;
	var lettersws= /[^a-bA-B\s]/;
	if(!(document.forms["frm"]["product_id"].value.match(letterNumber) ) ) 
	{
		alert("enter a valid product Id format: P0125");
		document.frm.product_id.focus();
		return false;
	}
	if((document.forms["frm"]["product_id"].value.length) > 8  ) 
	{
		alert("enter a valid product Id with maximum 8 characters");
		document.frm.a_id.focus();
		return false;
	}

	if(!(document.forms["frm"]["product_name"].value.match(lettersws) ) ) 
	{
		alert("enter a valid  product name with alphabatic characters only ");
		document.frm.product_name.focus();
		return false;
	}
	if((document.forms["frm"]["supplier_name"].value.length) > 30  ) 
	{
		alert("enter a valid product Id with maximum 8 characters");
		document.frm.supplier_name.focus();
		return false;
	}
	
	if(!(document.forms["frm"]["supplier_name"].value.match(lettersws) ) ) 
	{
		alert("enter a valid supplier name with alphabatic characters only ");
		document.frm.supplier_name.focus();
		return false;
	}

	if (isNaN(document.forms["frm"]["cost_price"].value)
			&& isNaN(document.forms["frm"]["selling_price"].value)) {
		alert("Selling  price and Cost Price should be a number ");
		document.frm.selling_price.focus();
		document.frm.cost_price.focus();

		return false;
	}
	if (isNaN(document.forms["frm"]["supplier_contact"].value)) {
		alert("supplier_contact should be a number with 10 digits");
		document.frm.supplier_contact.focus();

		return false;
	}
	if (document.forms["frm"]["supplier_contact"].value.length != 10) {
		alert("supplier_contact should be a number with 10 digits");
		document.frm.supplier_contact.focus();

		return false;
	}
	if (isNaN(document.forms["frm"]["product_unitSize"].value)) {
		alert("unit Size should be a number greater than 0");
		document.frm.product_unitSize.focus();

		return false;
	}
	if (Number(document.forms["frm"]["product_unitSize"].value) <= 0) {
		alert("unit Size should be a number greater than 0");
		document.frm.product_unitSize.focus();

		return false;
	}
	var costPrice = Number(document.forms["frm"]["cost_price"].value);
	var sellingPrice = Number(document.forms["frm"]["selling_price"].value);
	if (costPrice <= 0 && sellingPrice <= 0) {
		alert("Selling  price and cost price should be greater than 0  ");
		document.frm.selling_price.focus();
		document.frm.cost_price.focus();

		return false;
	}
	if (costPrice > sellingPrice) {
		alert("Selling  price Should be greater than cost price " + costPrice);
		document.frm.selling_price.focus();

		return false;
	}
	if (isNaN(document.forms["frm"]["buffer_stock"].value)) {
		alert("unit Size should be a number greater than 0");
		document.frm.buffer_stock.focus();

		return false;
	}
	if (Number(document.forms["frm"]["buffer_stock"].value) <= 10) {
		alert("unit Size should be a number greater than 0");
		document.frm.buffer_stockproduct_unitSize.focus();

		return false;
	}

	return true;
}
