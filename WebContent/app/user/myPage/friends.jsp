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
        	<div id="top_meun">
                <table>
                  <tr>
                    <th id="myboard" class="off">
                      <a href="${cp}/app/user/mypage/community.jsp">내 게시글</a>
                    </th>
                    <th id="friendslist" class="on">
                        <a href="${cp}/app/user/mypage/friends.jsp">친구목록</a>
                    </th>
                    <th id="notebox" class="off">
                      <a href="${cp}/app/user/mypage/notebox.jsp"> 쪽지함 </a> 
                    </th>
                  </tr>
                </table>
              </div>
              <!--친구 관리 -->
              <div id="friendslist_area">
                <form action="">
                  <div>
                    <h2>친구목록</h2>
                  </div>
                </form>
              </div>
              </div>
    	</div>
	</div>

	<%@include file="../../../footer.jsp"%>
</body>
<script>
const friends = '/dogather/app/user/mypage/friends.jsp';
if("<%= request.getRequestURI() %>"==friends){
	document.querySelector("#friends").className = "on";
	
	
}
</script>
</html>