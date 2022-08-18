<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="${cp}/resources/js/cp.js"></script>

<link rel="preconnect" href="https://fonts.googleapis.com/" />
<link rel="preconnect" href="https://fonts.gstatic.com/" />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet" />
<link rel="shortcut icon" href="${cp}/resources/images/favicon.png" />

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>


<title>Doːgather</title>
<link rel="stylesheet" href="${cp }/resources/css/include.css" />
</head>
<style>
	div{
		width: 500px;
		height:500px;
		display: none;
	}
	body>div:first-child {
	background-color: blue;
}
	body>div:last-child {
	background-color: deeppink;
}
</style>

<body>
	<div class="test1">asdf</div>
	<div class="test2">asdf</div>
	<input type="button" value="test1" id="show">
</body>
<script>
	$('#show').on('click',function(){
		$('.test'+1).show();
	});
</script>
</html>