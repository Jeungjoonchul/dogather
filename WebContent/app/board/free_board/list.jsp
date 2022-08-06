<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="${cp }/resources/css/board.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com/" />
    <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;600;700;800;900&display=swap"
      rel="stylesheet"
    />
    <link rel="shortcut icon" href="${cp }/resources/images/favicon.png" />
    <title>DoGather</title>
  </head>
  <body>
    <div id="main">
       <div id="head">
        <div>
          <div class="left">
            <a href="${cp }/main">
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
            <a href="${cp}/user/user_join.us">
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
                    <span class="span">종료된 두게더</span>
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
                  <span>&nbsp</span>
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
                  <span>&nbsp</span>
                </li>
              </ul>
            </li>
          </ul>
        </div>
        <!-- 이벤트&커뮤니티 게시판 -->
        <div id="boardcontainer">
          <div id="boardmain">
            <div class="board title">
              <span class="purple">자유</span><span> 게시판</span>
            </div>
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
                  	<c:when test="${fb_list.size()>0 and fb_list!=null }">
                  	<c:forEach var="list" items="${fb_list}">
                  	<tr>
                  	<td>${list.b_index}</td>
                  	<td><a href="#">${list.b_title}</a></td>
                  	<td><a href="#">${list.user_nickname}</a></td>
                  	<td>${list.b_reg_date}<c:if test="${list.b_reg_date!=list.b_reg_date}">(수정됨)</c:if></td>
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
                	<tr>
                		<td colspan="5">
               				<c:if test="${startPage!=1 }">
               					<a href="${cp }/board/free_board/list.bo?page=${startPage-1}">&lt;</a>
               				</c:if>
               				<c:forEach begin="${startPage }" end="${endPage }" var="i">
               				<c:choose>
               					<c:when test="${page==i }">
               						<span class="nowPage">${i }</span>
               					</c:when>
               					<c:otherwise>
               						<a href="${cp}/board/free_board/list.bo?page=${i}">${i}</a>
               					</c:otherwise>
               				</c:choose>
               				</c:forEach>
               				<c:if test="${endPage!=totalPage }">
               					<a href="${cp }/board/free_board/list.bo?page=${endPage+1}">&gt;</a>
               				</c:if>
                		</td>
                	</tr>
                </tfoot>
              </table>
              <table class="writing">
                <tr>
                  <td><a class="write" href="">글쓰기</a></td>
                </tr>
              </table>
              <div class="search_area">
                <input type="search" id="q" />
                <input type="button" value="검색" onclick="search()" />
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- 풋터 -->
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
                ><img src=".${cp }/resources/images/small_instagram.png" alt=""
              /></a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </body>
  <script>
    function search() {
      const q = document.getElementById("q");
    }
  </script>
</html>
