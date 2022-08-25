<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath }" />
<header>
	<div id="header">
		<div>
			<div class="left"><a>메인화면</a></div>
			<div class="center">
				<a href="${cp }/main"><img
					src="${cp}/resources/images/dogather_logo.png" alt="" width="175px" /></a>
			</div>
			<div class="right">
				<c:choose>
					<c:when test="${empty loginUser}">
						<!-- 세션이 없다면 -->
						<a href="${cp}/user/login.us"> <span> 로그인 </span>
						</a>
						<a href="${cp}/user/join.us"> <span> 회원가입 </span>
						</a>

					</c:when>
					<c:otherwise>
						<!-- 세션이 있다면 -->
						<a href="${cp}/user/myPage.us">
    			        	<span> 마이페이지 </span>
						</a>
						<a href="${cp}/user/logout.us"> <span> 로그아웃 </span>
						</a>
					</c:otherwise>
				</c:choose>
				<a href=""> <span> 고객센터 </span>
				</a>
			</div>
		</div>
		<div class="category">
			<ul class="menubar">
				<li><a href="#"> <span> 서비스소개 </span>
				</a>
					<ul class="submenu">
						<li><a href=""> <span class="span">회사 소개</span>
						</a></li>
						<li><a href="#"> <span class="span">이용 방법</span>
						</a></li>

					</ul></li>
				<li><a href="${cp }/dg/front.dg"> <span> 두게더 </span>
				</a>
					<ul class="submenu">
						<li><a href="${cp }/dg/catalog.dg"> <span class="span">진행 중 두게더</span>
						</a></li>
						<li><a href="#"> <span class="span">종료 된 두게더</span>
						</a></li>
						<li><a href="#"> <span class="span">인증/후기 게시판</span>
						</a></li>
					</ul></li>
				<li><a href=""> <span> 커뮤니티 </span>
				</a>
					<ul class="submenu">
						<li><a href="${cp }/board/free_board/post_list.bo"> <span
								class="span">자유게시판</span>
						</a></li>
						<li><a href="${cp }/board/info_board/post_list.bo"> <span class="span">정보게시판</span>
						</a></li>
						<li><span>&nbsp;</span></li>
					</ul></li>
				<li><a href="#"> <span> 이벤트 </span>
				</a>
					<ul class="submenu">
						<li><a href="#"> <span class="span">콜라보레이션</span>
						</a></li>
						<li><a href="${cp }/board/event_board/post_list.bo"> <span class="span">이벤트</span>
						</a></li>
						<li><span>&nbsp;</span></li>
					</ul></li>
			</ul>
		</div>
	</div>
</header>
