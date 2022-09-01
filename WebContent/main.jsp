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
	<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css" />
<script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>

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
                <a href="${cp}/board/event_board/post_view.bo?b_index=1">
                  <label for="slide3" class="s-left">&lt;</label>
                  <img src="${cp }/resources/images/event_banner1.png" alt="이미지1" />
                  <label for="slide2" class="s-right">&gt;</label>
                </a>
              </li>
              <li>
                <a href="${cp}/board/event_board/post_view.bo?b_index=2">
                  <label for="slide1" class="s-left">&lt;</label>
                  <img src="${cp }/resources/images/event_banner2.png" height="215.2px" alt="이미지2" />
                  <label for="slide3 class=s-right">&gt;</label>
                </a>
              </li>
              <li>
                <a href="${cp}/board/event_board/post_view.bo?b_index=3">
                  <label for="slide2" class="s-left">&lt;</label>
                  <img src="${cp }/resources/images/event_banner3.png" alt="이미지3" />
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
              <a href="${cp}/dg/catalog.dg?criteria_key=dg_member_cnt">
                <span class="purple">인기 </span><span>두ː게더</span>
              </a>
            </div>
            <div class="list_album swiper albumswiper">
            <c:choose>
            	<c:when test="${hot_list.size()>0 and hot_list!=null }">
              		<ul class="slides swiper-wrapper">
             		<c:forEach items="${hot_list }" var="hl">
              			<li class="swiper-slide">
              				<a href="${cp }/dg/detail.dg?dg_index=${hl.dg_index}">
                 				 <div class="album">
                  					<c:choose>
										<c:when test="${hl.dg_banner_sys == null}">
											<c:choose>
												<c:when test="${hl.category_index eq 1 }"><img src="${cp}/resources/images/default_health.png"/></c:when>
												<c:when test="${hl.category_index eq 2 }"><img src="${cp}/resources/images/default_study.png"/></c:when>
												<c:when test="${hl.category_index eq 3 }"><img src="${cp}/resources/images/default_refinement.png"/></c:when>
												<c:when test="${hl.category_index eq 4 }"><img src="${cp}/resources/images/default_habit.png"/></c:when>
												<c:otherwise><img src="${cp}/resources/images/default_economy.png"/></c:otherwise>
											</c:choose>
										</c:when>
										<c:otherwise>
											<img src="${cp }/upload/images/dogather/banner/${hl.dg_banner_sys}"/>
										</c:otherwise>
									</c:choose>
                 				 </div>
								<span>${hl.dg_title }</span>
                 				<span class="dg_intro">
	                  				<c:choose>
	                  					<c:when test="${hl.dg_intro_short!=null }">
	                  						${hl.dg_intro_short }
	                  					</c:when>
	                  					<c:otherwise>
	                  						${hl.dg_intro}
	                  					</c:otherwise>
	                  				</c:choose>
                  				</span>
                 			</a>
                		</li>
              	</c:forEach>
              		</ul>
            </c:when>
            <c:otherwise>
				<div style="line-height: 300px; font-size: 49px;font-weight: bold">두게더가 없습니다 ㅠㅠ</div>
            </c:otherwise>
           </c:choose>
           	<div class="swiper-button-next"></div>
			<div class="swiper-button-prev"></div>
            </div>
          </div>
          <div id="new">
            <div class="list_title">
              <a href="${cp}/dg/catalog.dg?criteria_key=dg_reg_date">
                <span class="purple">최신 </span><span>두ː게더</span>
              </a>
            </div>
            <div class="list_album swiper albumswiper">
            <c:choose>
            	<c:when test="${latest_list.size()>0 and latest_list!=null }">
              		<ul class="slides swiper-wrapper">
             		<c:forEach items="${latest_list }" var="ll">
              			<li class="swiper-slide">
              				<a href="${cp }/dg/detail.dg?dg_index=${ll.dg_index}">
                 				 <div class="album">
                  					<c:choose>
										<c:when test="${ll.dg_banner_sys == null}">
											<c:choose>
												<c:when test="${ll.category_index eq 1 }"><img src="${cp}/resources/images/default_health.png"/></c:when>
												<c:when test="${ll.category_index eq 2 }"><img src="${cp}/resources/images/default_study.png"/></c:when>
												<c:when test="${ll.category_index eq 3 }"><img src="${cp}/resources/images/default_refinement.png"/></c:when>
												<c:when test="${ll.category_index eq 4 }"><img src="${cp}/resources/images/default_habit.png"/></c:when>
												<c:otherwise><img src="${cp}/resources/images/default_economy.png"/></c:otherwise>
											</c:choose>
										</c:when>
										<c:otherwise>
											<img src="${cp }/upload/images/dogather/banner/${ll.dg_banner_sys}"/>
										</c:otherwise>
									</c:choose>
                 				 </div>
								<span>${ll.dg_title }</span>
                 				<span class="dg_intro">
	                  				<c:choose>
	                  					<c:when test="${ll.dg_intro_short!=null }">
	                  						${ll.dg_intro_short }
	                  					</c:when>
	                  					<c:otherwise>
	                  						${ll.dg_intro}
	                  					</c:otherwise>
	                  				</c:choose>
                  				</span>
                 			</a>
                		</li>
              	</c:forEach>
              		</ul>
            </c:when>
            <c:otherwise>
				<div style="line-height: 300px; font-size: 49px;font-weight: bold">두게더가 없습니다 ㅠㅠ</div>
            </c:otherwise>
           </c:choose>
           <div class="swiper-button-next"></div>
			<div class="swiper-button-prev"></div>
            </div>
          </div>
          <div id="id="interest">
            <div class="list_title">
              <a href="${cp}/dg/catalog.dg?criteria_key=dg_hits">
                <span class="purple">관심 </span><span>두ː게더</span>
              </a>
            </div>
            <div class="list_album swiper albumswiper">
            <c:choose>
            	<c:when test="${mostView_list.size()>0 and mostView_list!=null }">
              		<ul class="slides swiper-wrapper">
             		<c:forEach items="${mostView_list }" var="ml">
              			<li class="swiper-slide">
              				<a href="${cp }/dg/detail.dg?dg_index=${ml.dg_index}">
                 				 <div class="album">
                  					<c:choose>
										<c:when test="${ml.dg_banner_sys == null}">
											<c:choose>
												<c:when test="${ml.category_index eq 1 }"><img src="${cp}/resources/images/default_health.png"/></c:when>
												<c:when test="${ml.category_index eq 2 }"><img src="${cp}/resources/images/default_study.png"/></c:when>
												<c:when test="${ml.category_index eq 3 }"><img src="${cp}/resources/images/default_refinement.png"/></c:when>
												<c:when test="${ml.category_index eq 4 }"><img src="${cp}/resources/images/default_habit.png"/></c:when>
												<c:otherwise><img src="${cp}/resources/images/default_economy.png"/></c:otherwise>
											</c:choose>
										</c:when>
										<c:otherwise>
											<img src="${cp }/upload/images/dogather/banner/${ml.dg_banner_sys}"/>
										</c:otherwise>
									</c:choose>
                 				 </div>
								<span>${ml.dg_title }</span>
                 				<span class="dg_intro">
	                  				<c:choose>
	                  					<c:when test="${ml.dg_intro_short!=null }">
	                  						${ml.dg_intro_short }
	                  					</c:when>
	                  					<c:otherwise>
	                  						${ml.dg_intro}
	                  					</c:otherwise>
	                  				</c:choose>
                  				</span>
                 			</a>
                		</li>
              	</c:forEach>
              		</ul>
            </c:when>
            <c:otherwise>
				<div style="line-height: 300px; font-size: 49px;font-weight: bold">두게더가 없습니다 ㅠㅠ</div>
            </c:otherwise>
           </c:choose>
           <div class="swiper-button-next"></div>
			<div class="swiper-button-prev"></div>
            </div>
          </div>
          
        </div>
        <!-- 이벤트&커뮤니티 게시판 -->
        <div id="event_community">
        <c:set var="today" value="<%=new java.util.Date() %>"></c:set>
        <c:set var="today"><fmt:formatDate value="${today }" pattern="yyyyMMdd"/></c:set>
          <div id="event_border">
            <div class="event title">
              <a href="${cp }/board/event_board/post_list.bo">
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
					<a href=""> <span class="purple">후기</span><span> 게시판</span>
					</a>
				</div>
				<div class="swiper mySwiper">
					<div class="swiper-wrapper">
						<div class="swiper-slide">
							<div id="review_img_area">
								<div class="review_img">
									<a href="#"> <img
										src="${cp }/resources/images/walking.jpg" alt="" />
									</a>
								</div>
							</div>
							<div id="review_list_area">
								<a href="#"> <span class="catalog green">운동</span><br /> <span
									class="title">워킹다이어트 후기</span><br /> <span class="contents gray">
									체중감량을 위해서는 격한 유산소 운동이나 힘든 근육 트레이닝이 기본이라고 생각하기 때문에 다이어트에 도전하기가 쉽지만은 않은이유인것 같아요.<br>
									그렇지만, 우리가 평상시 하고 있는 걷기 만으로도 다이어트가 가능합니다. 저역시 가까운 거리는 정말 매일 걸어다니고 있는 이유이기도 한데요<br>
									체력이 없어 다이어트에 도전하기가 망설여지는 분이나 격한 운동방법이 맞지 않는 분들께 추천드리는"워킹 다이어트"입니다.
									</span>
								</a>
							</div>
						</div>
						<div class="swiper-slide">
							<div id="review_img_area">
								<div class="review_img">
									<a href="#"> <img
										src="${cp }/resources/images/study.jpg" alt="" />
									</a>
								</div>
							</div>
							<div id="review_list_area">
								<a href="#"> <span class="catalog green">공부</span><br /> <span
									class="title">2202 공무원 시험 성공전략!</span><br /> <span class="contents gray">
									올해 처음 공무원 시험에 도전하는 '쌩'초시생 이라면?<br>
									기초가 많이 부족하여 공시 준비에 '감'을 도무지 못 잡겠다면?<br>
									기본강의 전에 듣는 입문강의 있죠?<br> 초시생분들이라면 묻지도, 따지지도 말고 반드시 입문강의부터 수강하고 오세요!</span>
								</a>
							</div>
						</div>
						<div class="swiper-slide">
							<div id="review_img_area">
								<div class="review_img">
									<a href="#"> <img
										src="${cp }/resources/images/eng_study.jpg" alt="" />
									</a>
								</div>
							</div>
							<div id="review_list_area">
								<a href="#"> <span class="catalog green">어학</span><br /> <span
									class="title">영어공부 두게더 후기</span><br /> <span class="contents gray"> 
									"나 영어회화책 1권 외운지 4개월이 다 되가고. 영화보면서 딕테이션도 하고.. 말할 수 있는 표현이 많아진거 같기는 한데.. 왜 내실력은 큰 진적이 없는거 같지?"<br>
									영화받아쓰기 총4편, 영어책 한권 외우기등 하루에 1시간~1시간 30분 정도 매일 영어에 시간 투자를 했었어요.
									</span>
								</a>
							</div>
						</div>
					</div>
					<div class="swiper-button-next"></div>
					<div class="swiper-button-prev"></div>
					<!--  <div class="swiper-pagination"></div> -->
				</div>
			</div>
		</div>
	</main>

    <%@include file="/footer.jsp" %>
  </body>
  <script>

  var album = new Swiper(".albumswiper", {
	  slidesPerView : 5,
		spaceBetween : 30,
		freeMode : true,
		allowTouchMove : true,
		pagination : {
			el : ".swiper-pagination",
			clickable : true,
		},
		navigation : {
			nextEl : ".swiper-button-next",
			prevEl : ".swiper-button-prev",
		},
	});
	var swiper = new Swiper(".mySwiper", {
		slidesPerView : 1,
		spaceBetween : 30,
		freeMode : true,
		allowTouchMove : false,
		pagination : {
			el : ".swiper-pagination",
			clickable : true,
		},
		autoplay : { //자동슬라이드 (false-비활성화)
			delay : 10000, // 시간 설정
			disableOnInteraction : false, // false-스와이프 후 자동 재생 
		},
		loop : true, // 슬라이드 반복 여부
		loopAdditionalSlides : 1,
		navigation : {
			nextEl : ".swiper-button-next",
			prevEl : ".swiper-button-prev",
		},
	});
    setInterval(function(){
    	$('.slidewrap > .slidelist').delay(2500);
    	$('.slidewrap > .slidelist').animate({marginLeft:"-1400px"})
    	$('.slidewrap > .slidelist').delay(2500);
    	$('.slidewrap > .slidelist').animate({marginLeft:"-2800px"})
    	$('.slidewrap > .slidelist').delay(2500);
    	$('.slidewrap > .slidelist').animate({marginLeft:"0px"})

    	});
</script>
</html>