<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 보기</title>
<script src="${cp}/resources/js/cp.js"></script>
<link rel="stylesheet" href="${cp }/resources/css/include.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com/" />
    <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;600;700;800;900&display=swap"
      rel="stylesheet"
    />
    <!-- include libraries(jQuery, bootstrap) -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/lang/summernote-ko-KR.min.js"></script>
</head>
<body>
<%@include file="../../../header.jsp" %>
<div id="main">
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
				<td><div id="">${fb.b_contents }</div></td>
			</tr>
			<tr>
				<th></th>
				<td>
				<c:if test="${loginUser.user_nickname==fb.user_nickname }">
					<a href="${cp}/board/free_board/update.bo?b_index=${fb.b_index}&page=${param.page}">수정</a>
					<a href="javascript:delete_check(${fb.b_index});">삭제</a>					
				</c:if>
				<a href="${cp }/board/free_board/list.bo?page=${param.page}">목록</a>
				</td>
			</tr>
		</table>
	</form>
</div>
<%@include file="../../../footer.jsp" %>
</body>
<script src="${cp }/resources/js/board.js"></script>
<script>
$(document).ready(function() {
	$('#summernote').summernote('destroy');
});
</script>
</html>