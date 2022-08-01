<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>board_list</title>
</head>
<body>
	<div style="margin: 0 auto; width: 1000px;">
		<!-- 타이틀과 글 개수 띄워주는 테이블 -->
		<table class="title">
			<tr align="center" valign="middle">
				<td><h3>board list</h3></td>
			</tr>
			<tr align="right" valign="middle">
				<td>글 개수 :${totalCnt}</td>
			</tr>
		</table>

		<!-- 게시글 리스트 띄우는 테이블 -->
		<table class="list">
			<tr align="center" valign="middle">
				<th width="8%">번호</th>
				<th width="50%">제목</th>
				<th width="15%">작성자</th>
				<th width="17%">날짜</th>
				<th width="10%">조회수</th>
			</tr>
			<c:choose>
				<c:when test="${list != null and list.size()>0 }">
					<c:forEach items="${list }" var="board">
					<!-- inactive가 false인 경우 활성화된 게시글 -->
					<c:if test="${board.tb_inactive==false}">
						<tr>
							<td>${board.tb_index}</td>
							<td><a href="${cp}/board/board_view.bo?tb_index=${board.tb_index}&page=${page}">${board.tb_title}</a></td>
							<td>${board.user_index}</td>
							<td>${board.tb_reg_date}<c:if
									test="${board.tb_reg_date!=board.tb_update_date}">(수정됨)</c:if></td>
							<td>${board.tb_hits}</td>
						</tr>
					</c:if>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="5" style="text-align: center; font-size: 20px;">등록된
							게시글이 없습니다.</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>
		<br>

		<!-- 페이징 처리하는 테이블 -->
		<table class="pagination">
			<tr align="center" valign="middle">
				<td><c:if test="${startPage!=1 }">
						<a href="${cp}/board/board_list.bo?page=${startPage-1}">&lt;</a>
					</c:if> <c:forEach begin="${startPage}" end="${endPage }" var="i">
						<c:choose>
							<c:when test="${page==i}">
								<span class="nowPage">${i}</span>
							</c:when>
							<c:otherwise>
								<a href="${cp}/board/board_list.bo?page=${i}">${i}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach> <c:if test="${endPage!=totalPage}">
						<a href="${cp}/board/board_list.bo?page=${endPage+1}">&gt;</a>
					</c:if></td>
			</tr>
		</table>
		<!-- 글쓰기 버튼 배치하는 테이블 -->
		<table style="border: 0px; width: 900px;">
			<tr align="right" valign="middle">
				<td><a class="write"
					href="${cp }/board/boardwrite.bo?page=${page}">글쓰기</a></td>
			</tr>
		</table>
		<div class="search_area">
			<input type="search" id="q" name="q"> <input type="button"
				value="검색" onclick="">
		</div>
	</div>
</body>
</html>