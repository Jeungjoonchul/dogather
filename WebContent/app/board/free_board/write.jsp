<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
<script src="${cp}/resources/js/cp.js"></script>
<link rel="stylesheet" href="${cp }/resources/css/include.css" />
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
<script src="${cp}/resources/js/summernote.js"></script>

<link rel="stylesheet" href="${cp }/resources/css/include.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com/" />
    <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;600;700;800;900&display=swap"
      rel="stylesheet"
    />
</head>
<body>
	<c:if test="${empty loginUser }">
		<script>
			alert("로그인 후 이용 가능합니다");
			location.replace("${cp}/user/login.us");
		</script>
	</c:if>


		<%@include file="../../../header.jsp"%>
		<div id="body">
			<form method="post" action="${cp}/board/free_board/write_ok.bo"
				id="post_editor" name="post_editor">
				<table style="margin: 0 auto;">
					<tr>
						<th>제목</td>
						<td><input type="text" name="b_title" id="b_title"></td>
					</tr>
					<tr>
						<th>작성자</td>
						<td><input type="text" name="user_id"
							value="${loginUser.user_nickname }" readonly></td>
					</tr>
					<tr>
					<th>주제</th>
					<td>
						<select name="b_subject">
						<option value="잡담">잡담</option>
						<option value="유머">유머</option>
						<option value="기타">기타</option>
						</select>
					</td>
					</tr>
					<tr>
						<td colspan="2"><textarea id="summernote" name="b_contents"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2"><a href=javascript:postOn()>글쓰기</a></td>
					</tr>
				</table>
				<textarea name="orgName" id="orgName" style="display: none;"></textarea>
				<textarea name="sysName" id="sysName" style="display: none;"></textarea>
			</form>
		</div>
		<%@include file="../../../footer.jsp"%>
</body>
<script src="${cp}/resources/js/board.js"></script>
</html>