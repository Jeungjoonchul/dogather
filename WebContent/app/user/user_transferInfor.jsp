<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="http://code.jquery.com/jquery-1.4.4.min.js"></script>
<body>
	<c:if test="${loginUser == null }">
		<script>
			let cp = "${pageContext.request.contextPath}";
			alert("로그인 후 이용하세요!");
			location.replace("${cp}/user/login.us");
		</script>
	</c:if>
	<form method="post" id="userInfor" name="userInforForm" action="${cp}/user/userInforAction.us?userInfor=${loginUser.user_email}">
		<input type="hidden" name="user_email"></input>
	</form>
	<script type="text/javascript">
	this.document.getElementById("userInfor").submit();
	</script>
</body>
</html>