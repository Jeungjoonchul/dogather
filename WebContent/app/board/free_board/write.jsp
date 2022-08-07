<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
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
</head>
<body>
	<form method="post" action="${cp}/board/board_write.bo"
		id="board_editor" name="board_editor">
		<table>
			<tr>
				<td>제목</td>
				<td><input type="text" name="tb_title"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="user_id" value = "${loginUser.user_nickname }" readonly></td>
			</tr>
			<tr>
				<td colspan="2"><textarea id="summernote" name="tb_contents"></textarea>
				</td>
			</tr>
		</table>
		<input type="submit" value="전송">
		<textarea name="orgName" id="orgName" style="display: none;"></textarea>
		<textarea name="sysName" id="sysName" style="display: none;"></textarea>
	</form>
</body>
</html>