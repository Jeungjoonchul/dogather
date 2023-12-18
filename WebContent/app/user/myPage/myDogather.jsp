<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="preconnect" href="https://fonts.googleapis.com/" />
    <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;600;700;800;900&display=swap"
      rel="stylesheet"
    />
        <link  rel="stylesheet"  href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css"/>
    <link rel="shortcut icon" href="./img/favicon.png" />
    <link rel="shortcut icon" href="${cp}/resources/images/favicon.png" />
<title>마이페이지</title>
<link rel="stylesheet" href="${cp }/resources/css/include.css" />
<link rel="stylesheet" href="${cp }/resources/css/mypage.css" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>

</head>

<style>

#mypage {
  width: 80%;
  margin-top: 160px;
}
#mypage_container {
  box-sizing: border-box;
  width: 1202px;
  height: 800px;
  margin: 0 auto;
  margin-bottom: 50px;
}

</style>
<body>
	<%@include file="../../../header.jsp"%>
<div id="mypage">
	<div id="mypage_container">
		<%@include file="../../../myPage_sideBar.jsp" %> 
		<div id="mypage_area">
        	<div id="top_meun">
                <table>
                  <tr>
                    <th id="mydogether" class="on">
                      <a href="${cp}/app/user/mypage/mydogather.jsp">마이 두게더</a>
                    </th>
                    <th id="category" class="off">
                      <a href="${cp}/app/user/mypage/favorite_dogather.jsp">관심 카테고리</a>
                    </th>
                  </tr>
                </table>
              </div>
              <!-- 투게더 -->
              <div id="mydogether_area">
                <form action="">
                <div id="mydogether_list">
                    <h2>참여중인두게더</h2>
                    <div class="swiper mySwiper">
                      <div class="swiper-wrapper">
                        <div class="swiper-slide">
                          <a href="" >
                                     <img src="./img/경제.jpg">
                          </a></div>
                        <div class="swiper-slide"><a href="" >
                          <img src="./img/경제.jpg">
                          <p>두게더2</p>
                        </a></div>
                        <div class="swiper-slide"><a href="" >
                          <img src="./img/경제.jpg">
                          <p>두게더3</p>
                        </a></div>
                        <div class="swiper-slide"><a href="" >
                          <img src="./img/경제.jpg">
                          <p>두게더3</p>
                        </a></div>
                      </div>
                      <div class="swiper-pagination"></div>
                    </div>
                  </div>
                <div id="mydogether_list">
                    <h2>관리중인 두게더</h2>
                    <div class="swiper mySwiper">
                      <div class="swiper-wrapper">
                        <div class="swiper-slide">
                          <a href="" >
                                     <img src="./img/경제.jpg">
                          </a></div>
                        <div class="swiper-slide"><a href="" >
                          <img src="./img/경제.jpg">
                          <p>두게더2</p>
                        </a></div>
                        <div class="swiper-slide"><a href="" >
                          <img src="./img/경제.jpg">
                          <p>두게더3</p>
                        </a></div>
                        <div class="swiper-slide"><a href="" >
                          <img src="./img/경제.jpg">
                          <p>두게더3</p>
                        </a></div>
                      </div>
                      <div class="swiper-pagination"></div>
                    </div>
                  </div>
                </form>
                </div>
                </div>
                </div>
                </div>
	<%@include file="../../../footer.jsp"%>
</body>
<script>
const mydogather = '/dogather/app/user/mypage/mydogather.jsp';
if("<%= request.getRequestURI() %>"==mydogather){
	document.querySelector("#mydogather").className = "on";
	
	
}
var swiper = new Swiper(".mySwiper", {
	  slidesPerView: 3,
	  spaceBetween: 30,
	  freeMode: true,
	  pagination: {
	    el: ".swiper-pagination",
	    clickable: true,
	  },
});
</script>
</html>