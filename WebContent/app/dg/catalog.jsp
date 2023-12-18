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
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">

<title>Doːgather</title>
<link rel="stylesheet" href="${cp }/resources/css/include.css" />
<link rel="stylesheet" href="${cp }/resources/css/dogatherCatalog.css" />
</head>


<body>
	<%-- 	로그인 후 이용해야할 때 사용
	<%@include file="/loginCheck.jsp" %> --%>
	<%@include file="/header.jsp"%>
	<main>
		<div id="main">
			<div id="dg_present">
				<div class="dg_present_title">
					<a href="${cp }/dg/catalog.dg"> <span class="purple">진행중</span><span> 두게더</span>
					</a>
				</div>
			</div>
<form action="${cp }/dg/catalog.dg" method="post">
					<div id="navi">
					<select name="category_index">
					<c:choose>
						<c:when test="${category_index eq '1' }">
						<option value="">전체</option>
						<option value="1" selected="selected">건강</option>
						<option value="2">학습</option>
						<option value="3">교양</option>
						<option value="4">습관</option>
						<option value="5">경제</option>
						</c:when>
						<c:when test="${category_index eq '2' }">
						<option value="">전체</option>
						<option value="1">건강</option>
						<option value="2" selected="selected">학습</option>
						<option value="3">교양</option>
						<option value="4">습관</option>
						<option value="5">경제</option>
						</c:when>
						<c:when test="${category_index eq '3' }">
						<option value="">전체</option>
						<option value="1">건강</option>
						<option value="2">학습</option>
						<option value="3" selected="selected">교양</option>
						<option value="4">습관</option>
						<option value="5">경제</option>
						</c:when>
						<c:when test="${category_index eq '4' }">
						<option value="">전체</option>
						<option value="1">건강</option>
						<option value="2">학습</option>
						<option value="3">교양</option>
						<option value="4" selected="selected">습관</option>
						<option value="5">경제</option>
						</c:when>
						<c:when test="${category_index eq '5' }">
						<option value="">전체</option>
						<option value="1">건강</option>
						<option value="2">학습</option>
						<option value="3">교양</option>
						<option value="4">습관</option>
						<option value="5" selected="selected">경제</option>
						</c:when>
						<c:otherwise>
						<option value="" selected="selected">전체</option>
						<option value="1">건강</option>
						<option value="2">학습</option>
						<option value="3">교양</option>
						<option value="4">습관</option>
						<option value="5">경제</option>
						</c:otherwise>
					</c:choose>
					</select>
					
					
					<select name="criteria_key">
						<c:choose>
							<c:when test="${criteria_key eq 'dg_index' }">
								<option value="dg_index" selected="selected">만든 날짜</option>
								<option value="dg_member_cnt">회원 수</option>
								<option value="dg_hits">조회 수</option>
							</c:when>
							<c:when test="${criteria_key eq 'dg_member_cnt' }">
								<option value="dg_index">만든 날짜</option>
								<option value="dg_member_cnt" selected="selected">회원 수</option>
								<option value="dg_hits">조회 수</option>
							</c:when>
							<c:otherwise>
								<option value="dg_index">만든 날짜</option>
								<option value="dg_member_cnt">회원 수</option>
								<option value="dg_hits" selected="selected">조회 수</option>
							</c:otherwise>
						</c:choose>
					</select>
					
					
					<select name="align">
					<c:choose>
						<c:when test="${align eq 'desc' }">
						<option value="desc" selected="selected">내림차순</option>
						<option value="asc">오름차순</option>
						</c:when>
						<c:otherwise>
						<option value="desc">내림차순</option>
						<option value="asc"  selected="selected">오름차순</option>
						</c:otherwise>
					</c:choose>
					</select>
					<input type="hidden" value="${dg_page }" name="dg_page"/>
					<input type="text" name="keyword" value="${keyword }" placeholder="search">
					<i class="fa-regular fa-magnifying-glass"></i>
					<label for="search_txt_sBtn"><i class="xi-search purple"></i></label><input type="submit" value="제출하기" id="search_txt_sBtn" style="display: none;"/>
					</div>
					</form>
			<div id="dogathermain_mould">
				<c:choose>
					<c:when test="${list.size()>0 and list!=null }">
						<c:set var="i" value="${0}"/>
						<c:forEach var="dg" items="${list}">
							<c:choose>
								<c:when test="${i<5}">
								<div class="dg_number${i } dogathermain_list">
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
										<h3 class="dg_title">${dg.dg_title }</h3>
										<p class="dg_maker">만든 사람 : ${dg.user_nickname }</p>
										<p class="dg_info"><span>참여자 수 : ${dg.dg_member_cnt }</span><span>&nbsp;<c:if test="${dg.dg_expire!=null }">종료일 : ${dg.dg_expire }</c:if></span></p>
										<div class="list_container_contents"><p class="dg_intro">${dg.dg_intro }</p></div>
											<a class="viewMore" href="${cp}/dg/detail.dg?dg_index=${dg.dg_index}&dg_page=${dg_page}&criteria_key=${criteria_key}&align=${align}&keyword=${keyword}&category_index=${category_index}">자세히 보기</a>
									</div>
								</div>
								</c:when>
								
								<c:otherwise>
								<div class="dg_number${i } dogathermain_list" style="display: none;">
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
										<h3 class="dg_title">${dg.dg_title }</h3>
										<p class="dg_maker">만든 사람 : ${dg.user_nickname }</p>
										<p class="dg_info"><span>참여자 수 : ${dg.dg_member_cnt }</span><span>&nbsp;<c:if test="${dg.dg_expire!=null }">종료일 : ${dg.dg_expire }</c:if></span></p>
										<div class="list_container_contents"><p class="dg_intro">${dg.dg_intro }</p></div>
										<a class="viewMore" href="${cp}/dg/detail.dg?dg_index=${dg.dg_index}&dg_page=${dg_page}&criteria_key=${criteria_key}&align=${align}&keyword=${keyword}&category_index=${category_index}">자세히 보기</a>
									</div>
								</div>
								</c:otherwise>
							</c:choose>
							
						<c:set var="i" value="${i+1}"/>
						</c:forEach>
						<c:if test="${i>4 }">
							<button class="addlist" type="button">더보기</button>
						</c:if>
						<div class="page-btns" style="display: none">
							<div>
								<c:if test="${dg_startPage!=1 }">
									<a href="${cp }/dg/catalog.dg?dg_page=${dg_startPage-1}&criteria_key=${criteria_key}&align=${align}&keyword=${keyword}&category_index=${category_index}">&lt;</a>
								</c:if> 
								<c:forEach begin="${dg_startPage }" end="${dg_endPage }" var="i">
									<c:choose>
										<c:when test="${dg_page==i }">
											<span class="nowPage">${i }</span>
										</c:when>
										<c:otherwise>
											<a href="${cp }/dg/catalog.dg?dg_page=${i}&criteria_key=${criteria_key}&align=${align}&keyword=${keyword}&category_index=${category_index}">${i}</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:if test="${dg_endPage!=dg_totalPage }">
									<a href="${cp }/dg/catalog.dg?dg_page=${dg_endPage+1}&criteria_key=${criteria_key}&aalign=${align}&keyword=${keyword}&category_index=${category_index}">&gt;</a>
								</c:if>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="dogathermain_list">
							<p style="font-size: 40px; font-weight: bold;">두게더가 없습니다 ㅠㅠ</p>
							<p style="font-size: 40px; font-weight: bold;">첫번째 두게더의 주인공이 되어 주세요!!</p>
							<a href="${cp }/dg/create.dg" style="font-size: 40px; font-weight: bold; color:#621ae5">두게더 만들기</a>
						</div>
					</c:otherwise>
				</c:choose>
			</div>		
		</div>
	</main>
	<%@include file="/footer.jsp"%>
</body>
<script src="${cp }/resources/js/dg.js"></script>
</html>