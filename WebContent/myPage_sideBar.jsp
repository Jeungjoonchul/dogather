<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath }"/>
<style>

div {
  width: 100%;
  margin: 0 auto;
  text-align: center;
  box-sizing: border-box;
}

#body {
  width: 100%;
  
  position: relative;
  margin-top: 50px;
}
ul {
  padding-inline-start: 0px;
}

a {
  text-decoration: none;
  color: #141414;
  /* margin: 0 auto; */
}
li {
  display: block;
  list-style: none;
  text-align: center;
}
/* 사이드 */
#side_menu {
  box-sizing: border-box;
  /* border: 1px solid #141414; */
  width: 300px;
  height: 500px;
  float: left;
}
#side_menu ul {
  margin-left: -10px;
}
#side_menu ul li {
  text-align: left;
}
#side_menu ul li a {
  color: #141414bb;
}
#side_menu ul li a:hover {
  color: #141414;
}

#side_menu ul li .cap {
  margin-left: -10px;
  font-size: 20px;
  color: #141414;
}
#side_menu ul li .on {
  font-weight: 700;
}
</style>
  <%@include file="loginCheck.jsp" %>
        <div id="side_menu">
              <ul>
                <li>
                  <a href="${cp}/app/user/myPage_Main.jsp" class="cap">회원정보관리</a>
                </li>
                <li>
                  <a
                    href="${cp}/app/user/myPage_Main.jsp"
                    id="porfile">프로필 변경</a>
                </li>
                <li>
                  <a href="${cp}/user/pw.us" id="password"
                    >비밀번호 변경</a
                  >
                </li>
                <li>
                  <a href="${cp}/user/info.us" id="info"
                    >기본정보 변경</a
                  >
                </li>
              </ul>
              <ul>
                <li>
                  <a href="${cp}/app/user/mypage/mydogather.jsp" class="cap">두게더</a>
                </li>
                <li><a id="mydogather" href="${cp}/app/user/mypage/mydogather.jsp">마이 두게더</a></li>
                <li><a id="favorite_dogather" href="${cp}/app/user/mypage/favorite_dogather.jsp">관심 카테고리 설정</a></li>
              </ul>
              <ul>
                <li>
                  <a href="${cp}/app/user/mypage/community.jsp" class="cap">커뮤니티</a>
                </li>
                <li>
                  <a
                    href="${cp}/app/user/mypage/community.jsp"
                    id="community"
                    >내 게시글</a
                  >
                </li>
                <li>
                  <a id="friends" href="${cp}/app/user/mypage/friends.jsp" id="friendslist_side"
                    >친구목록</a
                  >
                </li>
                <li>
                  <a id="notebox" href="${cp}/app/user/mypage/notebox.jsp" id="notebox_side"
                    >쪽지함</a
                  >
                </li>
              </ul>
              <ul>
                <li>
                  <a href="${cp}/app/user/mypage/service.jsp" class="cap">고객센터</a>
                </li>
                <li><a id="service" href="${cp}/app/user/mypage/service.jsp">나의 문의 내역</a></li>
                <li><br></li>
                <li><a id="unregister" href="${cp}/app/user/mypage/unregister.jsp">회원탈퇴</a></li>
              </ul>
            </div>