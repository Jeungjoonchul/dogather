<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="${cp}/resources/js/cp.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com/" />
<link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet" />
<link rel="shortcut icon" href="${cp}/resources/images/favicon.png" />

<!-- <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script> -->
	 <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<script src="${cp }/resources/js/summernote.js"></script>

<title>Insert title here</title>
<script src="${cp}/resources/js/board.js"></script>
<link rel="stylesheet" href="${cp }/resources/css/include.css" />
</head>
<body>
	<c:if test="${empty loginUser}">
		<script>
			alert("로그인 후 이용 가능합니다");
			location.replace("${cp}/user/login.us");
		</script>
	</c:if>
	<c:if test="${not (loginUser.user_nickname eq fb.user_nickname)}">
		<script>
			alert("글쓴이가 아닙니다.");
			location
					.replace("${cp}/board/free_board/post_list.bo?page=${param.page}");
		</script>
	</c:if>
	<%@include file="../../../header.jsp"%>
	<div id="body">
		<form method="post" action="${cp}/board/free_board/post_update_ok.bo"
			id="post_editor" name="post_editor">
			<table>
				<tr>
					<th>제목</th>
					<td><input type="text" name="b_title" id="b_title"
						value="${fb.b_title }" /></td>
				</tr>
				<tr>
					<th>주제</th>
					<td><select name="b_subject">
							<c:choose>
								<c:when test="${fb.b_subject eq '유머'}">
									<option value="유머">유머</option>
									<option value="잡담">잡담</option>
									<option value="기타">기타</option>
								</c:when>
								<c:when test="${fb.b_subject eq '잡담'}">
									<option value="잡담">잡담</option>
									<option value="유머">유머</option>
									<option value="기타">기타</option>
								</c:when>
								<c:otherwise>
									<option value="기타">기타</option>
									<option value="유머">유머</option>
									<option value="잡담">잡담</option>
								</c:otherwise>
							</c:choose>
					</select></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input type="text" name="user_nickname"
						value="${fb.user_nickname }" readonly /></td>
				</tr>
				<tr>
					<th>작성일</th>
					<td>${fb.b_reg_date}<c:if
							test="${fb.b_reg_date!=fb.b_update_date}">(수정됨 : <span>${fb.b_update_date }</span>)</c:if></td>
				</tr>
				<tr>
					<th>조회수</th>
					<td>${fb.b_hits}</td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea id="summernote" name="b_contents">${fb.b_contents }</textarea></td>
				</tr>
				<tr>
					<th></th>
					<td><a href="javascript:postOn();">수정완료</a> <a
						href="${cp }/board/free_board/post_list.bo?page=${param.page}">목록</a></td>
				</tr>
			</table>
			<input type="hidden" name="b_files" value="${fb.b_files }" /> <input
				type="hidden" name="b_index" value="${fb.b_index }" /> <input
				type="hidden" name="page" value="${param.page}" />
			<textarea name="orgName" id="orgName" style="display: none;"></textarea>
			<textarea name="sysName" id="sysName" style="display: none;"></textarea>
		</form>
	</div>
	<%@include file="../../../footer.jsp"%>
</body>
</html>