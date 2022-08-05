<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doːgather</title>
</head>
<body>
인덱스
<a href="${cp}/main" >메인으로 가기</a>
<form>
<input type="checkbox" name="skip_intro" value="skip"/>
</form>
<p id="test"></p>
</body>
<script>
	$('input').change({
		$()
	});
</script>
</html>