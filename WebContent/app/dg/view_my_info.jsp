<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="cp" value="${pageContext.request.contextPath }" />
<c:set var="date" value="<%=new java.util.Date() %>"></c:set>
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
	<input type="hidden" value="${dg_index }" id="dg_index"/>
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
        <div>
        <p><span>인증 글 작성 : </span><span>&nbsp;</span></p>
        <p><span>인증 글 미 작성 : </span><span>&nbsp;</span></p>
        </div>
        </div>
        		
        <div id="myinfo">
        	<h4>${loginUser.user_nickname }님은</h4>
        	<div>
        	
        	 <fmt:parseDate var="drd" value="${info.dg_user_reg_date }" pattern="yyyy-MM-dd HH:mm:ss"/>
              <c:set var="dg_user_reg_date"><fmt:formatDate value="${drd }" pattern="yyyy-MM-dd"/></c:set>
              
        	<span><span class="purple">${dg_user_reg_date }</span>에 가입하셨습니다</span><br><br><br>
        	<span>총 <span class="purple">${info.dp_cert_cnt }</span>개의 인증글을 썼어요 </span><br><br>
        	<span>총 <span class="purple">${info.dp_feed_cnt }</span>개의 피드를 썼어요 </span><br><br>
        	<span>총 <span class="purple">${info.dpr_cnt }</span>개의 댓글을 썼어요 </span><br><br><br>
     		
     		<c:if test="${info.dg_user_target!=null }">
        		<span class="purple">${loginUser.user_nickname }님의 목표는</span><br><br>
        		<span>${info.dg_user_target }</span><br><br>
        		<span class="purple">입니다</span><br><br>
     		</c:if>
     		
     		<c:if test="${info.dg_user_target_date!=null }">
     			<fmt:parseDate var="dutd" value="${info.dg_user_target_date }" pattern="yyyy-MM-dd"/>
				<fmt:parseNumber var="dutd_num" value="${dutd.time/(1000*60*60*24 )}" integerOnly="true"/>
				<fmt:parseNumber var="today_num" value="${date.time/(1000*60*60*24 )}" integerOnly="true"/>
 				<c:choose>
					<c:when test="${dutd_num-today_num>1 }">
        				<span>목표 달성까지 <span class="purple">${dutd_num-today_num+1}</span>일 남았습니다!</span><br>
					</c:when>
					<c:otherwise>
					 <span>목표일이 지났습니다</span>
					</c:otherwise>
				</c:choose> 
     		</c:if>
        	</div>
        </div>
		</div>
	</main>
	
	
	
	<%@include file="../../footer.jsp"%>
</body>
<script src="${cp }/resources/js/dg.js"></script>
<script src="${cp }/resources/js/caleder.js"></script>
<c:set var="month"><fmt:formatDate value="${date }" pattern="M"/></c:set>
<c:set var="year"><fmt:formatDate value="${date }" pattern="yyyy"/></c:set>
<c:set var="now"><fmt:formatDate value="${date }" pattern="d"/></c:set>
<c:set var="now" value="${now }"/>
<c:set var="i" value="1"/>
<c:set var="flag" value="${false }"/>
    <c:forEach var="i" begin="${i }" end="${now}">
		<c:forEach var="cert" items="${cl }">
			<fmt:parseDate var="crd" value="${cert.dp_reg_date }" pattern="yyyy-MM-dd"/>
 			<c:set var="cert_year"><fmt:formatDate value="${crd }" pattern="yyyy"/></c:set>
 			<c:set var="cert_month"><fmt:formatDate value="${crd }" pattern="M"/></c:set>
			<c:set var="cert_date"><fmt:formatDate value="${crd }" pattern="d"/></c:set>
			<c:if test="${cert_year eq year }">
				<c:if test="${cert_month eq month }">
					<c:if test="${cert_date eq i }">
						<c:set var="flag" value="${true }"/>
					</c:if>
				</c:if>
			</c:if>
		</c:forEach>
		<c:choose>
			<c:when test="${flag }">
				<script>
					var d = '${i}';
					$('.this.'+d).parent().css('background-color','#bbdefb');
				</script>
			</c:when>
			<c:otherwise>
				<script>
					var d = '${i}';
					$('.this.'+d).parent().css('background-color','#ffcdd2');
				</script>
			</c:otherwise>
		</c:choose>
		<c:set var="flag" value="${false }"/>
		<c:set var="i" value="${i+1 }"/>	
	</c:forEach>
	<c:set var="target_date" value="${info.dg_user_target_date }"/>
	<c:if test="${target_date!=null }">
		<fmt:parseDate var="td" value="${target_date}" pattern="yyyy-MM-dd"/>
 		<c:set var="td_year"><fmt:formatDate value="${td }" pattern="yyyy"/></c:set>
 		<c:set var="td_month"><fmt:formatDate value="${td }" pattern="M"/></c:set>
 		<c:set var="td_date"><fmt:formatDate value="${td }" pattern="d"/></c:set>
 		<c:if test="${td_year eq year and td_month eq month }">
 			<script>
 				$('.this.${td_date}').parent().append('<br><span class="purple">목표일</span>');
 			</script>
 		</c:if>
	</c:if>
</html>