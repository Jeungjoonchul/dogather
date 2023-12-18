<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath}"></c:set>
<c:set var="now" value="<%=new java.util.Date()%>" />
<c:set var="now">
	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" />
</c:set>
<!DOCTYPE html>
<html lang="en">
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
<title>Doːgather</title>
<link rel="stylesheet" href="${cp }/resources/css/boardList.css" />
<link rel="stylesheet" href="${cp }/resources/css/include.css" />
</head>
<body>


	<%@include file="../../../header.jsp"%>

	<main>
	<div id="main">

		<!-- 자유 게시판 -->
		<div id="boardcontainer">
			<div id="boardmain">
				<div class="board title">
					<span class="purple">자유</span><span> 게시판</span>
				</div>
<%-- 				<div class="board_filter">
				<select id="subject">
					<c:choose>
						<c:when test="${subject eq ''}">
						<option value="">전체</option>
						<option value="" selected></option>
						<option value=""></option>
						<option value=""></option>
						</c:when>
						<c:when test="${subject eq ''}">
						<option value="">전체</option>
						<option value=""></option>
						<option value="" selected></option>
						<option value=""></option>
						</c:when>
						<c:when test="${subject eq ''}">
						<option class="filter" value="">전체</option>
						<option value=""></option>
						<option value=""></option>
						<option value="" selected></option>
						</c:when>
						<c:otherwise>
						<option value="" selected>전체</option>
						<option value=""></option>
						<option value=""></option>
						<option value=""></option>
						</c:otherwise>
					</c:choose>
					</select>
				</div> --%>
				<div class="board_list">
					<table class="list">
						<tbody>
							<tr class="tableh">
								<th class="boardnum">번호</th>
								<th class="boardtitle">제목</th>
								<th class="boarduser">작성자</th>
								<th class="boarddate">날짜</th>
								<th class="boardview">조회수</th>
							</tr>
							<c:choose> 
								<c:when test="${b_list.size()>0 and b_list!=null }">
									<c:forEach var="list" items="${b_list}">

										<tr>
											<td>${list.b_index}</td>
											<td><a
												href="${cp}/board/notice_board/post_view.bo?b_index=${list.b_index}&page=${page}&keyword=${keyword}&subject=${subject}"><span>${list.b_title}</span><span>[${list.b_reply_cnt }]</span></a></td>
											<td><a href="#">${list.user_nickname}</a></td>
											<td><fmt:parseDate value="${list.b_reg_date}" pattern="yyyy-MM-dd HH:mm:ss" var="datetime" /> 
											<c:set var="date"> <fmt:formatDate value="${datetime }" pattern="yyyy-MM-dd" /></c:set> 
											<c:set var="time"> <fmt:formatDate value="${datetime }" pattern="HH:mm" /></c:set> 
											<span>${now eq date ? time:date }</span> 
											<span><c:if test="${list.b_reg_date!=list.b_update_date}">(수정됨)</c:if></span>
											</td>
											<td>${list.b_hits}</td>
										</tr>

									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="5">게시글이 없습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
						<tfoot>
							<tr class="page-btns">
								<td colspan="5">
								<c:if test="${startPage!=1 }">
										<a href="${cp }/board/notice_board/post_list.bo?page=${startPage-1}&keyword=${keyword}&subject=${subject}">&lt;</a>
									</c:if> 
									<c:forEach begin="${startPage }" end="${endPage }" var="i">
										<c:choose>
											<c:when test="${page==i }">
												<span class="nowPage">${i }</span>
											</c:when>
											<c:otherwise>
												<a href="${cp}/board/notice_board/post_list.bo?page=${i}&keyword=${keyword}&subject=${subject}">${i}</a>
											</c:otherwise>
										</c:choose>
									</c:forEach> <c:if test="${endPage!=totalPage }">
										<a
											href="${cp }/board/notice_board/post_list.bo?page=${endPage+1}&keyword=${keyword}&subject=${subject}">&gt;</a>
									</c:if></td>
							</tr>
						</tfoot>
					</table>
					<table class="writing">
						<tr>
							<td>&nbsp;</td>
						</tr>
					</table>
					<div class="search_area">
						<input type="search" id="post_query_keyword" value="${keyword==null||keyword==''? '':keyword }"/><input type="button" id="post_query_btn" value="검색"/>
						<input type="hidden" id="path" value="notice_board"/>
						<input type="hidden" id="page" value="${page }"/>
					</div>
				</div>
			</div>
		</div>
	</div>
	</main>
	<%@include file="../../../footer.jsp"%>


</body>
<script src="${cp}/resources/js/board.js"></script>
</html>
