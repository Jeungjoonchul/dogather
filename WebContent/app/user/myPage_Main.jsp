<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <script src="${cp}/resources/js/cp.js"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    
    <link rel="preconnect" href="https://fonts.googleapis.com/" />
    <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;600;700;800;900&display=swap"
      rel="stylesheet"/>
    <link rel="shortcut icon" href="./img/favicon.png" />
	<link rel="stylesheet" href="${cp }/resources/css/include.css" />
	
<title>마이페이지</title>
<!--<link rel="stylesheet" href="${cp }/resources/css/myPage_sideBar.css" />-->
</head>
<body>
		<c:if test="${loginUser == null }">
			<script>
				let cp = "${pageContext.request.contextPath}";
				alert("로그인 후 이용하세요!");
				location.replace("${cp}/user/login.us");
			</script>
		</c:if>
	<%@include file="../../../header.jsp"%>
<main>
	<table>
		<form method="post" id="pwCheck" name="pwCheckForm" action="${cp}/user/pwCheck_ok.us?loginUser=${loginUser.user_email}">
			<tr>
				<td>현재 비밀번호</td>
				<td><input type="password" name="user_password" id="user_password" maxlength="24"></td>
				<input type="hidden" name="user_email" id="user_email" value="${loginUser.user_email}">
			</tr>
				<input type="submit" value="확인">
		</form>
	</table>
	
	
	
	<%@include file="../../../footer.jsp"%>
	
	
</main>
</body>
	<script src="${cp }/resources/js/myPage.js"></script>
</html>