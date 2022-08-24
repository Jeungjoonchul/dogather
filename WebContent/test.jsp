<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
   <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<style>
	#modal{
		width: 800px;
		min-height: 500px;
		background-color: gray;
		display: flex;
		flex-direction: column;
		justify-content: space-between;
		text-align: center;
		box-sizing: border-box;
	}
	#modal *{
	box-sizing: border-box;}
	#modal>div{
		width: 80%;
		padding:20px;
		margin: 0 auto;
	}
	#post_info{
		display: flex;
		justify-content: space-between;
	}
</style>
<title>Doːgather</title>
</head>
<body>
<c:set var="test1" value="${'1' }"/>
<c:set var="test2" value="1"/>
<c:if test="${test1==test2 }">트루</c:if>
</body>
<script>
</script>
</html>