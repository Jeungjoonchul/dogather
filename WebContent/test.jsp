<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<select >
	<option value="1" >1</option>
	<option value="" selected>2</option>
	<option value="3">3</option>
	<option value="4">4</option>
</select>
</body>
<script>
$(document).ready(function(){
	console.log($('select').val());
	console.log($('select').val()=='');
});
	$('select').change(function(){
		console.log($('select').val());
	});
</script>
</html>