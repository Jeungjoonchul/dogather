<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="cp" value="${pageContext.request.contextPath}"></c:set>
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
      rel="stylesheet"
    />
    <link rel="shortcut icon" href="${cp}/resources/images/favicon.png" />

   <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
    
<title>글쓰기</title>
<link rel="stylesheet" href="${cp }/resources/css/include.css" />
<link rel="stylesheet" href="${cp }/resources/css/boardWrite33.css" />

</head>
<body>
	<c:if test="${empty loginUser }">
		<script>
			alert("로그인 후 이용 가능합니다");
			location.replace("${cp}/user/login.us");
		</script>
	</c:if>
		<%@include file="../../../header.jsp"%>
		<main>
		<div id="main">
			<form method="post" action="${cp}/board/free_board/post_write_ok.bo"
				id="post_editor" name="post_editor">
				<table class="post_write">
				<tbody>
					<tr>
						<th>제목</th>
						<td><input type="text" name="b_title" id="b_title"></td>
					</tr>
					<tr>
						<th>작성자</th>
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
					<tr id="editor">
						<td colspan="2"><textarea id="summernote" name="b_contents"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2">
						<a href=javascript:postOn()>등록하기</a>
						<a
							href="${cp }/board/free_board/post_list.bo?page=${param.page}">목록</a>
						</td>
					</tr>
				</tbody>
				</table>
				<textarea name="orgName" id="orgName" style="display: none;"></textarea>
				<textarea name="sysName" id="sysName" style="display: none;"></textarea>
			</form>
		</div>
		</main>
		
		<%@include file="../../../footer.jsp"%>
</body>
<script src="${cp }/resources/js/summernote.js"></script>
<script src="${cp}/resources/js/board.js"></script>
<script>
/* $(document).ready(function(){
	$('#summernote').val('${fn:replace(productDetail.product_content,"\'","\\'")}');
	$('#summernote').summernote(setting);
}); */
</script>
</html>