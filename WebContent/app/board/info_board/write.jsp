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
    
<title>Doːgather</title>
<link rel="stylesheet" href="${cp }/resources/css/include.css" />
<link rel="stylesheet" href="${cp }/resources/css/boardWrite.css" />

</head>
<body>
<%@include file="../../../loginCheck.jsp" %>
		<%@include file="../../../header.jsp"%>
		<main>
		<div id="main">
		<div id="post_write_container">
		<div id="post_write_title">
			<h2>새 글 작성하기</h2>
		</div>
			<form method="post" action="${cp}/board/info_board/post_write_ok.bo"
		
				id="post_editor" name="post_editor">
				<table class="post_write">
				<tbody>
					<tr id="post_title">
						<td>
						<select name="b_subject">
						<c:choose>
						<c:when test="${subject eq '건강'}">
						<option value="건강" selected>건강</option>
						<option value="학습">학습</option>
						<option value="교양">교양</option>
						<option value="습관">습관</option>
						<option value="경제">경제</option>
						<option value="기타">기타</option>
						</c:when>
						<c:when test="${subject eq '학습'}">
						<option value="건강">건강</option>
						<option value="학습" selected>학습</option>
						<option value="교양">교양</option>
						<option value="습관">습관</option>
						<option value="경제">경제</option>
						<option value="기타">기타</option>
						</c:when>
						<c:when test="${subject eq '교양'}">
						<option value="건강">건강</option>
						<option value="학습">학습</option>
						<option value="교양" selected>교양</option>
						<option value="습관">습관</option>
						<option value="경제">경제</option>
						<option value="기타">기타</option>
						</c:when>
						<c:when test="${subject eq '습관'}">
						<option value="건강">건강</option>
						<option value="학습">학습</option>
						<option value="교양">교양</option>
						<option value="습관" selected>습관</option>
						<option value="경제">경제</option>
						<option value="기타">기타</option>
						</c:when>
						<c:when test="${subject eq '경제'}">
						<option value="건강">건강</option>
						<option value="학습">학습</option>
						<option value="교양">교양</option>
						<option value="습관">습관</option>
						<option value="경제" selected>경제</option>
						<option value="기타">기타</option>
						</c:when>
						<c:otherwise>
						<option value="건강">건강</option>
						<option value="학습">학습</option>
						<option value="교양">교양</option>
						<option value="습관">습관</option>
						<option value="경제">경제</option>
						<option value="기타">기타</option>
						</c:otherwise>
						</c:choose>
						</select>
					</td>
						<td><input type="text" name="b_title" id="b_title" placeholder="제목을 입력해주세요"></td>
					</tr>
					<tr style="display: none;">
						<th>작성자</th>
						<td><input type="text" name="user_id" 
							value="${loginUser.user_nickname }" readonly></td>
					</tr>
					<tr>
					</tr>
					<tr id="editor">
						<td colspan="2"><textarea id="summernote" name="b_contents"></textarea>
						</td>
					</tr>
					<tr id="button_a">
						<td colspan="2">
						<a href=javascript:postCheck()>등록하기</a>
						<a
							href="${cp }/board/info_board/post_list.bo?page=${param.page}&keyword=${param.keyword}&subject=${param.subject}">목록</a>
						</td>
					</tr>
				</tbody>
				</table>
				<textarea name="orgName" id="orgName" style="display: none;"></textarea>
				<textarea name="sysName" id="sysName" style="display: none;"></textarea>
				<input type="hidden" id="page" name="page" value="${param.page}"/>
				<input type="hidden" id="keyword" name="keyword" value="${param.keyword}"/>
				<input type="hidden" id="subject" name="subject" value="${param.subject}"/>
			</form>
		</div>
		</div>
		</main>
		
		<%@include file="../../../footer.jsp"%>
</body>
<script src="${cp }/resources/js/summernote.js"></script>
<script src="${cp}/resources/js/board.js"></script>

</html>