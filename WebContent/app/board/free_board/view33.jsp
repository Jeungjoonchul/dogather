<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="cp" value="${pageContext.request.contextPath}"></c:set>
<c:set var="today" value="<%=new java.util.Date()%>"></c:set>
<c:set var="today">
	<fmt:formatDate value="${today }" pattern="yyyy-MM-dd" />
</c:set>

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

	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<script src="${cp }/resources/js/summernote.js"></script>

<title>게시글 보기</title>
<link rel="stylesheet" href="${cp }/resources/css/include.css" />
</head>
<body>
<input type="hidden" id="loginUser_nickname" value="${loginUser.user_nickname}"/>
<input type="hidden" id="totalPage" value="${totalPage}">
<input type="hidden" id="totalCnt" value="${totalCnt}">
<input type="hidden" id="startPage" value="${startPage}">
<input type="hidden" id="endPage" value="${endPage}">
<input type="hidden" id="page" value="${page}">
<input type="hidden" name="b_index" id = "b_index" value="${fb.b_index }" />
<input type="hidden" id="r_name" name="r_name" value="t_fb_reply"/>
	<%@include file="../../../header.jsp"%>
	<div id="body">
		<div id="post">
			<form>
				<table>
				<tbody>
					<tr>
						<th>제목</th>
						<td><input type="text" name="b_title" value="${fb.b_title }"
							readonly /></td>
					</tr>
					<tr>
						<th>주제</th>
						<td><input type="text" name="b_subject"
							value="${fb.b_subject }" readonly /></td>
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
						<td>${fb.b_hits }</td>
					</tr>
					<tr>
						<th>내용</th>
						<td><div id="summernote">${fb.b_contents }</div></td>
					</tr>
					<tr>
						<th></th>
						<td><c:if
								test="${loginUser.user_nickname==fb.user_nickname }">
								<a
									href="${cp}/board/free_board/post_update.bo?b_index=${fb.b_index}&page=${param.page}">수정</a>
								<a href="javascript:delete_check(${fb.b_index});">삭제</a>
							</c:if> <a
							href="${cp }/board/free_board/post_list.bo?page=${param.page}">목록</a>
						</td>
					</tr>
				</tbody>
				</table>
			</form>
		</div>
		<div id="reply">
			<div id="reply_list_area"></div>
			<form name="reply_update" id="reply_update">
				<table id="reply_list">
					<tbody id="reply_contents">
					<c:choose>
					<c:when test="${fb_replies!=null and fb_replies.size()>0}">
					<c:set var="i" value="0"/>
						<c:forEach var="reply" items="${fb_replies}">
							<fmt:parseDate var="dateTime" value="${reply.r_reg_date }" pattern="yyyy-MM-dd HH:mm:ss" />
							<c:set var="date"><fmt:formatDate value="${dateTime }" pattern="yyyy-MM-dd" /></c:set>
							<c:set var="time"><fmt:formatDate value="${dateTime }" pattern="HH:mm" /></c:set>
							<tr class="replies">
								<td>${reply.user_nickname}</td>
								<td><textarea rows="2" cols="10" readonly
										style="resize: none; outline: none; border: none;" id="reply_contents${i }">${reply.r_contents }</textarea>
								</td>
								<td>${today eq date ? time : date }
								<c:if test="${reply.r_reg_date!=reply.r_update_date}">(수정됨)</c:if>
								</td>
								<td>
								<c:choose>
									<c:when test="${loginUser.user_index==reply.user_index }">
									<a id="reply_update_btn${i }" href="javascript:replyUpdate($('#reply${i}').val())">수정</a>
									<a id="reply_sumbit_btn${i }" href="#" style="display: none;">수정완료</a>
									<a href="#">삭제</a>
									</c:when>
									<c:otherwise>
									<a href="#">신고</a>
									</c:otherwise>
								</c:choose>
								<input type="hidden" id="reply${i}" value="${i}"/>
								</td>
							</tr>
							<c:set var="i" value="${i+1}"/>
						</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="4">작성된 댓글이 없습니다.</td>
							</tr>
						</c:otherwise>
						</c:choose>
					</tbody>
					<tfoot id="list_selector">
					<c:if test="${fb_replies!=null and fb_replies.size()>0}">
						<tr>
							<td colspan="4"><c:if test="${startPage!=1 }">
									<input type="button" class="reply_page_btn" value="&lt;"/>
								</c:if> <c:forEach begin="${startPage }" end="${endPage }" var="i">
									<c:choose>
										<c:when test="${page==i }">
											<span>${i }</span>
										</c:when>
										<c:otherwise>
											<input type="button" class="reply_page_btn" value="${i}"/>
										</c:otherwise>
									</c:choose>
								</c:forEach> <c:if test="${endPage!=totalPage }">
									<input type="button" class="reply_page_btn" value="&gt;"/>
								</c:if></td>
						</tr>
						</c:if>
						
					</tfoot>
					
				</table>
			</form>
			<div id="reply_write_area"></div>
			<form name="reply_write" id="reply_write">
				<table>
					<tr>
						<th>댓글</th>
						<td>
						<textarea name="r_contents" id="r_contents" rows="4" cols="30" style="resize: none;" placeholder="아름다운 댓글을 작성해주세요"></textarea>
						<a href="javascript:replyOn(${empty loginUser},$('#r_name').val(),$('#b_index').val(),${empty loginUser?null:loginUser.user_index})">등록</a></td>
					</tr>
				</table>
			</form>
		</div>

	</div>
	<%@include file="../../../footer.jsp"%>
</body>
<script src="${cp }/resources/js/board.js"></script>
<script>
	$(document).ready(function() {
		$('#summernote').summernote('destroy');			
	});
</script>
</html>