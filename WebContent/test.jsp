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
<link rel="preconnect" href="https://fonts.gstatic.com/" />
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet" />
<link rel="shortcut icon" href="${cp}/resources/images/favicon.png" />

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>


<title>Doːgather</title>
<link rel="stylesheet" href="${cp }/resources/css/include.css" />
</head>
<style>

body {
	width: 100%;
}

main {
	width: 100%;
}
main div {
	width: 100%;
	margin: 0 auto;
	text-align: center;
	box-sizing: border-box;
}
main ul {
	padding-inline-start: 0px;
}

main a {
	text-decoration: none;
	color: #141414;
	/* margin: 0 auto; */
}

main li {
	display: block;
	list-style: none;
	text-align: center;
}

#main {
	width: 80%;
	margin: 0 auto;
}
/* 진행중 두게더 */
#dg_present {
	width: 100%;
	text-align: left;
	margin-top: 70px;
	border-bottom: 1px solid black;
	margin-bottom: 30px;
}

.dg_present_title {
	text-align: left;
	font-size: 30px;
}

/* 두게더 틀 */
#dogathermain_mould {
	margin-bottom: 70px;
	width: 100%;
	height: 100%;
	/* border: 1px solid blue; */
}

.dogathermain_list {
	width: 90%;
	height: 300px;
	margin: 20px auto;
	/* border: 1px solid green; */
}

.list_photo {
	margin: 3px auto;
	width: 30%;
	height: 100%;
	border: 1px solid red;
	float: left;
}

.list_container {
	margin: 3px auto;
	width: 70%;
	height: 100%;
	border: 1px solid black;
	float: left;
}

.list_container_contents {
	width: 80%;
	height: 70%;
	border: 1px solid black;
	margin: 0 auto;
}
/* 자세히 보기 버튼 */
.ViewMore {
	background-color: #666666;
	width: 250px;
	height: 35px;
	color: #fff;
	font-weight: 300;
	font-size: 1rem;
	border: 0px solid;
	cursor: pointer;
	border-radius: 5px;
}

.ViewMore:hover {
	background-color: #141414;
}
/* 더보기 버튼 */
.addlist {
	background-color: #141414;
	width: 60%;
	height: 40px;
	color: #fff;
	font-weight: 100;
	font-size: 1.25rem;
	border: 0px solid;
	cursor: pointer;
	border-radius: 10px;
}

.addlist:hover {
	background-color: #666666;
}


</style>

<body>
	<%-- 	로그인 후 이용해야할 때 사용
	<%@include file="/loginCheck.jsp" %> --%>
	<%@include file="/header.jsp"%>
	<main>
		<div id="main">
			<div id="dg_present">
				<div class="dg_present_title">
					<a href=""> <span class="purple">진행중</span><span> 두게더</span>
					</a>
				</div>
			</div>

			<div id="dogathermain_mould">

				<div class=dogathermain_list>
					<div class="list_photo">두게더사진1</div>

					<div class="list_container">
						<span>제목</span> <br> <span>시작일: / 종료일: </span><br>
						<p class="list_container_contents"></p>

						<button class="ViewMore" type="button">자세히 보기</button>
					</div>
				</div>

				<div class=dogathermain_list>
					<div class="list_photo">두게더사진2</div>
					<div class="list_container">
						<span>제목</span> <br> <span>시작일: / 종료일: </span><br>
						<p class="list_container_contents"></p>

						<button class="ViewMore" type="button">자세히 보기</button>
					</div>
				</div>

				<div class=dogathermain_list>
					<div class="list_photo">두게더사진3</div>
					<div class="list_container">
						<span class="dg_title">제목</span> <br> <span>시작일: /
							종료일: </span><br>
						<p class="list_container_contents"></p>

						<button class="ViewMore" type="button">자세히 보기</button>
					</div>
				</div>

				<div class=dogathermain_list>
					<div class="list_photo">두게더사진4</div>
					<div class="list_container">
						<span class="dg_title">제목</span> <br> <span>시작일: /
							종료일: </span><br>
						<p class="list_container_contents"></p>

						<button class="ViewMore" type="button">자세히 보기</button>
					</div>
				</div>
				<button class="addlist" type="button">더보기</button>
			</div>
		</div>
	</main>
	<%@include file="/footer.jsp"%>
</body>
</html>