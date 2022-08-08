<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 보기</title>
<link rel="stylesheet" href="${cp }/resources/css/include.css" />
</head>
<body>
<%@include file="../../../header.jsp" %>
<div id="main" style="clear:both;">
	<form>
		<table>
			<tr>
				<th>제목</th>
				<td><input type="text" name="b_title" value="${fb.b_title }" readonly/></td>
			</tr>
			<tr>
				<th>주제</th>
				<td><input type="text" name="b_subject" value="${fb.b_subject }" readonly/></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="user_nickname" value="${fb.user_nickname }" readonly/></td>
			</tr>
			<tr>
				<th>작성일</th>
				<td>${fb.b_reg_date}<c:if test="${fb.b_reg_date!=fb.b_update_date}">(수정됨 : <span>${fb.b_update_date }</span>)</c:if></td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${fb.b_hits }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><div>${fb.b_contents }</div></td>
			</tr>
			<tr>
				<th></th>
				<td>
				<c:if test="${loginUser.user_nickname==fb.user_nickname }">
					<a href="${cp}/board/free_board/update.bo?${fb.b_index}&page=${param.page}">수정</a>
					<a href="${cp}/board/free_board/delete.bo?${fb.b_index}">삭제</a>					
				</c:if>
				<a href="${cp }/board/free_board/list.bo?page=${param.page}">목록</a>
				</td>
			</tr>
		</table>
	</form>
</div>
<%@include file="../../../footer.jsp" %>
</body>
</html>