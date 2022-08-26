<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="cp" value="${pageContext.request.contextPath }" />
<c:set var="date" value="<%=new java.util.Date() %>"></c:set>
<c:set var="today"><fmt:formatDate value="${date }" pattern="yyyyMMdd"/></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="${cp}/resources/js/cp.js"></script>

<link rel="preconnect" href="https://fonts.googleapis.com/" />
<link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet" />
<link rel="shortcut icon" href="${cp}/resources/images/favicon.png" />

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>


<title>Doːgather</title>
<link rel="stylesheet" href="${cp }/resources/css/include.css" />
<link rel="stylesheet" href="${cp }/resources/css/calender.css" />

</head>
<body>
	<%@include file="/loginCheck.jsp"%>
	<%@include file="/header.jsp"%>
	<main>
		<h2 class="purple">내정보</h2>
		<div id="main">
			<div class="calendar">
          <div class="header">
            <div class="year-month"></div>
            <div class="nav">
              <button class="nav-btn go-prev" onclick="prevMonth()">&lt;</button>
              <button class="nav-btn go-today" onclick="goToday()">Today</button>
              <button class="nav-btn go-next" onclick="nextMonth()">&gt;</button>
            </div>
          </div>
          <div class="main">
            <div class="days">
              <div class="day">일</div>
              <div class="day">월</div>
              <div class="day">화</div>
              <div class="day">수</div>
              <div class="day">목</div>
              <div class="day">금</div>
              <div class="day">토</div>
            </div>
            <div class="dates"></div>
          </div>
        </div>
        		
        <div id="myinfo">
        	<h4>유저님은</h4>
        	<div>
        	
        	 <fmt:parseDate var="drd" value="${info.dg_user_reg_date }" pattern="yyyy-MM-dd HH:mm:ss"/>
              <c:set var="dg_user_reg_date"><fmt:formatDate value="${drd }" pattern="yyyy-MM-dd"/></c:set>
              
        	<span><span class="purple">${dg_user_reg_date }</span>에 가입하셨습니다</span><br><br><br>
        	<span>총 <span class="purple">${info.dp_cert_cnt }</span>개의 인증글을 썼어요 </span><br><br>
        	<span>총 <span class="purple">${info.dp_feed_cnt }</span>개의 피드를 썼어요 </span><br><br>
        	<span>총 <span class="purple">${info.dpr_cnt }</span>개의 댓글을 썼어요 </span><br><br><br>
     		
     		<c:if test="${info.dg_user_target!=null }">
        		<span>목표</span><br><br>
        		<span>${info.dg_user_target }</span><br><br>
     		</c:if>
     		
     		<c:if test="${info.dg_user_target_date!=null }">
     			<fmt:parseDate var="dutd" value="${info.dg_user_target_date }" pattern="yyyy-MM-dd"/>
				<c:set var="dg_user_target_date"><fmt:formatDate value="${dutd }" pattern="yyyyMMdd"/></c:set>
        		<span>목표 달성까지 <span class="purple">${dg_user_target_date - today }</span>일 남았습니다!</span><br>
     		</c:if>
     		<c:forEach items="${cl}" var="cert">
				${cert.dp_reg_date }
			</c:forEach>
        	</div>
        </div>
		</div>
	</main>
	<%@include file="../../footer.jsp"%>
</body>
<script src="${cp }/resources/js/dg.js"></script>
<script src="${cp }/resources/js/caleder.js"></script>
<script>
	$(document).ready(function test(){
	$('.this.18').parent().css('background-color','blue');
	});
</script>
</html>