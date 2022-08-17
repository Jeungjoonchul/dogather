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
<link rel="preconnect" href="https://fonts.gstatic.com/" />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet" />
<link rel="shortcut icon" href="${cp}/resources/images/favicon.png" />

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>


<title>Doːgather</title>
<link rel="stylesheet" href="${cp }/resources/css/include.css" />
<link rel="stylesheet" href="${cp }/resources/css/dogatherList.css" />
</head>
<style>

</style>

<body>
	<%-- 	로그인 후 이용해야할 때 사용
	<%@include file="/loginCheck.jsp" %> --%>
	<%@include file="/header.jsp"%>
	<main>
		<div id="main">
			<div id="dg_present">
				<div class="dg_present_title">
					<a href=""> <span class="purple">진행중</span><span> 두게더</span>
					</a>
				</div>
			</div>

			<div id="dogathermain_mould">
				<c:choose>
					<c:when test="${list.size()>1 and list!=null }">
						<c:set var="i" value="${0 }"/>
						<c:forEach var="dg" items="${list}">
							<c:choose>
								<c:when test="${i<5}">
								<div class="dogathermain_list dg_number${i }">
								<c:choose>
									<c:when test="${dg.dg_banner_sys eq null }">
										<c:choose>
											<c:when test="${dg.category_index eq 1 }"><div class="list_photo"><img src="${cp}/resources/images/default_health.png"/></div></c:when>
											<c:when test="${dg.category_index eq 2 }"><div class="list_photo"><img src="${cp}/resources/images/default_study.png"/></div></c:when>
											<c:when test="${dg.category_index eq 3 }"><div class="list_photo"><img src="${cp}/resources/images/default_refinement.png"/></div></c:when>
											<c:when test="${dg.category_index eq 4 }"><div class="list_photo"><img src="${cp}/resources/images/default_habit.png"/></div></c:when>
											<c:otherwise><div class="list_photo"><img src="${cp}/resources/images/default_economy.png"/></div></c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise>
									<div class="list_photo"><img src="${cp }/upload/images/dogather/banner/${dg.dg_banner_sys}"/></div>
									</c:otherwise>
								</c:choose>
									<div class="list_container">
										<span class="dg_title">제목</span> <br> <span>시작일: / 종료일: </span><br>
										<p class="list_container_contents"></p>
										<button class="ViewMore" type="button">자세히 보기</button>
									</div>
								</div>
								</c:when>
								
								<c:otherwise>
								<div class="dogathermain_list dg_number${i }" style="display: none">
								<c:choose>
									<c:when test="${dg.dg_banner_sys eq null }">
										<c:choose>
											<c:when test="${dg.category_index eq 1 }"><div class="list_photo"><img src="${cp}/resources/images/default_health.png"/></div></c:when>
											<c:when test="${dg.category_index eq 2 }"><div class="list_photo"><img src="${cp}/resources/images/default_study.png"/></div></c:when>
											<c:when test="${dg.category_index eq 3 }"><div class="list_photo"><img src="${cp}/resources/images/default_refinement.png"/></div></c:when>
											<c:when test="${dg.category_index eq 4 }"><div class="list_photo"><img src="${cp}/resources/images/default_habit.png"/></div></c:when>
											<c:otherwise><div class="list_photo"><img src="${cp}/resources/images/default_economy.png"/></div></c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise>
									<div class="list_photo"><img src="${cp }/upload/images/dogather/banner/${dg.dg_banner_sys}"/></div>
									</c:otherwise>
								</c:choose>
									<div class="list_container">
										<span class="dg_title">제목</span> <br> <span>시작일: / 종료일: </span><br>
										<p class="list_container_contents"></p>
										<button class="ViewMore" type="button">자세히 보기</button>
									</div>
								</div>
								</c:otherwise>
							</c:choose>
							
						<c:set var="i" value="${i+1}"/>
						</c:forEach>
						<button class="addlist" type="button">더보기</button>
						<div class="page-btns" style="display: none">
							<div>
								<c:if test="${startPage!=1 }">
									<a href="${cp }/dg/list.dg?page=${startPage-1}">&lt;</a>
								</c:if> 
								<c:forEach begin="${startPage }" end="${endPage }" var="i">
									<c:choose>
										<c:when test="${page==i }">
											<span class="nowPage">${i }</span>
										</c:when>
										<c:otherwise>
											<a href="${cp}/dg/list.dg?page=${i}">${i}</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:if test="${endPage!=totalPage }">
									<a href="${cp }/dg/list.dg?page=${endPage+1}">&gt;</a>
								</c:if>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="dogathermain_list">
							<p style="font-size: 40px; font-weight: bold;">두개더가 없습니다 ㅠㅠ</p>
							<p style="font-size: 40px; font-weight: bold;">첫번째 두개더의 주인공이 되어 주세요!!</p>
							<a href="${cp }/dg/create.dg" style="font-size: 40px; font-weight: bold; color:#621ae5">두개더 만들기</a>
						</div>
					</c:otherwise>
				</c:choose>
			</div>		
		</div>
	</main>
	<%@include file="/footer.jsp"%>
</body>
</html>