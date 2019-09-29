<!DOCTYPE html>
<html>
<style>
input[type=text], select {
  width: 15%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=number], select {
  width: 15%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=date], select {
  width: 15%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
}

input[type=submit] {
  width: 8%;
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #45a049;
}

div {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}
body{background-image:url("hard.jpg")}

</style>
<head>
<meta charset="ISO-8859-1">
<title>Supplier Manage</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body >

<h3>Supplier Return</h3>
<div>
<form  method="post"><br><br>
 <label for="p_name">Product name </label>           :<input type="text" name="p_name" id="p_name"/><br><br>
<label for="p_ID">Product ID </label>              :<input type="text" name="p_ID" id="p_ID" /><br><br>
<label for="p_r">Product Return Reason </label>   :<input type="text" name="p_r" id="p_r"/><br><br>
<label for="stocks">Product Return Quantity </label> :<input type="number" name="stocks" id="stocks"/><br><br>
<label for="p_d">Product Return Date </label>     :<input type="date" name="p_d" id="p_d"/><br><br>
<label for="s_id">Supplier ID  </label>            :<input type="text" name="s_id" id="s_id" /><br><br>
<label for="s_name">Supplier Name </label>           :<input type="text" name="s_name" id="s_name"/><br><br>

<input type="submit" value="submit" id="save_data" />
</form>
</div>

<div>
<form action="supreturnretrieve.jsp" method="post"> <input type="submit" value="list" id="rid" /></form>
</div>

<!-- <a href="update.jsp?id=stocks"><button type="button" class="submit">update</button></a> -->
<a href="update.jsp?stocks=stocks & p_ID=p_ID"><button type="button" class="submit">update</button></a>
<script>
$(document).ready(function() {
$("#save_data").click(function() {
alert("succeess");
$.ajax({
url: "save.jsp",
type: "post",
data: {
p_name:$('#p_name').val(),
p_ID:$('#p_ID').val(),
p_r:$('#p_r').val(),
stocks:$('#stocks').val(),
p_d:$('#p_d').val(),
s_id:$('#s_id').val(),
s_name:$('#s_name').val(),

//success : function(data){
//alert(data);
//}
}
});
});
});
</script>

</body>
</html>