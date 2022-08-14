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

<title>Doːgather</title>
<script src="${cp}/resources/js/board.js"></script>
<link rel="stylesheet" href="${cp }/resources/css/include.css" />
<link rel="stylesheet" href="${cp }/resources/css/boardUpdate.css" />
</head>
<!-- <style>
#body {
	padding-top: 60px;
	padding-bottom: 60px;
}

#body table tr {
	text-align: left;
}

.post_update {
	text-align: center;
	margin: 0 auto;
}

.post_update>tbody>tr:last-child>td {
	text-align: right;
}

#post_title select {
	width: 200px;
	height: 40px;
	font-size: 16px;
	text-align: center;
	border: 1px solid #ccc;
	border-radius: 3px;
}

#post_title input {
	font-size: 16px;
	width: 750px;
	height: 36px;
	padding-right: 42px;
	border: 1px solid #ccc;
	border-radius: 3px;
}

#button_a a {
	text-align: right;
	display: inline-block;
	border-radius: 5px;
	padding: 10px;
	color: #fff;
	background-color: #621ae5;
	margin: 10px 5px 10px 0;
	text-decoration: none;
}

#button_a a:hover {
	background-color: #8757de;
}

#post_update_container {
	border: solid 1px #eee;
	border-top: 2px solid #621ae5;
	width: 1100px;
	margin: 0 auto;
	padding: 10px 0;
}

#post_update_title {
	margin: 0 auto;
	width: 90%;
	color: #141414;
	font-size: 24px;
}
/* #post_title td:nth-child(1){
width:100%;
} */
</style> -->
<body>
	<c:if test="${empty loginUser}">
		<script>
			alert("로그인 후 이용 가능합니다");
			location.replace("${cp}/user/login.us");
		</script>
	</c:if>
	<c:if test="${not (loginUser.user_nickname eq b.user_nickname)}">
		<script>
			alert("글쓴이가 아닙니다");
			location.replace("${cp}/board/free_board/post_list.bo?page=${param.page}");
		</script>
	</c:if>
	<%@include file="../../../header.jsp"%>
	<main>
		<div id="main">
			<div id="post_update_container">
				<div id="post_update_title">
					<h2>수정하기</h2>
				</div>
				<form method="post"
					action="${cp}/board/free_board/post_update_ok.bo" id="post_editor" name="post_editor">
					<table class="post_update">
						<tbody>
							<tr id="post_title">
								<td>
									<select name="b_subject">
										<c:choose>
											<c:when test="${b.b_subject eq '유머'}">
												<option value="유머">유머</option>
												<option value="잡담">잡담</option>
												<option value="기타">기타</option>
											</c:when>
											<c:when test="${b.b_subject eq '잡담'}">
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
									</select>
								</td>
								<td><input type="text" name="b_title" id="b_title"
									value="${b.b_title }" /></td>
							</tr>

							<tr style="display: none;">
								<th>작성자</th>
								<td><input type="text" name="user_nickname"
									value="${b.user_nickname }" readonly /></td>
							</tr>

							<tr>

								<td colspan="2"><textarea id="summernote" name="b_contents">${b.b_contents }</textarea></td>
							</tr>
							<tr id="button_a">
								<th></th>
								<td><a href="javascript:postOn();">수정완료</a> <a
									href="${cp }/board/free_board/post_list.bo?page=${param.page}&keyword=${param.keyword}">목록</a></td>
							</tr>
						</tbody>
					</table>
					<input type="hidden" name="b_files" value="${b.b_files }" /> 
					<input type="hidden" name="b_index" value="${b.b_index }" />
					<input type="hidden" name="page" value="${param.page}" />
					<input type="hidden" name="keyword" value="${param.keyword}" />
					<textarea name="orgName" id="orgName" style="display: none;"></textarea>
					<textarea name="sysName" id="sysName" style="display: none;"></textarea>
				</form>
			</div>
		</div>
	</main>

	<%@include file="../../../footer.jsp"%>
</body>
</html>