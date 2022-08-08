<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/lang/summernote-ko-KR.min.js"></script>
<link href="${cp }/resources/css/new.css" rel="stylesheet">



<script>
	$(document).ready(function() {
		//여기 아래 부분
		
		$('#summernote').summernote('destroy');
	});
</script>
</head>
<body>
	<%@include file="header.jsp" %>
	<div id="body">
		<form method="post" action="${cp}/board/board_imageUpload.bo">
		<table>
			<tr>
				<td>제목</td>
				<td><input type="text" name="subject"></td>
			</tr>
			<tr>
				<td colspan="2">
				<div id="summernote"><p><img style="width: 25%;" src="/dogather/upload/images/free_board/38e00907-8075-4736-8c7b-05117f13d955"><img style="width: 25%;" src="/dogather/upload/images/free_board/1016a556-5c52-46c2-b0cd-9e1aa9b6a97f"><br></p></div>
				</td>
			</tr>
		</table>
		<input type="submit" value="전송">
		<img src="">
	</form>
	</div>

	<%@include file="footer.jsp" %>
</body>
</html>