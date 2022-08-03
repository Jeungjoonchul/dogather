<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cp" value="${pageContext.request.contextPath}" />
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
				<td colspan="2"><h4>필수 입력 사항</h4></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="user_email" id="user_email" onkeyup="checkEmail('${cp}');" onblur="emailStatus();" placeholder='이메일을 입력하세요'></td>
			</tr>
			<tr>
				<td><span style="display: none;">null</span></td>
				<td><span>&nbsp;</span></td>
			</tr>

			<tr>
				<th>닉네임</th>
				<td><input type="text" name="user_nickname" id="user_nickname" onkeyup="checkNickname('${cp}');" onblur="nicknameStatus();" placeholder='닉네임을 입력하세요'></td>
			</tr>
			<tr>
				<td><span style="display: none;">null</span></td>
				<td><span>&nbsp;</span></td>
			</tr>

			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="user_password"
					id="user_password" placeholder='비밀번호를 입력하세요'></td>
			</tr>
			<tr>
				<td><span style="display: none;">null</span></td>
				<td><span>&nbsp;</span></td>
			</tr>

			<tr>
				<th>비밀번호 확인</th>
				<td><input type="password" name="user_password_re"
					id="user_password_re" placeholder='비밀번호 확인'></td>
			</tr>
			<tr>
				<td><span style="display: none;">null</span></td>
				<td><span>&nbsp;</span></td>
			</tr>
			
			<tr>
				<th>이름</th>
				<td><input type="text" name="user_name" id="user_name" placeholder='이름을 입력하세요'></td>
			</tr>
			<tr>
				<td><span style="display: none;">null</span></td>
				<td><span>&nbsp;</span></td>
			</tr>
			
			<tr>
				<th>휴대폰</th>
				<td><input type="tel" name="user_phone" id="user_phone" placeholder='휴대전화번호를 입력하세요'></td>
			</tr>
			<tr>
				<td><span style="display: none;">null</span></td>
				<td><span>&nbsp;</span></td>
			</tr>
			
			<tr>
				<th>성별</th>
				<td><label><input type="radio" name="user_gender"
						class="user_gender" value="male" checked>남자</label> <label><input
						type="radio" name="user_gender" class="user_gender" value="female">여자</label>
				</td>
			</tr>
			
			<tr>
				<th>생년월일</th>
				<td><input type="date" name="user_birth_date"
					id="user_birth_date"></td>
			</tr>
			<tr>
				<td><span style="display: none;">null</span></td>
				<td><span>&nbsp;</span></td>
			</tr>
			
			<tr>
				<th>우편번호</th>
				<td><input type="text" name="zip_code" id="zip_code" readonly onclick="daumPostcode()" placeholder="우편 번호를 입력하세요"></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="address" id="address" readonly onclick="daumPostcode()"placeholder="주소를 입력하세요"></td>
			</tr>
			<tr>
				<th>상세주소</th>
				<td><input type="text" name="address_detail"
					id="address_detail" placeholder="상세 주소를 입력하세요"></td>
			</tr>
			<tr>
				<th>참고항목</th>
				<td><input type="text" name="address_extra" id="address_extra"
					readonly></td>
			</tr>
			<tr>
				<td colspan="2"><h4>선택 입력 사항</h4></td>
			</tr>
			<tr>
				<th>관심사</th>
				<td><label><input type="checkbox" name="user_interest"
						class="user_interest" value="1">건강</label> <label><input
						type="checkbox" name="user_interest" class="user_interest"
						value="2">학습</label> <label><input type="checkbox"
						name="user_interest" class="user_interest" value="3">교양</label> <label><input
						type="checkbox" name="user_interest" class="user_interest"
						value="4">습관</label> <label><input type="checkbox"
						name="user_interest" class="user_interest" value="5">경제</label> <label>기타<input
						type="text" name="user_interest_etc" id="user_interest_etc" placeholder='그 외 관심사를 입력하세요(ex: 코딩)'></label>
				</td>
			</tr>

			<tr>
				<th>자기소개</th>
				<td><textarea rows="15" cols="60" name="user_intro"
						id="user_intro" style="resize: none;" placeholder="자기소개를 입력하세요"></textarea>
				</td>
			</tr>
			<input type="hidden" name="user_term_selective1"
				id="user_term_selective1"
				value="${!empty param.user_terms_type3?true:false}" />
			<input type="hidden" name="user_term_selective2"
				id="user_term_selective2"
				value="${empty param.user_terms_type4?false:true}" />

		</table>
		<input type="submit" value="회원 가입 완료">
	</form>
</body>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${cp}/resources/js/join.js"></script>
</html>