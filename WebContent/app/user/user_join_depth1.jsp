<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <c:set var="cp" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doːgather 이용약관</title>
</head>
<body>
	<form name="terms_form" onsubmit="return sendit_terms()" action="${cp}/user/user_join_depth2.us" method="get">
		<c:forEach var="terms" items="${terms_list}">
		
		<tr>
		<td class="terms_${terms.terms_index}_${terms.terms_type}">
			<div>
			${terms.terms_title}
			<c:choose>
				<c:when test="${terms.terms_type eq 'essential'}">
				(필수)
				</c:when>
				<c:otherwise>
				(선택)
				</c:otherwise>
			</c:choose>
			</div>
			<div>
			${terms.terms_contents}
			</div>
			<div>
			<input type="checkbox" name="user_terms_type${terms.terms_index}">
			</div>
		</td>
		</tr>
		</c:forEach>
		<input type="submit">
	</form>
</body>
<script src="${cp}/resources/js/join.js"></script>
</html>