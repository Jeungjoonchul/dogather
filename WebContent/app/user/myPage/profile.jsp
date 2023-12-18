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
                    <th id="${cp}/app/user/porfile.jsp" class="on">
                      <a href=""> 내프로필 </a>
                    </th>
                    <th id="${cp}/app/user/password.jsp" class="off">
                      <a href="mypage_changepw.html"> 비밀번호변경 </a>
                    </th>
                    <th id="${cp}/app/user/info.jsp" class="off">
                      <a href="mypage_info.html"> 기본정보변경 </a>
                    </th>
                  </tr>
                </table>
              </div>
              <div id="profile_area">
                <form action="">
                  <div id="profile">
                    <h2>프로필 변경</h2>
                    <div id="porfile_photo">
                      <img src="${cp }/resources/images/default.png" alt="" />
                    </div>
                    <input type="button" value="사진변경" />
                    <input type="button" value="삭제" />
                    <div id="profile_open">
                      <p>프로필 공개여부</p>
                      <label>
                        <input
                          type="radio"
                          name="porfile_share"
                          id=""
                          checked
                        />
                        공개</label
                      >
                      <label>
                        <input type="radio" name="porfile_share" id="" />
                        비공개</label
                      >
                      <label>
                        <input type="radio" name="porfile_share" id="" />
                        친구공개</label
                      >
                    </div>
                  </div>
                  <div id="intro">
                    <p>자기소개</p>
                    <textarea
                      name="user_intro"
                      id="user_intro"
                      cols="30"
                      rows="10"
                    >user_intro</textarea
                    >
                  </div>
                  <div class="end">
                    <input type="submit" value="적용" />
                    <input type="button" value="취소" />
                  </div>
                </form>
              </div>
    	</div>
	</div>
</div>
	<%@include file="../../../footer.jsp"%>
</body>
</html>