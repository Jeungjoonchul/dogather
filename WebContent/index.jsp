<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${cp}/resources/jquery/jquery.fullPage.css">
    <script src="${cp}/resources/js/cp.js"></script>
    <script
  src="https://code.jquery.com/jquery-3.6.0.min.js"
  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
  crossorigin="anonymous"></script>
  <link rel="stylesheet" href="${cp}/resources/css/index.css">
  <script src="${cp}/resources/jquery/jquery.fullPage.js"></script>
  <script src="${cp}/resources/js/index.js"></script>
  <link rel="preconnect" href="https://fonts.googleapis.com/" />
  <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin />
  <link
    href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;600;700;800;900&display=swap"
    rel="stylesheet"
  />
  <link rel="shortcut icon" href="${cp}/resources/images/favicon.png" />
    <title>Doːgather</title>
    <link rel="stylesheet" href="">
</head>
<body onload="rotate()">
<!-- 인덱스 다시 보지 않기 체크 여부 확인 후 흐름 나눔 -->
<c:if test="${cookie.skip_index.value eq 'on'}">
	<script>
		location.href='${cp}/main';
	</script>	
</c:if>

    <header>
      
        <nav>
            <ul>
                <li data-menuanchor="section1"><a href="#section1">서비스소개</a></li>
                <li data-menuanchor="section2"><a href="#section2">이용방법</a></li>
                <li><a href="https://www.facebook.com"><img src="${cp}/resources/images/index_fb.png" alt=""></a></li>
                <li><a href="https://www.instagram.com"><img src="${cp}/resources/images/index_ins.png" alt=""></a></li>
                
            </ul>
        </nav>
    </header>
    <main id="fullpage" >
        <div class="section s1">
            
            
          <div class="section_main">
            <div class="m-title">
                <h1>새로운 목표가 생기셨나요?
                  <BR>
                  생활습관을 고치고 싶으신가요?
                  <BR>
                  두게더와 함께 시작해보세요!
                  <BR><BR>
                  
                대한민국 1등 건강습관, 두게더
            </h1>
            <img src="${cp}/resources/images/app-store-download.png" alt="" width="134px" height="43px">
            <img src="${cp}/resources/images/google-play-download.png" alt="" width="134px" height="43px">
            </div>
            <div class="m-img_ani" >
              <img src="${cp}/resources/images/1.jpg" id="slide">
            </div>
        </div>
        </div>
        <div class="section s2">
            
            <div class="slide" data-anchor="slide1">
            <div class="section_main">
                
                    <div class="m-title">
                        <h1>01</h1>
                        <h1>나에게 필요한<br>습관을 고르세요</h1>
                        <h4>아침기상, 운동, 책읽기, 취미연습까지<br>
                        나에게 필요한 작은 미션을 선택하세요.<br>
평균 2주의 짧은 기간으로 부담없이 도전할 수 있어요.</h4>
                            <table>
                                <tr>
                                <th>Tip !</th>
                                <td>원하는 두게더가 없다면<br>직접 두게더를 개설하세요.</td>
                            <tr>
                            </table>
                    </div>
                    <div class="m-img">
                        <img src="${cp}/resources/images/slide-1.png" alt="" width="100%" height="100%">
                    </div>
                </div>
	            <div class="slide" data-anchor="slide2">
                    <div class="section_main">
                
                        <div class="m-img">
                            <img src="${cp}/resources/images/Index_slide2.jpg" alt="" width="100%" height="100%">
                        </div>
                        <div class="m-title2">
                           <h1> 02</h1>
                            
                            <h1>정보가 필요하신가요?<br>
                              커뮤니티 게시판으로 오세요!</h1>
    <h4>필요한 정보를 확인해보세요
      <br>
      유저들과 정보를 공유해보세요</h4>
                        </div>
                    </div>
                </div>
	            <div class="slide" data-anchor="slide3">
                    <div class="section_main">
                
                        <div class="m-title">
                            <h1>03</h1>
                            <h1>실천할 때마다 포인트 지급!<br>
                            못 지키면 차감</h1>
                            <h4>오늘 실천할 일은 인증샷을 찍어주세요!
                                <br>
                            한 번 실천할 때마다 포인트가 지급됩니다.</h4>
                            
                        </div>
                        <div class="m-img">
                            <img src="${cp}/resources/images/index_slide_3.png" alt="" width="475px" height="250px">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="section s3">
            
            <div class="section_main">
                <div class="m-title">
                  <h1>

                    같은 목표를 가진
                    <br>
                    사람들과 함께 하니까
                    <br>
                    끝까지 해낼 수 있어요
                  </h1>
                </div>
                <div class="m-img">
                    <img src="${cp}/resources/images/Index_3.png" alt="" width="409.5px" height="330px">
                
                </div>
            </div>
            <div class="m-start">
              <h2>지금 바로 두게더를 시작하세요!</h2>
              <br>
              
               <form method="post" action="${cp}/main">
					<input type="submit" value="두게더 시작하기"/>
					<label style="display: block">다음부터는 이창 보지 않기<input type="checkbox" name="skip_index"/></label>
					
				</form>
            </div>
            
            
            
        </div>
      
    </main>
    
</body>
<script>

</script>
</html>