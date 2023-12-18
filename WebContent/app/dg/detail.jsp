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
<!-- include libraries(jQuery, bootstrap) -->

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css" />

<script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>
<title>Doːgather</title>
<link rel="stylesheet" href="${cp }/resources/css/include.css" />
<link rel="stylesheet" href="${cp }/resources/css/dogatherDetail.css" />
<link rel="stylesheet" href="${cp }/resources/css/dogatherPost.css" />
</head>
<body>
	<div style="display: none;">
		<input type="hidden" value="${dg_index }" id="dg_index"> <input
			type="hidden" value="${dp_page }" id="dp_page"> <input
			type="hidden" value="${dp_type }" id="dp_type"> <input
			type="hidden" value="${dp_align }" id="dp_align"> <input
			type="hidden" value="${dp_mine }" id="dp_mine"> <input
			type="hidden" id="loginUser_nickname"
			value="${loginUser.user_nickname }">
	</div>

	<div id="modal"></div>

	<%@include file="/header.jsp"%>
	<main>
		<div id="main">

			<div id="dg_community">
				<div id="dg_comm_category">

					<div class="dg_comm_photo">
						<c:choose>
							<c:when test="${dg.dg_banner_sys eq null }">
								<c:choose>
									<c:when test="${dg.category_index eq 1 }">
										<img src="${cp}/resources/images/default_health.png" />
									</c:when>
									<c:when test="${dg.category_index eq 2 }">
										<img src="${cp}/resources/images/default_study.png" />
									</c:when>
									<c:when test="${dg.category_index eq 3 }">
										<img src="${cp}/resources/images/default_refinement.png" />
									</c:when>
									<c:when test="${dg.category_index eq 4 }">
										<img src="${cp}/resources/images/default_habit.png" />
									</c:when>
									<c:otherwise>
										<img src="${cp}/resources/images/default_economy.png" />
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>
								<img
									src="${cp }/upload/images/dogather/banner/${dg.dg_banner_sys}" />
							</c:otherwise>
						</c:choose>
					</div>

					<div class="dg_comm_information">
						<span>${dg.dg_title }</span> <br> <span>만든 사람 :
							${dg.user_nickname }</span> <br> <span>시작일 :
							${dg.dg_reg_date } <c:if test="${dg.dg_expire!=null }">/ 종료일 : ${dg.dg_expire }</c:if>
						</span> <br> <br>
						<p class="list_container_contents">${dg.dg_intro}</p>
						<br> <br>
						<c:set var="doneLoop" value="false" />
						<c:forEach items="${members }" var="member">
							<c:if test="${not doneLoop }">
								<c:if test="${member == loginUser.user_index}">
									<nav>
										<ul>
											<li><a
												href="${cp }/dg/view_my_info.dg?dg_index=${dg.dg_index}">
													<span class="purple">내정보</span> 보러가기
											</a></li>
											<li><a
												href="${cp }/dg/post_write.dg?dp_type=cert&dg_index=${dg.dg_index}">
													<span class="purple">인증글</span> 쓰러가기
											</a></li>
											<li><a
												href="${cp }/dg/post_write.dg?dp_type=feed&dg_index=${dg.dg_index}">
													<span class="purple">피드</span> 쓰러가기
											</a></li>
											<li><a
												href="javascript:quitDg(${loginUser.user_index },${dg.user_index },${dg.dg_index })"
												id="quit_dg_btn"> <span class="purple">두게더</span> 그만두기
											</a></li>
										</ul>
									</nav>
									<c:set var="doneLoop" value="true" />
								</c:if>
							</c:if>
						</c:forEach>
						<c:if test="${not doneLoop }">
							<a class="joindg"
								href="${cp }/dg/join.dg?dg_index=${dg.dg_index}">두게더 신청하기</a>
						</c:if>
					</div>
				</div>


				<div id="dg_comm_mould">
					<div class="dg_comm_header">
						<ul class="dp_filter">
							<div id="feedorcert">
								<c:choose>
									<c:when test="${dp_type eq 'feed' }">
										<li><label class="filter_unchecked">전체<input
												type="radio" value="all" name="dp_type" id="dp_type_all" /></label>
										</li>
										<li><label class="filter_checked">피드<input
												type="radio" value="feed" name="dp_type" id="dp_type_feed"
												checked /></label></li>
										<li><label class="filter_unchecked">인증<input
												type="radio" value="cert" name="dp_type" id="dp_type_cert" /></label>
										</li>
									</c:when>
									<c:when test="${dp_type eq 'cert' }">
										<li><label class="filter_unchecked">전체<input
												type="radio" value="all" name="dp_type" id="dp_type_all" /></label>
										</li>
										<li><label class="filter_unchecked">피드<input
												type="radio" value="feed" name="dp_type" id="dp_type_feed" /></label>
										</li>
										<li><label class="filter_checked">인증<input
												type="radio" value="cert" name="dp_type" id="dp_type_cert"
												checked /></label></li>
									</c:when>
									<c:otherwise>
										<li><label class="filter_checked">전체<input
												type="radio" value="all" name="dp_type" id="dp_type_all"
												checked /></label></li>
										<li><label class="filter_unchecked">피드<input
												type="radio" value="feed" name="dp_type" id="dp_type_feed" /></label>
										</li>
										<li><label class="filter_unchecked">인증<input
												type="radio" value="cert" name="dp_type" id="dp_type_cert" /></label>
										</li>
									</c:otherwise>
								</c:choose>
							</div>
							<div id="likeordate">
								<c:choose>
									<c:when test="${dp_align eq 'dp_like_cnt' }">
										<li><label class="filter_checked">좋아요<input
												type="radio" value="dp_like_cnt" name="dp_align"
												id="dp_align_like" checked /></label></li>
										<li><label class="filter_unchecked">등록일<input
												type="radio" value="dp_reg_date" name="dp_align"
												id="dp_align_date" /></label></li>
									</c:when>
									<c:otherwise>
										<li><label class="filter_unchecked">좋아요<input
												type="radio" value="dp_like_cnt" name="dp_align"
												id="dp_align_like" /></label></li>
										<li><label class="filter_checked">등록일<input
												type="radio" value="dp_reg_date" name="dp_align"
												id="dp_align_date" checked /></label></li>
									</c:otherwise>
								</c:choose>
							</div>
							<c:if test="${doneLoop}">
								<c:choose>
									<c:when test="${dp_mine == null or dp_mine=='off'}">
										<li><label class="filter_unchecked">내가 쓴글<input
												type="checkbox" value="on" id="dp_mine" name="dp_mine" /></label></li>
									</c:when>
									<c:otherwise>
										<li><label class="filter_checked">내가 쓴글<input
												type="checkbox" value="on" id="dp_mine" name="dp_mine"
												checked="checked" /></label></li>
									</c:otherwise>
								</c:choose>
							</c:if>
						</ul>
					</div>


					<div id="dg_comm_bulletin" class="swiper mySwiper">
						<div class="swiper-wrapper">

							<c:choose>
								<c:when test="${dpList.size()>0 and dpList != null }">
									<c:forEach items="${dpList }" var="dp">
										<c:choose>
											<c:when test="${dp.dp_type eq 'feed' }">
												<div class="dg_comm_feed swiper-slide">
													<a href="javascript:viewPost(${dp.dp_index })">
														<table>
															<tr>
																<th class="comm_board_user_nickname" colspan="2">${dp.user_nickname }</th>
																<th class="comm_board_date"><span>♥</span> <span>${dp.dp_like_cnt }</span><input
																	type="hidden" id="dp_index${dp.dp_index}"
																	value="${dp.dp_index}" /></th>
															</tr>
															<tr>
																<th class="comm_board_date" colspan="3"
																	style="font-size: 14px; color: #ccc;">${dp.dp_reg_date }<c:if
																		test="${dp.dp_reg_date!=dp.dp_update_date }">(수정됨)</c:if></th>
															</tr>
															<tr>
																<th class="comm_board_contents" colspan="3">${dp.dp_contents }</th>
															</tr>
															<tr>
														</table>
													</a>
												</div>
											</c:when>
											<c:otherwise>

												<div class="dg_comm_cert swiper-slide">
													<a
														href="javascript:viewPost(${dp.dp_index },'${dp.dp_type }')">
														<table>
															<tr>
																<th class="comm_board_user_nickname" colspan="2">${dp.user_nickname }</th>
																<th class="comm_board_date"><span>♥</span> <span>${dp.dp_like_cnt }</span><input
																	type="hidden" id="dp_index${dp.dp_index}"
																	value="${dp.dp_index}" /></th>
															</tr>
															<tr>
																<th class="comm_board_date" colspan="3"
																	style="font-size: 14px; color: #ccc;">${dp.dp_reg_date }<c:if
																		test="${dp.dp_reg_date!=dp.dp_update_date }">(수정됨)</c:if></th>
															</tr>
															<tr>
																<th class="comm_board_contents" colspan="3">${dp.dp_contents }</th>
															</tr>
															<tr>
																<c:if test="${dp.dp_image1_sys !=null }">
																	<td><img
																		src="${cp }/upload/images/dogather/cert/${dp.dp_image1_sys}"
																		style="max-width: 144px; max-height: 144px;"></td>
																</c:if>
																<c:if test="${dp.dp_image2_sys !=null }">
																	<td><img
																		src="${cp }/upload/images/dogather/cert/${dp.dp_image2_sys}"
																		style="max-width: 144px; max-height: 144px;"></td>
																</c:if>
																<c:if test="${dp.dp_image3_sys !=null }">
																	<td><img
																		src="${cp }/upload/images/dogather/cert/${dp.dp_image3_sys}"
																		style="max-width: 144px; max-height: 144px;"></td>
																</c:if>
															</tr>
														</table>
													</a>
												</div>

											</c:otherwise>
										</c:choose>
									</c:forEach>
						</div>
						<div class="page-btns">
							<div>
								<c:if test="${dp_startPage!=1 }">
									<a href="javascript:transferPage(${dp_startPage-1 })">&lt;</a>
								</c:if>
								<c:forEach begin="${dp_startPage }" end="${dp_endPage }" var="i">
									<c:choose>
										<c:when test="${dp_page==i }">
											<span class="nowPage">${i }</span>
										</c:when>
										<c:otherwise>
											<a href="javascript:transferPage(${i})">${i}</a>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:if test="${dp_endPage!=dp_totalPage }">
									<a href="javascript:transferPage(${dp_endPage+1})">&gt;</a>
								</c:if>
							</div>
						</div>
					</c:when>
						<c:otherwise>
							<div>
								<p
									style="text-align: center; font-size: 32px; padding-top: 40px;">작성된
									글이 없습니다</p>
							</div>
						</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</main>
	<%@include file="/footer.jsp"%>
</body>
<script src="${cp }/resources/js/dg.js">
	
</script>
<script>
	var swiper = new Swiper(".mySwiper", {
		direction : 'vertical',
		slidesPerView : 'auto',
		spaceBetween : 10,
		freeMode : true,
	});
</script>
</html>