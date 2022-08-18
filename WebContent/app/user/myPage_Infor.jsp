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

    <script src="${cp}/resources/js/cp.js"></script>
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    
    <link rel="preconnect" href="https://fonts.googleapis.com/" />
    <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;600;700;800;900&display=swap"
      rel="stylesheet"/>
    <link rel="shortcut icon" href="./img/favicon.png" />
	
<title>마이페이지</title>
<link rel="stylesheet" href="${cp }/resources/css/include.css" />
<!--<link rel="stylesheet" href="${cp }/resources/css/myPage_sideBar.css" />-->
</head>
<body>
	<%@include file="../../../header.jsp"%>
<main>
	<div id="changeinfo_area">
		<c:if test="${loginUser == null }">
			<script>
				let cp = "${pageContext.request.contextPath}";
				alert("로그인 후 이용하세요!");
				location.replace("${cp}/user/login.us");
			</script>
		</c:if>
		<c:if test="${myInfor == null }">
			<script>
				let cp = "${pageContext.request.contextPath}";
				location.replace("{cp}/user/myPage.us");
			</script>
		</c:if>
	
	${myInfor.zip_code}
	${myInfor.user_phone}
		<form action="">
			<div>
				<h2>기본정보 변경</h2>
			</div>
			<table>
				<tr>
					<th>이메일</th>
					<td>
					<input type="text" name="user_email" id="user_email" value="user_email" readonly/>
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td>
					<input type="text" name="user_name" id="user_name"   value="user_name"  readonly/>
					</td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td>
					<input type="text" name="user_birth_date"  id="user_birth_date" value="user_birth_date"  readonly/>
					</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
					<label>
					<input type="radio" name="user_gender" class="user_gender" value="male" checked onclick="return false"/>
						남자
					</label>
					<label>
					<input type="radio" name="user_gender" class="user_gender" value="female" onclick="return false"/>
						여자
					</label>
					</td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td>
					<input type="text"  name="user_nickname"  id="user_nickname" value="user_nickname" maxlength="10"/>
					</td>
				</tr>
				<tr>
					<th>휴대폰 번호</th>
					<td>
					<input type="tel"  name="user_phone" id="user_phone" value="user_phone" maxlength="13"/>
					</td>
				</tr>
				<tr>
					<th>우편번호</th>
					<td>
					<input type="text" name="zip_code" id="zip_code" readonly onclick="daumPostcode()" value="zipCode"/>
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>
					<input type="text"  name="address"  id="address" readonly onclick="daumPostcode()"  value="address"/>
					</td>
				</tr>
				<tr>
					<th>상세주소</th>
					<td>
					<input type="text" name="address_detail" id="address_detail" maxlength="300" value="address_detail"/>
					</td>
				</tr>
				<tr>
					<th>
					<span style="display: none" class="status">null</span>
					</th>
					<td><span>&nbsp;</span></td>
				</tr>
			</table>
				<br/>
					<input type="submit" value="수정하기" />
					<input type="button" value="나가기" onclick="back()" />
		</form>
	
	
	
	<%@include file="../../../footer.jsp"%>
	
	
</main>
</body>
</html>