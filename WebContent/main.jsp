<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doːgather</title>
 <link rel="stylesheet" href="${cp}/main.css">
 <script src="${cp}/main.js"></script>
</head>
<body>
메인
<a href="${cp}/user/user_logout.us">로그아웃</a>
</body>
</html>