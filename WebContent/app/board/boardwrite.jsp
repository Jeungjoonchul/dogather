<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- NAVER SmartEditor 텍스트 편집기 -->
<script type="text/javascript" src="./smarteditor2/js/HuskyEZCreator.js" charset="utf-8"></script>
</head>
<body>
	<div id="wrap">
<%-- 		<table class="header_area">
			<tr align="right" valign="middle">
				<td>
					<span>${loginUser}님 환영합니다.</span>&nbsp;&nbsp;
					<a href="${cp}/user/userlogout.us">로그아웃</a>
				</td>
			</tr>
		</table> --%>
		<table class="title">
			<tr align="center" valign="middle">
				<td><h3>자유 게시판</h3></td>
			</tr>
		</table>
			<textarea name="ir1" id="ir1" rows="10" cols="100"></textarea>
		<table class="btn_area">
			<tr align="right" valign="middle">
				<td>
					<a href="javascript:sendit()">등록</a>&nbsp;&nbsp;
					<a href="${cp}/board/boardlist.bo?page=${param.page}">목록</a>
				</td>
			</tr>
		</table>
	</div>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- jQuery에 주요 업데이트가 있을 경우 콘솔에 경고 표시, 해결할 수 있는 문제들은 스스로 해결 -->
<script src="https://code.jquery.com/jquery-migrate-1.2.1.js"></script>
</html>
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
 oAppRef: oEditors,
 elPlaceHolder: "ir1",
 sSkinURI: "./smarteditor2/SmartEditor2Skin.html",
 fCreator: "createSEditor2"
});
</script>
