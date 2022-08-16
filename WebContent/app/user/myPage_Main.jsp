<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath }"/>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="preconnect" href="https://fonts.googleapis.com/" />
    <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;600;700;800;900&display=swap"
      rel="stylesheet"
    />
    <link rel="shortcut icon" href="./img/favicon.png" />
<title>마이페이지</title>
<link rel="stylesheet" href="${cp }/resources/css/include.css" />
<!--<link rel="stylesheet" href="${cp }/resources/css/myPage_sideBar.css" />-->
</head>
<body>
	<%@include file="../../../header.jsp"%>
<main>
<div style="width:80% ">
	<%@include file="../../../myPage_sideBar.jsp" %> 
	<table>
		<form action="">
			<tr>
				<td>현재 비밀번호</td>
				<td><input type="password" name="" id="" /></td>
			</tr>
			<div>
				<input type="submit" value="변경">
				<input type="button" value="취소">
			</div>
		</form>
	</table>
</div>

	
	
	
	
	<%@include file="../../../footer.jsp"%>
	
	
</main>
</body>
</html>