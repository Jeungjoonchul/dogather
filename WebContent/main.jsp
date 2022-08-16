<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="cp" value="${pageContext.request.contextPath }"/>

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
    <link rel="stylesheet" href="${cp }/resources/css/include.css" />
    <link rel="stylesheet" href="${cp }/resources/css/mainStyle.css" />
  </head>
  <body>	
  <%@include file="/header.jsp"%>
    <main>
    <div id="main">
        
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
        <c:set var="today" value="<%=new java.util.Date() %>"></c:set>
        <c:set var="today"><fmt:formatDate value="${today }" pattern="yyyyMMdd"/></c:set>
          <div id="event_border">
            <div class="event title">
              <a href="1#">
                <span class="purple">Event</span><span> 게시판</span>
              </a>
            </div>
            <div class="event border">
              <ul>
              <c:choose>
              <c:when test="${eb_list.size()>0 and eb_list!= null }">
              <c:forEach var="eb_list" items="${eb_list}">
              <fmt:parseDate var="date" value="${eb_list.b_reg_date }" pattern="yyyy-MM-dd HH:mm:ss"/>
              <c:set var="date"><fmt:formatDate value="${date }" pattern="yyyyMMdd"/></c:set>
              	<li>
               
                    <div class="cap gray"><span>${eb_list.b_subject}</span></div>
                    
                    <div class="tit">
                      	  <a href="${cp}/board/event_board/post_view.bo?b_index=${eb_list.b_index}"> ${eb_list.b_title } </a> 
                    </div>
                    
                    <div class="comm red">[${eb_list.b_reply_cnt}]</div>
                    <div class="icon">
                      <p class="new">
						<c:choose>
                      	<c:when test="${today-date <=1}">N</c:when>
                      	<c:otherwise>&nbsp;</c:otherwise>
                      	</c:choose>
                      </p>
                    </div>
                
                </li>
              </c:forEach>
              </c:when>
              <c:otherwise>
              	<p>게시글이 없습니다.</p>
              </c:otherwise>
              </c:choose>

              </ul>
            </div>
          </div>
          <div id="community_border">
            <div class="community title">
              <a href="${cp }/board/free_board/post_list.bo">
                <span class="purple">자유 </span><span>게시판</span>
              </a>
            </div>
            <div class="community border">
              <ul>
              <c:choose>
              <c:when test="${fb_list.size()>0 and fb_list!= null }">
              <c:forEach var="fb_list" items="${fb_list}">
              <fmt:parseDate var="date" value="${fb_list.b_reg_date }" pattern="yyyy-MM-dd HH:mm:ss"/>
              <c:set var="date"><fmt:formatDate value="${date }" pattern="yyyyMMdd"/></c:set>
              	<li>
               
                    <div class="cap gray"><span>${fb_list.b_subject}</span></div>
                    
                    <div class="tit">
                      	  <a href="${cp}/board/free_board/post_view.bo?b_index=${fb_list.b_index}"> ${fb_list.b_title } </a> 
                    </div>
                    
                    <div class="comm red">[${fb_list.b_reply_cnt}]</div>
                    <div class="icon">
                      <p class="new">
						<c:choose>
                      	<c:when test="${today-date <=1}">N</c:when>
                      	<c:otherwise>&nbsp;</c:otherwise>
                      	</c:choose>
                      </p>
                    </div>
                
                </li>
              </c:forEach>
              </c:when>
              <c:otherwise>
              	<p>게시글이 없습니다.</p>
              </c:otherwise>
              </c:choose>

              </ul>
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
      </div>
    </main>

    <%@include file="footer.jsp" %>
  </body>
</html>
