<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="${cp}/resources/images/favicon.png" />
<title>Doːgather</title>
<style>
	body{
		width: 80%;
		margin: 0 auto;
	}
	body div{
		margin:0 auto;
		width:50%;
		font-size: 24px;
		font-weight:bold; 
		text-align: center;
	}
	body form{
		float:right;
	}
</style>

<!-- 인덱스 다시 보지 않기 체크 여부 확인 후 흐름 나눔 -->
<c:if test="${cookie.skip_index.value eq 'on'}">
	<script>
		location.href='${cp}/main';
	</script>	
</c:if>

</head>
<body>
<div>인.덱.스</div>
<form method="post" action="${cp}/main">
<input type="submit" value="메인으로 가기"/>
<label>다음부터는 이창 보지 않기</label><input type="checkbox" name="skip_index"/>
</form>
</body>
</html>