<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
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
      rel="stylesheet"
    />
    <link rel="shortcut icon" href="${cp}/resources/images/favicon.png" />
    <!-- include libraries(jQuery, bootstrap) -->

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

    <title>Doːgather</title>
    <link rel="stylesheet" href="${cp}/resources/css/login.css" />
  </head>
  <body>
    <div id="main">
      <div id="head">
        <div>
          <p class="left">
            <a href="#">
            </a>
          </p>
          <p class="center">
            <a href="${cp }/main">
              <img src="${cp}/resources/images/dogather_logo.png" alt="" width="350px" />
            </a>
          </p>
        </div>
      </div>
      <!-- 로그인 -->
      <div id="login_container">
        <div id="login_area">
          <div class="login_top">
            <h3>로그인</h3>
            <form method="post" id="login" name="LoginForm" action="${cp }/user/login_ok.us">
            <input type="hidden" name ="prev_page" value="${prev_page }"/>
              <div class="user_email">
                <c:choose>
                	<c:when test="${empty param.user}">
                		<input type="email" name="user_email" id="user_email" placeholder="이메일 주소 입력"/>
                	</c:when>
                	<c:otherwise>
                		<input type="email" name="user_email" id="user_email" value="${param.user}"/>
                	</c:otherwise>
                </c:choose>
              </div>
              <div class="userpw_area">
                <input type="password" name="user_password" id="user_password" placeholder="비밀번호" maxlength="24"/>
              </div>
              <div>
              	<span id="login_status">&nbsp;</span>
              </div>
              <div class="login_keep_wrap">
                <div class="keep_check">
                  <input type="checkbox" name="keep" id="keep" class="input_keep" value="on"/>
                  <label for="keep" class="keep_text"> 자동로그인 </label>
                </div>
                <div class="find_id">
                  <a href="${cp }/user/find_email.us">
                    <span>아이디 찾기 &#124;</span>
                  </a>
                  <a href="${cp }/user/find_password.us">
 	                 <span>비밀번호 찾기</span>
                  </a>
                </div>
              </div>
              <div class="login_submit">
                <input type="submit" value="로그인" />
              </div>
            </form>
          </div>
          <%-- <div class="login_bottom">
            <div class="sns_login">
                <!-- <hr> -->
              <p>SNS 계정 로그인/회원가입</p>
                <ul class="sns">
                    <li>
                        <a href="">
                            <img src="${cp}/resources/images/navericon.png" alt="네이버 아이콘">
                        </a>
                    </li>
                    <li>
                        <a href="">
                            <img src="${cp}/resources/images/KakaoTalk_logo.svg.png" alt="카카오 아이콘">
                        </a>
                    </li>
                   
                </ul>
              </div>
            </div> --%>
            <div class="join_container">
                <div class="join_area">
                    <a href="${cp }/user/join.us" class="join"><p>
                        이메일로 회원가입
                    </p>
                </a>
                </div>
            </div>
          </div>
        </div>
      </div>
      <!-- 푸터 -->
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
    </div>
  </body>
  <script src="${cp }/resources/js/login.js"></script>
</html>
