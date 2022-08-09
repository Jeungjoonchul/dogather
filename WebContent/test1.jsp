<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="${cp }/resources/css/mainStyle.css" />
    <link rel="stylesheet" href="${cp }/resources/css/include.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com/" />
    <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;600;700;800;900&display=swap"
      rel="stylesheet"
    />
    <link rel="shortcut icon" href="${cp}/resources/images/favicon.png" />
    <!-- include libraries(jQuery, bootstrap) -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<title>Insert title here</title>
</head>
<body>
<table>
<div id="head">
        <div>
          <div class="left" style="text-indent: -999px">
            메인화면
          </div>
          <div class="center">
            <a href="${cp }/main"><img src="${cp}/resources/images/dogather_logo.png" alt="" width="175px" /></a>
          </div>
          <div class="right">
            <c:choose>
          	<c:when test="${empty loginUser}"><!-- 세션이 없다면 -->
          	<a href="${cp}/user/login.us">
              <span> 로그인 </span>
            </a>
            <a href="${cp}/user/join.us">
              <span> 회원가입 </span>
            </a>

          	</c:when>
          	<c:otherwise><!-- 세션이 있다면 -->
              <a href="#?user_index=${loginUser.user_index}">
              <span> 마이페이지 </span>
            </a>
            <a href="${cp}/user/logout.us">
              <span> 로그아웃 </span>
            </a>
          	</c:otherwise>
          </c:choose>
            <a href="">
              <span> 고객센터 </span>
            </a>
          </div>
        </div>
		<div class="category">
		  <ul class="menubar">
			<li>
			  <a href="#">
				<span> 서비스소개 </span>
			  </a>
			  <ul class="submenu">
				<li>
				  <a href="">
					<span class="span">회사 소개</span>
				  </a>
				</li>
				<li>
				  <a href="#">
					<span class="span">이용 방법</span>
				  </a>
				</li>
				
			  </ul>
			</li>
			<li>
			  <a href="#">
				<span> 두게더 </span>
			  </a>
			  <ul class="submenu">
				<li>
				  <a href="#">
					<span class="span">진행 중 두게더</span>
				  </a>
				</li>
				<li>
				  <a href="#">
					<span class="span">종료 된 두게더</span>
				  </a>
				</li>
				<li>
				  <a href="#">
					<span class="span">인증/후기 게시판</span>
				  </a>
				</li>
			  </ul>
			</li>
			<li>
			  <a href="#">
				<span> 커뮤니티 </span>
			  </a>
			  <ul class="submenu">
				<li>
				  <a href="${cp }/board/free_board/list.bo">
					<span class="span">자유게시판</span>
				  </a>
				</li>
				<li>
				  <a href="#">
					<span class="span">정보게시판</span>
				  </a>
				</li>
				<li>
				  <span>&nbsp;</span>
				</li>
			  </ul>
			</li>
			<li>
			  <a href="#">
				<span> 이벤트 </span>
			  </a>
			  <ul class="submenu">
				<li>
				  <a href="#">
					<span class="span">콜라보레이션</span>
				  </a>
				</li>
				<li>
				  <a href="#">
					<span class="span">이벤트</span>
				  </a>
				</li>
				<li>
				  <span>&nbsp;</span>
				</li>
			  </ul>
			</li>
		  </ul>
		</div>
		</div>
 
	<div id="main">asdf</div>
	
	 <div id="footer">
        <div class="web_container">
          <div class="footer_menu">
            <ul>
              <li>
                <a>
                  <span>이용약관</span>
                </a>
              </li>
              <li>
                <a>
                  <span>개인정보취급방침</span>
                </a>
              </li>
              <li>
                <a>
                  <span>법적고지</span>
                </a>
              </li>
            </ul>
            <div class="footer_btn">
              <a>
                <span>인재채용</span>
              </a>
              <a>
                <span>가맹점모집</span>
              </a>
            </div>
          </div>

          <div class="copyright">
            <p>
              서울 강남구 테헤란로 146 <span class="footer_line"></span>전화문의
              010-5287-3610
            </p>
            <p>
              사업자 등록번호 101-86-76277
              <span class="footer_line"></span>(주)DGT 대표이사 양형모
            </p>

            <p>Copyright 2022 DGT Co., Ltd. All right Reserved</p>
            <div class="sns">
              <a
                href="https://www.facebook.com"
                target="_blank"
                class="facebook"
                ><img src="${cp}/resources/images/small_facebook.png" alt=""
              /></a>
              <a href="https://www.instagram.com" target="_blank" class="insta"
                ><img src="${cp}/resources/images/small_instagram.png" alt=""
              /></a>
            </div>
          </div>
        </div>
      </div>

</table>
</body>
</html>