<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doːgather</title>
</head>
<body>
	<c:set var="cp" value="${pageContext.request.contextPath}"/>
	<h2>Doːgather</h2>
	<a href="${cp}/main.us">회원가입</a><br>
	<a href="${cp}/user/userjoin.us">회원가입</a><br>
	<a href="${cp}/user/userlogin.us">로그인</a><br>
	<a href="${cp}/app/board/boardlist.us">게시판 페이지</a><br>
</body>
</html>