<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Doːgather 회원가입</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</head>
<body>
	<form action="${cp}/user/user_join_ok.us" method="post">
	<table>
			<tr> 
				<th>이메일</th>
				<td><input type="text" name="user_email" id="user_email"><input type="button" value="중복확인" onclick="checkEmail()"></td>
			</tr>
			
			<tr>
				<th>닉네임</th>
				<td><input type="text" name="user_nickname" id="user_nickname"></td>
			</tr>
			
			<tr>
				<th>이름</th>
				<td><input type="text" name="user_name" id="user_name"></td>
			</tr>
			
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="user_password" id="user_password"></td>
			</tr>
			
			<tr>
				<th>비밀번호 확인</th>
				<td><input type="password" name="user_password_re" id="user_password_re"></td>
			</tr>
			
			<tr>
				<th>휴대폰</th>
				<td><input type="tel" name="user_phone" id="user_phone"></td>
			</tr>
			
			<tr>
				<th>성별</th>
				<td>
				<label><input type="radio" name="user_gender" class="user_gender" value="male" checked>남자</label>
				<label><input type="radio" name="user_gender" class="user_gender" value="female">여자</label>
				</td>
			</tr>
			
			<tr>
				<th>생년월일</th>
				<td><input type="date" name="user_birth_date" id="user_birth_date"></td>
			</tr>
			
			<tr>
				<th>우편번호</th>
				<td><input type="text" name="zip_code" id="zip_code" readonly><input type="button" onclick="daumPostcode()" value="우편번호 찾기"></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="address" id="address" readonly></td>
			</tr>
			<tr>
				<th>상세주소</th>
				<td><input type="text" name="address_detail" id="address_detail"></td>
			</tr>
			<tr>
				<th>참고항목</th>
				<td><input type="text" name="address_extra" id="address_extra" readonly></td>
			</tr>
			
			<tr>
				<th>관심사</th>
				<td>
					<label><input type="checkbox" name="user_interest" class="user_interest" value="1">건강</label>				
					<label><input type="checkbox" name="user_interest" class="user_interest" value="2">학습</label>				
					<label><input type="checkbox" name="user_interest" class="user_interest" value="3">교양</label>				
					<label><input type="checkbox" name="user_interest" class="user_interest" value="4">습관</label>				
					<label><input type="checkbox" name="user_interest" class="user_interest" value="5">경제</label>	
					<label>기타<input type="text" name="user_interest_etc" id="user_interest_etc"></label>			
				</td>
			</tr>
			
			<tr>
				<th>자기소개</th>
				<td>
					<textarea rows="15" cols="60" name="user_intro" id="user_intro" style="resize: none;
					" placeholder="자기소개를 입력해주세요."></textarea>
				</td>
			</tr>
			<input type="hidden" name="user_term_selective1" id="user_term_selective1" value="${!empty param.user_terms_type3?true:false}"/>
			<input type="hidden" name="user_term_selective2" id="user_term_selective2" value="${empty param.user_terms_type4?false:true}"/>
			
	</table>
		<input type="submit" value="회원 가입 완료">
	</form>
</body>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function daumPostcode() {
    new daum.Postcode({
        oncomplete: function (data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if (data.userSelectedType === 'R') {
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if (data.buildingName !== '' && data.apartment === 'Y') {
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if (extraAddr !== '') {
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("address_extra").value = extraAddr;

            } else {
                document.getElementById("address_extra").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('zip_code').value = data.zonecode;
            document.getElementById("address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("address_detail").focus();
        }
    }).open();
}

function checkEmail(){
	var user_email_tag=$('#user_email');
	var user_email = user_email_tag.val();
	var user_nickname=$('#user_nickname');
	$.ajax({
		url : '${cp}/user/user_check_email.us',
		data : {"user_email":user_email},
		type : "get",
		dataType : "text",
		success : function(result){
			if(result=='O'){
				alert('사용가능한 이메일입니다.');
				user_nickname.focus();
			}else{
				alert('사용할 수 없는 이메일입니다');
				user_email_tag.val('');
				user_email_tag.focus();
			}
		}
	});
}

</script>
</html>