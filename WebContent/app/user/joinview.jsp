<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="cp" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Join</title>
</head>
<body>
	<div id="wrap">
		<form name="joinForm" method="post" action="${cp}/user/userjoinok.us"
			onsubmit="return sendit()">
			<table>
				<tr>
					<td id="result" colspan="2">&nbsp;</td>
				</tr>
				<tr>
					<th><label for="user_email">이메일</label></th>
					<td><input required type="email" name="user_email" id="user_email"><input
						type="button" value="중복검사" onclick="checkId()"></td>
				</tr>
				<tr>
					<th><label for="usernickname">닉네임</label></th>
					<td><input type="text" name="user_nickname" id="user_nickname"></td>
				</tr>
				<tr>
					<th><label for="username">이름</label></th>
					<td><input type="text" name="user_name" id="user_name"></td>
				</tr>
				<tr>
					<th><label for="userpassword">비밀번호</label></th>
					<td><input type="password" name="user_password" id="user_password"></td>
				</tr>
				<tr>
					<th><label for="userphone">핸드폰번호</label></th>
					<td><input type="text" name="user_phone" id="user_phone"></td>
				</tr>
				<tr>
					<th>성별</th>
					<td><label>남자<input checked type="radio"
							name="usergender" value="male"></label> <label>여자 <input
							type="radio" name="user_gender" value="female"></label></td>
				</tr>
					<tr>
					<th><label for="userbirthdate">생년월일</label></th>
					<td><input type="text" name="user_birth_date" id="user_birth_date"></td>
				</tr>
				<tr>
					<th colspan="2"><input type="submit" value="가입 완료"></th>
				</tr>
			</table>
		</form>
	</div>
</body>
<script>
	const cp = "${cp}";
</script>
<script src="${cp}/app/user/user.js"></script>
</html>
















