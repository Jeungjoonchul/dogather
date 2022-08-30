<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath }" />
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
<!-- include libraries(jQuery, bootstrap) -->

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>


<title>Doːgather</title>
<link rel="stylesheet" href="${cp }/resources/css/include.css" />
<style>
	main{
		width: 100%;
	}
	#main{
		width: 80%;
		margin: 0 auto;
		display: flex;
		justify-content: space-around;
	}
	.dg_box{
		width: 20%;
		height:300px;
		border: 1px solid #eeeeee;
		border-radius: 10px;
		box-shadow: 10px 10px 5px #aaaaaa;
	}
	main a{
		text-decoration: none;
		color:#141414;
		display:block;
		width: 100%;
		height: 100%
	}
	.hover{
		background-color: #eeeeee;
	}
	#main div{
	 position: relative;
	}
	#main div img{
	opacity: 0.7;
	width:100%;
	height:100%;
	z-index:1;
	border-radius: 10px;
	}
	#main div span{
	color:#1414147c;
	position: absolute;
	z-index:10;
	width: 100%;
	display:inline-block;
	text-align: center;
	top:10%;
	left:0;
	font-size:24px;
	}
	#main div:hover img{
	opacity: 1.0;
	}
	#main div:hover span{
	color:#141414;
	font-size:30px;
	}
	
</style>
</head>
<body>
<%@include file="/header.jsp" %>
	<main>
		<div id="main">
			<div class="create_dg dg_box"><a href="${cp }/dg/create.dg"><img src="${cp}/resources/images/dogather_start.jpg"><span>두게더 시작하기</span></a></div>
			<div class="progress_dg dg_box"><a href="${cp }/dg/catalog.dg"><img src="${cp}/resources/images/dogather_ing.jpg"><span>진행중 두게더</span></a></div>
			<div class="end_dg dg_box"><a href="#"><img src="${cp}/resources/images/dogather_end.jpg"><span>종료된 두게더</span></a></div>
			<div class="epilogue_dg dg_box"><a href="#"><img src="${cp}/resources/images/dogather_after.jpg"><span>두게더 후기</span></a></div>
		</div>
	</main>
	<%@include file="/footer.jsp" %>
</body>
<script src="${cp }/resources/js/dg.js"></script>
</html>