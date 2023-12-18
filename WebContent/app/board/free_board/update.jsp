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

<body>
<%@include file="../../../loginCheck.jsp" %>
	<c:if test="${not (loginUser.user_nickname eq b.user_nickname)}">
		<script>
			alert("글쓴이가 아닙니다");
			location.replace("${cp}/board/free_board/post_list.bo?page=${param.page}&keyword=${param.keyword}&subject=${param.subject}");
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
											<c:when test="${b.b_subject eq '잡담'}">
												<option value="잡담" selected>잡담</option>
												<option value="유머">유머</option>
												<option value="기타">기타</option>
											</c:when>
											<c:when test="${b.b_subject eq '유머'}">
												<option value="잡담">잡담</option>
												<option value="유머" selected>유머</option>
												<option value="기타">기타</option>
											</c:when>
											<c:otherwise>
												<option value="잡담">잡담</option>
												<option value="유머">유머</option>
												<option value="기타" selected>기타</option>
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
								<td><a href="javascript:postCheck();">수정완료</a> <a
									href="${cp }/board/free_board/post_list.bo?page=${param.page}&keyword=${param.keyword}&subject=${param.subject}">목록</a></td>
							</tr>
						</tbody>
					</table>
					<input type="hidden" name="b_files" value="${b.b_files }" /> 
					<input type="hidden" name="b_index" value="${b.b_index }" />
					<input type="hidden" name="page" value="${param.page}" />
					<input type="hidden" name="keyword" value="${param.keyword}" />
					<input type="hidden" name="subject" value="${param.subject}" />
					<textarea name="orgName" id="orgName" style="display: none;"></textarea>
					<textarea name="sysName" id="sysName" style="display: none;"></textarea>
				</form>
			</div>
		</div>
	</main>

	<%@include file="../../../footer.jsp"%>
</body>
</html>