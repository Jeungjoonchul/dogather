<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	a{
		text-decoration: none;
		color:000000;
	}
</style>
</head>
<body>
<a class='btn' href="">버튼1</a>
<a class='btn'href="">버튼2</a>
</body>
<script>
$('.btn').on('focus',function(e){
		$(e.target).text('눌려짐');
	})
</script>
</html>