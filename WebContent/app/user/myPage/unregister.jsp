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
    <link rel="shortcut icon" href="./img/favicon.png" />
    <link rel="shortcut icon" href="${cp}/resources/images/favicon.png" />
<title>마이페이지</title>
<link rel="stylesheet" href="${cp }/resources/css/include.css" />
<link rel="stylesheet" href="${cp }/resources/css/mypage.css" />
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
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
        	<form action="">
                <div id="unregister_area">
                  <div id="unregister">
                    <h2>회원 탈퇴</h2>
                    <div>

                      <p>사용중인 아이디(user_id)는 사용할 경우 재사용 및 복구가 불가능합니다.</p>
                      <p>탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다.</p>
                      <p>탈퇴 후에도 게시판형 서비스에 등록한 게시물은 그대로 남아 있습니다.</p>

                    </div>
                    <div>

                      <input type="checkbox" name="" id=""><span>안내 사항을 모두 확인하였으며, 이에 동의합니다.</span>
                      <input type="submit" value="확인">
                    </div>
                      
                  </div>
                  </div>
                </form>
    	</div>
	</div>
</div>
	<%@include file="../../../footer.jsp"%>
</body>
<script>
const unregister = '/dogather/app/user/mypage/unregister.jsp';
if("<%= request.getRequestURI() %>"==unregister){
	document.querySelector("#unregister").className = "on";
}
</script>
</html>