<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:if test="${empty loginUser }">
	<c:choose>
		<c:when test="${empty cookie.autoLogin_check }">
		<script>
			alert('로그인 후 이용 가능합니다');
			location.replace("${cp}/user/login.us");
		</script>
		</c:when>
		<c:otherwise>
		<script>
			location.replace("${cp}/user/login.us");
		</script>
		</c:otherwise>
	</c:choose>
</c:if>