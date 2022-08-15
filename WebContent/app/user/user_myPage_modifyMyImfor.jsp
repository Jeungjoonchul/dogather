<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="http://code.jquery.com/jquery-1.4.4.min.js"></script>
<body>
	<c:if test="${loginUser == null }">
		<script>
			let cp = "${pageContext.request.contextPath}";
			alert("로그인 후 이용하세요!");
			location.replace("${cp}/user/login.us");
		</script>
	</c:if>
	<!--
	<form method="post" id="userInfor" name="userInforForm" action="${cp}/user/userInforAction.us">
		<input type="hidden" name="user_email" value="${loginUser.user_email}"></input>
	</form>
	<script type="text/javascript">
	this.document.getElementById("userInfor").submit();
	</script>
	 -->
	<script>
	$(function(){
		const xhr = new XMLHtppRequest();
			xhr.onreadystatechange = fuction(){
			 
			}
		xhr.open("Get | Post", "{cp}경로?userid="+userid.value,true);
		xhr.send();
	});
	</script>
	<!-- 작업중 -->
 	<div id="changeinfo_area" class="hidden">
    	<div>
        	<h2>기본정보 변경</h2>
            <table>
                <form name="userModifyForm" method="post" action=""
                onsubmit="return sendit()">
                  <tr>
                    <th><label for="user_nickname">닉네임</label> <span id=nicknamecheck>&nbsp;</span></th>
                  </tr>
                  <tr>
                  <td><input type="text" name="user_name" id="user_name" value="${MyInfor_nickname}" readonly></td>
                  </tr>
                  <tr>
                    <th><label for="user_birthDate">생년월일</label>
                      <input type="date" name="user_birthDate" id="user_birthDate" value="${MyInfor_birthDate}" readonly>
                    </th>
                  </tr>
                  <tr>
                    <th>
                      <label for="user_phone">휴대폰</label>
                    </th>
                  </tr>
                  <tr>
                  <td><input type="text"  name="user_phone" id="user_phone" value="${MyInfor_phone}" readonly></td>
                  </tr>
                  <tr class="zipCode">
                    <th>우편번호 <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"></th>
                  </tr>
      
                  <tr>
                  <td><input readonly name="zipcode" type="text" id="sample6_postcode" value="${MyInfor_zipCode}" readonly>
                    
                  </td>
                  </tr>
      
                  <tr class="addr_area">
                    <th>주소</th>
                  </tr>
                  <tr>
                  <td><input readonly name="addr" type="text"
                    id="sample6_address" placeholder="주소" value="${MyInfor_addressDefault}" readonly>
                  </td>
                  </tr>
                  <tr>
                    <th>상세주소</th>
                  </tr>
                  <tr>
                  <td><input name="addrdetail" type="text" value="${MyInfor_addressDetail}" readonly
                    id="sample6_detailAddress" placeholder="상세주소"></td>
                  </tr>
                  <tr>
                    <th>참고항목</th>
                  </tr>
                  <tr>
                  <td><input readonly name="addretc" type="text" value="${MyInfor_addressExtra}" readonly
                    id="sample6_extraAddress" placeholder="참고항목"></td>
                
                  </tr>
                  
            
        </table>
        <div>
            <input type="submit" value="변경">
            <input type="button" value="취소">
        </div>
</body>
</html>