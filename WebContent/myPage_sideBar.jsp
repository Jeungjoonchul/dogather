<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath }"/>
<style>
* {
  font-family: "Noto Sans KR", sans-serif;
}

div {
  width: 100%;
  margin: 0 auto;
  text-align: center;
  box-sizing: border-box;
}
body{
  width: 100%;
  height: 100%;
  margin: 0;
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

/* 마이페이지 */
.hidden {
  display: none;
}
#mypage {
  width: 80%;
  margin-top: 100px;
}
#mypage_container {
  box-sizing: border-box;
  width: 1202px;
  height: 800px;
  margin: 0 auto;
  margin-bottom: 50px;
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
<div id="side_menu">
	<ul>
    	<li>
        	<a href="" class="cap">회원정보관리</a>
		</li>
		<li>
        	<a href="javascript:changeprofile();"
                id="changeprofile_side"
                class="on">프로필 변경</a>
        </li>
        <li>
        	<a href="javascript:changepw();" id="changepw_side">비밀번호 변경</a>
        </li>
        <li>
        	<a href="javascript:changeinfo();" id="changeinfo_side">기본정보 변경</a>
        </li>
	</ul>
    <ul>
    	<li>
        	<a href="./mypage_dogather.html" class="cap">두게더</a>
        </li>
        <li><a href="./mypage_dogather.html">마이 두게더</a></li>
        <li><a href="./mypage_dogather.html">관심 카테고리 설정</a></li>
    </ul>
    <ul>
        <li>
        	<a href="" class="cap">커뮤니티</a>
        </li>
        <li>
        	<a href="/mypage_community.html"
                id="myboard_side">내 게시글</a>
        </li>
        <li>
        	<a href="/mypage_community.html" id="friendslist_side">친구목록</a>
        </li>
        <li>
        	<a href="/mypage_community.html" id="notebox_side">쪽지함</a>
        </li>
    </ul>
    <ul>
    	<li>
        	<a href="" class="cap">고객센터</a>
        </li>
        <li><a href="">나의 문의 내역</a></li>
        <li><a href="">회원탈퇴</a></li>
    </ul>
</div>