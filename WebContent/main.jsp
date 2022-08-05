<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="${cp }/resources/css/mainStyle.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com/" />
    <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;600;700;800;900&display=swap"
      rel="stylesheet"
    />
    <link rel="shortcut icon" href="${cp}/resources/images/favicon.png" />
    <title>DoGather</title>
  </head>
  <body>
	<p>${cookie.autoLogin_check.name } : ${cookie.autoLogin_check.value }</p>
	<p>${loginUser.user_email}</p>
  	
    <div id="main">
      <div id="head">
        <div>
          <div class="left">
            <a href="#">
              <span>메인화면</span>
            </a>
          </div>
          <div class="center">
            <img src="${cp }/resources/images/dogather_logo.png" alt="" width="175px" />
          </div>
          <div class="right">
          <c:choose>
          	<c:when test="${empty loginUser}"><!-- 세션이 없다면 -->
          	<a href="${cp}/user/user_login.us">
              <span> 로그인 </span>
            </a>
            <a href="${cp }/app/user/user.jsp">
              <span> 회원가입 </span>
            </a>

          	</c:when>
          	<c:otherwise><!-- 세션이 있다면 -->
              <a href="#?user_index=${loginUser.user_index}">
              <span> 마이페이지 </span>
            </a>
            <a href="${cp}/user/user_logout.us">
              <span> 로그아웃 </span>
            </a>
          	</c:otherwise>
          </c:choose>
          <a href="#">
              <span> 고객센터 </span>
            </a>
           </div>
        </div>
      </div>
      <div id="body">
        <div class="category">
          <ul class="menubar">
            <li>
              <a href="#">
                <span> 서비스소개 </span>
              </a>
              <ul class="submenu">
                <li>
                  <a href="#">
                    <span class="span">회사 소개</span>
                  </a>
                </li>
                <li>
                  <a href="#">
                    <span class="span">이용 방법</span>
                  </a>
                </li>
                <li>
                  <a href="#">
                    <span class="span">인재 채용</span>
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
                  <a href="#">
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
        <div class="section">
          <input type="radio" name="slide" id="slide1" checked />
          <input type="radio" name="slide" id="slide2" />
          <input type="radio" name="slide" id="slide3" />
          <div class="slidewrap">
            <ul class="slidelist">
              <li>
                <a href="#">
                  <label for="slide3" class="s-left">&lt;</label>
                  <img src="${cp }/resources/images/버거메인이미지1.png" alt="이미지1" />
                  <label for="slide2" class="s-right">&gt;</label>
                </a>
              </li>
              <li>
                <a href="#">
                  <label for="slide1" class="s-left">&lt;</label>
                  <img src="${cp }/resources/images/bg.JPG" height="215.2px" alt="이미지2" />
                  <label for="slide3 class=s-right">&gt;</label>
                </a>
              </li>
              <li>
                <a href="#">
                  <label for="slide2" class="s-left">&lt;</label>
                  <img src="" alt="이미지3" />
                  <label for="slide1" class="s-right">&gt;</label>
                </a>
              </li>
            </ul>
          </div>
        </div>
        <!-- 두게더 리스트 -->
        <div id="dogather_list">
          <!--인기 두게더  -->
          <div id="favorite">
            <div class="list_title">
              <a href="">
                <span class="purple">인기 </span><span>두ː게더</span>
              </a>
            </div>
            <div class="list_album">
              <ul class="slides">
                <li>
                  <div class="album"></div>
                  <span>인기1제목</span>
                  <span>내용</span>
                </li>
                <li>
                  <div class="album"></div>
                  <span>인기2</span>
                  <span>내용</span>
                </li>
                <li>
                  <div class="album"></div>
                  <span>인기3</span>
                  <span>내용</span>
                </li>
                <li>
                  <div class="album"></div>
                  <span>인기4</span>
                  <span>내용</span>
                </li>
                <li>
                  <div class="album"></div>
                  <span>인기5</span>
                  <span>내용</span>
                </li>
              </ul>
            </div>
          </div>
          <div id="new">
            <div class="list_title">
              <a href="">
                <span class="purple">최신 </span><span>두ː게더</span>
              </a>
            </div>
            <div class="list_album">
              <ul class="slides">
                <li>
                  <div class="album"></div>
                  <span>최신1</span>
                  <span>내용</span>
                </li>
                <li>
                  <div class="album"></div>
                  <span>최신2</span>
                  <span>내용</span>
                </li>
                <li>
                  <div class="album"></div>
                  <span>최신3</span>
                  <span>내용</span>
                </li>
                <li>
                  <div class="album"></div>
                  <span>최신4</span>
                  <span>내용</span>
                </li>
                <li>
                  <div class="album"></div>
                  <span>최신5</span>
                  <span>내용</span>
                </li>
              </ul>
            </div>
          </div>
          <div id="interest">
            <div class="list_title">
              <a href="">
                <span class="purple">관심 </span><span>두ː게더</span>
              </a>
            </div>
            <div class="list_album">
              <ul class="slides">
                <li>
                  <div class="album"></div>
                  <span>관심1</span>
                  <span>내용</span>
                </li>
                <li>
                  <div class="album"></div>
                  <span>관심2</span>
                  <span>내용</span>
                </li>
                <li>
                  <div class="album"></div>
                  <span>관심3</span>
                  <span>내용</span>
                </li>
                <li>
                  <div class="album"></div>
                  <span>관심4</span>
                  <span>내용</span>
                </li>
                <li>
                  <div class="album"></div>
                  <span>관심5</span>
                  <span>내용</span>
                </li>
              </ul>
            </div>
          </div>
        </div>
        <!-- 이벤트&커뮤니티 게시판 -->
        <div id="event_community">
          <div id="event_border">
            <div class="event title">
              <a href="">
                <span class="purple">Event</span><span> 게시판</span>
              </a>
            </div>
            <div class="event border">
              <ul>
                <li>
                  <a href="#">
                    <div class="cap gray">이벤트</div>
                    <div class="tit">
                      	이벤트 게시물 내용하나둘셋하나둘셋하나둘
                    </div>
                    <div class="comm red">[댓글수]</div>
                    <div class="icon">
                      <p class="new">N</p>
                    </div>
                  </a>
                </li>
                <li>
                  <a href="#">
                    <div class="cap gray">이벤트</div>
                    <div class="tit">
                      이벤트 게시물 내용하나둘셋하나둘셋하나둘
                    </div>
                    <div class="comm red">[댓글수]</div>
                    <div class="icon">
                      <p class="new">N</p>
                    </div>
                  </a>
                </li>
                <li>
                  <a href="#">
                    <div class="cap gray">이벤트</div>
                    <div class="tit">
                      이벤트 게시물 내용하나둘셋하나둘셋하나둘
                    </div>
                    <div class="comm red">[댓글수]</div>
                    <div class="icon">
                      <p class="new">N</p>
                    </div>
                  </a>
                </li>
                <li>
                  <a href="#">
                    <div class="cap gray">이벤트</div>
                    <div class="tit">
                      이벤트 게시물 내용하나둘셋하나둘셋하나둘
                    </div>
                    <div class="comm red">[댓글수]</div>
                    <div class="icon">
                      <p class="new">N</p>
                    </div>
                  </a>
                </li>
                <li>
                  <a href="#">
                    <div class="cap gray">이벤트</div>
                    <div class="tit">
                      이벤트 게시물 내용하나둘셋하나둘셋하나둘
                    </div>
                    <div class="comm red">[댓글수]</div>
                    <div class="icon">
                      <p class="new">N</p>
                    </div>
                  </a>
                </li>
                <li>
                  <a href="#">
                    <div class="cap gray">이벤트</div>
                    <div class="tit">
                      이벤트 게시물 내용하나둘셋하나둘셋하나둘
                    </div>
                    <div class="comm red">[댓글수]</div>
                    <div class="icon">
                      <p class="new">N</p>
                    </div>
                  </a>
                </li>
              </ul>
            </div>
          </div>
          <div id="community_border">
            <div class="community title">
              <a href="">
                <span class="purple">자유 </span><span>게시판</span>
              </a>
            </div>
            <div class="community border">
              <ul>
                <li>
                  <a href="#">
                    <div class="cap gray">유머</div>
                    <div class="tit">
                      	유머 게시물
                      	내용하나둘셋하나둘셋하나둘셋하나둘셋하나둘셋하나둘셋하나둘셋
                    </div>
                    <div class="comm red">[댓글수]</div>
                    <div class="icon">
                      <p class="new">N</p>
                    </div>
                  </a>
                </li>
                <li>
                  <a href="#">
                    <div class="cap gray">팁</div>
                    <div class="tit">
                      유머 게시물
                      내용하나둘셋하나둘셋하나둘셋하나둘셋하나둘셋하나둘셋하나둘셋
                    </div>
                    <div class="comm red">[댓글수]</div>
                    <div class="icon">
                      <p class="new">N</p>
                    </div>
                  </a>
                </li>
                <li>
                  <a href="#">
                    <div class="cap gray">유머</div>
                    <div class="tit">
                      유머 게시물
                      내용하나둘셋하나둘셋하나둘셋하나둘셋하나둘셋하나둘셋하나둘셋
                    </div>
                    <div class="comm red">[댓글수]</div>
                    <div class="icon">
                      <p class="new">N</p>
                    </div>
                  </a>
                </li>
                <li>
                  <a href="#">
                    <div class="cap gray">유머</div>
                    <div class="tit">
                      유머 게시물
                      내용하나둘셋하나둘셋하나둘셋하나둘셋하나둘셋하나둘셋하나둘셋
                    </div>
                    <div class="comm red">[댓글수]</div>
                    <div class="icon">
                      <p class="new">N</p>
                    </div>
                  </a>
                </li>
                <li>
                  <a href="#">
                    <div class="cap gray">유머</div>
                    <div class="tit">
                      유머 게시물
                      내용하나둘셋하나둘셋하나둘셋하나둘셋하나둘셋하나둘셋하나둘셋
                    </div>
                    <div class="comm red">[댓글수]</div>
                    <div class="icon">
                      <p class="new">N</p>
                    </div>
                  </a>
                </li>
                <li>
                  <a href="#">
                    <div class="cap gray">유머</div>
                    <div class="tit">
                      유머 게시물
                      내용하나둘셋하나둘셋하나둘셋하나둘셋하나둘셋하나둘셋하나둘셋
                    </div>
                    <div class="comm red">[댓글수]</div>
                    <div class="icon">
                      <p class="new">N</p>
                    </div>
                  </a>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <!-- 후기 인증 게시판 리스트 -->
      <div id="review_border">
        <div class="review title">
          <a href=""> <span class="purple">후기</span><span> 게시판</span> </a>
        </div>
        <div id="review_img_area">
          <div class="review_img">
            <a href="#">
              <img src="${cp }/resources/images/review_img.jpg" alt="" />
            </a>
          </div>
        </div>
        <div id="review_list_area">
          <a href="#">
            <span class="catalog green">운동</span><br />
            <span class="title">제목</span><br />
            <span class="contents gray"
              >내용 Lorem ipsum dolor sit amet consectetur adipisicing elit. In
              obcaecati quos accusamus, unde, vero maiores quasi corrupti
              pariatur iste excepturi veniam similique eos cum inventore
              repellat praesentium amet placeat eveniet?
            </span>
          </a>
        </div>
      </div>
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
                ><img src="${cp }/resources/images/small_facebook.png" alt=""
              /></a>
              <a href="https://www.instagram.com" target="_blank" class="insta"
                ><img src="${cp }/resources/images/small_instagram.png" alt=""
              /></a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
</html>
